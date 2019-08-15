package ws

import (
	"core/logs"
	// "core/util"
	"core/xlib"

	"github.com/gorilla/websocket"

	"fmt"
	"net"
	"net/http"
	"sync"
	"time"
)

type wsConnector struct {
	lib.SessionManager
	lib.PeerProp

	// peer.CoreSessionManager

	// peer.CorePeerProperty
	// peer.CoreContextSet
	// peer.CoreRunningTag
	// peer.CoreProcBundle

	defaultSes *wsSession

	tryConnTimes int // 尝试连接次数

	sesEndSignal sync.WaitGroup

	reconDur time.Duration
}

func (self *wsConnector) Prop() *lib.PeerProp {
	return self.GetProp()
}

func (self *wsConnector) Start() {

	self.WaitStopFinished()

	if self.IsRunning() {
		return
	}

	go self.connect(self.Address())

	return
}

func (self *wsConnector) Session() lib.Session {
	return self.defaultSes
}

func (self *wsConnector) Port() int {
	if self.defaultSes.conn == nil {
		return 0
	}

	return self.defaultSes.conn.LocalAddr().(*net.TCPAddr).Port
}

func (self *wsConnector) SetSessionManager(raw interface{}) {
	self.SessionManager = raw.(lib.SessionManager)
}

func (self *wsConnector) Stop() {

	if !self.IsRunning() {
		return
	}

	if self.IsStopping() {
		return
	}

	self.StartStopping()

	// 通知发送关闭
	self.defaultSes.Close()

	// 等待线程结束
	self.WaitStopFinished()
}

func (self *wsConnector) ReconnectDuration() time.Duration {

	return self.reconDur
}

func (self *wsConnector) SetReconnectDuration(v time.Duration) {
	self.reconDur = v
}

const reportConnectFailedLimitTimes = 3

func (self *wsConnector) connect(address string) {

	self.SetRunning(true)

	for {
		self.tryConnTimes++

		dialer := websocket.Dialer{}
		dialer.Proxy = http.ProxyFromEnvironment
		dialer.HandshakeTimeout = 45 * time.Second

		addrObj, err := lib.ParseAddress(address)
		if err != nil {
			logs.Error("invalid address: %s", address)
			break
		}

		// 处理非法路径问题
		var finalAddress string
		if addrObj.Scheme == "ws" || addrObj.Scheme == "wss" {
			finalAddress = address
		} else {
			finalAddress = "ws://" + fmt.Sprintf("%s:%d%s", addrObj.Host, addrObj.MinPort, addrObj.Path)
		}

		conn, _, err := dialer.Dial(finalAddress, nil)
		self.defaultSes.conn = conn

		if err != nil {
			if self.tryConnTimes <= reportConnectFailedLimitTimes {

				logs.Error("#ws.connect failed(%s) %v", self.Name(), err.Error())

				if self.tryConnTimes == reportConnectFailedLimitTimes {
					logs.Error("(%s) continue reconnecting, but mute log", self.Name())
				}
			}

			// 没重连就退出
			if self.ReconnectDuration() == 0 || self.IsStopping() {

				self.ProcEvent(&lib.RecvMsgEvent{
					Ses: self.defaultSes,
					Msg: &lib.SessionConnectError{},
				})
				break
			}

			// 有重连就等待
			time.Sleep(self.ReconnectDuration())

			// 继续连接
			continue

		}

		self.sesEndSignal.Add(1)

		self.defaultSes.Start()

		self.tryConnTimes = 0

		self.ProcEvent(&lib.RecvMsgEvent{Ses: self.defaultSes, Msg: &lib.SessionConnected{}})

		self.sesEndSignal.Wait()

		self.defaultSes.conn = nil

		// 没重连就退出/主动退出
		if self.IsStopping() || self.ReconnectDuration() == 0 {
			break
		}

		// 有重连就等待
		time.Sleep(self.ReconnectDuration())
	}

	self.SetRunning(false)
	self.EndStopping()

}

func (self *wsConnector) TypeName() string {
	return "gorillaws.Connector"
}

func NewConnector() lib.Peer {
	this := &wsConnector{}

	this.defaultSes = newSession(nil, this, func() {
		this.sesEndSignal.Done()
	})

	return this
}

// func init() {

// 	peer.RegisterPeerCreator(func() cellnet.Peer {
// 		self := &wsConnector{}

// 		self.defaultSes = newSession(nil, self, func() {
// 			self.sesEndSignal.Done()
// 		})

// 		return self
// 	})
// }
