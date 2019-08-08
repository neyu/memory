package tcp

import (
	"core/log"
	"core/util"
	"core/xlib"

	"net"
	"strings"
	"time"
)

// 接受器
type tcpAcceptor struct {
	lib.SessionManager
	// lib.Peer
	lib.PeerProp

	// lib.CorePeerProperty
	// lib.CoreContextSet
	// lib.CoreRunningTag
	// lib.CoreProcBundle
	// lib.CoreTCPSocketOption
	// lib.CoreCaptureIOPanic

	// 保存侦听器
	listener net.Listener
}

func (self *tcpAcceptor) Prop() *lib.PeerProp {
	return self.GetProp()
}

func (self *tcpAcceptor) Port() int {
	if self.listener == nil {
		return 0
	}

	return self.listener.Addr().(*net.TCPAddr).Port
}

func (self *tcpAcceptor) IsReady() bool {

	return self.IsRunning()
}

// 异步开始侦听
func (self *tcpAcceptor) Start() {

	self.WaitStopFinished()

	if self.IsRunning() {
		return
	}

	ln, err := util.DetectPort(self.Address(), func(a *util.Address, port int) (interface{}, error) {
		return net.Listen("tcp", a.HostPortString(port))
	})

	if err != nil {

		logs.Error("#tcp.listen failed(%s) %v", self.Name(), err.Error())

		self.SetRunning(false)

		return
	}

	self.listener = ln.(net.Listener)

	logs.Info("#tcp.listen(%s) %s", self.Name(), self.ListenAddress())

	go self.accept()

	return
}

func (self *tcpAcceptor) ListenAddress() string {

	pos := strings.Index(self.Address(), ":")
	if pos == -1 {
		return self.Address()
	}

	host := self.Address()[:pos]

	return util.JoinAddress(host, self.Port())
}

func (self *tcpAcceptor) accept() {
	self.SetRunning(true)

	for {
		conn, err := self.listener.Accept()

		if self.IsStopping() {
			break
		}

		if err == nil {
			// 处理连接进入独立线程, 防止accept无法响应
			go self.onNewSession(conn)

		} else {

			if nerr, ok := err.(net.Error); ok && nerr.Temporary() {
				time.Sleep(time.Millisecond)
				continue
			}

			// 调试状态时, 才打出accept的具体错误
			logs.Error("#tcp.accept failed(%s) %v", self.Name(), err.Error())
			break
		}
	}

	self.SetRunning(false)

	self.EndStopping()

}

func (self *tcpAcceptor) onNewSession(conn net.Conn) {

	self.ApplySocketOption(conn)

	ses := newSession(conn, self, nil)

	ses.Start()

	self.ProcEvent(&lib.RecvMsgEvent{
		Ses: ses,
		Msg: &lib.SessionAccepted{},
	})
}

// 停止侦听器
func (self *tcpAcceptor) Stop() {
	if !self.IsRunning() {
		return
	}

	if self.IsStopping() {
		return
	}

	self.StartStopping()

	self.listener.Close()

	// 断开所有连接
	self.CloseAllSession()

	// 等待线程结束
	self.WaitStopFinished()
}

func (self *tcpAcceptor) TypeName() string {
	return "tcp.Acceptor"
}

func NewAcceptor() lib.Peer {
	this := &tcpAcceptor{
		// SessionManager: new(peer.CoreSessionManager),
		SessionManager: lib.NewSessionManager(),
	}
	// this.CoreTCPSocketOption.Init()
	this.Init()
	return this
}

func init() {
	// peer.RegisterPeerCreator(func() lib.Peer {
	// 	p := &tcpAcceptor{
	// 		SessionManager: new(peer.CoreSessionManager),
	// 	}

	// 	p.CoreTCPSocketOption.Init()

	// 	return p
	// })
}
