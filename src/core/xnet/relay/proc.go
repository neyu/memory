package relay

import (
	"core/codec"
	"core/xlib"
)

type PassthroughContent struct {
	Int64      int64
	Int64Slice []int64
	Str        string
}

func ResolveInboundEvent(inputEvent lib.Event) (outputEvent lib.Event, handled bool, err error) {
	switch relayMsg := inputEvent.Message().(type) {
	case *RelayAck:
		ev := &RecvMsgEvent{
			Ses: inputEvent.Session(),
			ack: relayMsg,
		}
		if relayMsg.MsgId != 0 {
			ev.Msg, _, err = codec.DecodeMessage(relayMsg.MsgId, relayMsg.Msg)
			if err != nil {
				return
			}
		}
		//if log.IsDebugEnabled() && !msglog.IsBlockedMessageByID(int(relayMsg.MsgID)) {
		//peerInfo := inputEvent.Session().Peer().(lib.PeerProperty)
		//log.Debugf
		// fmt.Printf("#relay.recv(%s)@%d len: %d %s <%s>| %s",
		// 	peerInfo.Name(),
		// 	inputEvent.Session().ID(),
		// 	codec.MessageSize(ev.Message()),
		// 	codec.MessageToName(ev.Message()),
		// 	codec.MessageToString(relayMsg),
		// 	codec.MessageToString(ev.Message()))
		// //}

		if bcFunc != nil {
			lib.SessionQueuedCall(inputEvent.Session(), func() {
				bcFunc(ev)
			})
		}
		return ev, true, nil
	}
	return inputEvent, false, nil
}

func ResolveOutboundEvent(inputEvent lib.Event) (handled bool, err error) {
	switch relayMsg := inputEvent.Message().(type) {
	case *RelayAck:
		//if log.IsDebugEnabled() && !msglog.IsBlockedMessageByID(int(relayMsg.MsgID)) {

		//var payload interface{}
		if relayMsg.MsgId != 0 {

			//payload
			_, _, err = codec.DecodeMessage(relayMsg.MsgId, relayMsg.Msg)
			if err != nil {
				return
			}
			//fmt.Println(payload)
		}

		//peerInfo := inputEvent.Session().Peer().(lib.PeerProperty)
		//log.Debugf
		// fmt.Printf("#relay.send(%s)@%d len: %d %s <%s>| %s",
		// 	peerInfo.Name(),
		// 	inputEvent.Session().ID(),
		// 	codec.MessageSize(payload),
		// 	codec.MessageToName(payload),
		// 	codec.MessageToString(relayMsg),
		// 	codec.MessageToString(payload))
		// //}
		return true, nil
	}
	return true, nil
}
