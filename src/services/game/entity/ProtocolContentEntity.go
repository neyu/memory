/**
主-协议内容(ProtocolContentEntity)
协议内容
**/
package tb

var TbProtocolContent = "uw_protocol_content"

type ProtocolContentEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 内容 **/
	Content string /*内容*/
	/** 是否开启 **/
	IsOpen int8 /*是否开启,0：不开启，1：开启*/

}
