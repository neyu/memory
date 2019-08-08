/**
游戏-野外pk备份(PkOutBakEntity)
游戏-野外pk
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: 0/*用户id*/
    /** 对手组 **/
    enemyIds: null/*对手组*/
    /** 额外的对手 **/
    exEnemyId: 0/*额外的对手*/
    /** 上一次刷新对手时间 **/
    freshTime: null/*上一次刷新对手时间*/
    /** pk值 **/
    pkValue: 0/*pk值*/
    /** 历史最高pk值 **/
    highPkValue: 0/*历史最高pk值*/
    /** 杀戮值 **/
    killValue: 0/*杀戮值*/
    /** pk值结算时间 **/
    pkValueTime: null/*pk值结算时间*/
    /** 对手类型 **/
    enemyTypes: 0/**/
    /** 每日刷新对手次数 **/
    todayRefreshNum: 0/*每日刷新对手次数*/
    /** 最近每日刷新时间 **/
    todayRefreshTime: null/*最近每日刷新时间*/
    /** 连胜次数 **/
    winCount: 0/*连胜次数*/
    /** 历史最高连胜次数 **/
    highWinCount: 0/*历史最高连胜次数*/
    /** 累计胜利次数 **/
    accWinCount: 0/*累计胜利次数*/

}
_Class.tableName: 'uw_pkout_bak'