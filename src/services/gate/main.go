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

	pr := tcp.CreateConnector()

	gp := pr.(lib.GenericPeer)
	gp.SetName("game")
	gp.SetAddress(":8302")
	gp.SetQueue(queue)

	bundle := pr.(ProcessorBundle)
	bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
	bundle.SetHooker(proc.NewMultiHooker(
		new(service.SvcEventHooker), // 服务互联处理
		new(broadcasterHooker),      // 网关消息处理
		new(tcp.MsgHooker)))         // tcp基础消息处理
	bundle.SetCallback(proc.NewQueuedEventCallback(gameMsgHandler))

	if opt, ok := pr.(peer.TCPSocketOption); ok {
		opt.SetSocketBuffer(2048, 2048, true)
	}
	pr.(peer.TCPConnector).SetReconnectDuration(time.Second * 3)
	pr.Start()
}

func createAcceptor() {
	pr := tcp.CreateAcceptor()

	gp := pr.(lib.GenericPeer)
	gp.SetName("gate")
	gp.SetAddress(":8303")
	gp.SetQueue(nil)

	bundle := pr.(ProcessorBundle)
	bundle.SetTransmitter(new(directTCPTransmitter))
	bundle.SetHooker(proc.NewMultiHooker(
		new(tcp.MsgHooker),       //  TCP基础消息及日志
		new(FrontendEventHooker), // 内部消息处理
	))
	bundle.SetCallback(proc.NewQueuedEventCallback(nil))

	if socketOpt, ok := pr.(peer.TCPSocketOption); ok {
		// 无延迟设置缓冲
		socketOpt.SetSocketBuffer(2048, 2048, true)

		// 40秒无读，20秒无写断开
		socketOpt.SetSocketDeadline(time.Second*40, time.Second*20)
	}

	pr.Start()

	model.FrontendSessionManager = pr.(peer.SessionManager)
}

func stop() {
	if model.FrontendSessionManager != nil {
		model.FrontendSessionManager.(lib.Peer).Stop()
		// discovery.Default.Deregister(model.AgentSvcID)
	}
}
