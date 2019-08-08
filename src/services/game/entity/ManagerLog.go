/**
后台-操作日志(ManagerLog)
后台操作日志
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 账号id **/
    managerId: null/*账号id*/
    /** 账号名 **/
    managerName: null/*账号名*/
    /** 模块 **/
    module: null/*模块*/
    /** 服务器id **/
    serverId: 0/*服务器id*/
    /** 类型 **/
    type: null/*类型*/
    /** 操作 **/
    operation: null/*操作*/
    /** ip **/
    ip: null/*ip*/
    /** 时间 **/
    time: null/*时间*/
    /** 类型id **/
    tid: null/*类型id*/

}
_Class.tableName: 'uw_manager_log'