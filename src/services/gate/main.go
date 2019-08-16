package main

import (
	"services/fx/service"
	"services/gate/backend"
	"services/gate/frontend"
	"services/gate/model"

	"core/logs"
	"core/xlib"
	"core/xnet/tcp"
	"core/xnet/ws"

	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	logs.Info("gate server entry")

	connectToGame()

	// createAcceptor()
	createAcceptorWs()

	waitExitSignal()

	stop()
}

func stop() {
	if model.FrontendSessionManager != nil {
		model.FrontendSessionManager.(lib.Peer).Stop()
		// discovery.Default.Deregister(model.GateSvcId)
	}
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	<-ch
}

type reconnector interface {
	SetReconnectDuration(time.Duration)
}

func connectToGame() {
	queue := lib.NewEventQueue()
	queue.StartLoop()

	connector := tcp.NewConnector()
	connector.SetName("game")
	connector.SetAddress(":8302")
	connector.SetQueue(queue)

	connector.Prop().SetTransmitter(new(tcp.TCPMessageTransmitter))
	connector.Prop().SetHooker(lib.NewMultiHooker(
		new(service.SvcEventHooker),    // 服务互联处理
		new(backend.BroadcasterHooker), // 网关消息处理
		new(tcp.MsgHooker)))            // tcp基础消息处理
	connector.Prop().SetCallback(lib.NewQueuedEventCallback(messageHandler))

	connector.Prop().SetSocketBuffer(2048, 2048, true)
	connector.(reconnector).SetReconnectDuration(time.Second * 3)

	connector.Start()
}

func createAcceptor() {
	acceptor := tcp.NewAcceptor()
	acceptor.SetName("gate")
	acceptor.SetAddress(":8301")

	acceptor.Prop().SetTransmitter(new(frontend.DirectTCPTransmitter))
	acceptor.Prop().SetHooker(lib.NewMultiHooker(
		new(tcp.MsgHooker),                //  TCP基础消息及日志
		new(frontend.FrontendEventHooker), // 内部消息处理
	))

	acceptor.Prop().SetSocketBuffer(2048, 2048, true)
	acceptor.Prop().SetSocketDeadline(time.Second*40, time.Second*20)

	acceptor.Start()

	model.FrontendSessionManager = acceptor.(lib.SessionManager)
}

func createAcceptorWs() {
	acceptor := ws.NewAcceptor()
	acceptor.SetName("gate")
	acceptor.SetAddress(":8401")

	acceptor.Prop().SetTransmitter(new(frontend.DirectWSMessageTransmitter))
	acceptor.Prop().SetHooker(lib.NewMultiHooker(
		new(ws.MsgHooker),                 //  WS基础消息及日志
		new(frontend.FrontendEventHooker), // 内部消息处理
	))

	acceptor.Prop().SetSocketBuffer(2048, 2048, true)
	acceptor.Prop().SetSocketDeadline(time.Second*40, time.Second*20)

	acceptor.Start()

	model.FrontendSessionManager = acceptor.(lib.SessionManager)
}
