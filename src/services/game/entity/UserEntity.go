/**
游戏-角色(UserEntity)
角色，账号进入到每个服中扮演的角色。
**/

type AccountEntity struct {
    /** 账号id **/
    accountId: 0/*账号id*/
    /** 头像 **/
    iconId: null/**/
    /** 昵称 **/
    nickName: null/*昵称*/
    /** 金币 **/
    gold: 0/*金币*/
    /** 总钻石 **/
    diamond: 0/*钻石*/
    /** 序号 **/
    id: null/*序号*/
    /** 绑定钻石 **/
    giveDiamond: 0/*绑定钻石，即送的钻石*/
    /** 非绑定钻石 **/
    buyDiamond: 0/*非绑定钻石，即购买的钻石*/
    /** 等级 **/
    lvl: 0/*等级(不同于英雄等级)*/
    /** 经验 **/
    expc: 0/*经验*/
    /** 战力 **/
    combat: 0/*战力*/
    /** VIP等级 **/
    vip: 0/*VIP等级*/
    /** VIP积分 **/
    vipScore: 0/*VIP积分*/
    /** 体力 **/
    strength: 0/**/
    /** 上次恢复体力时间 **/
    strengthReTime: null/**/
    /** 签名 **/
    signName: null/*签名*/
    /** 荣誉值 **/
    honor: 0/*荣誉值*/
    /** 背包（只存放静态物品） **/
    bag: null/*背包(只存放静态物品，格式：{&quot物品id&quot:数量,&quot物品id&quot:数量.............})*/
    /** 装备背包 **/
    equipBag: null/*装备背包 {&quot1&quot:[物品id,[随到的属性值],评价,是否穿戴,name,[基础属性],锁定状态]
,...}  &quot1&quot:指定id,累加上去的*/
    /** 装备背包购买次数 **/
    equipBagBuyCount: 0/*装备背包格数*/
    /** 成就数据 **/
    honorData: null/*成就数据
{&quotid&quot:[是否完成，是否领取],&quotid&quot:[是否完成，是否领取],..........}*/
    /** 蓝钻标记 **/
    blueDiamond: null/*蓝钻标记，为一个对象，key为dsConsts.BlueDiamond中的定义*/
    /** 签到数据 **/
    sign: null/*签到数据,[签到次数,最近一次签到时间]*/
    /** 活动数据 **/
    activity: null/*{&quot活动id&quot:数据}
数据格式：
首充:[领取次数]，
七天登陆：[次数,次数...]
每日限购:[[次数,时间],[次数,时间]..........]
每日累充:[领取时间,领取时间,..........]
全部累充:[次数,次数..........]
每日消费:[领取时间,领取时间,..........]
全部消费:[次数,次数..........]
领主升级:[次数,次数..........]
&quot-7&quot:[登陆次数] 7天登陆的数据
时间段限购:[次数,次数..........]*/
    /** 记录数据 **/
    record: null/*记录数据*/
    /** 扩展数据 **/
    exData: null/*刷新数据
{key:value}
具体看c_prop的userExData*/
    /** 今日次数列表 **/
    counts: null/*今日次数列表，是一个数组，对应各自系统的次数。*/
    /** 今日次数列表刷新时间 **/
    countsRefreshTime: null/*今日次数列表刷新时间【】数组对应下标*/
    /** 最后更新时间 **/
    lastUpdateTime: null/*更新时间*/
    /** 服务器 **/
    serverId: null/**/
    /** 最后点技能时间 **/
    lastSkillTime: null/*最后点技能时间*/
    /** 技能CD **/
    skillCd: 0/*技能CD(秒)*/
    /** 是否开启野外pk **/
    isOpenPk: 0/*是否开启野外pk*/
    /** 声望 **/
    prestige: 0/*声望*/
    /** 红点数据 **/
    redPointData: null/*红点数据*/
    /** 机器人id **/
    robotId: 0/*机器人id*/
    /** 创建时间 **/
    createTime: null/*创建时间*/
    /** sdk渠道号 **/
    sdkChannelId: null/*sdk渠道号*/
    /** 服务器索引 **/
    serverIndexId: 0/*服务器索引*/
    /** 在线掉落数据 **/
    onlineLootData: null/*在线掉落数据[每秒经验,每秒金币,每波怪多少秒,是否统计]*/
    /** 是否是霸主 **/
    isKing: 0/*是否是霸主*/
    /** 转生等级 **/
    rebirthLvl: 0/**/
    /** 转生经验 **/
    rebirthExp: 0/**/
    /** 国库累计积分 **/
    coffersPoints: 0/*国库累计积分*/
    /** 国库今日积分 **/
    todayCoffersPoints: 0/*国库今日积分*/
    /** 勋章称号 **/
    medalTitle: null/**/
    /** 勋章数据 **/
    medalData: null/*{勋章id:[勋章强化等级表id],勋章id:[勋章强化等级表id],...}*/
    /** 真气 **/
    genuineQi: 0/*真气*/
    /** 属性数据 **/
    propertyData: null/*{id:数据,id:数据,...}*/
    /** 国库杀人数 **/
    coffersKillNum: 0/*国库杀人数*/
    /** 是否开启注入 **/
    isOpenIn: 0/*是否开启注入*/
    /** 注入经验 **/
    infuseExpc: 0/*注入经验*/
    /** 通天塔最高层数 **/
    highPaTa: 0/*通天塔最高层数*/

}
_Class.tableName: 'uw_user'