package main

import (
	"core/lib"
	"core/log"
)

// 消息处理
var Handle_Game_Default func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *LoginREQ:
		Handle_Login_LoginREQ(ev)
	default:
		if Handle_Login_Default != nil {
			Handle_Login_Default(ev)
		}
	}
}

func Handle_Login_LoginREQ(ev lib.Event) {
	//msg := ev.Message().(*gameProto.LoginREQ)
	// TODO 第三方请求验证及信息拉取

	var ack gameProto.LoginACK

	agentSvcID := hubstatus.SelectServiceByLowUserCount("agent", "", false)
	if agentSvcID == "" {
		ack.Result = gameProto.ResultCode_AgentNotFound

		service.Reply(ev, &ack)
		return
	}

	agentWAN := basefx.GetRemoteServiceWANAddress("agent", agentSvcID)

	host, port, err := util.SpliteAddress(agentWAN)
	if err != nil {
		//log.Errorf("invalid address: '%s' %s", agentWAN, err.Error())
		fmt.Printf("invalid address: '%s' %s\n", agentWAN, err.Error())

		ack.Result = gameProto.ResultCode_AgentAddressError

		service.Reply(ev, &ack)
		return
	}

	ack.Server = &gameProto.ServerInfo{
		IP:   host,
		Port: int32(port),
	}

	ack.GameSvcID = hubstatus.SelectServiceByLowUserCount("game", "", false)

	if ack.GameSvcID == "" {
		ack.Result = gameProto.ResultCode_GameNotFound

		service.Reply(ev, &ack)
		return
	}

	service.Reply(ev, &ack)
}
