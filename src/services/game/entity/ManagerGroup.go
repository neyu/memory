/**
后台-账号组(ManagerGroup)
后台-账号组
**/
package table

var TbManagerGroup = "uw_manager_group"

type ManagerGroup struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 组名 **/
	Name string /*组名*/
	/** 权限 **/
	Rights int32 /*权限*/

}
