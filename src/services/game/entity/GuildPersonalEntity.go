/**
游戏-公会个人信息(GuildPersonalEntity)
公会个人信息
**/
package table

var TbGuildPersonal = "uw_guild_personal"

type GuildPersonalEntity struct {
	/** 公会个人信息id **/
	Id int32 /*公会个人信息id*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 公会id **/
	GuildId int32 /*公会id*/
	/** 职务 **/
	Position int32 /*职务*/
	/** 被提升为副会长的时间 **/
	ViceTime int64 /*被提升为副会长的时间*/
	/** 今天贡献值 **/
	TodayAct int32 /*今天贡献值*/
	/** 今天公告次数 **/
	NoticeCount int32 /*今天公告次数*/
	/** 今天退会次数 **/
	ExitGuildCount int32 /*今天退会次数*/
	/** 今日抽奖次数 **/
	LotteryCount int32 /*今日抽奖次数*/
	/** 贡献上一次刷新时间 **/
	ActLastTime int64 /*贡献上一次刷新时间*/
	/** 累计贡献值 **/
	AddUpAct int32 /*累计贡献值*/
	/** 退会信息 **/
	OutMsg string /*退会信息*/
	/** 申请信息 **/
	AppliedMsg string /*申请信息*/
	/** 贡献数据 **/
	ActData string /*格式:{&quot贡献id&quot:[次数]}*/
	/** 当前公会贡献 **/
	GuildAct int32 /*当前公会贡献*/
	/** 最后退会时间 **/
	LastQuipGuildTime int64 /*最后退会时间*/
	/** 爵位 **/
	Ennoble int32 /*爵位*/

}
