/**
主-公告(NoticeEntity)
公告
**/
package tb

var TbNotice = "uw_notice"

type NoticeEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 标题 **/
	Title string /*标题*/
	/** 内容 **/
	Content string /*内容*/
	/** 服务器id组 **/
	ServerIdArr string /*服务器id组,[]长度为0时为全服*/
	/** 是否开启 **/
	IsOpen int8 /*是否开启,0：不开启，1：开启*/
	/** 更新时间 **/
	UpdateTime int64 /*更新时间*/
	/** icon类型 **/
	IconType int8 /*icon类型*/
	/** 公告时间 **/
	NoticeTime int64 /*公告时间*/
	/** 开始时间 **/
	StartTime int64 /*开始时间*/
	/** 结束时间 **/
	EndTime int64 /*结束时间*/
	/** 排序 **/
	Sort int8 /*排序*/
	/** 活动额外数据 **/
	ExData string /*活动额外数据*/

}
