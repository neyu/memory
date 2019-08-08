/**
游戏-聚灵妖莲(DemonLotusEntity)
聚灵妖莲
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*公会个人信息id*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 妖莲等级 **/
    lvl: 0/*妖莲等级*/
    /** 累计经验值 **/
    addUpExpc: 0/*累计经验值*/
    /** 最后操作时间 **/
    lastOpeTime: null/*最后操作时间*/
    /** 进阶等级 **/
    advanceLvl: 0/*进阶等级*/
    /** 宝物等级 **/
    treasureLvl: 0/*宝物等级*/

}
_Class.tableName: 'uw_demon_lotus'