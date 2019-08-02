package tcp

import (
	"core/relay"
	"core/rpc"
	"core/xlib"

	"fmt"
)

type MsgHooker struct {
	//
}

func (this MsgHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	var handled bool
	var err error

	inputEvent, handled, err = rpc.ResolveInboundEvent(inputEvent)
	if err != nil {
		//log.Errorln("rpc.ResolveInboundEvent:", err)
		fmt.Println("rpc.ResolveInboundEvent:", err)
		return
	}
	if !handled {
		inputEvent, handled, err = relay.ResolveInboundEvent(inputEvent)
		if err != nil {
			//log.Errorln("relay.ResolveInboundEvent:", err)
			fmt.Println("relay.ResolveInboundEvent:", err)
			return
		}
		if !handled {
			//msglog.WriteRecvLogger(log, "tcp", inputEvent.Session(), inputEvent.Message())
		}
	}
	return inputEvent
}

func (this MsgHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	handled, err := rpc.ResolveOutboundEvent(inputEvent)
	if err != nil {
		//log.Errorln("rpc.ResolveOutboundEvent:", err)
		fmt.Println("rpc.ResolveOutboundEvent:", err)
		return nil
	}
	if !handled {
		handled, err = relay.ResolveOutboundEvent(inputEvent)
		if err != nil {
			//log.Errorln("relay.ResolveOutboundEvent:", err)
			fmt.Println("relay.ResolveOutboundEvent:", err)
			return nil
		}
		if !handled {
			//msglog.WriteSendLogger(log, "tcp", inputEvent.Session(), inputEvent.Message())
		}
	}
	return inputEvent
}
