/**
游戏-用户兑换码(UserCouponEntity)
游戏-用户兑换码(UserCouponEntity)
**/
package table

var TbUserCoupon = "uw_user_coupon"

type UserCouponEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 兑换码批次 **/
	CodeName string /*兑换码批次*/
	/** 玩家id **/
	UserId uint64 /*玩家id*/

}
