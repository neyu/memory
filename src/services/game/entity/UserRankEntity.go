/**
游戏-用户排行榜(UserRankEntity)
用户排行榜
**/
package tb

var TbUserRank = "uw_user_rank"

type UserRankEntity struct {
	/** 排名 **/
	Id int32 /*排名*/
	/** 用户id **/
	UserId uint64 /*领主id*/
	/** 用户名称 **/
	UserName string /*领主名称*/
	/** 用户头像 **/
	IconId int32 /**/
	/** 用户等级 **/
	UserLvl int32 /*英雄id*/
	/** 蓝钻标记 **/
	BlueDiamond string /*蓝钻标记*/
	/** 英雄等级 **/
	PkWinCount int32 /**/
	/** 战力 **/
	Combat int32 /**/
	/** 排名类型 **/
	RankType int8 /*排名类型*/
	/** 排名数值 **/
	RankValue int32 /*排名数值*/

}
