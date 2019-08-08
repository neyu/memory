/**
红包个人信息(RedEnvelopePersonalEntity)
红包个人信息
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: 1/*用户id*/
    /** 累计全服红包 **/
    addUpServer: 0/*累计全服红包*/
    /** 累计公会红包 **/
    addUpGuild: 0/*累计公会红包*/
    /** 累计抢得元宝 **/
    addUpGet: 0/*累计抢得元宝*/
    /** 今日发送份额 **/
    sendCount: 0/*今日发送次数*/
    /** 最后发送时间 **/
    lastSendTime: null/*领取记录{&quot元宝数&quot:userId,&quot元宝数&quot:userId......}*/
    /** 发送记录 **/
    getData: null/*发送记录[[份额，用户id，名字],[份额，用户id，名字]..]*/
    /** 扩展数据 **/
    exData: null/*扩展数据{}*/
    /** 累积抢的其他物品 **/
    exAddUpGet: null/*累积抢的其他物品*/

}
_Class.tableName: 'uw_red_envelope_personal'