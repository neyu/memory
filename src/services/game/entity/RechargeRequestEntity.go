/**
主-充值请求记录(RechargeRequestEntity)
充值请求记录
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 账号id **/
    accountId: null/*账号id*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 服务器id **/
    serverId: null/*服务器id*/
    /** 充值项id **/
    rechargeId: null/*充值项id*/
    /** 状态 **/
    status: 0/*状态 0:请求 1:支付成功 2:领取钻石*/
    /** 添加时间 **/
    addTime: null/*添加时间*/
    /** 业务号 **/
    transId: null/*业务号*/
    /** 渠道物品id **/
    goodsId: 0/*渠道物品id*/
    /** 订单号 **/
    orderNo: null/*订单号*/

}
_Class.tableName: 'uw_recharge_request'