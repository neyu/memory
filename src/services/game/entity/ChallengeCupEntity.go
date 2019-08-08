/**
王城擂主(ChallengeCupEntity)
王城擂主(ChallengeCupEntity)
**/

type AccountEntity struct {
    /** 擂主信息表id **/
    id: null/**/
    /** 当前守擂者角色id **/
    userId: null/*当前守擂者userId*/
    /** 成为擂主的时间戳 **/
    leftTime: null/*成为擂主的时间戳*/
    /** 老擂主id **/
    championUserId: null/*老擂主userId*/
    /** 活动开始时间 **/
    startTime: null/**/
    /** 活动数据 **/
    exData: null/**/
    /** 活动状态 **/
    isOpen: 0/**/
    /** 被膜拜次数 **/
    worship: 0/*被膜拜次数*/
    /** 被膜拜总次数 **/
    worshipCount: 0/*被膜拜总次数*/
    /** buff开启次数 **/
    buffOpenNum: 0/*开启buff次数*/
    /** 最后一次开启时间 **/
    buffOpenTime: null/*最后一次开启时间*/
    /** buff结束时间 **/
    buffEndTime: null/*buff结束时间*/
    /** 战斗记录 **/
    recordArr: null/*战斗记录*/

}
_Class.tableName: 'uw_challengeCup'