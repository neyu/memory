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
	acceptor.SetName("name")
	acceptor.SetAddress(":8300")
	acceptor.SetQueue(queue)

	acceptor.(*lib.PeerProp).SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.(*lib.PeerProp).SetHooker(new(tcp.MsgHooker))
	acceptor.(*lib.PeerProp).SetCallback(lib.NewQueuedEventCallback(messageHandler))

	waitExitSignal()
	log.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	log.Info("receive system signal: %d", <-ch)
}
