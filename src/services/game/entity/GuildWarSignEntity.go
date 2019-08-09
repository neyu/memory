/**
主-行会战报名(GuildWarSignEntity)
主-行会战报名(GuildWarSignEntity)
**/
package table

var TbGuildWarSign = "uw_guild_war_sign"

type GuildWarSignEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 行会id **/
	GuildId int32 /*行会id*/
	/** 报名时间 **/
	SignTime int64 /*报名时间*/
	/** 报名组别 **/
	GroupId int32 /*报名组别*/
	/** 报名人id **/
	SignUserId int32 /**/

}
