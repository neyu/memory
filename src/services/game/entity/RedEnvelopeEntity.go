/**
红包(RedEnvelopeEntity)
红包
**/
package tb

var TbRedEnvelope = "uw_red_envelope"

type RedEnvelopeEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 红包类型 **/
	RedType int8 /*红包类型*/
	/** 发送者id **/
	UserId uint64 /*发送者id*/
	/** 公会id **/
	GuildId int32 /*公会id*/
	/** 红包物品 **/
	SpItemId int32 /*红包物品,默认元宝*/
	/** 红包元宝 **/
	Diamond int32 /*红包元宝*/
	/** 人数 **/
	PersonNum int32 /*人数*/
	/** 红包祝福 **/
	Wish string /*红包祝福*/
	/** 领取记录 **/
	GetData string /*领取记录[[元宝数,userId],[元宝数,userId]......]*/
	/** 添加时间 **/
	AddTime int64 /*添加时间*/
	/** 过期时间 **/
	ExpireTime int64 /*过期时间*/
	/** 是否删除 **/
	IsDelete int8 /*是否删除*/

}
