/**
游戏-聚灵妖莲(DemonLotusEntity)
聚灵妖莲
**/
package tb

var TbDemonLotus = "uw_demon_lotus"

type DemonLotusEntity struct {
	/** 序号 **/
	Id int32 /*公会个人信息id*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 妖莲等级 **/
	Lvl int32 /*妖莲等级*/
	/** 累计经验值 **/
	AddUpExpc int32 /*累计经验值*/
	/** 最后操作时间 **/
	LastOpeTime int64 /*最后操作时间*/
	/** 进阶等级 **/
	AdvanceLvl int32 /*进阶等级*/
	/** 宝物等级 **/
	TreasureLvl int32 /*宝物等级*/

}
