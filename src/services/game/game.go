package main

import (
	"services/fx"
	"services/fx/const"
	"services/fx/service"
	"services/game/entity"
	"services/gate/api"
	"services/gate/backend"
	"services/msg/proto"

	"core/codec"
	"core/logs"
	"core/util"
	"core/xlib"

	"fmt"
	"strconv"
	"strings"
	"time"
)

type svrMsgHandler func(ev lib.Event, tag fx.ClientTag)

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

	regMsgHandler(msgProto.ID_GameEnter, handleGameEnter)
	regMsgHandler(msgProto.ID_UserCreate, handleUserCreate)

}

func messageHandler(incomingEv lib.Event) {
	defer util.PrintPanicStackError() // 不是这样写的，后面回归正常流程里

	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var tag fx.ClientTag
		tag.SesId = ev.ClientId
		tag.AccId = ev.AccId
		tag.UserId = ev.UserId

		if gateCtx := service.SessionToContext(ev.Session()); gateCtx != nil {
			tag.SvcId = gateCtx.SvcId
		}

		// userHandler(incomingEv, cid)
		msgId := codec.MessageToId(ev.Message())
		if handler, ok := msgHandlers[msgId]; ok {
			handler(ev, tag)
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
func handleChatReq(ev lib.Event, tag fx.ClientTag) {
	msg := ev.Message().(*msgProto.ChatReq)

	fmt.Printf("chat: %+v \n", msg.Content)

	// 消息广播到网关并发给客户端
	gateapi.BroadcastAll(&msgProto.ChatAck{
		Content: msg.Content,
	})

	// 消息单发给客户端
	gateapi.Send(&tag, &msgProto.TestAck{
		Dummy: "single send",
	})
}

// func handleVerifyReq(incomingEv lib.Event) {
func handleVerifyReq(ev lib.Event, tag fx.ClientTag) {
	msg := ev.Message().(*msgProto.VerifyReq)
	logs.Debug("verfiy:%+v", msg)

	service.Reply(ev, &msgProto.VerifyAck{})
}

// func handleGameEnter(incomingEv lib.Event) {
func handleGameEnter(ev lib.Event, tag fx.ClientTag) {
	msg := ev.Message().(*msgProto.GameEnter)
	logs.Debug("game enter:", msg.AccId, msg.LoginKey, msg.ServerIndexId)

	var ack msgProto.GameEnterResponse

	acc := tb.NewAccountEntity()
	acc.Id = msg.AccId

	ret := accDao.FindById([]string{"loginKey", "status"}, []interface{}{&acc.LoginKey, &acc.Status}, msg.AccId)
	if ret != 0 || strings.Index(acc.LoginKey, msg.LoginKey) <= -1 {
		ack.RetCode = fx.TipCode("loginKeyWrong")

		gateapi.Send(&tag, &ack)
		return
	}
	if acc.Status == consts.Lock || acc.Status == consts.LockDevice {
		ack.RetCode = fx.TipCode("accountLockout")

		gateapi.Send(&tag, &ack)
		return
	}

	// 用另外一个go routine来并行处理
	usr := tb.NewUserEntity()
	usr.AccId = acc.Id
	usr.ServerIndexId = msg.ServerIndexId

	ret = userDao.Find([]string{"id", "nickName", "gold", "diamond", "giveDiamond", "buyDiamond",
		"lvl", "vip", "honor", "bag", "equipBag", "honorData", "record", "exData", "counts",
		"countsRefreshTime", "lastUpdateTime", "serverId", "prestige", "onlineLootData",
		"medalTitle", "medalData", "genuineQi", "isKing", "rebirthExp"},
		[]interface{}{&usr.Id, &usr.NickName, &usr.Gold, &usr.Diamond, &usr.GiveDiamond,
			&usr.BuyDiamond, &usr.Lvl, &usr.Vip, &usr.Honor, &usr.Bag, &usr.EquipBag, &usr.HonorData,
			&usr.Record, &usr.ExData, &usr.Counts, &usr.CountsRefreshTime, &usr.LastUpdateTime,
			&usr.ServerId, &usr.Prestige, &usr.OnlineLootData, &usr.MedalTitle, &usr.MedalData,
			&usr.GenuineQi, &usr.IsKing, &usr.RebirthExp}, usr.AccId, usr.ServerIndexId)
	if ret != 0 {
		if ret != 1 {
			ack.RetCode = fx.TipCode("getRoleDataFalse")
		} else {
			ack.RetCode = 0 // 没有创建过角色
		}
		gateapi.Send(&tag, &ack)
		return
	}

	svrInfo := tb.NewSvrInfoEntity()
	svrInfo.Id = usr.ServerId

	ret = svrInfoDao.FindById([]string{"status"}, []interface{}{&svrInfo.Status}, svrInfo.Id)
	if ret != 0 || svrInfo.Status == consts.Closed {
		ack.RetCode = fx.TipCode("svrMaintain")

		gateapi.Send(&tag, &ack)
		return
	}

	acc.ExData += strconv.Itoa(int(svrInfo.Id))
	ret = accDao.Update([]string{"exData"}, []interface{}{&acc.ExData, &acc.Id})
	if ret != 0 {
		ack.RetCode = fx.TipCode("sysErr")

		gateapi.Send(&tag, &ack)
		return
	}

	// _handleAndGetData()
	ack.NickName = usr.NickName
	ack.UserId = usr.Id
	gateapi.Send(&tag, &ack)

	_handleLogin()

}

// func handleUserCreate(incomingEv lib.Event) {
func handleUserCreate(ev lib.Event, tag fx.ClientTag) {
	msg := ev.Message().(*msgProto.UserCreate)
	logs.Debug("user create:", msg.Name, msg.HeroTempId, msg.Sex, msg.ServerIndexId, msg.ShareKey)

	var ack msgProto.UserCreateResponse

	// 对角色名的检测
	// "角色名不能包含回车换行或双引号"
	if strings.TrimSpace(msg.Name) == "" {
		ack.RetCode = fx.TipCode("roleNameNull")

		gateapi.Send(&tag, &ack)
		return
	}

	usr := tb.NewUserEntity()
	usr.AccId = tag.AccId
	usr.NickName = msg.Name
	usr.ServerIndexId = msg.ServerIndexId

	// 检测是否已经存在角色
	ret := userDao.Find([]string{"id", "nickName", "gold", "diamond", "giveDiamond", "buyDiamond",
		"lvl", "vip", "honor", "bag", "equipBag", "honorData", "record", "exData", "counts",
		"countsRefreshTime", "lastUpdateTime", "serverId", "prestige", "onlineLootData",
		"medalTitle", "medalData", "genuineQi", "isKing", "rebirthExp"},
		[]interface{}{&usr.Id, &usr.NickName, &usr.Gold, &usr.Diamond, &usr.GiveDiamond,
			&usr.BuyDiamond, &usr.Lvl, &usr.Vip, &usr.Honor, &usr.Bag, &usr.EquipBag, &usr.HonorData,
			&usr.Record, &usr.ExData, &usr.Counts, &usr.CountsRefreshTime, &usr.LastUpdateTime,
			&usr.ServerId, &usr.Prestige, &usr.OnlineLootData, &usr.MedalTitle, &usr.MedalData,
			&usr.GenuineQi, &usr.IsKing, &usr.RebirthExp}, usr.AccId, usr.ServerIndexId)
	if ret == 0 {
		gateapi.Send(&tag, &ack)
		return
	}

	// 检测是否重名
	type colDef struct {
		Id    int32
		AccId uint64
	}
	var cols colDef
	resSet, ret := userDao.FindAll([]string{"id", "accountId"}, &cols, usr.NickName)
	if ret != 0 {
		ack.RetCode = ret

		gateapi.Send(&tag, &ack)
		logs.Debug("handleUserCreate error0")

		return
	}
	if len(resSet) != 0 {
		ack.RetCode = fx.TipCode("roleNameExist")

		gateapi.Send(&tag, &ack)
		logs.Debug("handleUserCreate error1")

		return
	}

	// 创建立一个新角色
	acc := tb.NewAccountEntity()
	acc.Id = tag.AccId

	ret = accDao.FindById([]string{"sdkChannelId"}, []interface{}{&acc.SdkChannelId}, acc.Id)
	if ret != 0 {
		ack.RetCode = ret

		gateapi.Send(&tag, &ack)
		logs.Debug("handleUserCreate error2")

		return
	}

	//usr.signName = _getRandomSignName();
	//usr.nickName = "s" +serverIndexId +"."+ name; /*昵称*/
	usr.IconId = getIconId(msg.HeroTempId, int8(msg.Sex)) /** 头像 **/
	usr.Bag = ""                                          /*背包(只存放静态物品，格式：{&quot;物品id&quot;:数量,&quot;物品id&quot;:数量.............})*/
	usr.EquipBag = ""
	usr.HonorData = "" /*成就数据 {&quot;id&quot;:[是否完成，是否领取],&quot;id&quot;:[是否完成，是否领取],..........}*/
	usr.Activity = ""
	usr.Record = ""
	usr.ExData = ""            /*刷新数据 {key:value} 具体看c_prop的userExData*/
	usr.CountsRefreshTime = "" /*刷新数据 {key:value} 具体看c_prop的userRefreshCount*/
	usr.ServerId = 1
	usr.MedalData = ""
	usr.PropertyData = ""
	usr.Lvl = 1 /*等级(不同于英雄等级)*/
	usr.LastUpdateTime = time.Now().Unix()
	usr.CreateTime = time.Now().Unix()
	usr.SdkChannelId = acc.SdkChannelId
	// usr.Gold = 0                                    /*金币*/
	// usr.Diamond = 0                                 /*钻石*/
	// usr.GiveDiamond = 0                             /*绑定钻石，即送的钻石*/
	// usr.BuyDiamond = 0                              /*非绑定钻石，即购买的钻石*/
	// usr.Expc = 0               /*经验*/
	// usr.Strength = 0           /*体力*/
	// usr.Vip = 0                /*VIP等级*/
	// usr.VipScore = 0           /*VIP积分*/
	// usr.Honor = 0              /*荣誉值*/
	// usr.Combat = 0             /*战力*/
	// usr.Counts = ""            //刷新数据
	// usr.Sign = ""              /*签到数据,[签到次数,最近一次签到时间]*/

	// 插入user表
	id, ret := userDao.Insert([]string{"accountId", "nickName", "serverIndexId", "iconId",
		"bag", "equipBag", "honorData", "activity", "record", "exData", "countsRefreshTime",
		"serverId", "medalData", "propertyData", "lvl", "lastUpdateTime", "createTime",
		"sdkChannelId"},
		[]interface{}{&usr.AccId, &usr.NickName, &usr.ServerIndexId, &usr.IconId,
			&usr.Bag, &usr.EquipBag, &usr.HonorData, &usr.Activity, &usr.Record, &usr.ExData, &usr.CountsRefreshTime,
			&usr.ServerId, &usr.MedalData, &usr.PropertyData, &usr.Lvl, &usr.LastUpdateTime, &usr.CreateTime,
			&usr.SdkChannelId})
	if ret != 0 {
		ack.RetCode = ret

		gateapi.Send(&tag, &ack)
		logs.Debug("_createNewUser err ret:", ret)

		return
	}
	usr.Id = id

	var ackEnter msgProto.GameEnterResponse
	ackEnter.NickName = usr.NickName
	ackEnter.UserId = usr.Id
	gateapi.Send(&tag, &ackEnter)

	_createHeroByTempId(tag, usr.Id, msg.HeroTempId, int8(msg.Sex))

	_addUserServer(acc.Id, usr.ServerId)
}
