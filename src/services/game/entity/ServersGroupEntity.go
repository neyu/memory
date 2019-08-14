/**
主-服务器分组表(ServersGroupEntity)
服务器分组表
**/
package tb

var TbServersGroup = "uw_servers_group"

type ServersGroupEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 分组类型 **/
	Type int32 /*分组类型*/
	/** 组名 **/
	Name string /*组名*/
	/** 服务器组 **/
	ServerArr string /*服务器组*/
	/** 是否删除 **/
	IsDelete int8 /*是否删除*/
	/** 分组方案 **/
	Case string /*分组方案*/

}
