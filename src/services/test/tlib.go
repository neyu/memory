package main

import (
	"core/log"
	"core/xlib"
	"core/xnet/tcp"
)

func main() {
	pr := lib.NewPeer()
	pr.SetName("test peer library")

	logs.Info("Name:%s", pr.Name())

	acceptor := tcp.NewAcceptor()
	logs.Info("acceptor:%+v" acceptor)
}
