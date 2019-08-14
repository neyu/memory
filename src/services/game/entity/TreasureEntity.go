/**
秘宝信息表(TreasureEntity)
秘宝信息表
**/
package tb

var TbTreasure = "uw_treasure"

type TreasureEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 拥有者id **/
	UserId uint64 /*拥有者id*/
	/** 秘宝id **/
	TreasureId int32 /*秘宝id*/
	/** 开启时间 **/
	OpenTime int64 /*开启时间*/
	/** 是否有效 **/
	IsOpen int8 /*是否有效*/
	/** 开出物品 **/
	Items string /*开出物品*/
	/** 是否删除 **/
	IsDelete int8 /*是否删除*/

}
