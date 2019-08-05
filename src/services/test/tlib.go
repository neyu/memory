package main

import (
	"core/log"
	"core/xlib"
)

func main() {
	pr := lib.NewPeer()
	pr.SetName("test peer library")

	log.Info("Name:%s", pr.Name())
}
