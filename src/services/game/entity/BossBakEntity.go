/**
游戏-世界BOSS备份(BossBakEntity)
世界BOSS
**/
package table

var TbBossBak = "uw_boss_bak"

type BossBakEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** bossId **/
	BossId int32 /*bossId*/
	/** 开始时间 **/
	StartTime int64 /*开始时间*/
	/** 结束时间 **/
	EndTime int64 /*结束时间*/
	/** 击杀人的id **/
	KillUserId uint64 /*击杀人的id*/
	/** 死亡时间 **/
	DeathTime int64 /*死亡时间*/
	/** 状态 **/
	Status int8 /*状态 0:未开启 1:开启中*/
	/** 最后一次是否胜利 **/
	LastIsWin int8 /*最后一次是否胜利*/
	/** 结算数据 **/
	ResultData string /*结算数据*/
	/** 是否结算奖励 **/
	IsPrize int8 /*是否结算奖励*/
	/** 限时开启时间 **/
	LimitStartTime int64 /*限时开启时间*/
	/** 限时结束时间 **/
	LimitEndTime int64 /*限时结束时间*/
	/** 是否限时 **/
	IsLimit int8 /*是否限时*/
	/** 类型 **/
	Type int8 /*类型*/
	/** 原始bossId **/
	OriginBossId int32 /*原始bossId*/
	/** 死亡bossId **/
	DeathBossId int32 /*死亡bossId*/
	/** 复活次数 **/
	RepeatCount int32 /*复活次数*/
	/** 最后复活时间 **/
	RepeatTime int64 /*最后复活时间*/
	/** 召唤数据 **/
	CallArr string /*召唤数据[[userId,userName,callTime],.....]*/
	/** 周几 **/
	Week int8 /*周几*/
	/** 异常数据 **/
	ErrData int32 /*异常数据*/

}
