package main

import (
	"services/msg/proto"

	"core/log"
	"core/xlib"
	"core/xnet/tcp"

	"errors"
	"reflect"
	"sync"
	"time"
)

var (
	callByType sync.Map
)

func connectToLogin() (ret lib.Session) {
	done := make(chan struct{})

	go func() {
		syncConn := tcp.CreateSyncConnector()
		syncConn.SetName("login")
		syncConn.SetAddress(":7300")

		syncConn.SetTransmitter(new(tcp.TCPMessageTransmitter))
		syncConn.SetHooker(lib.NewMultiHooker(new(tcp.MsgHooker), new(TypeRPCHooker)))

		syncConn.Start()

		if syncConn.IsReady() {
			ret = syncConn.Session()
			// break
		}

		syncConn.Stop()

		done <- struct{}{}
	}()

	<-done
	return
}

func connectToGate(addr string, onReady func(lib.Session), onClose func()) {
	var stop sync.WaitGroup

	syncConn := tcp.CreateSyncConnector()
	syncConn.SetName("gate")
	syncConn.SetAddress(addr)

	syncConn.SetTransmitter(new(tcp.TCPMessageTransmitter))
	syncConn.SetHooker(lib.NewMultiHooker(new(tcp.MsgHooker), new(TypeRPCHooker)))
	syncConn.SetCallback(lib.NewQueuedEventCallback(gateMsgHandler))

	stop.Add(1)

	syncConn.Start()

	if syncConn.IsReady() {
		onReady(syncConn.Session())

		stop.Wait()
	}

	syncConn.Stop()

	if onClose != nil {
		onClose()
	}
}

func gateMsgHandler(ev lib.Event) {
	switch msg := ev.Message().(type) {
	case *lib.SessionClosed:
		// stop.Done()
	case *msgProto.ChatAck:
		log.Info(msg.Content)
	}
}

// callback = func(ack *YouMsgAck)
func remoteCall(ses lib.Session, req interface{}, callback interface{}) error {
	funcType := reflect.TypeOf(callback)
	if funcType.Kind() != reflect.Func {
		panic("callback require 'func'")
	}

	feedBack := make(chan interface{})

	if funcType.NumIn() != 1 {
		panic("callback func param format like 'func(ack *YouMsgAck)'")
	}
	ackType := funcType.In(0)
	if ackType.Kind() != reflect.Ptr {
		panic("callback func param format like 'func(ack *YouMsgAck)'")
	}
	ackType = ackType.Elem()
	callByType.Store(ackType, feedBack)
	defer callByType.Delete(ackType)

	ses.Send(req)

	select {
	case ack := <-feedBack:
		vCall := reflect.ValueOf(callback)
		vCall.Call([]reflect.Value{reflect.ValueOf(ack)})
		return nil
	case <-time.After(time.Second * 10):
		log.Warn("client.remoteCall rpc time out")
		return errors.New("client.remoteCall rpc time out")
	}
	return nil
}
