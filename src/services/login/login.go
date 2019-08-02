package main

import (
	"services/msg/proto"

	"core/log"
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

	agentSvcID := hubstatus.SelectServiceByLowUserCount("agent", "", false)
	if agentSvcID == "" {
		ack.Result = msgProto.ResultCode_AgentNotFound

		service.Reply(ev, &ack)
		return
	}

	agentWAN := basefx.GetRemoteServiceWANAddress("agent", agentSvcID)

	host, port, err := util.SpliteAddress(agentWAN)
	if err != nil {
		//log.Errorf("invalid address: '%s' %s", agentWAN, err.Error())
		log.Error("invalid address: '%s' %s\n", agentWAN, err.Error())

		ack.Result = msgProto.ResultCode_AgentAddressError

		service.Reply(ev, &ack)
		return
	}

	ack.Server = &msgProto.ServerInfo{
		IP:   host,
		Port: int32(port),
	}

	// for test no hub...
	ack.GameSvcID = hubstatus.SelectServiceByLowUserCount("game", "", false)

	if ack.GameSvcID == "" {
		ack.Result = msgProto.ResultCode_GameNotFound

		service.Reply(ev, &ack)
		return
	}

	service.Reply(ev, &ack)
}
