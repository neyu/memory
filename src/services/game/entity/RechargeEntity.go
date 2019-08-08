/**
游戏-充值记录表(RechargeEntity)
游戏-充值记录表
**/

type AccountEntity struct {
    /** id **/
    id: null/*id*/
    /** 用户id **/
    userId: null/**/
    /** 充值项id **/
    rechargeId: null/**/
    /** 充值钻石 **/
    diamond: null/*充值钻石*/
    /** 充值时间 **/
    rechargeTime: null/**/
    /** 生效时间 **/
    effTime: null/*生效时间*/
    /** 渠道号 **/
    channelId: null/*渠道号*/
    /** 业务号 **/
    transId: null/*业务号*/
    /** 币种 **/
    currency: 'CNY'/*币种,CNY,USD,HKD,TWD*/
    /** ip **/
    ip: null/*ip*/
    /** 金额 **/
    payMoney: null/*金额*/
    /** 用户当前等级 **/
    userLvl: null/*用户当前等级*/

}
_Class.tableName: 'uw_recharge'