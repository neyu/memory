/**
游戏-副本进度(CopyProgressEntity)
副本进度
**/
package tb

var TbCopyProgress = "uw_copy_progress"

type CopyProgressEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 副本类型 **/
	CopyType int32 /*副本类型*/
	/** 主副本id **/
	PCopyId int32 /*主副本id*/
	/** 连胜 **/
	WinningStreak int32 /*连胜*/
	/** 主副本挑战时间 **/
	PTime int64 /*主副本挑战时间*/
	/** 已通关子副本列表 **/
	CopyObj string /*已通关子副本列表{子副本id:节点,子副本id:节点...}*/
	/** 最后一次通关子副本时间 **/
	RefreshTime int64 /*最后一次通关子副本时间*/
	/** 子副本挑战时间列 **/
	TimeArr string /*子副本挑战时间列*/
	/** 子副本星级 **/
	CopyStar string /*子副本星级*/
	/** 主副本是否已经通过 **/
	Finished int8 /*主副本是否已经通过*/
	/** 是否领取通关奖励 **/
	IsPickAward string /*是否领取通关奖励[0,0,1]*/
	/** 是否领取通关宝箱 **/
	IsPickChests string /*是否领取通关宝箱[0,0,1]*/
	/** 子副本剩余挑战次数 **/
	TimesPerDay string /*子副本已通关次数*/
	/** 购买次数 **/
	ResetCounts string /*购买次数{id:次数,id:次数...}*/
	/** 购买时间 **/
	ResetTime int64 /*购买时间*/
	/** 查看数据 **/
	ReadObj string /*查看数据{副本id:是否阅读}*/

}
