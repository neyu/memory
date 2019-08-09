/**
游戏-公会战记录(GuildWarRecordEntity)
游戏-公会战记录(GuildWarRecordEntity)
**/
package table

var TbGuildWarRecord = "uw_guildwar_record"

type GuildWarRecordEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 记录数据 **/
	RecordData string /*记录数据*/
	/** 记录时间 **/
	RecordTime string /*记录时间*/
	/** 结束排名数据 **/
	LastRankData string /*结束排名数据*/

}
