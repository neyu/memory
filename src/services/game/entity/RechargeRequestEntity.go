/**
主-充值请求记录(RechargeRequestEntity)
充值请求记录
**/
package tb

var TbRechargeRequest = "uw_recharge_request"

type RechargeRequestEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 账号id **/
	AccountId uint64 /*账号id*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 充值项id **/
	RechargeId int32 /*充值项id*/
	/** 状态 **/
	Status int8 /*状态 0:请求 1:支付成功 2:领取钻石*/
	/** 添加时间 **/
	AddTime int64 /*添加时间*/
	/** 业务号 **/
	TransId string /*业务号*/
	/** 渠道物品id **/
	GoodsId int32 /*渠道物品id*/
	/** 订单号 **/
	OrderNo string /*订单号*/

}
