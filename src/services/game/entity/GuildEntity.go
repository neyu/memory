/**
游戏-公会(GuildEntity)
公会。
**/

type AccountEntity struct {
    /** 公会id **/
    id: null/*id*/
    /** 公会名称 **/
    name: null/*公会名称*/
    /** 公会旗号id **/
    iconId: null/*公会旗号id*/
    /** 会长id **/
    chairmanId: null/*会长id*/
    /** 副会长ids **/
    viceChairmanId: null/*副会长ids*/
    /** 公会人数 **/
    guildPopulation: 1/*公会人数*/
    /** 累计贡献值 **/
    addUpAct: 0/*累计贡献值*/
    /** 加入条件 **/
    joinCon: 0/*加入条件*/
    /** 加入最低等级 **/
    joinLvl: 0/*加入最低等级*/
    /** 公会等级 **/
    lvl: 0/*公会等级*/
    /** 公会公告 **/
    notice: null/*公会公告*/
    /** 公会日志 **/
    note: null/*公会日志*/
    /** 申请入会人员 **/
    appliedMembers: null/*申请入会人员*/
    /** 每日开除会员数量 **/
    numbersArr: null/*每天能开除的会员数量*/
    /** 最后开除成员时间 **/
    lastExpelTime: null/*最后开除成员时间*/
    /** 爵位数据 **/
    ennobleData: null/*{&quot男爵&quot:count,&quot子爵&quot:count,&quot伯爵&quot:count,&quot侯爵&quot:count,&quot公爵&quot:count}*/
    /** 公会副本数据 **/
    guildCopyData: null/*{bossId:[进度,[参与userId,userId,...]],bossId:[进度,[参与userId,userId,...]],...}*/
    /** 副本重置次数 **/
    resetCount: 0/*副本重置次数*/
    /** 副本重置时间 **/
    resetTime: null/*副本重置时间*/
    /** 成员最后登录时间 **/
    lastLgTime: null/**/

}
_Class.tableName: 'uw_guild'