/**
主-掉落配置(LootConfigEntity)
主-掉落配置
**/
package table

var TbLootConfig = "uw_loot_config"

type LootConfigEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 开始时间 **/
	StartTime int64 /*开始时间*/
	/** 结束时间 **/
	EndTime int64 /*结束时间*/
	/** 特殊掉落的物品类型 **/
	LootTypeArr string /*特殊掉落的物品类型*/

}
