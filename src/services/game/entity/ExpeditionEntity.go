/**
游戏-传奇之路(ExpeditionEntity)
传奇之路
**/
package table

var TbExpedition = "uw_expedition"

type ExpeditionEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /**/
	/** 关卡数 **/
	StageId int32 /*关卡数*/
	/** 挑战次数 **/
	FightCount int32 /*挑战次数*/
	/** 元婴召唤次数 **/
	SoulCount int32 /*元婴召唤次数*/

}
