package main

import (
	"core/lib"
	"core/log"
	"fmt"
)

func main() {
	log.Info("gate server entry")

	connectToGame()

	createAcceptor()

	waitExitSignal()

	stop()
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	<-ch
}

func connectToGame() {
	queue := lib.NewEventQueue()
	queue.StartLoop()

	connector := tcp.CreateConnector()
	connector.SetName("game")
	connector.SetAddress(":8302")
	connector.SetQueue(queue)

	connector.SetTransmitter(new(tcp.TCPMessageTransmitter))
	connector.SetHooker(lib.NewMultiHooker(
		new(service.SvcEventHooker), // 服务互联处理
		new(broadcasterHooker),      // 网关消息处理
		new(tcp.MsgHooker)))         // tcp基础消息处理
	connector.SetCallback(lib.NewQueuedEventCallback(gameMsgHandler))

	connector.SetSocketBuffer(2048, 2048, true)
	connector.SetReconnectDuration(time.Second * 3)

	connector.Start()
}

func createAcceptor() {
	acceptor := tcp.CreateAcceptor()
	acceptor.SetName("gate")
	acceptor.SetAddress(":8303")

	acceptor.SetTransmitter(new(directTCPTransmitter))
	acceptor.SetHooker(lib.NewMultiHooker(
		new(tcp.MsgHooker),       //  TCP基础消息及日志
		new(FrontendEventHooker), // 内部消息处理
	))
	acceptor.SetCallback(proc.NewQueuedEventCallback(nil))

	acceptor.SetSocketBuffer(2048, 2048, true)
	acceptor.SetSocketDeadline(time.Second*40, time.Second*20)

	acceptor.Start()

	model.FrontendSessionManager = acceptor
}

func stop() {
	if model.FrontendSessionManager != nil {
		model.FrontendSessionManager.(lib.Peer).Stop()
		// discovery.Default.Deregister(model.AgentSvcID)
	}
}
