/**
游戏-排位赛记录(ArenaRecordEntity)
排位赛挑战记录
**/
package table

var TbArenaRecord = "uw_arena_record"

type ArenaRecordEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 用户id **/
	UserId uint64 /**/
	/** 用户等级 **/
	UserLvl int32 /*用户等级*/
	/** 用户头像 **/
	UserIconId int32 /**/
	/** 用户名字 **/
	UserName string /*用户名字*/
	/** 用户胜场 **/
	UserWinCount int32 /**/
	/** 对手id **/
	EnemyId uint64 /*对手id*/
	/** 对手等级 **/
	EnemyLvl int32 /*对手等级*/
	/** 对手头像 **/
	EnemyIconId int32 /**/
	/** 对手名字 **/
	EnemyName string /*对手名字*/
	/** 对手胜场 **/
	EnemyWinCount int32 /**/
	/** 是否胜利 **/
	IsWin int8 /*是否胜利*/
	/** 挑战时间 **/
	FightTime int64 /*挑战时间*/
	/** 战斗数据 **/
	FightData string /*战斗数据*/
	/** 战斗类型 **/
	FightType int8 /*战斗类型
	1,排位赛,2仇人榜*/
	/** 是否结算 **/
	IsDeal int8 /*是否结算
	0:没结算
	1:已结算*/
	/** 是否阅读 **/
	IsRead int8 /**/
	/** 是否复仇 **/
	IsRevenge int8 /*是否复仇*/

}
