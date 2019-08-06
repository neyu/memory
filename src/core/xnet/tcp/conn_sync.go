package tcp

import (
	"core/xlib"

	"fmt"
	"net"
	"time"
)

type TcpSyncConnector struct {
	lib.SessionManager

	// lib.Peer
	lib.PeerProp

	// lib.CoreContextSet
	// lib.CoreProcBundle
	// lib.CoreTCPSocketOption

	defaultSes *tcpSession
}

func (this *TcpSyncConnector) Port() int {
	if this.defaultSes.conn == nil {
		return 0
	}

	return this.defaultSes.conn.LocalAddr().(*net.TCPAddr).Port
}

func (this *TcpSyncConnector) Start() {

	// 尝试用Socket连接地址
	conn, err := net.Dial("tcp", this.Address())

	// 发生错误时退出
	if err != nil {

		//log.Debugf("#tcp.connect failed(%s)@%d address: %s", this.Name(), this.defaultSes.Id(), this.Address())
		fmt.Printf("#tcp.connect failed(%s)@%d address: %s\n", this.Name(), this.defaultSes.Id(), this.Address())

		this.ProcEvent(&lib.RecvMsgEvent{Ses: this.defaultSes, Msg: &lib.SessionConnectError{}})
		return
	}

	this.defaultSes.conn = conn

	this.ApplySocketOption(conn)

	this.defaultSes.Start()

	this.ProcEvent(&lib.RecvMsgEvent{Ses: this.defaultSes, Msg: &lib.SessionConnected{}})

	return
}

func (this *TcpSyncConnector) Session() lib.Session {
	return this.defaultSes
}

func (this *TcpSyncConnector) SetSessionManager(raw interface{}) {
	this.SessionManager = raw.(lib.SessionManager)
}

func (this *TcpSyncConnector) ReconnectDuration() time.Duration {
	return 0
}

func (this *TcpSyncConnector) SetReconnectDuration(v time.Duration) {

}

func (this *TcpSyncConnector) Stop() {

	if this.defaultSes != nil {
		this.defaultSes.Close()
	}

}

func (this *TcpSyncConnector) IsReady() bool {

	return this.SessionCount() != 0
}

func (this *TcpSyncConnector) TypeName() string {
	return "tcp.SyncConnector"
}

func CreateSyncConnector() lib.Peer {
	this := &TcpSyncConnector{
		SessionManager: lib.NewSessionManager(),
	}
	this.defaultSes = newSession(nil, this, nil)
	// this.CoreTCPSocketOption.Init()
	this.Init()
	return this
}

// func init() {

// 	peer.RegisterPeerCreator(func() lib.Peer {
// 		this := &tcpSyncConnector{
// 			SessionManager: new(peer.CoreSessionManager),
// 		}

// 		this.defaultSes = newSession(nil, this, nil)

// 		this.CoreTCPSocketOption.Init()

// 		return this
// 	})
// }
