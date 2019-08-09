/**
后台-消耗钻石(ConsumeEntity)
后台-消耗钻石
**/
package table

var TbConsume = "uw_consume"

type ConsumeEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 时间 **/
	RecordTime int64 /*时间*/
	/** 用户ID **/
	UserId uint64 /*用户ID*/
	/** 消耗项目 **/
	Item_id string /*消耗项目*/
	/** 消耗钻石 **/
	Amount int32 /*消耗钻石*/
	/** 商店记录 **/
	ShopRecord string /*商店记录*/
	/** 渠道号 **/
	ChannelId string /*渠道号*/

}
