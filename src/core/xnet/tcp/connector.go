package tcp

import (
	"core/xlib"

	"fmt"
	"net"
	"sync"
	"time"
)

type tcpConnector struct {
	lib.SessionManager

	// lib.Peer
	lib.PeerProp
	// lib.CoreContextSet
	// lib.CoreRunningTag
	// lib.CoreProcBundle
	// lib.CoreTCPSocketOption

	defaultSes *tcpSession

	tryConnTimes int

	sesEndSignal sync.WaitGroup

	reconDur time.Duration
}

func (this *tcpConnector) Start() {
	this.WaitStopFinished()
	if this.IsRunning() {
		return
	}

	go this.connect(this.Address())
	return
}

func (this *tcpConnector) Session() lib.Session {
	return this.defaultSes
}

func (this *tcpConnector) SetSessionManager(raw interface{}) {
	this.SessionManager = raw.(lib.SessionManager)
}

func (this *tcpConnector) Stop() {
	if !this.IsRunning() {
		return
	}
	if this.IsStopping() {
		return
	}
	this.StartStopping()
	this.defaultSes.Close()
	this.WaitStopFinished()
}

func (this *tcpConnector) ReconnectDuration() time.Duration {
	return this.reconDur
}

func (this *tcpConnector) SetReconnectDuration(v time.Duration) {
	this.reconDur = v
}

func (this *tcpConnector) Port() int {
	if this.defaultSes.conn == nil {
		return 0
	}
	return this.defaultSes.conn.LocalAddr().(*net.TCPAddr).Port
}

const reportConnectFailedLimitTimes = 3

func (this *tcpConnector) connect(address string) {
	this.SetRunning(true)
	for {
		this.tryConnTimes++
		conn, err := net.Dial("tcp", address)
		this.defaultSes.conn = conn
		if err != nil {
			if this.tryConnTimes <= reportConnectFailedLimitTimes {
				fmt.Printf("#tcp.connect failed(%s) %v\n", this.Name(), err.Error())

				if this.tryConnTimes == reportConnectFailedLimitTimes {
					fmt.Printf("(%s) continue reconnecting, but mute log\n", this.Name())
				}
			}

			if this.ReconnectDuration() == 0 || this.IsStopping() {
				this.ProcEvent(&lib.RecvMsgEvent{
					Ses: this.defaultSes,
					Msg: &lib.SessionConnectError{},
				})
				break
			}

			time.Sleep(this.ReconnectDuration())
			continue
		}
		this.sesEndSignal.Add(1)
		this.ApplySocketOption(conn)
		this.defaultSes.Start()
		this.tryConnTimes = 0
		this.ProcEvent(&lib.RecvMsgEvent{
			Ses: this.defaultSes,
			Msg: &lib.SessionConnected{},
		})

		// 等待下一波重连
		this.sesEndSignal.Wait()
		this.defaultSes.conn = nil

		if this.IsStopping() || this.ReconnectDuration() == 0 {
			break
		}

		time.Sleep(this.ReconnectDuration())
		continue
	}
	this.SetRunning(false)
	this.EndStopping()
}

func (self *tcpConnector) IsReady() bool {

	return self.SessionCount() != 0
}

func (this *tcpConnector) TypeName() string {
	return "tcp.Connector"
}

func CreateConnector() *tcpConnector {
	this := &tcpConnector{
		// SessionManager: new(lib.CoreSessionManager),
		SessionManager: lib.NewSessionManager(),
	}
	this.defaultSes = newSession(nil, this, func() {
		this.sesEndSignal.Done()
	})
	// this.CoreTCPSocketOption.Init()
	this.Init()
	return this
}

// func init() {
// 	peer.RegisterPeerCreator(func() lib.Peer {
// 		this := &tcpConnector{
// 			SessionManager: new(peer.CoreSessionManager),
// 		}
// 		this.defaultSes = newSession(nil, this, func() {
// 			this.sesEndSignal.Done()
// 		})
// 		this.CoreTCPSocketOption.Init()
// 		return this
// 	})
// }
