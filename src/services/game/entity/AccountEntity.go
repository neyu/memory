/**
主-账号(AccountEntity)
游戏-账号
**/
package table

var TbAccount = 'uw_account'

type AccountEntity struct {
    /** 序号 **/
   	Id uint64/*序号*/
    /** 账号名 **/
    Name string/*账号名*/
    /** 邮箱 **/
    Email string/*邮箱*/
    /** 密码 **/
    Pwd string/*密码*/
    /** 机器码 **/
    DeviceId string/*机器码，设备唯一号*/
    /** 账号状态 **/
    Status int8/*账号状态  0正常 ，1普通封号，2设备封号*/
    /** 渠道id **/
    ChannelId int32/*渠道id*/
    /** sdk数据 **/
    SdkData string/*sdk数据*/
    /** 扩展数据 **/
    ExData string/*扩展数据*/
    /** 创建时间 **/
    CreateTime int64/*创建时间*/
    /** 创建ip **/
    CreateIP string/*创建ip*/
    /** 最后修改时间 **/
    LastUpdateTime int64/*最后修改时间*/
    /** 登陆次数 **/
    LoginCount int32/**/
    /** 登陆key **/
    LoginKey string/*登陆key*/
    /** 拥有角色的服务器 **/
    UserServers string/*拥有角色的服务器*/
    /** 充值补偿 **/
    RechargeCom string/*充值补偿  [充值元宝数量,是否发送奖励]*/
    /** sdk渠道号 **/
    SdkChannelId string/*sdk渠道号*/
    /** 禁言过期时间 **/
    BendExpireAt int64/*禁言过期时间*/
    /** 禁言类型，第一位为普通聊天，第二位客服聊天 **/
    BendType int8/*禁言类型，第一位为普通聊天，第二位客服聊天*/

}
