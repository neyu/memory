/**
后台-获取钻石(GemGainEntity)
后台-获取钻石
**/
package table

var TbGemGain = "uw_gem_gain"

type GemGainEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 时间 **/
	RecordTime int64 /*时间*/
	/** 用户ID **/
	UserId uint64 /*用户ID*/
	/** 获取项目 **/
	Item_id string /*获取项目*/
	/** 获取钻石 **/
	Amount string /*获取钻石*/
	/** 商店记录 **/
	ShopRecord string /*商店记录*/
	/** 渠道号 **/
	ChannelId int32 /*渠道号*/

}
