package main

import (
	"core/lib"
	"core/log"
)

func main() {
	log.Info("game server entry")

	createAcceptor()

	waitExitSignal()
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	<-ch
}

func createAcceptor() {
	queue := lib.NewEventQueue()
	queue.StartLoop()

	pr := tcp.CreateAcceptor()
	gp := pr.(lib.GenericPeer)
	gp.SetName("name")
	gp.SetAddress(":8082")
	gp.SetQueue(queue)

	bundle := pr.(ProcessorBundle)
	bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
	bundle.SetHooker(proc.NewMultiHooker(
		new(service.SvcEventHooker), // 服务互联处理
		new(BackendMsgHooker),       // 网关消息处理
		new(tcp.MsgHooker)))         // tcp基础消息处理
	bundle.SetCallback(proc.NewQueuedEventCallback(messageHandler))

	if opt, ok := pr.(peer.TCPSocketOption); ok {
		opt.SetSocketBuffer(2048, 2048, true)
	}
	pr.Start()
}
