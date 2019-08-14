/**
主-游戏配置(GameConfigEntity)
主-游戏配置(GameConfigEntity)
**/
package tb

var TbGameConfig = "uw_game_config"

type GameConfigEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 行会战报名时间 **/
	GuildWarSign string /*[星期开始，星期结束，开始时间，结束时间]*/
	/** 行会战开启时间 **/
	GuildWarOpen string /*[星期几，开始时间，结束时间]*/
	/** 行会战服主机 **/
	GuildWarHost string /*行会战服主机*/
	/** 行会战服端口 **/
	GuildWarPort int32 /*行会战服端口*/
	/** redis主机端口列表 **/
	RedisHostArr string /*redis主机端口列表*/
	/** 报名排除的服务器列表 **/
	NoSignServerArr string /*报名排除的服务器列表*/

}
