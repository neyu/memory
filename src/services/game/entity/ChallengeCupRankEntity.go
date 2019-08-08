/**
王城擂主数据排行(ChallengeCupRankEntity)

**/

type AccountEntity struct {
    /** 擂主数据id **/
    id: null/**/
    /** 守擂用户id **/
    userId: null/**/
    /** 守擂开始时间 **/
    startTime: null/**/
    /** 守擂结束时间 **/
    endTime: null/**/
    /** 最长守擂时间 **/
    maxTime: 0/*最长守擂时间*/
    /** 头像 **/
    iconId: null/**/
    /** 昵称 **/
    nickName: null/**/
    /** 等级 **/
    lvl: null/**/
    /** vip等级 **/
    vip: null/**/

}
_Class.tableName: 'uw_challengeCup_rank'