/**
主-公告(NoticeEntity)
公告
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 标题 **/
    title: null/*标题*/
    /** 内容 **/
    content: null/*内容*/
    /** 服务器id组 **/
    serverIdArr: null/*服务器id组,[]长度为0时为全服*/
    /** 是否开启 **/
    isOpen: 0/*是否开启,0：不开启，1：开启*/
    /** 更新时间 **/
    updateTime: null/*更新时间*/
    /** icon类型 **/
    iconType: 0/*icon类型*/
    /** 公告时间 **/
    noticeTime: null/*公告时间*/
    /** 开始时间 **/
    startTime: null/*开始时间*/
    /** 结束时间 **/
    endTime: null/*结束时间*/
    /** 排序 **/
    sort: 0/*排序*/
    /** 活动额外数据 **/
    exData: null/*活动额外数据*/

}
_Class.tableName: 'uw_notice'