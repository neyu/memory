/**
游戏-野外pk(PkOutEntity)
游戏-野外pk
**/
package tb

var TbPkOut = "uw_pkout"

type PkOutEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 对手组 **/
	EnemyIds string /*对手组*/
	/** 额外的对手 **/
	ExEnemyId uint64 /*额外的对手*/
	/** 上一次刷新对手时间 **/
	FreshTime int64 /*上一次刷新对手时间*/
	/** pk值 **/
	PkValue int32 /*pk值*/
	/** 历史最高pk值 **/
	HighPkValue int32 /*历史最高pk值*/
	/** 杀戮值 **/
	KillValue int32 /*杀戮值*/
	/** pk值结算时间 **/
	PkValueTime int64 /*pk值结算时间*/
	/** 对手类型 **/
	EnemyTypes string /**/
	/** 每日刷新对手次数 **/
	TodayRefreshNum int32 /*每日刷新对手次数*/
	/** 最近每日刷新时间 **/
	TodayRefreshTime int64 /*最近每日刷新时间*/
	/** 连胜次数 **/
	WinCount int32 /*连胜次数*/
	/** 历史最高连胜次数 **/
	HighWinCount int32 /*历史最高连胜次数*/
	/** 累计胜利次数 **/
	AccWinCount int32 /*累计胜利次数*/

}
