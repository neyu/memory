/**
游戏-国库信息(CoffersEntity)
游戏-国库信息(CoffersEntity)
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/**/
    /** 等级 **/
    lvl: 0/*等级*/
    /** 建设值 **/
    buildValue: 0/*建设值*/
    /** 国库当前储量 **/
    resource: 0/*国库当前储量*/
    /** 今日掠夺储量 **/
    lootResource: 0/*今日掠夺储量*/
    /** 今日被劫储量 **/
    beLootResource: 0/*今日被劫储量*/
    /** 守卫玩家数据 **/
    defeseData: null/*[门类型，用户id,头衔类型，被掠夺的对手id组]*/
    /** 防守记录 **/
    defeseRecordArr: null/*防守记录*/
    /** 掠夺成功记录 **/
    lootRecordArr: null/*掠夺成功记录*/
    /** 累计积分 **/
    points: 0/*累计积分*/
    /** 今日积分 **/
    todayPoints: 0/*今日积分*/
    /** buff等级 **/
    buffLvl: 0/*buff等级*/
    /** buff经验 **/
    buffExpc: 0/*buff经验*/
    /** buff基础值 **/
    buffBase: 0/*buff基础值*/
    /** 掠夺别的服务器用户数据 **/
    lootUserData: null/*掠夺别的服务器用户数据 {服务器id:{用户id:[次数],....},...}*/
    /** 守卫击破时间数据 **/
    breakTimeData: null/*守卫击破时间数据{门口:时间}*/

}
_Class.tableName: 'uw_coffers'