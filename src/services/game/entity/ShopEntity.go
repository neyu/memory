/**
游戏-商店(ShopEntity)
商店，包括普通商店、竞技场商店和神秘商店等
**/

type AccountEntity struct {
    /** id **/
    id: null/**/
    /** 用户id **/
    userId: null/*用户id*/
    /** 商店类型 **/
    type: 0/*商店类型*/
    /** 商店物品 **/
    items: null/*普通商店物品[shop模板id,剩余购买次数]*/
    /** 商店上次刷新时间 **/
    lastTime: null/*普通商店上次刷新时间*/
    /** 商店今日刷新次数 **/
    refreshCount: 0/*普通商店今日刷新次数*/
    /** 商店刷新次数重置时间 **/
    refreshCountResetTime: null/*普通商店刷新次数重置时间*/

}
_Class.tableName: 'uw_shop'