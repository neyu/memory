package main

import (
	"core/log"
	"core/xlib"
	"core/xnet/tcp"

	"os"
	"os/signal"
	"syscall"
)

func init() {
	logs.Info("login server init...")
}

func main() {
	logs.Info("login server entry")

	queue := lib.NewEventQueue()
	queue.StartLoop()

	// queue.Wait()

	acceptor := tcp.NewAcceptor()
	acceptor.SetName("login_svr")
	acceptor.SetAddress(":8300")
	acceptor.SetQueue(queue)

	acceptor.Prop().SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.Prop().SetHooker(new(tcp.MsgHooker))
	acceptor.Prop().SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.Start()

	waitExitSignal()
	logs.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}
