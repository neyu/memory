/**
游戏-系统红包(SysRedEnvelopeEntity)
游戏触发（或后台发送的）的发送给玩家的红包
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/**/
    /** 发送者id **/
    userId: 0/*发送者id,系统为0*/
    /** 发送者名称 **/
    sendName: '&quot系统&quot'/*发送者名称*/
    /** 红包类型 **/
    redType: 1/*红包类型*/
    /** 公会id **/
    guildId: null/*公会id*/
    /** 红包物品id **/
    spItemId: null/*红包物品*/
    /** 物品数量 **/
    amount: 0/*物品数量*/
    /** 显示数量 **/
    viewAmount: 0/*显示数量*/
    /** 人数 **/
    personNum: 0/*人数*/
    /** 红包祝福 **/
    wish: null/*红包祝福*/
    /** 每人限额区间 **/
    limitZone: null/*每人限额区间*/
    /** 添加时间 **/
    addTime: null/*添加时间*/
    /** 处理状态 **/
    isDeal: 0/*处理状态*/

}
_Class.tableName: 'uw_sys_red_envelope'