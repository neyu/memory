/**
游戏-用户排行榜(UserRankEntity)
用户排行榜
**/

type AccountEntity struct {
    /** 排名 **/
    id: null/*排名*/
    /** 用户id **/
    userId: null/*领主id*/
    /** 用户名称 **/
    userName: null/*领主名称*/
    /** 用户头像 **/
    iconId: null/**/
    /** 用户等级 **/
    userLvl: null/*英雄id*/
    /** 蓝钻标记 **/
    blueDiamond: null/*蓝钻标记*/
    /** 英雄等级 **/
    pkWinCount: null/**/
    /** 战力 **/
    combat: null/**/
    /** 排名类型 **/
    rankType: null/*排名类型*/
    /** 排名数值 **/
    rankValue: null/*排名数值*/

}
_Class.tableName: 'uw_user_rank'