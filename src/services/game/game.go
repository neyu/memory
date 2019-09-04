package main

import (
	"services/fx/const"
	"services/fx/service"
	"services/game/entity"
	"services/gate/api"
	"services/gate/backend"
	"services/msg/proto"
	"strconv"

	"core/logs"
	"core/xlib"

	"strings"
)

type svrMsgHandler func(ev lib.Event, cid msgProto.ClientId)

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

	var ack msgProto.GameEnterResponse

	acc := tb.NewAccountEntity()
	acc.Id = msg.AccountId

	ret := accDao.FindById([]string{"loginKey", "status"}, []interface{}{&acc.LoginKey, acc.Status}, msg.AccountId)
	if ret != 0 || strings.Index(acc.LoginKey, msg.LoginKey) <= -1 {
		ack.RetCode = fx.TipCode("loginKeyWrong")

		gateapi.Send(&cid, &ack)
		return
	}
	if acc.Status == consts.Lock || acc.Status == consts.LockDevice {
		ack.RetCode = fx.TipCode("accountLockout")

		gateapi.Send(&cid, &ack)
		return
	}

	// 用另外一个go routine来并行处理
	usr := tb.NewUserEntity()
	usr.AccountId = msg.AccountId
	usr.ServerIndexId = msg.ServerIndexId

	ret = userDao.Find([]string{"id", "nickName", "gold", "diamond", "giveDiamond", "buyDiamond",
		"lvl", "vip", "honor", "bag", "equipBag", "honorData", "record", "exData", "counts",
		"countsRefreshTime", "lastUpdateTime", "serverId", "prestige", "onlineLootData",
		"medalTitle", "medalData", "genuineQi", "isKing", "rebirthExp"},
		[]interface{}{&usr.Id, &usr.NickName, &usr.Gold, &usr.Diamond, &usr.GiveDiamond,
			&usr.BuyDiamond, &usr.Lvl, &usr.Vip, &usr.Honor, &usr.Bag, &usr.EquipBag, &usr.HonorData,
			&usr.Record, &usr.ExData, &usr.Counts, &usr.CountsRefreshTime, &usr.LastUpdateTime,
			&usr.ServerId, &usr.Prestige, &usr.OnlineLootData, &usr.MedalTitle, &usr.MedalData,
			&usr.GenuineQi, &usr.IsKing, &usr.RebirthExp}, usr.AccountId, usr.ServerIndexId)
	if ret != 0 {
		if ret != 1 {
			ack.RetCode = fx.TipCode("getRoleDataFalse")
		}
		gateapi.Send(&cid, &ack)
		return
	}

	svrInfo := tb.ServerInfoEntity
	svrInfo.Id = usr.ServerId

	ret = svrInfoDao.FindById([]string{"status"}, []interface{}{&svrInfo.Status}, svrInfo.Id)
	if ret != 0 || svrInfo.Status == consts.Closed {
		ack.RetCode = fx.TipCode("svrMaintain")

		gateapi.Send(&cid, &ack)
		return
	}

	acc.exData += strconv.Itoa(svrInfo.Id)
	ret = accDao.Update([]string{"exData"}, []interface{}{&acc.exData, &acc.Id})
	if ret != 0 {
		ack.RetCode = fx.TipCode("sysErr")

		gateapi.Send(&cid, &ack)
		return
	}

	// _handleAndGetData()
	ack.NickName = "我是测试人员"
	gateapi.Send(&cid, &ack)

	_handleLogin()

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
