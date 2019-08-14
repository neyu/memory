/**
游戏-商店(ShopEntity)
商店，包括普通商店、竞技场商店和神秘商店等
**/
package tb

var TbShop = "uw_shop"

type ShopEntity struct {
	/** id **/
	Id int32 /**/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 商店类型 **/
	Type int8 /*商店类型*/
	/** 商店物品 **/
	Items string /*普通商店物品[shop模板id,剩余购买次数]*/
	/** 商店上次刷新时间 **/
	LastTime int64 /*普通商店上次刷新时间*/
	/** 商店今日刷新次数 **/
	RefreshCount int32 /*普通商店今日刷新次数*/
	/** 商店刷新次数重置时间 **/
	RefreshCountResetTime int64 /*普通商店刷新次数重置时间*/

}
