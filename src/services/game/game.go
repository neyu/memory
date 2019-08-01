package main

import (
	"services/msg/proto"
	
	"core/lib"
	"core/log"
)

var Handle_Game_Default func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *ChatREQ:
		Handle_Game_ChatREQ(ev)
	case *VerifyREQ:
		Handle_Game_VerifyREQ(ev)
	default:
		if Handle_Game_Default != nil {
			Handle_Game_Default(ev)
		}
	}
}

func Handle_Game_ChatREQ(incomingEv lib.Event) {

	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid msgProto.ClientID
		cid.ID = ev.ClientID

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcID = agentCtx.SvcID
		}

		// userHandler(incomingEv, cid)
		msg := ev.Message().(*msgProto.ChatReq)
		fmt.Printf("chat: %+v \n", msg.Content)
		// 消息广播到网关并发给客户端
		agentapi.BroadcastAll(&msgProto.ChatAck{
			Content: msg.Content,
		})
		// 消息单发给客户端
		agentapi.Send(&cid, &msgProto.TestAck{
			Dummy: "single send",
		})
	}
})


func Handle_Game_VerifyREQ(incomingEv lib.Event) {
	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid msgProto.ClientID
		cid.ID = ev.ClientID

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcID = agentCtx.SvcID
		}

		// userHandler(incomingEv, cid)
		msg := ev.Message().(*msgProto.VerifyReq)
		fmt.Printf("verfiy: %+v \n", msg.GameToken)
		service.Reply(ev, &msgProto.VerifyAck{})
	}
})