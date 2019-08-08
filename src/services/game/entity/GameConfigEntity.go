/**
主-游戏配置(GameConfigEntity)
主-游戏配置(GameConfigEntity)
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/**/
    /** 行会战报名时间 **/
    guildWarSign: null/*[星期开始，星期结束，开始时间，结束时间]*/
    /** 行会战开启时间 **/
    guildWarOpen: null/*[星期几，开始时间，结束时间]*/
    /** 行会战服主机 **/
    guildWarHost: null/*行会战服主机*/
    /** 行会战服端口 **/
    guildWarPort: 0/*行会战服端口*/
    /** redis主机端口列表 **/
    redisHostArr: null/*redis主机端口列表*/
    /** 报名排除的服务器列表 **/
    noSignServerArr: 1/*报名排除的服务器列表*/

}
_Class.tableName: 'uw_game_config'