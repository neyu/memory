/**
红包个人信息(RedEnvelopePersonalEntity)
红包个人信息
**/
package tb

var TbRedEnvelopePersonal = "uw_red_envelope_personal"

type RedEnvelopePersonalEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 累计全服红包 **/
	AddUpServer int32 /*累计全服红包*/
	/** 累计公会红包 **/
	AddUpGuild int32 /*累计公会红包*/
	/** 累计抢得元宝 **/
	AddUpGet int32 /*累计抢得元宝*/
	/** 今日发送份额 **/
	SendCount int32 /*今日发送次数*/
	/** 最后发送时间 **/
	LastSendTime int64 /*领取记录{&quot元宝数&quot:userId,&quot元宝数&quot:userId......}*/
	/** 发送记录 **/
	GetData string /*发送记录[[份额，用户id，名字],[份额，用户id，名字]..]*/
	/** 扩展数据 **/
	ExData string /*扩展数据{}*/
	/** 累积抢的其他物品 **/
	ExAddUpGet string /*累积抢的其他物品*/

}
