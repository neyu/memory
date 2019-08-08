/**
红包(RedEnvelopeEntity)
红包
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 红包类型 **/
    redType: 1/*红包类型*/
    /** 发送者id **/
    userId: null/*发送者id*/
    /** 公会id **/
    guildId: null/*公会id*/
    /** 红包物品 **/
    spItemId: 200/*红包物品,默认元宝*/
    /** 红包元宝 **/
    diamond: null/*红包元宝*/
    /** 人数 **/
    personNum: 0/*人数*/
    /** 红包祝福 **/
    wish: 0/*红包祝福*/
    /** 领取记录 **/
    getData: null/*领取记录[[元宝数,userId],[元宝数,userId]......]*/
    /** 添加时间 **/
    addTime: null/*添加时间*/
    /** 过期时间 **/
    expireTime: null/*过期时间*/
    /** 是否删除 **/
    isDelete: 0/*是否删除*/

}
_Class.tableName: 'uw_red_envelope'