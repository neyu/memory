/**
游戏-英雄(HeroEntity)
英雄
**/
package table

var TbHero = "uw_hero"

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
