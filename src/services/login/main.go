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

	gPeer := createAcceptor(queue)

	// proc.BindProcessorHandler(gPeer, "NetProcName", messageHandler)
	// proc(bundle, userCallback, args...)
	// bundle := peer.(ProcessorBundle)
	gPeer.SetTransmitter(new(TCPMessageTransmitter))
	gPeer.SetHooker(new(MsgHooker))
	gPeer.SetCallback(proc.NewQueuedEventCallback(messageHandler))

	waitExitSignal()
	logs.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}
