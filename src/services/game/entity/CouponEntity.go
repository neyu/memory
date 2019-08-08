/**
主-兑换码(CouponEntity)
兑换码
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 使用用户id **/
    userId: null/*使用用户id*/
    /** 名称 **/
    name: null/*名称*/
    /** 描述 **/
    content: null/*描述*/
    /** 生成码 **/
    code: null/*生成码*/
    /** 类型 **/
    type: 0/*类型*/
    /** 生效时间 **/
    startTime: null/*生效时间*/
    /** 截止时间 **/
    endTime: null/*截止时间*/
    /** 物品 **/
    items: null/*{hero:{&quotid&quot:num,..},diamond:100,wipeItem:100}*/
    /** 渠道组 **/
    channelIds: null/*渠道组*/
    /** 渠道号 **/
    channelId: 0/*渠道号*/
    /** 是否领取 **/
    isUsed: 0/*是否领取*/
    /** 服务器id **/
    serverId: 0/**/
    /** 兑换码领取周期 **/
    period: 0/**/
    /** 是否使用新兑换码机制 **/
    isNew: 0/*是否使用新兑换码机制*/

}
_Class.tableName: 'uw_coupon'