package main

import (
	"core/lib"
	"core/log"

	"fmt"
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

	acceptor := tcp.CreateAcceptor()
	acceptor.SetName("name")
	acceptor.SetAddress("addr")
	acceptor.SetQueue(queue)

	acceptor.SetTransmitter(new(TCPMessageTransmitter))
	acceptor.SetHooker(new(MsgHooker))
	acceptor.SetCallback(lib.NewQueuedEventCallback(messageHandler))

	waitExitSignal()
	log.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	log.Info("receive system signal: %d", <-ch)
}
