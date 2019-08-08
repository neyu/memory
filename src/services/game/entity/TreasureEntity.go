/**
秘宝信息表(TreasureEntity)
秘宝信息表
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 拥有者id **/
    userId: null/*拥有者id*/
    /** 秘宝id **/
    treasureId: null/*秘宝id*/
    /** 开启时间 **/
    openTime: null/*开启时间*/
    /** 是否有效 **/
    isOpen: 1/*是否有效*/
    /** 开出物品 **/
    items: null/*开出物品*/
    /** 是否删除 **/
    isDelete: 0/*是否删除*/

}
_Class.tableName: 'uw_treasure'