/**
游戏-数据分析(RunwatEntity)
数据分析
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 时间 **/
    dateTime: null/*时间*/
    /** 新增 **/
    newUser: 0/*新增*/
    /** 活跃 **/
    active: 0/*活跃*/
    /** 次日留存 **/
    nextDayLeft: null/*次日留存*/
    /** 7日留存 **/
    weekLeft: null/*7日留存*/
    /** 流水 **/
    runwat: 0/*流水*/
    /** 付费用户数 **/
    payCount: 0/*付费用户数*/
    /** 新增付费 **/
    newPay: 0/*新增付费*/
    /** ARPU **/
    ARPU: null/*ARPU*/
    /** 付费率 **/
    payRate: null/*付费率*/
    /** ARPPU **/
    ARPPU: null/*ARPPU*/
    /** 累计流水 **/
    runwatNum: 0/*累计流水*/
    /** 累计用户 **/
    userNum: 0/*累计用户*/

}
_Class.tableName: 'uw_runwat'