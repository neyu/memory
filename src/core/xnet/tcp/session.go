package tcp

import (
	"core/logs"
	"core/util"
	"core/xlib"

	"net"
	"sync"
	"sync/atomic"
	"time"
)

// Socket会话
type tcpSession struct {
	// lib.CoreContextSet
	// lib.CoreSessionIdentify
	// *lib.CoreProcBundle
	lib.Peer
	lib.ContextSet

	id int64

	// Socket原始连接
	conn      net.Conn
	connGuard sync.RWMutex

	// 退出同步器
	exitSync sync.WaitGroup

	// 发送队列
	sendQueue *lib.Pipe

	cleanupGuard sync.Mutex

	endNotify func()

	closing int64
}

func (this *tcpSession) Id() int64 {
	return this.id
}

func (this *tcpSession) SetId(id int64) {
	this.id = id
}

func (self *tcpSession) setConn(conn net.Conn) {
	self.connGuard.Lock()
	self.conn = conn
	self.connGuard.Unlock()
}

func (self *tcpSession) Conn() net.Conn {
	self.connGuard.RLock()
	defer self.connGuard.RUnlock()
	return self.conn
}

func (self *tcpSession) GetPeer() lib.Peer {
	return self.Peer
}

// 取原始连接
func (self *tcpSession) Raw() interface{} {
	return self.Conn()
}

func (self *tcpSession) Close() {

	closing := atomic.SwapInt64(&self.closing, 1)
	if closing != 0 {
		return
	}

	conn := self.Conn()

	if conn != nil {
		// 关闭读
		tcpConn := conn.(*net.TCPConn)
		// 关闭读
		tcpConn.CloseRead()
		// 手动读超时
		tcpConn.SetReadDeadline(time.Now())
	}
}

// 发送封包
func (self *tcpSession) Send(msg interface{}) {

	// 只能通过Close关闭连接
	if msg == nil {
		return
	}

	// 已经关闭，不再发送
	if self.IsManualClosed() {
		return
	}

	self.sendQueue.Add(msg)
}

func (self *tcpSession) IsManualClosed() bool {
	return atomic.LoadInt64(&self.closing) != 0
}

func (self *tcpSession) protectedReadMessage() (msg interface{}, err error) {

	defer func() {

		if err := recover(); err != nil {
			logs.Error("IO panic: %s", err)
			self.Conn().Close()
		}

	}()

	msg, err = self.Prop().ReadMessage(self)
	// msg, err = self.peer.(*TcpAcceptor).ReadMessage(self)

	return
}

// 接收循环
func (self *tcpSession) recvLoop() {

	var capturePanic bool

	// if i, ok := self.Peer().(cellnet.PeerCaptureIOPanic); ok {
	// 	capturePanic = i.CaptureIOPanic()
	// }

	for self.Conn() != nil {

		var msg interface{}
		var err error

		if capturePanic {
			msg, err = self.protectedReadMessage()
		} else {
			msg, err = self.Prop().ReadMessage(self)
			// msg, err = self.peer.PeerProp.ReadMessage(self)
		}

		if err != nil {
			if !util.IsEOFOrNetReadError(err) {
				logs.Error("session closed, sesid: %d, err: %s", self.Id(), err)
			}

			self.sendQueue.Add(nil)

			// 标记为手动关闭原因
			closedMsg := &lib.SessionClosed{}
			if self.IsManualClosed() {
				closedMsg.Reason = lib.CloseReason_Manual
			}

			self.Prop().ProcEvent(&lib.RecvMsgEvent{Ses: self, Msg: closedMsg})
			break
		}

		self.Prop().ProcEvent(&lib.RecvMsgEvent{Ses: self, Msg: msg})
	}

	// 通知完成
	self.exitSync.Done()
}

// 发送循环
func (self *tcpSession) sendLoop() {

	var writeList []interface{}

	for {
		writeList = writeList[0:0]
		exit := self.sendQueue.Pick(&writeList)

		// 遍历要发送的数据
		for _, msg := range writeList {

			self.Prop().SendMessage(&lib.SendMsgEvent{Ses: self, Msg: msg})
			// self.peer.(*TcpAcceptor).SendMessage(&lib.SendMsgEvent{Ses: self, Msg: msg})
		}

		if exit {
			break
		}
	}

	// 完整关闭
	conn := self.Conn()
	if conn != nil {
		conn.Close()
	}

	// 通知完成
	self.exitSync.Done()
}

// 启动会话的各种资源
func (self *tcpSession) Start() {

	atomic.StoreInt64(&self.closing, 0)

	// connector复用session时，上一次发送队列未释放可能造成问题
	self.sendQueue.Reset()

	// 需要接收和发送线程同时完成时才算真正的完成
	self.exitSync.Add(2)

	// 将会话添加到管理器, 在线程处理前添加到管理器(分配id), 避免ID还未分配,就开始使用id的竞态问题
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

func newSession(conn net.Conn, p lib.Peer, endNotify func()) *tcpSession {
	self := &tcpSession{
		conn:      conn,
		endNotify: endNotify,
		sendQueue: lib.NewPipe(),
		Peer:      p,
		// CoreProcBundle: p.(interface {
		// 	GetBundle() *lib.CoreProcBundle
		// }).GetBundle(),
	}

	return self
}
