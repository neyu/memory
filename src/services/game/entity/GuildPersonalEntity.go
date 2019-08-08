/**
游戏-公会个人信息(GuildPersonalEntity)
公会个人信息
**/

type AccountEntity struct {
    /** 公会个人信息id **/
    id: null/*公会个人信息id*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 公会id **/
    guildId: 0/*公会id*/
    /** 职务 **/
    position: 0/*职务*/
    /** 被提升为副会长的时间 **/
    viceTime: null/*被提升为副会长的时间*/
    /** 今天贡献值 **/
    todayAct: 0/*今天贡献值*/
    /** 今天公告次数 **/
    noticeCount: 0/*今天公告次数*/
    /** 今天退会次数 **/
    exitGuildCount: 0/*今天退会次数*/
    /** 今日抽奖次数 **/
    lotteryCount: 0/*今日抽奖次数*/
    /** 贡献上一次刷新时间 **/
    actLastTime: null/*贡献上一次刷新时间*/
    /** 累计贡献值 **/
    addUpAct: 0/*累计贡献值*/
    /** 退会信息 **/
    outMsg: null/*退会信息*/
    /** 申请信息 **/
    appliedMsg: null/*申请信息*/
    /** 贡献数据 **/
    actData: null/*格式:{&quot贡献id&quot:[次数]}*/
    /** 当前公会贡献 **/
    guildAct: 0/*当前公会贡献*/
    /** 最后退会时间 **/
    lastQuipGuildTime: null/*最后退会时间*/
    /** 爵位 **/
    ennoble: 0/*爵位*/

}
_Class.tableName: 'uw_guild_personal'