package main

import (
	"services/fx"
	"services/game/entity"
	"services/msg/proto"

	"core/codec"
	"core/logs"
	"core/util"
	"core/xlib"
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

	regMsgHandler(msgProto.ID_AccountLogin, handleAccountLogin)
	regMsgHandler(msgProto.ID_AccountRegister, handleAccountRegist)
	regMsgHandler(msgProto.ID_ServerInfoGetServerList, handleServerListGet)
	regMsgHandler(msgProto.ID_ServerInfoGetUserServers, handleUserServersGet)

}

func messageHandler(ev lib.Event) {
	defer util.PrintPanicStackError()

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
	logs.Alert("account login:", msg)

	var ack msgProto.LoginResponse

	ent := tb.AccountEntity{}
	ent.Name = msg.GetName()

	code := accDao.FindByAcc([]string{"id", "email", "loginCount", "pwd"},
		[]interface{}{&ent.Id, &ent.Email, &ent.LoginCount, &ent.Pwd}, ent.Name)
	if code != 0 {
		ack.RetCode = code
	} else {
		if ent.Pwd != msg.GetPwd() {
			ack.RetCode = fx.TipCode("loginWordWrong")
		} else {
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

func handleAccountRegist(ev lib.Event) {
	msg := ev.Message().(*msgProto.AccountRegister)
	logs.Alert("account register:", msg)

	var ack msgProto.LoginResponse

	ent := &tb.AccountEntity{}
	ent.Name = msg.Name
	ent.Pwd = msg.Name
	ent.ChannelId = msg.ChannelId
	ent.DeviceId = msg.DeviceId

	code := accDao.FindByAcc([]string{"id", "email", "loginCount", "pwd"},
		[]interface{}{&ent.Id, &ent.Email, &ent.LoginCount, &ent.Pwd}, ent.Name)
	if code == 0 {
		ack.RetCode = fx.TipCode("regHasUser")

		logs.Debug("handleAccountRegist:%+v", ack)
		ev.Session().Send(&ack)

		return
	} else {
		if code == fx.TipCode("loginNoUser") {
			code = _createNewAccount(ent)

			if code != 0 {
				ack.RetCode = code
			} else {
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

			logs.Debug("handleAccountRegist:%+v", ack)
			ev.Session().Send(&ack)

			return
		} else {
			ack.RetCode = code

			logs.Debug("handleAccountRegist:%+v", ack)
			ev.Session().Send(&ack)

			return
		}
	}
}

func handleServerListGet(ev lib.Event) {
	msg := ev.Message().(*msgProto.ServerInfoGetServerList)
	logs.Alert("server list get:", msg)

	var ack msgProto.ServerListResponse

	type colDef struct {
		Id           int32
		Name         string
		MergerName   string
		Area         string
		Host         string
		Port         string
		IsNew        int32
		Status       int32
		Sort         int32
		AppId        string
		ServerId     int32
		IndexId      int32
		IsClose      int32
		CloseExplain string
		ServerDate   int64
	}
	var cols colDef
	resSet, code := svrInfoDao.FindAll([]string{"id", "name", "area", "host", "port", "serverId"}, &cols)
	if code != 0 {
		ack.RetCode = code

		ev.Session().Send(&ack)
		logs.Debug("handleServerListGet error")

		return
	}

	var infos []*msgProto.PbSvrInfo
	for idx, item := range resSet {
		logs.Debug("server :", idx, item)
		record := item.(*colDef)

		infos = append(infos, &msgProto.PbSvrInfo{
			Id:           record.Id,
			Name:         record.Name,
			MergerName:   record.MergerName,
			Area:         record.Area,
			Host:         record.Host,
			Port:         record.Port,
			IsNew:        record.IsNew,
			Status:       record.Status,
			Sort:         record.Sort,
			AppId:        record.AppId,
			ServerId:     record.ServerId,
			IndexId:      record.IndexId,
			IsClose:      record.IsClose,
			CloseExplain: record.CloseExplain,
			ServerDate:   record.ServerDate,
		})
	}

	ack.Infos = infos
	ev.Session().Send(&ack)
}

func handleUserServersGet(ev lib.Event) {
	msg := ev.Message().(*msgProto.ServerInfoGetUserServers)
	logs.Alert("user servers get:", msg)
	ß
	var ack msgProto.ServerListResponse

	ent := tb.AccountEntity{}
	ent.Id = msg.AccountId

	code := accDao.FindById([]string{"userServers"}, []interface{}{&ent.UserServers}, ent.Id)
	if code != 0 {
		ack.RetCode = code

		ev.Session().Send(&ack)
		logs.Debug("handleUserServersGet error")

		return
	}
	serverIds := ent.UserServers
	logs.Debug("server ids:", serverIds)

	// ent := &tb.ServerInfoEntity{}
	ent := svrInfoDao.FindInSet(serverIds)

}
