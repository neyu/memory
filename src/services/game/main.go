package main

import (
	"services/fx/service"
	"services/gate/backend"

	"core/logs"
	"core/xlib"
	"core/xnet/tcp"

	"os"
	"os/signal"
	"syscall"
)

func main() {
	logs.Info("game server entry")

	initMsgHandler()
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

	acceptor := tcp.NewAcceptor()
	acceptor.SetName("game_1")
	acceptor.SetAddress(":8302")
	acceptor.SetQueue(queue)

	acceptor.Prop().SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.Prop().SetHooker(lib.NewMultiHooker(
		new(service.SvcEventHooker),   // 服务互联处理
		new(backend.BackendMsgHooker), // 网关消息处理
		new(tcp.MsgHooker)))           // tcp基础消息处理
	acceptor.Prop().SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.Prop().SetSocketBuffer(2048, 2048, true)

	acceptor.Start()
}
