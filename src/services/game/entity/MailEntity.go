/**
游戏-邮件(MailEntity)
邮件
**/
package tb

var TbMail = "uw_mail"

type MailEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 用户id **/
	UserId uint64 /*用户id*/
	/** 类型 **/
	Type int32 /*类型*/
	/** 发送者 **/
	FromName string /*发送者*/
	/** 标题 **/
	Title string /*标题*/
	/** 内容 **/
	Content string /*内容*/
	/** 替换值 **/
	ReplaceArgs string /*替换值*/
	/** 附件物品 **/
	Items string /*{hero:{&quotid&quot:num,..},diamond:100,wipeItem:100}*/
	/** 是否提取物品 **/
	IsPicked int8 /*是否提取物品*/
	/** 是否阅读 **/
	IsRead int8 /*是否阅读*/
	/** 操作后几小时删除 **/
	DelHours int32 /*操作后几小时删除*/
	/** 删除时间 **/
	DelTime int64 /*删除时间*/
	/** 过期时间 **/
	ExpireTime int64 /*过期时间*/
	/** 添加时间 **/
	AddTime int64 /*添加时间*/
	/** 是否删除 **/
	IsDelete int8 /**/
	/** 任务id **/
	TaskId int32 /*任务id*/

}
