/**
主-国库分组(CoffersGroupEntity)
主-国库分组(CoffersGroupEntity)
**/
package tb

var TbCoffersGroup = "uw_coffers_group"

type CoffersGroupEntity struct {
	/** 序号 **/
	Id int32 /**/
	/** 组名 **/
	Name string /*组名*/
	/** 服务器组 **/
	ServerArr string /*服务器组*/

}
