/**
秘宝争夺记录(TreasureRecordEntity)
秘宝争夺记录
**/
package tb

var TbTreasureRecord = "uw_treasureRecord"

type TreasureRecordEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 记录类型 **/
	RecordType int32 /*记录类型*/
	/** 玩家id **/
	UserId uint64 /*玩家id*/
	/** 公会名 **/
	GuildName string /*公会名*/
	/** vip等级 **/
	UserVip int32 /*vip等级*/
	/** 玩家名 **/
	UserName string /*玩家名*/
	/** 勋章称号 **/
	MedalTitle int32 /*勋章称号*/
	/** 秘宝id **/
	TreasureId int32 /*秘宝id*/
	/** 掉落物品 **/
	Items string /*掉落物品*/
	/** 记录日期 **/
	RecordDate int64 /**/

}
