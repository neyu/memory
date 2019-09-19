package main

import (
	"services/fx"
	"services/game/entity"
	"services/msg/proto"

	"core/codec"
	"core/logs"
	"core/util"
	"core/xlib"

	"strings"
	// "fmt"
)

type svrMsgHandler func(ev lib.Event)

// 消息处理
var (
	handleLoginDefault func(ev lib.Event)
	msgHandlers        = make(map[int32]svrMsgHandler)
)

func regMsgHandler(msgId int32, handler svrMsgHandler) {
	msgHandlers[msgId] = handler
}

func initMsgHandler() {
	regMsgHandler(msgProto.ID_LoginReq, handleLoginReq)
	regMsgHandler(msgProto.ID_PingAck, handlePingAck)

	regMsgHandler(msgProto.ID_AccountLogin, handleAccountLogin)
	regMsgHandler(msgProto.ID_AccountRegister, handleAccountRegist)
	regMsgHandler(msgProto.ID_SvrListGet, handleServerListGet)
	regMsgHandler(msgProto.ID_UserSvrsGet, handleUserServersGet)

}

func messageHandler(ev lib.Event) {
	defer util.PrintPanicStackError() // 不是这样写的，后面回归正常流程里

	msgId := codec.MessageToId(ev.Message())
	if handler, ok := msgHandlers[msgId]; ok {
		handler(ev)
	} else {
		logs.Debug("msg handler not found:", msgId)
		if handleLoginDefault != nil {
			handleLoginDefault(ev)
		}
	}

	// switch ev.Message().(type) {
	// case *msgProto.PingAck:
	// 	// fmt.Println("ping msg, do nothing...")
	// case *msgProto.LoginReq:
	// 	handleLoginReq(ev)
	// case *msgProto.AccountLogin:
	// 	handleAccountLogin(ev)
	// default:
	// 	if handleLoginDefault != nil {
	// 		handleLoginDefault(ev)
	// 	}
	// }
}

