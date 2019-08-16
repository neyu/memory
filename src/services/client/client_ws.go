package main

import (
	// "core/logs"
	"core/xlib"
	"core/xnet/ws"

	"sync"
)

func connectToLoginWs() (ret lib.Session) {
	done := make(chan struct{})

	go func() {
		syncConn := ws.NewSyncConnector()

		syncConn.SetName("client-to-login")
		syncConn.SetAddress(":8400")

		syncConn.Prop().SetTransmitter(new(ws.WSMessageTransmitter))
		syncConn.Prop().SetHooker(lib.NewMultiHooker(new(ws.MsgHooker), new(TypeRPCHooker)))

		syncConn.Start()

		if syncConn.(peerChecker).IsReady() {
			ret = syncConn.(peerChecker).Session()

			done <- struct{}{}
			return
		}

		syncConn.Stop()

		done <- struct{}{}
	}()

	<-done
	return
}

func connectToGateWs(addr string, onReady func(lib.Session), onClose func()) {
	var stop sync.WaitGroup

	syncConn := ws.NewSyncConnector()
	syncConn.SetName("gate")
	syncConn.SetAddress(addr)

	syncConn.Prop().SetTransmitter(new(ws.WSMessageTransmitter))
	syncConn.Prop().SetHooker(lib.NewMultiHooker(new(ws.MsgHooker), new(TypeRPCHooker)))
	syncConn.Prop().SetCallback(lib.NewQueuedEventCallback(gateMsgHandler))

	stop.Add(1)

	syncConn.Start()

	if syncConn.(peerChecker).IsReady() {
		onReady(syncConn.(peerChecker).Session())

		stop.Wait()
	}

	syncConn.Stop()

	if onClose != nil {
		onClose()
	}
}
