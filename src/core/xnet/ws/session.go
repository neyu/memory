package ws

import (
	"core/codec"
	"core/logs"
	"core/util"
	"core/xlib"

	"github.com/gorilla/websocket"

	"sync"
)

// Socket会话
type wsSession struct {
	// peer.CoreContextSet
	// peer.CoreSessionIdentify
	// *peer.CoreProcBundle

	lib.Peer
	lib.ContextSet

	id int64

	conn *websocket.Conn

	// 退出同步器
	exitSync sync.WaitGroup

	// 发送队列
	sendQueue *lib.Pipe

	cleanupGuard sync.Mutex

	endNotify func()
}

func (this *wsSession) Id() int64 {
	return this.id
}

func (this *wsSession) SetId(id int64) {
	this.id = id
}

func (self *wsSession) GetPeer() lib.Peer {
	return self.Peer
}

// 取原始连接
func (self *wsSession) Raw() interface{} {
	if self.conn == nil {
		return nil
	}

	return self.conn
}

func (self *wsSession) Close() {
	self.sendQueue.Add(nil)
}

// 发送封包
func (self *wsSession) Send(msg interface{}) {
	self.sendQueue.Add(msg)
}

// 接收循环
func (self *wsSession) recvLoop() {

	for self.conn != nil {

		msg, err := self.Prop().ReadMessage(self)

		if err != nil {

			logs.Error(err)

			if !util.IsEOFOrNetReadError(err) {
				logs.Error("session closed:", err)
			}

			self.Prop().ProcEvent(&lib.RecvMsgEvent{Ses: self, Msg: &lib.SessionClosed{}})
			break
		}

		self.Prop().ProcEvent(&lib.RecvMsgEvent{Ses: self, Msg: msg})
		logs.Debug("proc msg:", codec.MessageToId(msg), msg)
	}

	self.Close()

	// 通知完成
	self.exitSync.Done()
}

// 发送循环
func (self *wsSession) sendLoop() {

	var writeList []interface{}

	for {
		writeList = writeList[0:0]
		exit := self.sendQueue.Pick(&writeList)

		// 遍历要发送的数据
		for _, msg := range writeList {

			// TODO SendMsgEvent并不是很有意义
			self.Prop().SendMessage(&lib.SendMsgEvent{Ses: self, Msg: msg})
		}

		if exit {
			break
		}
	}

	// 关闭连接
	if self.conn != nil {
		self.conn.Close()
		self.conn = nil
	}

	// 通知完成
	self.exitSync.Done()
}

// 启动会话的各种资源
func (self *wsSession) Start() {

	// 需要接收和发送线程同时完成时才算真正的完成
	self.exitSync.Add(2)

	// 将会话添加到管理器
	self.GetPeer().(lib.SessionManager).Add(self)

	go func() {
		// 等待2个任务结束
		self.exitSync.Wait()

		// 将会话从管理器移除
		self.GetPeer().(lib.SessionManager).Remove(self)

		if self.endNotify != nil {
			self.endNotify()
		}

	}()

	// 启动并发接收goroutine
	go self.recvLoop()

	// 启动并发发送goroutine
	go self.sendLoop()
}

func newSession(conn *websocket.Conn, p lib.Peer, endNotify func()) *wsSession {
	self := &wsSession{
		conn:      conn,
		endNotify: endNotify,
		sendQueue: lib.NewPipe(),
		Peer:      p,
		// CoreProcBundle: p.(interface {
		// 	GetBundle() *peer.CoreProcBundle
		// }).GetBundle(),
	}

	return self
}
