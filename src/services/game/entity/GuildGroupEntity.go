/**
主-行会战分组(GuildGroupEntity)
主-行会战分组(GuildGroupEntity)
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/**/
    /** 组名 **/
    name: null/*组名*/
    /** 服务器组 **/
    serverArr: null/*服务器组*/
    /** 上次排名 **/
    lastRankData: null/*上次排名*/
    /** 上次排名时间 **/
    lastRankTime: null/*上次排名时间*/
    /** 对应的redis序号 **/
    redisId: 0/*对应的redis序号*/

}
_Class.tableName: 'uw_guild_group'