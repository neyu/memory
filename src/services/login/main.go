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
	log.Info("login server init...")
}

func main() {
	log.Info("login server entry")

	queue := lib.NewEventQueue()
	queue.StartLoop()

	// queue.Wait()

	acceptor := tcp.NewAcceptor()
	acceptor.SetName("login_svr")
	acceptor.SetAddress(":8300")
	acceptor.SetQueue(queue)

	acceptor.(*tcp.TcpAcceptor).SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.(*tcp.TcpAcceptor).SetHooker(new(tcp.MsgHooker))
	acceptor.(*tcp.TcpAcceptor).SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.(*tcp.TcpAcceptor).Start()

	waitExitSignal()
	log.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	log.Info("receive system signal: %d", <-ch)
}
