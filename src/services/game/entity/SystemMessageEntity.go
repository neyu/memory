/**
主-系统信息表(SystemMessageEntity)

**/
package tb

var TbSystemMessage = "uw_system_message"

type SystemMessageEntity struct {
	/** id **/
	Id int32 /*id*/
	/** 服务器id **/
	ServerId int32 /*默认为0，所有服务器*/
	/** 公告内容 **/
	Message string /*公告内容*/
	/** 公告类型 **/
	Type int8 /*公告类型:1 marquee 跑马灯公告 2 即时公告*/
	/** 字体颜色 **/
	Color string /*字体颜色*/
	/** 字体大小 **/
	Size int32 /*字体大小*/
	/** 状态 **/
	Status int8 /*状态0未发送，1已发送*/
	/** 显示次数 **/
	Times int32 /*显示次数*/
	/** 间隔时间 **/
	Interval int32 /*间隔时间 秒为单位*/
	/** 发送时间 **/
	SendTime int64 /*发送时间*/
	/** 创建时间 **/
	CreateTime int64 /*创建时间*/
	/** 最后更新时间 **/
	LastUpdateTime int64 /*最后更新时间*/

}
