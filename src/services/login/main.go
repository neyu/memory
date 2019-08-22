package main

import (
	"services/fx/config"
	"services/fx/service"

	"core/logs"
	"core/xlib"
	"core/xnet/tcp"
	"core/xnet/ws"

	"os"
	"os/signal"
	"syscall"
)

func init() {
	logs.Info("login server init...")
}

func main() {
	logs.Info("login server entry")

	config.Init("local")

	initMsgHandler()

	service.StartMysql()
	laodDao()
	handleServerListGet(nil)

	// createAcceptor()
	createAcceptorWs()

	waitExitSignal()
	logs.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}

func createAcceptor() {
	queue := lib.NewEventQueue()
	queue.StartLoop()

	// queue.Wait()

	acceptor := tcp.NewAcceptor()
	acceptor.SetName("login_tcp_svr")
	acceptor.SetAddress(":8300")
	acceptor.SetQueue(queue)

	acceptor.Prop().SetTransmitter(new(tcp.TCPMessageTransmitter))
	acceptor.Prop().SetHooker(new(tcp.MsgHooker))
	acceptor.Prop().SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.Start()
}

func createAcceptorWs() {
	queue := lib.NewEventQueue()
	queue.StartLoop()

	acceptor := ws.NewAcceptor()
	acceptor.SetName("login_ws_svr")
	acceptor.SetAddress(":8400")
	acceptor.SetQueue(queue)

	acceptor.Prop().SetTransmitter(new(ws.WSMessageTransmitter))
	acceptor.Prop().SetHooker(new(ws.MsgHooker))
	acceptor.Prop().SetCallback(lib.NewQueuedEventCallback(messageHandler))

	acceptor.Start()
}
