/**
游戏-商店购买记录(ShopRecordEntity)
游戏-商店购买记录
**/
package tb

var TbShopRecord = "uw_shop_record"

type ShopRecordEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 用户等级 **/
	UserLvl int32 /*用户等级*/
	/** 用户vip **/
	UserVip int32 /*用户vip*/
	/** 消耗金币 **/
	CostGold int32 /*消耗金币*/
	/** 商店类型 **/
	ShopType int32 /*商店类型*/
	/** 消耗元宝 **/
	CostDiamond int32 /*消耗元宝*/
	/** 购买物品 **/
	BuyItemId int32 /*购买物品*/
	/** 购买数量 **/
	BuyAmount int32 /*购买数量*/
	/** 购买时间 **/
	BuyTime int64 /*购买时间*/

}
