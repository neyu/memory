/**
后台-操作日志(ManagerLog)
后台操作日志
**/
package tb

var TbManagerLog = "uw_manager_log"

type ManagerLog struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 账号id **/
	ManagerId int32 /*账号id*/
	/** 账号名 **/
	ManagerName string /*账号名*/
	/** 模块 **/
	Module string /*模块*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 类型 **/
	Type int8 /*类型*/
	/** 操作 **/
	Operation string /*操作*/
	/** ip **/
	Ip string /*ip*/
	/** 时间 **/
	Time int64 /*时间*/
	/** 类型id **/
	Tid int32 /*类型id*/

}
