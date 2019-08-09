/**
游戏-国库信息(CoffersEntity)
游戏-国库信息(CoffersEntity)
**/
package table

var TbCoffers = "uw_coffers"

type CoffersEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 等级 **/
	Lvl int32 /*等级*/
	/** 建设值 **/
	BuildValue int32 /*建设值*/
	/** 国库当前储量 **/
	Resource int32 /*国库当前储量*/
	/** 今日掠夺储量 **/
	LootResource int32 /*今日掠夺储量*/
	/** 今日被劫储量 **/
	BeLootResource int32 /*今日被劫储量*/
	/** 守卫玩家数据 **/
	DefeseData string /*[门类型，用户id,头衔类型，被掠夺的对手id组]*/
	/** 防守记录 **/
	DefeseRecordArr string /*防守记录*/
	/** 掠夺成功记录 **/
	LootRecordArr string /*掠夺成功记录*/
	/** 累计积分 **/
	Points int32 /*累计积分*/
	/** 今日积分 **/
	TodayPoints int32 /*今日积分*/
	/** buff等级 **/
	BuffLvl int32 /*buff等级*/
	/** buff经验 **/
	BuffExpc int32 /*buff经验*/
	/** buff基础值 **/
	BuffBase int32 /*buff基础值*/
	/** 掠夺别的服务器用户数据 **/
	LootUserData string /*掠夺别的服务器用户数据 {服务器id:{用户id:[次数],....},...}*/
	/** 守卫击破时间数据 **/
	BreakTimeData string /*守卫击破时间数据{门口:时间}*/

}
