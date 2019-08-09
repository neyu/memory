/**
游戏-活动记录(ActivityRecordEntity)
游戏-活动记录
**/
package table

var TbActivityRecord = "uw_activity_record"

type ActivityRecordEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 活动id **/
	ActivityId int32 /*活动id*/
	/** 活动类型 **/
	ActivityType int32 /*活动类型*/
	/** 用户等级 **/
	UserLvl int32 /*用户等级*/
	/** 用户vip **/
	UserVip int32 /*用户vip*/
	/** 消耗钻石数量 **/
	CostDiamond int64 /*消耗钻石数量*/
	/** 获取钻石数量 **/
	GetDiamond int64 /*获取钻石数量*/
	/** 参与活动次数 **/
	JoinCount int32 /*参与活动次数*/
	/** 首次参加时间 **/
	AddTime int64 /*首次参加时间*/
	/** 最后参与时间 **/
	UpdateTime int64 /*最后参与时间*/

}
