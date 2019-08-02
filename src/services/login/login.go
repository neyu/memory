package main

import (
	"services/msg/proto"

	"core/log"
	"core/util"
	"core/xlib"
)

// 消息处理
var handleLoginDefault func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *msgProto.LoginReq:
		handleLoginReq(ev)
	default:
		if handleLoginDefault != nil {
			handleLoginDefault(ev)
		}
	}
}

func handleLoginReq(ev lib.Event) {
	//msg := ev.Message().(*gameProto.LoginREQ)
	// TODO 第三方请求验证及信息拉取

	var ack msgProto.LoginAck

	// gateSvcID := hubstatus.SelectServiceByLowUserCount("gate", "", false)
	// if agentSvcID == "" {
	// 	ack.Result = msgProto.ResultCode_GateNotFound

	// 	service.Reply(ev, &ack)
	// 	return
	// }

	// gateWAN := basefx.GetRemoteServiceWANAddress("gate", gateSvcID)
	gateWAN := ":8301"

	host, port, err := util.SpliteAddress(gateWAN)
	if err != nil {
		//log.Errorf("invalid address: '%s' %s", agentWAN, err.Error())
		log.Error("invalid address: '%s' %s\n", gateWAN, err.Error())

		ack.Result = msgProto.ResultCode_AgentAddressError

		// service.Reply(ev, &ack)
		ev.Session().Send(&ack)
		return
	}

	ack.Server = &msgProto.ServerInfo{
		IP:   host,
		Port: int32(port),
	}

	// ack.GameSvcID = hubstatus.SelectServiceByLowUserCount("game", "", false)
	ack.GameSvcID = "game_1"

	if ack.GameSvcID == "" {
		ack.Result = msgProto.ResultCode_GameNotFound

		// service.Reply(ev, &ack)
		ev.Session().Send(&ack)
		return
	}

	// service.Reply(ev, &ack)
	ev.Session().Send(&ack)
}
