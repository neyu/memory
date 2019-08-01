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

	acceptor := tcp.CreateAcceptor()
	acceptor.SetName("name")
	acceptor.SetAddress(":8082")
	acceptor.SetQueue(queue)

	acceptor.SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.SetHooker(lib.NewMultiHooker(
		new(service.SvcEventHooker), // 服务互联处理
		new(BackendMsgHooker),       // 网关消息处理
		new(tcp.MsgHooker)))         // tcp基础消息处理
	acceptor.SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.SetSocketBuffer(2048, 2048, true)

	acceptor.Start()
}
