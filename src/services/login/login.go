package main

import (
	"services/game/entity"
	"services/msg/proto"

	"core/logs"
	"core/util"
	"core/xlib"
	// "fmt"
)

// 消息处理
var handleLoginDefault func(ev lib.Event)

func messageHandler(ev lib.Event) {
	defer util.PrintPanicStackError()

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
	msg := ev.Message().(*msgProto.AccountLogin)
	logs.Alert("account login:", msg.GetName())

	var ack msgProto.LoginResponse

	ent := tb.AccountEntity{}
	ent.Name = msg.GetName()

	err := accDao.FindByAcc([]string{"id", "email", "loginCount", "pwd"}, []interface{}{&ent.Id, &ent.Email, &ent.LoginCount, &ent.Pwd}, ent.Name)
	if err != nil {
		ack.RetCode = 4 // 账号为空
	} else {
		if ent.Pwd != msg.GetPwd() {
			ack.RetCode = 17 // 密码不正确
		} else {
			ack.RetCode = 0 // 返回账号信息

			ack.Id = ent.Id
			ack.Name = ent.Name
			ack.Email = ent.Email
			ack.DeviceId = ent.DeviceId
			ack.Status = int32(ent.Status)
			ack.SdkData = ent.SdkData
			ack.ExData = ent.ExData
			ack.LoginCount = ent.LoginCount
			ack.LoginKey = ent.LoginKey
			ack.UserServers = ent.UserServers
			ack.RechargeCom = ent.RechargeCom
			ack.SdkChannelId = ent.SdkChannelId
			ack.BendExpireAt = ent.BendExpireAt
			ack.BendType = int32(ent.BendType)
		}
	}
	logs.Debug("handleAccountLogin:%+v", ack)
	ev.Session().Send(&ack)
}
