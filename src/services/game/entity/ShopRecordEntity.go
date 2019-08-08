/**
游戏-商店购买记录(ShopRecordEntity)
游戏-商店购买记录
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 用户等级 **/
    userLvl: null/*用户等级*/
    /** 用户vip **/
    userVip: null/*用户vip*/
    /** 消耗金币 **/
    costGold: null/*消耗金币*/
    /** 商店类型 **/
    shopType: null/*商店类型*/
    /** 消耗元宝 **/
    costDiamond: null/*消耗元宝*/
    /** 购买物品 **/
    buyItemId: null/*购买物品*/
    /** 购买数量 **/
    buyAmount: null/*购买数量*/
    /** 购买时间 **/
    buyTime: null/*购买时间*/

}
_Class.tableName: 'uw_shop_record'