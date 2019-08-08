/**
主-协议内容(ProtocolContentEntity)
协议内容
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 内容 **/
    content: null/*内容*/
    /** 是否开启 **/
    isOpen: 0/*是否开启,0：不开启，1：开启*/

}
_Class.tableName: 'uw_protocol_content'