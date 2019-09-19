package main

import (
	"services/fx"
	"services/game/entity"
	"services/gate/api"
	"services/msg/proto"

	"core/logs"
)

func _handleAndGetData() int32 {
	// do something

	return _handleData()
}

func _handleData() int32 {
	// do something

	return _getOtherData()
}

func _getOtherData() int32 {
	// do something
	return 0
}

func _handleLogin() {
	// save session, cache user data
}

func getIconId(tempId int32, sex int8) int32 {
	return 1
}

func _createHeroByTempId(tag fx.ClientTag, userId int64, tempId int32, sex int8) {
	var ack msgProto.UserCreateResponse

	hero := tb.NewHeroEntity()
	hero.UserId = userId
	hero.TempId = tempId
	hero.Sex = sex

	ret := heroDao.Find([]string{"id", "intensifyArr", "starArr", "gemArr", "wingArr",
		"equipData", "skillLvlArr", "realmArr", "propArr", "combat", "fightSort", "sex"},
		[]interface{}{&hero.Id, &hero.IntensifyArr, &hero.StarArr, &hero.GemArr, &hero.WingArr,
			&hero.EquipData, &hero.SkillLvlArr, &hero.RealmArr, &hero.PropArr, &hero.Combat,
			&hero.FightSort, &hero.Sex}, hero.UserId, hero.TempId)
	if ret != 0 {
		if ret != 1 {
			ack.RetCode = ret

			gateapi.Send(&tag, &ack)
			logs.Debug("_createHeroByTempId err ret 0:", ret)

			return
		}
	}
	hero.IntensifyArr = "" /*强化[等级,等级,...] 下标对应装备位置*/
	hero.StarArr = ""      /*星级[星级,星级,...] 下标对应装备位置*/
	hero.GemArr = ""       /*宝石[id,id,id,...]下标对应装备位置*/
	hero.WingArr = ""      /*翅膀[id,等级,星级,当前星经验]*/
	hero.EquipData = ""    /*装备数据{&quot;部位&quot;:物品id,....}*/
	hero.SkillLvlArr = ""  /*[技能1等级,技能2等级...]*/
	hero.RealmArr = ""     /*境界符文组  [0,1,2,3,4,5]*/
	hero.PropArr = ""      // heroPropHelper.calHeroProp(userData, hero)
	hero.Combat = 0        // heroPropHelper.calCombat(userData, hero)
	hero.FightSort = 0
	hero.Sex = sex
	hero.TalismanData = ""

	id, ret := heroDao.Insert([]string{"userId", "tempId", "intensifyArr", "starArr", "gemArr",
		"wingArr", "equipData", "skillLvlArr", "realmArr", "propArr", "combat", "fightSort",
		"sex", "talismanData"},
		[]interface{}{&hero.UserId, &hero.TempId, &hero.IntensifyArr, &hero.StarArr, &hero.GemArr,
			&hero.WingArr, &hero.EquipData, &hero.SkillLvlArr, &hero.RealmArr, &hero.PropArr, &hero.Combat, &hero.FightSort,
			&hero.Sex, &hero.TalismanData})

	if ret != 0 {
		ack.RetCode = ret

		gateapi.Send(&tag, &ack)
		logs.Debug("_createHeroByTempId err ret 1:", ret)

		return
	}

	ack.UserId = id
	gateapi.Send(&tag, &ack)
}

func _addUserServer(accId int64, svrId int32) {
	// accDao.SelectCols("userServers")
	// accDao.Update("userServers")
}
