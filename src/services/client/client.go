package main

import (
	"core/log"
	"core/net/proc"
	"core/net/tcp"
	"errors"
	"reflect"
	"sync"
	"time"
)

func connectToLogin() lib.Session {
	done := make(chan struct{})

	go func() {
		pr := tcp.CreateSyncConnector()

		gp := p.(lib.GenericPeer)
		gp.SetName("login")
		gp.SetAddress(":7300")
		gp.SetQueue(nil)

		bundle := pr.(ProcessorBundle)
		bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
		bundle.SetHooker(proc.NewMultiHooker(new(tcp.MsgHooker), new(TypeRPCHooker)))
		bundle.SetCallback(proc.NewQueuedEventCallback(nil))

		pr.Start()

		conn := pr.(connector)
		if conn.IsReady() {
			ret = conn.Session()
			break
		}

		pr.Stop()

		done <- struct{}{}
	}()

	<-done
	return
}

func connectToGate(addr string, onReady func(lib.Session), onClose func()) {
	var stop sync.WaitGroup

	pr := tcp.CreateSyncConnector()

	gp := pr.(lib.GenericPeer)
	gp.SetName("gate")
	gp.SetAddress(addr)
	gp.SetQueue(nil)

	bundle := pr.(ProcessorBundle)
	bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
	bundle.SetHooker(proc.NewMultiHooker(new(tcp.MsgHooker), new(TypeRPCHooker)))
	bundle.SetCallback(proc.NewQueuedEventCallback(gateMsgHandler))

	stop.Add(1)

	pr.Start()

	conn := pr.(connector)
	if conn.IsReady() {
		onReady(conn.Session())

		stop.Wait()
	}

	pr.Stop()

	if onClose != nil {
		onClose()
	}
}

func gateMsgHandler(ev lib.Event) {
	switch msg := ev.Message().(type) {
	case *lib.SessionClosed:
		stop.Done()
	case *gameProto.ChatACK:
		fmt.Println(msg.Content)
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
		logs.Warn("client.remoteCall rpc time out")
		return errors.New("client.remoteCall rpc time out")
	}
	return nil
}
