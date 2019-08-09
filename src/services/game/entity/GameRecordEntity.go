/**
游戏-用户每日记录(GameRecordEntity)
用户每日数据记录
**/
package table

var TbGameRecord = "uw_game_record"

type GameRecordEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 日期 **/
	RecordTime int64 /*日期*/
	/** 登录次数 **/
	LoginCount int32 /**/
	/** 挑战副本次数 **/
	CopyCount int32 /*挑战副本次数*/
	/** 刷野次数 **/
	WipeCount int32 /*刷野次数*/
	/** pk次数 **/
	PkCount int32 /*pk次数*/
	/** 竞技场pk次数 **/
	JjcPkCount int32 /*竞技场pk次数*/
	/** 充值次数 **/
	RechargeCount int32 /*充值次数*/
	/** 充值总金额 **/
	RechargeSum int32 /*充值总金额*/
	/** 充值记录 **/
	RechargeRecord string /*充值记录
	  {&quotid&quot:充值次数,&quotid&quot:充值次数,.............}*/
	/** 商店记录 **/
	ShopRecord string /*商店记录
	  {&quotid&quot:[今日购买次数,历史购买总次数],{&quotid&quot:[今日购买次数,历史购买总次数],.............}*/
	/** 消耗金币记录 **/
	CostGoldRecord string /*消耗金币记录
	  {&quotid&quot:金币数量,&quotid&quot:金币数量,.............}*/
	/** 消耗钻石记录 **/
	CostDiamondRecord string /*消耗钻石记录
	  {&quotid&quot:钻石数量,&quotid&quot:钻石数量,.............}*/
	/** 消耗钻石记录1 **/
	CostDiamondRecord1 string /*消耗钻石记录1*/
	/** 消耗钻石记录2 **/
	CostDiamondRecord2 string /*消耗钻石记录2*/
	/** 获取钻石记录 **/
	GetDiamondRecord string /*获取钻石记录
	  {&quotid&quot:钻石数量,&quotid&quot:钻石数量,.............}*/
	/** 获取钻石记录1 **/
	GetDiamondRecord1 string /*获取钻石记录1*/
	/** 获取钻石记录2 **/
	GetDiamondRecord2 string /*获取钻石记录2*/
	/** 渠道号 **/
	ChannelId int32 /*渠道号*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/

}
