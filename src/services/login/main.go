package main

import (
	"core/libs"
	"core/log"

	"os"
	"os/signal"
	"syscall"

	"fmt"
)

func init() {
	fmt.Println("login server init...")
}

func main() {
	fmt.Println("login server entry")

	queue := lib.NewEventQueue()
	queue.StartLoop()

	// queue.Wait()

	pr := tcp.CreateAcceptor()

	gp := pr.(lib.GenericPeer)
	gp.SetName("name")
	gp.SetAddress("addr")
	gp.SetQueue(queue)

	bundle := pr.(ProcessorBundle)
	bundle.SetTransmitter(new(TCPMessageTransmitter))
	bundle.SetHooker(new(MsgHooker))
	bundle.SetCallback(proc.NewQueuedEventCallback(messageHandler))

	waitExitSignal()
	logs.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}
