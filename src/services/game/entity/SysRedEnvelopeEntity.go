/**
游戏-系统红包(SysRedEnvelopeEntity)
游戏触发（或后台发送的）的发送给玩家的红包
**/
package table

var TbSysRedEnvelope = "uw_sys_red_envelope"

type SysRedEnvelopeEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 发送者id **/
	UserId uint64 /*发送者id,系统为0*/
	/** 发送者名称 **/
	SendName string /*发送者名称*/
	/** 红包类型 **/
	RedType int8 /*红包类型*/
	/** 公会id **/
	GuildId int32 /*公会id*/
	/** 红包物品id **/
	SpItemId int32 /*红包物品*/
	/** 物品数量 **/
	Amount int32 /*物品数量*/
	/** 显示数量 **/
	ViewAmount int32 /*显示数量*/
	/** 人数 **/
	PersonNum int32 /*人数*/
	/** 红包祝福 **/
	Wish string /*红包祝福*/
	/** 每人限额区间 **/
	LimitZone string /*每人限额区间*/
	/** 添加时间 **/
	AddTime int64 /*添加时间*/
	/** 处理状态 **/
	IsDeal int8 /*处理状态*/

}
