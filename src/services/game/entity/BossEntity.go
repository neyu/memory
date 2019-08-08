/**
游戏-世界BOSS(BossEntity)
世界BOSS
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** bossId **/
    bossId: null/*bossId*/
    /** 开始时间 **/
    startTime: null/*开始时间*/
    /** 结束时间 **/
    endTime: null/*结束时间*/
    /** 击杀人的id **/
    killUserId: 0/*击杀人的id*/
    /** 死亡时间 **/
    deathTime: null/*死亡时间*/
    /** 状态 **/
    status: 0/*状态 0:未开启 1:开启中*/
    /** 最后一次是否胜利 **/
    lastIsWin: 0/*最后一次是否胜利*/
    /** 结算数据 **/
    resultData: null/*结算数据*/
    /** 是否结算奖励 **/
    isPrize: 0/*是否结算奖励*/
    /** 限时开启时间 **/
    limitStartTime: null/*限时开启时间*/
    /** 限时结束时间 **/
    limitEndTime: null/*限时结束时间*/
    /** 是否限时 **/
    isLimit: 0/*是否限时*/
    /** 类型 **/
    type: 0/*类型*/
    /** 原始bossId **/
    originBossId: 0/*原始bossId*/
    /** 死亡bossId **/
    deathBossId: 0/*死亡bossId*/
    /** 复活次数 **/
    repeatCount: 0/*复活次数*/
    /** 最后复活时间 **/
    repeatTime: null/*最后复活时间*/
    /** 召唤数据 **/
    callArr: null/*召唤数据[[userId,userName,callTime],.....]*/
    /** 周几 **/
    week: 0/*周几*/
    /** 异常数据 **/
    errData: null/*异常数据*/

}
_Class.tableName: 'uw_boss'