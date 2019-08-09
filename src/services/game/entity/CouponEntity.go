/**
主-兑换码(CouponEntity)
兑换码
**/
package table

var TbCoupon = "uw_coupon"

type CouponEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 使用用户id **/
	UserId uint64 /*使用用户id*/
	/** 名称 **/
	Name string /*名称*/
	/** 描述 **/
	Content string /*描述*/
	/** 生成码 **/
	Code string /*生成码*/
	/** 类型 **/
	Type int8 /*类型*/
	/** 生效时间 **/
	StartTime int64 /*生效时间*/
	/** 截止时间 **/
	EndTime int64 /*截止时间*/
	/** 物品 **/
	Items string /*{hero:{&quotid&quot:num,..},diamond:100,wipeItem:100}*/
	/** 渠道组 **/
	ChannelIds string /*渠道组*/
	/** 渠道号 **/
	ChannelId int32 /*渠道号*/
	/** 是否领取 **/
	IsUsed int8 /*是否领取*/
	/** 服务器id **/
	ServerId int32 /**/
	/** 兑换码领取周期 **/
	Period int32 /**/
	/** 是否使用新兑换码机制 **/
	IsNew int8 /*是否使用新兑换码机制*/

}
