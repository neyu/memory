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

	waitExitSignal()
	logs.Info("main exit!")
}

func createAcceptor() {
	p := &tcpAcceptor{
		SessionManager: new(peer.CoreSessionManager),
	}
	p.CoreTCPSocketOption.Init()
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}
