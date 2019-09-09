/**
游戏-英雄(HeroEntity)
英雄
**/
package tb

var TbHero = "uw_hero"

type HeroDao mysql.DaoSource

type HeroEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 模板id **/
	TempId int32 /*模板id*/
	/** 品阶 **/
	Quality int32 /*品阶*/
	/** 强化 **/
	IntensifyArr string /*强化[等级,等级,...] 下标对应装备位置*/
	/** 星级 **/
	StarArr string /*星级[星级,星级,...] 下标对应装备位置*/
	/** 宝石 **/
	GemArr string /*宝石[id,id,id,...]下标对应装备位置*/
	/** 翅膀 **/
	WingArr string /*翅膀[id,等级,星级,当前星经验,左翅强化等级,右翅强化等级]*/
	/** 经验 **/
	Expc int32 /*经验*/
	/** 等级 **/
	Lvl int32 /*等级*/
	/** 装备数据 **/
	EquipData string /*{&quot部位&quot:物品id,....}*/
	/** 技能等级组 **/
	SkillLvlArr string /*[技能1等级,技能2等级...]*/
	/** 最终属性组 **/
	PropArr string /*最终属性组[值,值]*/
	/** 境界等级 **/
	RealmLvl int32 /*境界等级*/
	/** 境界符文组 **/
	RealmArr string /*境界符文组  [0,1,2,3,4,5]*/
	/** 性别 **/
	Sex int8 /*性别 1:男 2:女*/
	/** 战斗力 **/
	Combat int32 /*战斗力*/
	/** 装备精炼 **/
	RefineArr string /*装备精炼[等级,等级,...] 下标对应装备位置*/
	/** 升星突破 **/
	StarTopArr string /*升星突破[升星突破重数,升星突破重数,...] 下标对应装备位置*/
	/** 法宝佩戴 **/
	TalismanAdorn int32 /*法宝佩戴*/
	/** 法宝数据 **/
	TalismanData string /*法宝数据{法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],....}*/
	/** 法宝共鸣 **/
	TalismanFg string /*法宝共鸣{共鸣id:[0,1],共鸣id:[1,0],...}*/
	/** 翅膀总等级 **/
	WingSumLvl int32 /*翅膀等级*100+星数*/
	/** 宝石总等级 **/
	GemSumLvl int32 /*宝石总等级*/
	/** 境界总等级 **/
	RealmSumLvl int32 /*境界等级 * 100 + 已装备个数*/
	/** 出战顺序 **/
	FightSort int8 /*出战顺序*/
	/** 元婴背包 **/
	SoulArr string /*{&quot元婴id&quot:[物品id,剩余血量,今日是否有穿戴过]}*/
	/** 佩戴元婴 **/
	WearSoulId int32 /**/

}

func NewHeroEntity() *HeroEntity {
	return &HeroEntity{}
}

func (dao *HeroDao) Find(inCols []string, outCols []interface{}, tempId int32, sex int8) int32 {
	var err error

	if len(inCols) <= 0 || len(outCols) <= 0 || len(inCols) != len(outCols) {
		err = errors.New("hero dao Find() param length differ")
		logs.Debug(err)
		return -1
	}
	query := `select `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item
	}
	query += ` from ` + TbHero + ` where tempId=? and sex=?`
	logs.Debug("query/param:", query, tempId, sex)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("hero find err0:", err)
		return -1
	}
	defer stmt.Close()

	err = stmt.QueryRow(accId, svrIdx).Scan(outCols...)
	switch {
	case err == sql.ErrNoRows:
		logs.Debug("hero find err1:", err)
		return 1 // loginNoUser
	case err != nil:
		logs.Error("hero find err2:", err)
		return -1
	default:
		//
	}
	return 0
}

// insert uw_user set accountId=1,nickName='测试名',iconId=0,bag='',equipBag='',honorData='',
// activity='',record='',exData='',countsRefreshTime='',serverId=9999,medalData='',propertyData='';
func (dao *HeroDao) Insert(inCols []string, vals []interface{}) (uint64, int32) {
	var err error

	if len(inCols) <= 0 || len(vals) <= 0 || len(inCols) != len(vals) {
		err = errors.New("hero dao Insert() param length differ")
		logs.Debug(err)
		return 0, -1
	}
	query := `insert ` + TbHero + ` set `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item + `=?`
	}
	logs.Debug("query:", query)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("user insert err0:", err)
		return 0, -1
	}
	defer stmt.Close()

	res, err := stmt.Exec(vals...)
	if err != nil {
		logs.Error("user insert err1:", err)
		return 0, -1
	}

	id, err := res.LastInsertId()
	if err != nil {
		logs.Error("user insert err2:", err)
		return 0, -1
	}
	logs.Debug("new user id:", id)
	return uint64(id), 0
}
