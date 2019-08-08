/**
游戏-用户每日记录(GameRecordEntity)
用户每日数据记录
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 日期 **/
    recordTime: null/*日期*/
    /** 登录次数 **/
    loginCount: 0/**/
    /** 挑战副本次数 **/
    copyCount: 0/*挑战副本次数*/
    /** 刷野次数 **/
    wipeCount: 0/*刷野次数*/
    /** pk次数 **/
    pkCount: 0/*pk次数*/
    /** 竞技场pk次数 **/
    jjcPkCount: 0/*竞技场pk次数*/
    /** 充值次数 **/
    rechargeCount: 0/*充值次数*/
    /** 充值总金额 **/
    rechargeSum: 0/*充值总金额*/
    /** 充值记录 **/
    rechargeRecord: null/*充值记录
            {&quotid&quot:充值次数,&quotid&quot:充值次数,.............}*/
    /** 商店记录 **/
    shopRecord: null/*商店记录
            {&quotid&quot:[今日购买次数,历史购买总次数],{&quotid&quot:[今日购买次数,历史购买总次数],.............}*/
    /** 消耗金币记录 **/
    costGoldRecord: null/*消耗金币记录
            {&quotid&quot:金币数量,&quotid&quot:金币数量,.............}*/
    /** 消耗钻石记录 **/
    costDiamondRecord: null/*消耗钻石记录
            {&quotid&quot:钻石数量,&quotid&quot:钻石数量,.............}*/
    /** 消耗钻石记录1 **/
    costDiamondRecord1: null/*消耗钻石记录1*/
    /** 消耗钻石记录2 **/
    costDiamondRecord2: null/*消耗钻石记录2*/
    /** 获取钻石记录 **/
    getDiamondRecord: null/*获取钻石记录
            {&quotid&quot:钻石数量,&quotid&quot:钻石数量,.............}*/
    /** 获取钻石记录1 **/
    getDiamondRecord1: null/*获取钻石记录1*/
    /** 获取钻石记录2 **/
    getDiamondRecord2: null/*获取钻石记录2*/
    /** 渠道号 **/
    channelId: null/*渠道号*/
    /** 服务器id **/
    serverId: null/*服务器id*/

}
_Class.tableName: 'uw_game_record'