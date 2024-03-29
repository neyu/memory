/**
游戏-竞技场备份(ArenaBakEntity)

**/
package tb

var TbArenaBak = "uw_arena_bak"

type ArenaBakEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 排名 **/
	Rank int32 /*排名*/
	/** 历史最高排名 **/
	HighRank int32 /*历史最高排名*/
	/** 挑战排名 **/
	FightRanks string /*挑战排名*/
	/** 挑战次数数据 **/
	ReNumData string /*挑战次数数据[剩余挑战次数，上一次恢复次数时间，下一次可以挑战的时间(cd)]*/
	/** 奖励数据 **/
	AwardData string /*奖励数据*/
	/** 累计胜场 **/
	WinCount int32 /*累计胜场*/
	/** 连胜场数 **/
	ConWinCount int32 /*连胜场数*/
	/** 最大连胜场数 **/
	MaxConWinCount int32 /*最大连胜场数*/

}
