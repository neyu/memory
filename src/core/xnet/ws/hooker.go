package ws

import (
	// "core/codec"
	// "core/logs"
	"core/xlib"
)

// 萃取消息中的消息
type PacketMessagePeeker interface {
	Message() interface{}
}

// 带有RPC和relay功能
type MsgHooker struct {
}

func (self MsgHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	// // msglog.WriteRecvLogger(log, "ws", inputEvent.Session(), inputEvent.Message())
	// ses := inputEvent.Session()
	// msg := inputEvent.Message()
	// // if log.IsDebugEnabled() {
	// if peeker, ok := msg.(PacketMessagePeeker); ok {
	// 	msg = peeker.Message()
	// }

	// // if service.IsMsgLogValid(codec.MessageToID(msg)) {
	// peerInfo := ses.GetPeer().Prop()

	// logs.Debug("#%s.recv(%s)@%d len: %d %s | %s",
	// 	"ws",
	// 	peerInfo.Name(),
	// 	ses.Id(),
	// 	codec.MessageSize(msg),
	// 	codec.MessageToName(msg),
	// 	codec.MessageToString(msg))
	// // }
	// // }

	return inputEvent
}

func (self MsgHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {
	// // msglog.WriteSendLogger(log, "ws", inputEvent.Session(), inputEvent.Message())
	// ses := inputEvent.Session()
	// msg := inputEvent.Message()
	// // if log.IsDebugEnabled() {
	// if peeker, ok := msg.(PacketMessagePeeker); ok {
	// 	msg = peeker.Message()
	// }

	// // if IsMsgLogValid(lib.MessageToID(msg)) {
	// peerInfo := ses.GetPeer().Prop()

	// logs.Debug("#%s.send(%s)@%d len: %d %s | %s",
	// 	"ws",
	// 	peerInfo.Name(),
	// 	ses.Id(),
	// 	codec.MessageSize(msg),
	// 	codec.MessageToName(msg),
	// 	codec.MessageToString(msg))
	// // }
	// // }

	return inputEvent
}
