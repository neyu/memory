package main

import (
	"services/fx/service"
	"services/gate/api"
	"services/gate/backend"
	"services/msg/proto"

	"core/log"
	"core/xlib"
)

var handleDefault func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *msgProto.ChatReq:
		handleChatReq(ev)
	case *msgProto.VerifyReq:
		handleVerifyReq(ev)
	default:
		if handleDefault != nil {
			handleDefault(ev)
		}
	}
}

func handleChatReq(incomingEv lib.Event) {

	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid msgProto.ClientId
		cid.Id = ev.ClientId

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcId = agentCtx.SvcId
		}

		// userHandler(incomingEv, cid)
		msg := ev.Message().(*msgProto.ChatReq)
		log.Debug("chat: %+v \n", msg.Content)
		// 消息广播到网关并发给客户端
		gateapi.BroadcastAll(&msgProto.ChatAck{
			Content: msg.Content,
		})
		// 消息单发给客户端
		gateapi.Send(&cid, &msgProto.TestAck{
			Dummy: "single send",
		})
	}
}

func handleVerifyReq(incomingEv lib.Event) {
	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid msgProto.ClientId
		cid.Id = ev.ClientId

		if gateCtx := service.SessionToContext(ev.Session()); gateCtx != nil {
			cid.SvcId = gateCtx.SvcId
		}

		// userHandler(incomingEv, cid)
		msg := ev.Message().(*msgProto.VerifyReq)
		log.Debug("verfiy: %+v \n", msg.GameToken)
		service.Reply(ev, &msgProto.VerifyAck{})
	}
}
