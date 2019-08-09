/**
五日目标(FiveDaysTargetEntity)
五日目标历史排行榜
**/
package table

var TbFiveDaysTarget = "uw_fivedays_rank"

type FiveDaysTargetEntity struct {
	/** 主键 **/
	Id int32 /**/
	/** 用户id **/
	UserId uint64 /**/
	/** 用户名称 **/
	UserName string /**/
	/** 用户头像 **/
	IconId int32 /**/
	/** 用户等级 **/
	UserLvl int32 /**/
	/** 英雄等级 **/
	PkWinCount int32 /**/
	/** 战力 **/
	Combat int32 /**/
	/** 排名类型 **/
	RankType int8 /**/
	/** 排名数值 **/
	RankValue int32 /**/

}
