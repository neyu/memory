/**
游戏-心法神功(HeartStuntEntity)
心法神功
**/
package tb

var TbHeartStunt = "uw_heart_stunt"

type HeartStuntEntity struct {
	/** 序号 **/
	Id int32 /*公会个人信息id*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 境界数据 **/
	StateArr string /*境界数据境界槽位对应选择的心法[心法id,心法id,...]*/
	/** 心法等级数据 **/
	HeartLvlArr string /*心法等级数据境界槽位下标对应心法的等级[lvl,lvl,...]*/

}
