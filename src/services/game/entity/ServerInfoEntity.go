/**
主-服务器信息表(ServerInfoEntity)
服务器信息表。用于管理服务器信息。
**/

type AccountEntity struct {
    /** id **/
    id: null/*id*/
    /** 服务器名称 **/
    name: null/**/
    /** 合服后的名字 **/
    mergerName: null/*合服后的名字*/
    /** 游戏区 **/
    area: null/*游戏区*/
    /** 服务器ip **/
    host: null/*服务器ip*/
    /** 端口 **/
    port: null/*端口*/
    /** 是否是新区 **/
    isNew: 1/*是否是新区*/
    /** 状态 **/
    status: 1/*状态:
0:维护,1:良好，2:正常，3:爆满 ,4:未开放*/
    /** 数据库链接字符串 **/
    dbLink: null/*数据库链接字符串*/
    /** 排序 **/
    sort: 0/*越大越在后面*/
    /** 渠道区分 **/
    appId: null/*渠道区分*/
    /** 服务器id **/
    serverId: null/*服务器id*/
    /** 客户端索引id **/
    indexId: null/*客户端索引id*/
    /** 是否维护 **/
    isClose: 0/**/
    /** 维护说明 **/
    closeExplain: null/**/
    /** 开服日期 **/
    serverDate: null/**/
    /** 外部数据库链接 **/
    outLink: null/*外部数据库链接*/

}
_Class.tableName: 'uw_server_info'