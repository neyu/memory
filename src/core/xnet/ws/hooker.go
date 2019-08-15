package ws

import (
	"core/logs"
	"core/xlib"
)

// 带有RPC和relay功能
type MsgHooker struct {
}

func (self MsgHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	// msglog.WriteRecvLogger(log, "ws", inputEvent.Session(), inputEvent.Message())
	ses := inputEvent.Session()
	msg := inputEvent.Message()
	// if log.IsDebugEnabled() {
	if peeker, ok := msg.(PacketMessagePeeker); ok {
		msg = peeker.Message()
	}

	// if IsMsgLogValid(cellnet.MessageToID(msg)) {
	peerInfo := ses.Peer.Prop()

	logs.Debug("#%s.recv(%s)@%d len: %d %s | %s",
		"ws",
		peerInfo.Name(),
		ses.ID(),
		lib.MessageSize(msg),
		lib.MessageToName(msg),
		lib.MessageToString(msg))
	// }
	// }

	return inputEvent
}

func (self MsgHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	// msglog.WriteSendLogger(log, "ws", inputEvent.Session(), inputEvent.Message())
	ses := inputEvent.Session()
	msg := inputEvent.Message()
	// if log.IsDebugEnabled() {
	if peeker, ok := msg.(PacketMessagePeeker); ok {
		msg = peeker.Message()
	}

	// if IsMsgLogValid(lib.MessageToID(msg)) {
	peerInfo := ses.Peer.Prop()

	logs.Debug("#%s.send(%s)@%d len: %d %s | %s",
		"ws",
		peerInfo.Name(),
		ses.ID(),
		lib.MessageSize(msg),
		lib.MessageToName(msg),
		lib.MessageToString(msg))
	// }
	// }

	return inputEvent
}
