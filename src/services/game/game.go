package main

import (
	"services/fx/service"
	"services/gate/api"
	"services/gate/backend"
	"services/msg/proto"

	"core/logs"
	"core/xlib"
)

type svrMsgHandler func(ev lib.Event, msgProto.ClientId)

var (
	handleDefault func(ev lib.Event)
	msgHandlers   = make(map[int32]svrMsgHandler)
)

func regMsgHandler(msgId int32, handler svrMsgHandler) {
	msgHandlers[msgId] = handler
}

func initMsgHandler() {
	regMsgHandler(msgProto.ID_ChatReq, handleChatReq)
	regMsgHandler(msgProto.ID_VerifyReq, handleVerifyReq)

	regMsgHandler(msgProto.ID_AccountEnterGame, handleGameEnter)
	regMsgHandler(msgProto.ID_AccountCreateUser, handleUserCreate)

}

func messageHandler(incomingEv lib.Event) {
	defer util.PrintPanicStackError()

	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid msgProto.ClientId
		cid.ID = ev.ClientId

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcId = agentCtx.SvcId
		}

		// userHandler(incomingEv, cid)
		msgId := codec.MessageToId(ev.Message())
		if handler, ok := msgHandlers[msgId]; ok {
			handler(ev, cid)
		} else {
			logs.Debug("msg handler not found:", msgId)
			if handleDefault != nil {
				handleDefault(ev)
			}
		}
	}

	// switch ev.Message().(type) {
	// case *msgProto.ChatReq:
	// 	handleChatReq(ev)
	// case *msgProto.VerifyReq:
	// 	handleVerifyReq(ev)
	// default:
	// 	if handleDefault != nil {
	// 		handleDefault(ev)
	// 	}
	// }
}

// func handleVerifyReq(incomingEv lib.Event) {
func handleChatReq(ev lib.Event, cid msgProto.ClientId) {

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

// func handleVerifyReq(incomingEv lib.Event) {
func handleVerifyReq(ev lib.Event, cid msgProto.ClientId) {
	msg := ev.Message().(*msgProto.VerifyReq)
	logs.Debug("verfiy:%+v", msg)

	service.Reply(ev, &msgProto.VerifyAck{})
}

// func handleGameEnter(incomingEv lib.Event) {
func handleGameEnter(ev lib.Event, cid msgProto.ClientId) {
	msg := ev.Message().(*msgProto.AccountEnterGame)
	logs.Debug("game enter:", msg.AccountId, msg.LoginKey, msg.ServerIndexId)


	// 消息单发给客户端
	gateapi.Send(&cid, &msgProto.TestAck{
		Dummy: "single send",
	})
}

// func handleUserCreate(incomingEv lib.Event) {
func handleUserCreate(ev lib.Event, cid msgProto.ClientId) {
	msg := ev.Message().(*msgProto.AccountCreateUser)
	logs.Debug("user create:", msg.Name, msg.HeroTempId, msg.Sex, msg.ServerIndexId, msg.ShareKey)

	// 消息单发给客户端
	gateapi.Send(&cid, &msgProto.TestAck{
		Dummy: "single send",
	})
}


