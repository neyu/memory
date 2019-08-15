package ws

import (
	"core/logs"
	"core/xlib"

	"github.com/gorilla/websocket"

	"net"
	"net/http"
	"strings"
	"time"
)

type wsSyncConnector struct {
	lib.SessionManager
	lib.PeerProp

	// peer.SessionManager

	// peer.CorePeerProperty
	// peer.CoreContextSet
	// peer.CoreProcBundle
	// peer.CoreTCPSocketOption

	defaultSes *wsSession
}

func (self *wsSyncConnector) Prop() *lib.PeerProp {
	return self.GetProp()
}

func (self *wsSyncConnector) Port() int {
	if self.defaultSes.conn == nil {
		return 0
	}

	return self.defaultSes.conn.LocalAddr().(*net.TCPAddr).Port
}

func (self *wsSyncConnector) Start() {

	dialer := websocket.Dialer{}
	dialer.Proxy = http.ProxyFromEnvironment
	dialer.HandshakeTimeout = 45 * time.Second

	var finalAddress string
	if !strings.HasPrefix(self.Address(), "ws://") {
		finalAddress = "ws://" + self.Address()
	}

	conn, _, err := dialer.Dial(finalAddress, nil)

	// 发生错误时退出
	if err != nil {

		logs.Debug("#ws.connect failed(%s)@%d address: %s", self.Name(), self.defaultSes.Id(), self.Address())

		self.ProcEvent(&lib.RecvMsgEvent{Ses: self.defaultSes, Msg: &lib.SessionConnectError{}})
		return
	}

	self.defaultSes.conn = conn

	self.defaultSes.Start()

	self.ProcEvent(&lib.RecvMsgEvent{Ses: self.defaultSes, Msg: &lib.SessionConnected{}})

	return
}

func (self *wsSyncConnector) Session() lib.Session {
	return self.defaultSes
}

func (self *wsSyncConnector) SetSessionManager(raw interface{}) {
	self.SessionManager = raw.(lib.SessionManager)
}

func (self *wsSyncConnector) ReconnectDuration() time.Duration {
	return 0
}

func (self *wsSyncConnector) SetReconnectDuration(v time.Duration) {

}

func (self *wsSyncConnector) Stop() {

	if self.defaultSes != nil {
		self.defaultSes.Close()
	}

}

func (self *wsSyncConnector) IsReady() bool {

	return self.SessionCount() != 0
}

func (self *wsSyncConnector) TypeName() string {
	return "gorillaws.SyncConnector"
}

func NewSyncConnector() lib.Peer {
	this := &wsSyncConnector{
		SessionManager: lib.NewSessionManager(),
	}

	this.defaultSes = newSession(nil, this, nil)

	return this
}

// func init() {

// 	peer.RegisterPeerCreator(func() cellnet.Peer {
// 		self := &wsSyncConnector{
// 			SessionManager: new(peer.CoreSessionManager),
// 		}

// 		self.defaultSes = newSession(nil, self, nil)

// 		return self
// 	})
// }
