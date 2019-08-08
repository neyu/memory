/**
主-服务器分组表(ServersGroupEntity)
服务器分组表
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 分组类型 **/
    type: null/*分组类型*/
    /** 组名 **/
    name: null/*组名*/
    /** 服务器组 **/
    serverArr: null/*服务器组*/
    /** 是否删除 **/
    isDelete: null/*是否删除*/
    /** 分组方案 **/
    case: null/*分组方案*/

}
_Class.tableName: 'uw_servers_group'