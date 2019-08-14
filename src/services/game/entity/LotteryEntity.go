/**
游戏-抽奖(LotteryEntity)
抽奖
**/
package tb

var TbLottery = "uw_lottery"

type LotteryEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 探宝值 **/
	TreasureValue int32 /*探宝值*/
	/** 探宝宝箱领取次数 **/
	TreasureChestCount int32 /*探宝宝箱领取次数*/

}
