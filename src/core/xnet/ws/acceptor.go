package ws

import (
	"core/logs"
	// "core/util"
	"core/xlib"

	"github.com/gorilla/websocket"

	"net"
	"net/http"
	"time"
)

type wsAcceptor struct {
	lib.SessionManager
	lib.PeerProp

	// peer.CoreSessionManager
	// peer.CorePeerProperty
	// peer.CoreContextSet
	// peer.CoreProcBundle

	useSSL   bool
	certfile string
	keyfile  string

	upgrader websocket.Upgrader
	// 保存端口
	listener net.Listener

	sv *http.Server
}

func (self *wsAcceptor) Prop() *lib.PeerProp {
	return self.GetProp()
}

func (self *wsAcceptor) SetUpgrader(upgrader interface{}) {
	self.upgrader = upgrader.(websocket.Upgrader)
}
func (self *wsAcceptor) Port() int {
	if self.listener == nil {
		return 0
	}

	return self.listener.Addr().(*net.TCPAddr).Port
}

func (self *wsAcceptor) IsReady() bool {

	return self.Port() != 0
}

func (self *wsAcceptor) SetTls(certfile, keyfile string) {
	self.useSSL = true
	self.certfile = certfile
	self.keyfile = keyfile
}

func (self *wsAcceptor) Start() {

	var (
		// addrObj *lib.Address
		err error
		// raw     interface{}
	)

	// raw, err = util.DetectPort(self.Address(), func(a *util.Address, port int) (interface{}, error) {
	// 	addrObj = a
	// 	return net.Listen("tcp", a.HostPortString(port))
	// })

	addr := self.Address()
	if addr == "" {
		addr = ":http"
	}
	ln, err := net.Listen("tcp", addr)
	if err != nil {
		logs.Error("#ws.listen failed(%s) %v", self.Name(), err.Error())
		return
	}

	// self.listener = raw.(net.Listener)
	self.listener = ln

	mux := http.NewServeMux()

	// if addrObj.Path == "" {
	// 	addrObj.Path = "/"
	// }

	// mux.HandleFunc(addrObj.Path, self.wsHandler)
	mux.HandleFunc("/", self.wsHandler)

	// self.sv = &http.Server{Addr: addrObj.HostPortString(self.Port()), Handler: mux}
	self.sv = &http.Server{Addr: addr, Handler: mux}

	go func() {

		logs.Info("#ws.listen(%s) %s", self.Name(), addr)

		if self.certfile != "" && self.keyfile != "" {
			err = self.sv.ServeTLS(self.listener, self.certfile, self.keyfile)
		} else {
			err = self.sv.Serve(self.listener)
		}

		if err != nil {
			logs.Error("#ws.listen. failed(%s) %v", self.Name(), err.Error())
		}

	}()

	return
}

func (self *wsAcceptor) wsHandler(w http.ResponseWriter, r *http.Request) {
	c, err := self.upgrader.Upgrade(w, r, nil)
	if err != nil {
		logs.Debug(err)
		return
	}

	ses := newSession(c, self, nil)
	// ses.SetContext("request", r)
	ses.Start()

	self.ProcEvent(&lib.RecvMsgEvent{Ses: ses, Msg: &lib.SessionAccepted{}})
}

func (self *wsAcceptor) Stop() {

	// TODO 关闭处理
}

func (self *wsAcceptor) TypeName() string {
	return "gorillaws.Acceptor"
}

func NewAcceptor() lib.Peer {
	this := &wsAcceptor{
		SessionManager: lib.NewSessionManager(),
		upgrader: websocket.Upgrader{
			ReadBufferSize:   10 * 1024,
			WriteBufferSize:  10 * 1024,
			HandshakeTimeout: 5 * time.Second,
			CheckOrigin: func(r *http.Request) bool {
				return true
			},
		},
	}
	return this
}

// func init() {

// 	peer.RegisterPeerCreator(func() cellnet.Peer {
// 		p := &wsAcceptor{
// 			upgrader: websocket.Upgrader{
// 				CheckOrigin: func(r *http.Request) bool {
// 					return true
// 				},
// 			},
// 		}

// 		return p
// 	})
// }
