/**
游戏-隐姓埋名玩家列表(IncognitoEntity)
游戏-隐姓埋名玩家列表
**/
package table

var TbIncognito = "uw_incognito"

type IncognitoEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 开启时间 **/
	OpenTime int64 /*开启时间*/

}
