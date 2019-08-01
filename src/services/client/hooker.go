package main

import (
	"core/lib"
)

type TypeRPCHooker struct {
}

func (TypeRPCHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	outputEvent, _, err := ResolveInboundEvent(inputEvent)
	if err != nil {
		//log.Errorln("rpc.ResolveInboundEvent", err)
		fmt.Println("rpc.ResolveInboundEvent", err)
		return
	}

	return outputEvent
}

func (TypeRPCHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	return inputEvent
}

func ResolveInboundEvent(inputEvent lib.Event) (ouputEvent lib.Event, handled bool, err error) {
	incomingMsgType := reflect.TypeOf(inputEvent.Message()).Elem()

	if rawFeedback, ok := callByType.Load(incomingMsgType); ok {
		feedBack := rawFeedback.(chan interface{})
		feedBack <- inputEvent.Message()
		return inputEvent, true, nil
	}

	return inputEvent, false, nil
}
