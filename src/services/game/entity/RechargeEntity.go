/**
游戏-充值记录表(RechargeEntity)
游戏-充值记录表
**/
package tb

var TbRecharge = "uw_recharge"

type RechargeEntity struct {
	/** id **/
	Id int32 /*id*/
	/** 用户id **/
	UserId uint64 /**/
	/** 充值项id **/
	RechargeId int32 /**/
	/** 充值钻石 **/
	Diamond int32 /*充值钻石*/
	/** 充值时间 **/
	RechargeTime int64 /**/
	/** 生效时间 **/
	EffTime int64 /*生效时间*/
	/** 渠道号 **/
	ChannelId int32 /*渠道号*/
	/** 业务号 **/
	TransId string /*业务号*/
	/** 币种 **/
	Currency string /*币种,CNY,USD,HKD,TWD*/
	/** ip **/
	Ip string /*ip*/
	/** 金额 **/
	PayMoney int32 /*金额*/
	/** 用户当前等级 **/
	UserLvl int32 /*用户当前等级*/

}
