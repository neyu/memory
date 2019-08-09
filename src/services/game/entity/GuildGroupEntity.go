/**
主-行会战分组(GuildGroupEntity)
主-行会战分组(GuildGroupEntity)
**/
package table

var TbGuildGroup = "uw_guild_group"

type GuildGroupEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 组名 **/
	Name string /*组名*/
	/** 服务器组 **/
	ServerArr string /*服务器组*/
	/** 上次排名 **/
	LastRankData string /*上次排名*/
	/** 上次排名时间 **/
	LastRankTime int64 /*上次排名时间*/
	/** 对应的redis序号 **/
	RedisId int32 /*对应的redis序号*/

}
