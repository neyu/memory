/**
王城擂主(ChallengeCupEntity)
王城擂主(ChallengeCupEntity)
**/
package table

var TbChallengeCup = "uw_challengeCup"

type ChallengeCupEntity struct {
	/** 擂主信息表id **/
	Id int32 /**/
	/** 当前守擂者角色id **/
	UserId uint64 /*当前守擂者userId*/
	/** 成为擂主的时间戳 **/
	LeftTime int64 /*成为擂主的时间戳*/
	/** 老擂主id **/
	ChampionUserId uint64 /*老擂主userId*/
	/** 活动开始时间 **/
	StartTime int64 /**/
	/** 活动数据 **/
	ExData string /**/
	/** 活动状态 **/
	IsOpen int8 /**/
	/** 被膜拜次数 **/
	Worship int32 /*被膜拜次数*/
	/** 被膜拜总次数 **/
	WorshipCount int32 /*被膜拜总次数*/
	/** buff开启次数 **/
	BuffOpenNum int32 /*开启buff次数*/
	/** 最后一次开启时间 **/
	BuffOpenTime int64 /*最后一次开启时间*/
	/** buff结束时间 **/
	BuffEndTime int64 /*buff结束时间*/
	/** 战斗记录 **/
	RecordArr string /*战斗记录*/

}
