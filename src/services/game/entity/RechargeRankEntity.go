/**
后台-充值排行(RechargeRankEntity)
后台-充值排行
**/
package table

var TbRechargeRank = "uw_recharge_rank"

type RechargeRankEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 昵称 **/
	NickName string /*昵称*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 充值总额 **/
	PayNum int32 /*充值总额*/
	/** 充值次数 **/
	PayCount int32 /*充值次数*/
	/** 充值记录 **/
	PayRecord int32 /*充值记录*/
	/** 购买金币总次数 **/
	BuyGoldNum int32 /*购买金币总次数*/
	/** 商店记录 **/
	ShopRecord string /*商店记录*/

}
