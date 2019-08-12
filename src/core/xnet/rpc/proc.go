package rpc

import (
	"core/codec"
	"core/logs"
	"core/xlib"
)

type RemoteCallMsg interface {
	GetMsgId() uint16
	GetMsgData() []byte
	GetCallId() int64
}

func ResolveInboundEvent(inputEvent lib.Event) (outputEvent lib.Event, handled bool, err error) {
	if _, ok := inputEvent.(*RecvMsgEvent); ok {
		return inputEvent, false, nil
	}

	rpcMsg, ok := inputEvent.Message().(RemoteCallMsg)
	if !ok {
		return inputEvent, false, nil
	}

	userMsg, _, err := codec.DecodeMessage(int(rpcMsg.GetMsgId()), rpcMsg.GetMsgData())

	if err != nil {
		return inputEvent, false, err
	}

	//if log.IsDebugEnabled() {

	//if !msglog.IsBlockedMessageById(int(rpcMsg.GetMsgId())) {
	peerInfo := inputEvent.Session().GetPeer()
	//log.Debugf("#rpc.recv(%s)@%d len: %d %s | %s",
	logs.Debug("#rpc.recv(%s)@%d len: %d %s | %s\n",
		peerInfo.Name(),
		inputEvent.Session().Id(),
		codec.MessageSize(userMsg),
		codec.MessageToName(userMsg),
		codec.MessageToString(userMsg))
	//}
	//}

	switch inputEvent.Message().(type) {
	case *RemoteCallReq: // 服务端收到客户端的请求
		return &RecvMsgEvent{
			inputEvent.Session(),
			userMsg,
			rpcMsg.GetCallId(),
		}, true, nil
	case *RemoteCallAck: // 客户端收到服务器的回应
		request := getRequest(rpcMsg.GetCallId())
		if request != nil {
			request.RecvFeedback(userMsg)
		}
		return inputEvent, true, nil
	}
	return inputEvent, false, nil
}

func ResolveOutboundEvent(inputEvent lib.Event) (handled bool, err error) {
	rpcMsg, ok := inputEvent.Message().(RemoteCallMsg)
	if !ok {
		return false, nil
	}

	userMsg, _, err := codec.DecodeMessage(int(rpcMsg.GetMsgId()), rpcMsg.GetMsgData())
	if err != nil {
		return false, err
	}

	//if log.IsDebugEnabled() {
	//if !msglog.IsBlockedMessageById(int(rpcMsg.GetMsgId())) {
	peerInfo := inputEvent.Session().GetPeer()
	//log.Debugf("#rpc.send(%s)@%d len: %d %s | %s",
	logs.Debug("#rpc.send(%s)@%d len: %d %s | %s\n",
		peerInfo.Name(),
		inputEvent.Session().Id(),
		codec.MessageSize(userMsg),
		codec.MessageToName(userMsg),
		codec.MessageToString(userMsg))
	//}
	//}

	// 避免后续环节处理
	return true, nil
}
