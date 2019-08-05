package main

import (
	"services/fx/service"
	"services/gate/backend"

	"core/log"
	"core/xlib"
	"core/xnet/tcp"

	"os"
	"os/signal"
	"syscall"
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

	acceptor := tcp.NewAcceptor()
	acceptor.SetName("name")
	acceptor.SetAddress(":8302")
	acceptor.SetQueue(queue)

	acceptor.(*lib.PeerProp).SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.(*lib.PeerProp).SetHooker(lib.NewMultiHooker(
		new(service.SvcEventHooker),   // 服务互联处理
		new(backend.BackendMsgHooker), // 网关消息处理
		new(tcp.MsgHooker)))           // tcp基础消息处理
	acceptor.(*lib.PeerProp).SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.(*lib.PeerProp).SetSocketBuffer(2048, 2048, true)

	// acceptor.Start()
}
