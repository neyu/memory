/**
后台-全服数据分析(AllRunwatEntity)
数据分析
**/
package table

var TbAllRunwat = 'uw_allrunwat'

type AllRunwatEntity struct {
    /** 序号 **/
    Id int32/*序号*/
    /** 时间 **/
    DateTime int64/*时间*/
    /** 新增 **/
    NewUser int32/*新增*/
    /** 活跃 **/
    Active int32/*活跃*/
    /** 次日留存 **/
    NextDayLeft float32/*次日留存*/
    /** 7日留存 **/
    WeekLeft float32/*7日留存*/
    /** 流水 **/
    Runwat int32/*流水*/
    /** 付费用户数 **/
    PayCount int32/*付费用户数*/
    /** 新增付费 **/
    NewPay int32/*新增付费*/
    /** ARPU **/
    ARPU float32/*ARPU*/
    /** 付费率 **/
    PayRate float32/*付费率*/
    /** ARPPU **/
    ARPPU float32/*ARPPU*/
    /** 累计流水 **/
    RunwatNum int32/*累计流水*/
    /** 累计用户 **/
    UserNum int32/*累计用户*/

}
