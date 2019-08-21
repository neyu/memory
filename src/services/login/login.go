package main

import (
	"services/msg/proto"

	"core/logs"
	// "core/util"
	"core/xlib"
	// "fmt"
)

// 消息处理
var handleLoginDefault func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *msgProto.PingAck:
		// fmt.Println("ping msg, do nothing...")
	case *msgProto.LoginReq:
		handleLoginReq(ev)
	case *msgProto.AccountLogin:
		handleAccountLogin(ev)
	default:
		if handleLoginDefault != nil {
			handleLoginDefault(ev)
		}
	}
}

func handleLoginReq(ev lib.Event) {
	// msg := ev.Message().(*msgProto.LoginReq)
	// TODO 第三方请求验证及信息拉取

	var ack msgProto.LoginAck

	// gateSvcId := hubstatus.SelectServiceByLowUserCount("gate", "", false)
	// if agentSvcId == "" {
	// 	ack.Result = msgProto.ResultCode_GateNotFound

	// 	service.Reply(ev, &ack)
	// 	return
	// }

	// gateWAN := basefx.GetRemoteServiceWANAddress("gate", gateSvcId)
	gateWAN := ":8401" //":8301"

	host, port, err := lib.SpliteAddress(gateWAN)
	if err != nil {
		//log.Errorf("invalid address: '%s' %s", agentWAN, err.Error())
		logs.Error("invalid address: '%s' %s\n", gateWAN, err.Error())

		ack.Result = msgProto.ResultCode_GateAddressError

		// service.Reply(ev, &ack)
		ev.Session().Send(&ack)
		return
	}

	ack.Server = &msgProto.ServerInfo{
		Ip:   host,
		Port: int32(port),
	}

	// ack.GameSvcId = hubstatus.SelectServiceByLowUserCount("game", "", false)
	ack.GameSvcId = "game_1"

	if ack.GameSvcId == "" {
		ack.Result = msgProto.ResultCode_GameNotFound

		// service.Reply(ev, &ack)
		ev.Session().Send(&ack)
		return
	}

	// service.Reply(ev, &ack)
	logs.Debug("handleLoginReq:%+v", ack)
	ev.Session().Send(&ack)
}

func handleAccountLogin(ev lib.Event) {
	// msg := ev.Message().(*msgProto.AccountLogin)

	var ack msgProto.LoginResponse
	ack.MsgCode = 17

	ack.Id = 1314
	ack.Name = "weTest"
	ack.Email = "test@xx.com"
	ack.DeviceId = "device123456"
	ack.Status = 3
	ack.SdkData = "sdkData"
	ack.ExData = "exData"
	ack.LoginCount = 999
	ack.LoginKey = "loginKey..."
	ack.UserServers = "A1,B2,C2"
	ack.RechargeCom = "123"
	ack.SdkChannelId = "sdk channel id"
	ack.BendExpireAt = 1555444333
	ack.BendType = 0

	logs.Debug("handleAccountLogin:%+v", ack)
	ev.Session().Send(&ack)
}
