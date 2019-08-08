/**
游戏-邮件(MailEntity)
邮件
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 类型 **/
    type: null/*类型*/
    /** 发送者 **/
    fromName: null/*发送者*/
    /** 标题 **/
    title: null/*标题*/
    /** 内容 **/
    content: null/*内容*/
    /** 替换值 **/
    replaceArgs: null/*替换值*/
    /** 附件物品 **/
    items: null/*{hero:{&quotid&quot:num,..},diamond:100,wipeItem:100}*/
    /** 是否提取物品 **/
    isPicked: 0/*是否提取物品*/
    /** 是否阅读 **/
    isRead: 0/*是否阅读*/
    /** 操作后几小时删除 **/
    delHours: null/*操作后几小时删除*/
    /** 删除时间 **/
    delTime: null/*删除时间*/
    /** 过期时间 **/
    expireTime: null/*过期时间*/
    /** 添加时间 **/
    addTime: null/*添加时间*/
    /** 是否删除 **/
    isDelete: 0/**/
    /** 任务id **/
    taskId: 0/*任务id*/

}
_Class.tableName: 'uw_mail'