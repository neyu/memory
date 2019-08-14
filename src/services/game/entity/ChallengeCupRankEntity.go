/**
王城擂主数据排行(ChallengeCupRankEntity)

**/
package tb

var TbChallengeCupRank = "uw_challengeCup_rank"

type ChallengeCupRankEntity struct {
	/** 擂主数据id **/
	Id int32 /**/
	/** 守擂用户id **/
	UserId uint64 /**/
	/** 守擂开始时间 **/
	StartTime int64 /**/
	/** 守擂结束时间 **/
	EndTime int64 /**/
	/** 最长守擂时间 **/
	MaxTime int32 /*最长守擂时间*/
	/** 头像 **/
	IconId int32 /**/
	/** 昵称 **/
	NickName string /**/
	/** 等级 **/
	Lvl int32 /**/
	/** vip等级 **/
	Vip int32 /**/

}
