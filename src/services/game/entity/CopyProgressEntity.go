/**
游戏-副本进度(CopyProgressEntity)
副本进度
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/**/
    /** 用户id **/
    userId: null/*用户id*/
    /** 副本类型 **/
    copyType: null/*副本类型*/
    /** 主副本id **/
    pCopyId: null/*主副本id*/
    /** 连胜 **/
    winningStreak: 0/*连胜*/
    /** 主副本挑战时间 **/
    pTime: null/*主副本挑战时间*/
    /** 已通关子副本列表 **/
    copyObj: null/*已通关子副本列表{子副本id:节点,子副本id:节点...}*/
    /** 最后一次通关子副本时间 **/
    refreshTime: null/*最后一次通关子副本时间*/
    /** 子副本挑战时间列 **/
    timeArr: null/*子副本挑战时间列*/
    /** 子副本星级 **/
    copyStar: null/*子副本星级*/
    /** 主副本是否已经通过 **/
    finished: 0/*主副本是否已经通过*/
    /** 是否领取通关奖励 **/
    isPickAward: null/*是否领取通关奖励[0,0,1]*/
    /** 是否领取通关宝箱 **/
    isPickChests: null/*是否领取通关宝箱[0,0,1]*/
    /** 子副本剩余挑战次数 **/
    timesPerDay: null/*子副本已通关次数*/
    /** 购买次数 **/
    resetCounts: null/*购买次数{id:次数,id:次数...}*/
    /** 购买时间 **/
    resetTime: null/*购买时间*/
    /** 查看数据 **/
    readObj: null/*查看数据{副本id:是否阅读}*/

}
_Class.tableName: 'uw_copy_progress'