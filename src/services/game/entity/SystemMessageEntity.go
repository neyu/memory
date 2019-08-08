/**
主-系统信息表(SystemMessageEntity)

**/

type AccountEntity struct {
    /** id **/
    id: null/*id*/
    /** 服务器id **/
    serverId: 0/*默认为0，所有服务器*/
    /** 公告内容 **/
    message: null/*公告内容*/
    /** 公告类型 **/
    type: 1/*公告类型： 
1 marquee 跑马灯公告
2 即时公告*/
    /** 字体颜色 **/
    color: '#000000'/*字体颜色*/
    /** 字体大小 **/
    size: 16/*字体大小*/
    /** 状态 **/
    status: 0/*状态0未发送，1已发送*/
    /** 显示次数 **/
    times: 1/*显示次数*/
    /** 间隔时间 **/
    interval: 60/*间隔时间 秒为单位*/
    /** 发送时间 **/
    sendTime: null/*发送时间*/
    /** 创建时间 **/
    createTime: null/*创建时间*/
    /** 最后更新时间 **/
    lastUpdateTime: null/*最后更新时间*/

}
_Class.tableName: 'uw_system_message'