func handleLoginReq(ev lib.Event) {
	// msg := ev.Message().(*msgProto.LoginReq)
	// TODO 第三方请求验证及信息拉取

	var ack msgProto.LoginAck

	// gateSvcId := hubstatus.SelectServiceByLowUserCount("gate", "", false)
	// if gateSvcId == "" {
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

func handlePingAck(ev lib.Event) {
	//
}

func handleAccountLogin(ev lib.Event) {
	msg := ev.Message().(*msgProto.AccountLogin)
	logs.Alert("account login:", msg)

	var ack msgProto.LoginResponse

	ent := tb.AccountEntity{}
	ent.Name = msg.Account

	ret := accDao.FindByName([]string{"id", "email", "loginCount", "pwd"},
		[]interface{}{&ent.Id, &ent.Email, &ent.LoginCount, &ent.Pwd}, ent.Name)
	if ret != 0 {
		ack.RetCode = ret
		if ret == 1 {
			ack.RetCode = fx.TipCode("loginNoUser")
		}
	} else {
		if ent.Pwd != msg.GetPwd() {
			ack.RetCode = fx.TipCode("loginWordWrong")
		} else {
			ack.AccId = ent.Id
			ack.Account = ent.Name
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

func handleAccountRegist(ev lib.Event) {
	msg := ev.Message().(*msgProto.AccountRegister)
	logs.Alert("account register:", msg)

	var ack msgProto.LoginResponse

	ent := &tb.AccountEntity{}
	ent.Name = msg.Account
	ent.Pwd = msg.Pwd
	ent.ChannelId = msg.ChannelId
	ent.DeviceId = msg.DeviceId

	ret := accDao.FindByName([]string{"id", "email", "loginCount", "pwd"},
		[]interface{}{&ent.Id, &ent.Email, &ent.LoginCount, &ent.Pwd}, ent.Name)
	if ret == 0 {
		ack.RetCode = fx.TipCode("regHasUser")

		logs.Debug("handleAccountRegist:%+v", ack)
		ev.Session().Send(&ack)

		return
	} else {
		if ret == 1 {
			ret2 := _createNewAccount(ent)

			if ret2 != 0 {
				ack.RetCode = ret2
			} else {
				ack.AccId = ent.Id
				ack.Account = ent.Name
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

			logs.Debug("handleAccountRegist:%+v", ack)
			ev.Session().Send(&ack)

			return
		} else {
			ack.RetCode = ret

			logs.Debug("handleAccountRegist:%+v", ack)
			ev.Session().Send(&ack)

			return
		}
	}
}

func handleServerListGet(ev lib.Event) {
	msg := ev.Message().(*msgProto.SvrListGet)
	logs.Alert("server list get:", msg)

	var ack msgProto.SvrListResponse
	ack.RetType = 0

	type colDef struct {
		Id       int32
		Name     string
		Area     string
		Host     string
		Port     string
		ServerId int32
	}
	var cols colDef
	resSet, ret := svrInfoDao.FindAll([]string{"id", "name", "area", "host", "port", "serverId"}, &cols)
	if ret != 0 {
		ack.RetCode = ret

		ev.Session().Send(&ack)
		logs.Debug("handleServerListGet error0")

		return
	}
	if len(resSet) == 0 {
		ack.RetCode = fx.TipCode("noOpenNow")

		ev.Session().Send(&ack)
		logs.Debug("handleServerListGet error1")

		return
	}

	var infos []*msgProto.PbSvrInfo
	for idx, item := range resSet {
		logs.Debug("server :", idx, item)
		record := item.(*colDef)

		infos = append(infos, &msgProto.PbSvrInfo{
			Id:       record.Id,
			Name:     record.Name,
			Area:     record.Area,
			Host:     record.Host,
			Port:     record.Port,
			ServerId: record.ServerId,
		})
	}

	ack.Infos = infos
	ev.Session().Send(&ack)
}

func handleUserServersGet(ev lib.Event) {
	msg := ev.Message().(*msgProto.UserSvrsGet)
	logs.Alert("user servers get:", msg)

	var ack msgProto.SvrListResponse
	ack.RetType = 1

	ent := &tb.AccountEntity{}
	ent.Id = msg.AccId

	ret := accDao.FindById([]string{"userServers"}, []interface{}{&ent.UserServers}, ent.Id)
	if ret != 0 {
		ack.RetCode = ret

		ev.Session().Send(&ack)
		logs.Debug("handleUserServersGet error0")

		return
	}
	svrIds := strings.Trim(ent.UserServers, "[]")
	if svrIds == "" {
		ack.RetCode = fx.TipCode("userSvrNull")

		ev.Session().Send(&ack)
		logs.Debug("handleUserServersGet null")

		return
	}

	type colDef struct {
		Id       int32
		Name     string
		Area     string
		Host     string
		Port     string
		ServerId int32
	}
	var cols colDef
	resSet, ret := svrInfoDao.FindInSet([]string{"id", "name", "area", "host", "port", "serverId"}, &cols, svrIds)
	if ret != 0 {
		ack.RetCode = ret

		ev.Session().Send(&ack)
		logs.Debug("handleUserServersGet error1")

		return
	}
	if len(resSet) == 0 {
		ack.RetCode = fx.TipCode("svrMiss")

		ev.Session().Send(&ack)
		logs.Debug("handleUserServersGet error2")

		return
	}

	var infos []*msgProto.PbSvrInfo
	for idx, item := range resSet {
		logs.Debug("server :", idx, item)
		record := item.(*colDef)

		infos = append(infos, &msgProto.PbSvrInfo{
			Id:       record.Id,
			Name:     record.Name,
			Area:     record.Area,
			Host:     record.Host,
			Port:     record.Port,
			ServerId: record.ServerId,
		})
	}

	ack.Infos = infos
	ev.Session().Send(&ack)
}
