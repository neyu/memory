/**
后台-账号(ManagerEntity)
后台-账号
**/
package tb

var TbManager = "uw_manager"

type ManagerEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 名字 **/
	Name string /**/
	/** 密码 **/
	Pwd string /**/
	/** 组别 **/
	GroupId int32 /**/

}
