package main

import (
	"core/log"
	"core/xlib"
	"core/xnet/tcp"
)

func main() {
	pr := lib.NewPeer()
	pr.SetName("test peer library")

	log.Info("Name:%s", pr.Name())

	acceptor := tcp.NewAcceptor()
	log.Info("acceptor:%+v" acceptor)
}
