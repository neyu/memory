/**
游戏-公会(GuildEntity)
公会。
**/
package tb

var TbGuild = "uw_guild"

type GuildEntity struct {
	/** 公会id **/
	Id int32 /*id*/
	/** 公会名称 **/
	Name string /*公会名称*/
	/** 公会旗号id **/
	IconId int32 /*公会旗号id*/
	/** 会长id **/
	ChairmanId uint64 /*会长id*/
	/** 副会长ids **/
	ViceChairmanId string /*副会长ids*/
	/** 公会人数 **/
	GuildPopulation int32 /*公会人数*/
	/** 累计贡献值 **/
	AddUpAct int32 /*累计贡献值*/
	/** 加入条件 **/
	JoinCon int32 /*加入条件*/
	/** 加入最低等级 **/
	JoinLvl int32 /*加入最低等级*/
	/** 公会等级 **/
	Lvl int32 /*公会等级*/
	/** 公会公告 **/
	Notice string /*公会公告*/
	/** 公会日志 **/
	Note string /*公会日志*/
	/** 申请入会人员 **/
	AppliedMembers string /*申请入会人员*/
	/** 每日开除会员数量 **/
	NumbersArr string /*每天能开除的会员数量*/
	/** 最后开除成员时间 **/
	LastExpelTime int64 /*最后开除成员时间*/
	/** 爵位数据 **/
	EnnobleData string /*{&quot男爵&quot:count,&quot子爵&quot:count,&quot伯爵&quot:count,&quot侯爵&quot:count,&quot公爵&quot:count}*/
	/** 公会副本数据 **/
	GuildCopyData string /*{bossId:[进度,[参与userId,userId,...]],bossId:[进度,[参与userId,userId,...]],...}*/
	/** 副本重置次数 **/
	ResetCount int32 /*副本重置次数*/
	/** 副本重置时间 **/
	ResetTime int64 /*副本重置时间*/
	/** 成员最后登录时间 **/
	LastLgTime int64 /**/

}
