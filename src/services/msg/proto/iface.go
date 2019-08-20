syntax = "proto3";

package msgProto;


// 神秘商店购买礼包
message ActivityBuyMysterShop {
    int32 activityId = 1; //活动id
    int32 index = 2; //栏目项
}

// 获取活动列表
message ActivityGetList {
	//
}

// 领取精彩活动
message ActivityReceive {
    int32 activityId = 1; //活动id
    int32 index = 2; //栏目项
}

// 获取是否需要操作，即前端所谓的红点，注意：外面的大红点的id为-1
// @returns {"活动id":"是否需要操作(0|1)",.....}
message ActivityGetIsNeedOperate {
	//
}

// 补签
message activity_patchSign_args : {
    int32 activityId = 1; //活动id
}

// 上报用户调研数据
message ActivityReport {
    int32 ActivityId = 1; //活动id
    string report = 2; //上报数据
}

// 获取竞技场信息
message ArenaGetInfo {
	//
}

// 重置竞技场挑战对手
message ArenaResetFightRanks {
	//
}

// 挑战开始
message ArenaFightStart {
    string rank = 1; //挑战排行
}

// 挑战结束
message ArenaFightEnd {
    string rank = 1; //挑战排行
    int32 isWin = 2; //是否胜利
    string fightData = 3; //战斗数据
}

// 获取对手列表
message ArenaGetFightUserList {
	//
}

// 购买挑战次数
message ArenaBuyPKNum {
	//
}

// 获取巅峰赛记录实例
message ArenaGetRecordList {
    int32 index = 1; //索引id
    int32 coun = 2; //总数
}

// 设置阅读
message ArenaSetRead {
	//
}

// 领取排行奖励
message ArenaPickRankAward {
	//
}

// 购买挑战次数
message ArenaRefreshCD {
	//
}

// 获取排行榜列表
message ArenaGetRankList {
	//
}

// 获取下次刷新剩余时间
message ArenaGetRefreshRemainTime {
	//
}

// 获取分红信息
message BonusGetInfo {
    int32 lastId = 1; //分页id
}

// 解散关系
message BonusBreakRelation {
    uint64 inviteeUserId : "_0"//解散的用户ID
}

// 上家分享
message BonusShare {
    int32 serverIndexId = 1; //服务器ID
}

// 上家提取返利
message BonusDraw {
	//
}

// 上家首次分享发奖
message BonusSendShareGift {
	//
}

// 获取行会boss列表
message BossGetGuildBossList {
	//
}

// 获取世界boss列表
message BossGetWorldBossList {
	//
}

// 开启boss
message BossOpenBoss {
    int32 bossId = 1; //bossId
    int32 isLock = 2; //是否上锁
}

// 进入boss系统
message BossEnter {
    int32 bossId = 1; //bossId
}

// 开始战斗
message BossStartFight {
    int32 bossId = 1; //bossId
}

// 造成伤害
message BossHurt {
    int32 bossId = 1; //bossId
    string hurtDic = 2; //{英雄id：伤害}
    int32 isEnd = 3; //是否最后
    string mData = 4; //加密
    string hurtArr = 5; //伤害长度，用于验证
}

// 退出战斗
message BossExitFight {
    int32 bossId = 1; //bossId
}

// 清除退出cd
message BossClearFightCd {
	//
}

// 鼓舞
message BossInspire {
    int32 bossId = 1; //bossId
}

// 获取鼓舞记录列表
a_boss_getInspireRecordArr : "a.bo.g"
message BossGetInspireRecordArr {
    int32 bossId = 1; //bossId
}

// 同步鼓舞
message BossSyncInspire {
    int32 bossId = 1; //bossId
}

// 获取前20伤害排名
message BossGetHurtRankList {
    int32 bossId = 1; //bossId
}

// 获取第一名
message BossGetFirstHurtRank {
    int32 bossId = 1; //bossId
}

// 获取boss战斗结果
message BossGetBossResult {
    int32 bossId = 1; //bossId
    int32 originBossId = 2; //originBossId
}

// 获取boss结果
message BossGetResultData {
    int32 originBossId = 1; //originBossId
}

// 获取聚灵妖莲数据
message DemonLotusGetInfo {
	//
}

// 升级聚灵妖莲
message DemonLotusUpLotus {
	//
}

// 领取收益
message DemonLotusGetRevenue {
	//
}

// 开光
message DemonLotusOpening {
	//
}

// 妖莲进阶
message DemonLotusLotusAdvance {
	//
}

// 妖莲进阶
message DemonLotusTreasureTrain {
	//
}

 * 获取邮件列表
 * @args
 * @isWorker 1
 * @returns MailEntity
 */
message mail_getList : "a.em.a"
,/**
 * 提取邮件物品
 * @args {mailId:"邮件id"}
 * @return ds.ExUserData
 */
a_mail_pickItems : "a.em.b"
message mail_pickItems_args : {
    mailId : "_0"//邮件id
}
,/**
 * 一键领取
 * @args
 * @return ds.ExUserData
 */
message mail_pickAllItems : "a.em.d"
,/**
 * 设置阅读邮件
 * @args {mailId:"邮件id"}
 * @isWorker 1
 */
a_mail_setRead : "a.em.c"
message mail_setRead_args : {
    mailId : "_0"//邮件id
}
,/**
 * 获取是否存在需要阅读或者提取物品的邮件
 * @args {mailId:"邮件id"}
 * @isWorker 1
 * @returns 1|0
 */
a_mail_getIsNeedOperate : "a.em.e"
message mail_getIsNeedOperate_args : {
    mailId : "_0"//邮件id
}
,/**.
 * 随机事件购买
 * @args {eventId:"随机事件id"}
 * @returns ds.UserEntity
 */
a_event_eventBuy : "a.ev.a"
message event_eventBuy_args : {
    eventId : "_0"//随机事件id
}
,/**
 * 装备
 * @args    {tempId:"英雄id",index:"装备位置",equipId:"装备id"}
 * @returns ds.ExUserData
 */
a_equip_changeEquip : "a.eq.a"
message equip_changeEquip_args : {
    tempId : "_0"//英雄id
    ,index : "_1"//装备位置
    ,equipId : "_2"//装备id
}
,/**
 * 传承装备
 * @args    {equipId:"装备id",tempId:"英雄id"}
 * @returns ds.ExUserData
 */
a_equip_inheritedEquip : "a.eq.b"
message equip_inheritedEquip_args : {
    equipId : "_0"//装备id
    ,tempId : "_1"//英雄id
}
,/**
 * 定制武器
 * @args    {certificate:"凭证id",job:"职业",name:"装备名",lvl:"装备等级",abilityIndex:"属性下标数组",equipType:"部位"}
 * @returns ds.ExUserData
 */
a_equip_customization : "a.eq.c"
message equip_customization_args : {
    certificate : "_0"//凭证id
    ,job : "_1"//职业
    ,name : "_2"//装备名
    ,lvl : "_3"//装备等级
    ,abilityIndex : "_4"//属性下标数组
    ,equipType : "_5"//部位
}
,/**
 * 定制武器升级
 * @args    {equipId:"装备id"}
 * @returns ds.ExUserData
 */
a_equip_upCustomization : "a.eq.d"
message equip_upCustomization_args : {
    equipId : "_0"//装备id
}
,/**
 * 锁定装备
 * @args    {equipId:"装备id",isLocked:"1"}
 * @returns ds.ExUserData
 */
a_equip_updateEquipItemLockStatus : "a.eq.e"
message equip_updateEquipItemLockStatus_args : {
    equipId : "_0"//装备id
    ,isLocked : "_1"//1
}
,/**
 * 出售装备
 * @args  {equipIdArr:"id,id,id"}
 * @returns ds.ExUserData
 */
a_equip_sellEquipItems : "a.eq.f"
message equip_sellEquipItems_args : {
    equipIdArr : "_0"//id,id,id
}
,/**
 * 获取用户信息
 * @args
 */
message user_getInfo : "a.u.a"
,/**
 * 改名
 * @args {name:"名字",heroTempId:"模板id "}
 * @returns ds.ExUserData
 */
a_user_changeName : "a.u.b"
message user_changeName_args : {
    name : "_0"//名字
    ,heroTempId : "_1"//模板id 
}
,/**
 * 升级
 * @args
 * @returns ds.ExUserData
 */
message user_upLvl : "a.u.c"
,/**
 * 同步信息
 * @args {sendData:"战斗数据是数组[最新聊天id]"}
 * @returns ds.AsyncData
 */
a_user_syncData : "a.u.f"
message user_syncData_args : {
    sendData : "_0"//战斗数据是数组[最新聊天id]
}
,/**
 * 同步信息2
 * @args
 * @isWorker 1
 * @returns ds.AsyncData2
 */
message user_syncData2 : "a.u.f1"
,/**
 * 打开背包宝箱
 * @args {chestId:"宝箱id",count:"宝箱数量"}
 * @isWorker 1
 */
a_user_getBagChest : "a.u.g"
message user_getBagChest_args : {
    chestId : "_0"//宝箱id
    ,count : "_1"//宝箱数量
}
,/**
 * 购买金币
 * @args
 * @isWorker 1
 * @returns ds.ExUserData
 */
message user_buyGold : "a.u.d"
,/**
 * 购买凌云石
 * @args
 * @isWorker 1
 * @returns ds.ExUserData
 */
message user_buyLingyun : "a.u.d1"
,/**
 * 红点提示
 * @args
 */
message user_getRedPoint : "a.u.h"
,/**
 * 更新引导
 * @args  {guideId:"引导id"}
 * @isWorker 1
 */
a_user_updateGuide : "a.u.i"
message user_updateGuide_args : {
    guideId : "_0"//引导id
}
,/**
 * 获取掠夺小弟记录
 * @args
 * @returns [ds.HeroChangeRecord]
 */
message user_getWinRecord : "a.u.j"
,/**
 * 获取被抢小弟记录
 * @args
 * @returns [ds.HeroChangeRecord]
 */
message user_getLoseRecord : "a.u.k"
,/**
 * 购买金币
 * @args
 * @isWorker 1
 */
message user_buyToUpLvl : "a.u.m"
,/**
 * 保存桌面成功
 * @args {type:"c_prop.userRecordTypeKey"}
 * @isWorker 1
 */
a_user_saveDeskSuccess : "a.u.o"
message user_saveDeskSuccess_args : {
    type : "_0"//c_prop.userRecordTypeKey
}
,/**
 * 设置布阵
 * @args {heroEmbattle:"布阵信息"}
 */
a_user_setHeroEmbattle : "a.u.p"
message user_setHeroEmbattle_args : {
    heroEmbattle : "_0"//布阵信息
}
,/**
 * 购买背包格子
 * @args
 * @isWorker 1
 */
message user_buyBagGrid : "a.u.q"
,/**
 * 更新战斗力
 * @args
 */
message user_updateCombat : "a.u.q1"
,/**
 * 设置自动战斗
 * @args {isAuto:"是否自动"}
 * @isWorker 1
 */
a_user_setAutoFight : "a.u.q2"
message user_setAutoFight_args : {
    isAuto : "_0"//是否自动
}
,/**
 * 设置报错次数
 * @args {errorNum:"异常次数"}
 * @isWorker 1
 */
a_user_setTimeError : "a.u.q3"
message user_setTimeError_args : {
    errorNum : "_0"//异常次数
}
,/**
 * 设置杀戮排名挑战
 * @args {eid:"对手userId"}
 * @isWorker 1
 */
a_user_setTodayRankWin : "a.u.q4"
message user_setTodayRankWin_args : {
    eid : "_0"//对手userId
}
,/**
 * 获取战印榜
 * @args
 */
message user_getWarPrintedList : "a.u.q5"
,/**
 * 战印强化
 * @args {warPrintedId:"战印id"}
 */
a_user_warPrintedStrength : "a.u.q6"
message user_warPrintedStrength_args : {
    warPrintedId : "_0"//战印id
}
,/**
 * 修改战印榜
 * @args {warPrintedId:"战印id"}
 */
a_user_setMedalTitle : "a.u.q7"
message user_setMedalTitle_args : {
    warPrintedId : "_0"//战印id
}
,/**
 * 获取真气数据
 * @args
 */
message user_getGenuineQi : "a.u.q8"
,/**
 * 激活战印
 * @args {warPrintedId:"战印id"}
 */
a_user_activeMedal : "a.u.q9"
message user_activeMedal_args : {
    warPrintedId : "_0"//战印id
}
,/**
 * 获取绑定手机url
 * @args
 * @return string url
 */
message user_getBindPhoneUrl : "a.u.r"
,/**
 * 领取玩吧礼包
 * @args {os:"ios", giftId:"901"}
 */
a_user_getWanbagift : "a.u.s"
message user_getWanbagift_args : {
    os : "_0"//ios
    ,giftId : "_1"//901
}
,/**
 * 更新设置数据
 * @args {catNoVipChat:"true", autoBuyLittleHorn:"true"}
 */
a_user_updateSetting : "a.u.t"
message user_updateSetting_args : {
    catNoVipChat : "_0"//true
    ,autoBuyLittleHorn : "_1"//true
}
,/**
 * 更新背包某样物品
 * @args {itemId:"itemId"}
 */
a_user_updateItems4Bag : "a.u.u"
message user_updateItems4Bag_args : {
    itemId : "_0"//itemId
}
,/**
 * 获取用户好友信息
 * @args
 */
message friend_getInfo : "a.f.a"
,/**
 * 请求添加好友
 * @args {requestedId:"被请求用户id"}
 */
a_friend_requestFriend : "a.f.b"
message friend_requestFriend_args : {
    requestedId : "_0"//被请求用户id
}
,/**
 * 处理好友请求
 * @args {requestId:"请求用户id",isTake:"是否接受请求  0：不接受  1：接受"}
 */
a_friend_disposeFriendRequest : "a.f.c"
message friend_disposeFriendRequest_args : {
    requestId : "_0"//请求用户id
    ,isTake : "_1"//是否接受请求  0：不接受  1：接受
}
,/**
 * 随机获取助阵好友/陌生人
 * @args
 */
message friend_eventCheer : "a.f.d"
,/**
 * 获取请求列表
 * @args
 */
message friend_getRequestInfo : "a.f.e"
,/**
 * 捡取掉落，得到金币，装备
 * @args {copyId:"副本id",uidArr:"掉落唯一id组",fightData:"战斗数据"}
 * @isWorker 1
 * @returns ds.ExUserData
 */
a_fight_pickLoot : "a.fi.a"
message fight_pickLoot_args : {
    copyId : "_0"//副本id
    ,uidArr : "_1"//掉落唯一id组
    ,fightData : "_2"//战斗数据
}
,/**
 * 复活
 * @args
 * @returns ds.UserEntity
 */
message fight_revive : "a.fi.b"
,/**
 * 获取和预掉落数据
 * @args {copyId:"副本id",isBoss:"是否boss关卡",lvl:"用户等级"}
 * @isWorker 1
 * @returns {"唯一id":[[物品id,物品数量],..]}
 */
a_fight_getAndInitNextLoot : "a.fi.c"
message fight_getAndInitNextLoot_args : {
    copyId : "_0"//副本id
    ,isBoss : "_1"//是否boss关卡
    ,lvl : "_2"//用户等级
}
,/**
 * 五日目标请求
 * @args
 * @isWorker 1
 * @returns [ds.FiveDaysTaret]
 */
message fiveDaysTarget_getInfo : "a.ft.e"
,/**
 * 新四日目标请求
 * @args
 * @isWorker 1
 * @returns [ds.FiveDaysTaret]
 */
message fiveDaysTarget_getInfo1 : "a.ft.a"
,/**
 * 获取公会数据
 * @args
 */
message guild_getInfo : "a.g.a"
,/**
 * 创建公会
 * @args {name:"公会名称"}
 */
a_guild_establishGuild : "a.g.b"
message guild_establishGuild_args : {
    name : "_0"//公会名称
}
,/**
 * 搜索公会
 * @args {guildId:"公会id"}
 */
a_guild_seekGuild : "a.g.c"
message guild_seekGuild_args : {
    guildId : "_0"//公会id
}
,/**
 * 申请加入公会
 * @args {guildId:"公会id"}
 */
a_guild_joinGuild : "a.g.d"
message guild_joinGuild_args : {
    guildId : "_0"//公会id
}
,/**
 * 获取申请列表
 * @args
 */
message guild_getAppliedMembers : "a.g.e"
,/**
 * 申请列表管理
 * @args {tUserId:"要设置用户id",isConsent:"是否同意"}
 */
a_guild_appliedMembersSet : "a.g.f"
message guild_appliedMembersSet_args : {
    tUserId : "_0"//要设置用户id
    ,isConsent : "_1"//是否同意
}
,/**
 * 工会设置
 * @args {joinCon:"加入条件",joinLvl:"加入最低等级"}
 */
a_guild_guildSetting : "a.g.g"
message guild_guildSetting_args : {
    joinCon : "_0"//加入条件
    ,joinLvl : "_1"//加入最低等级
}
,/**
 * 退会
 * @args
 */
message guild_exitGuild : "a.g.h"
,/**
 * 修改公告
 * @args {notice:"公告"}
 */
a_guild_setNotice : "a.g.i"
message guild_setNotice_args : {
    notice : "_0"//公告
}
,/**
 * 抽奖
 * @args {count:"次数"}
 */
a_guild_lottery : "a.g.j"
message guild_lottery_args : {
    count : "_0"//次数
}
,/**
 * 爵位
 * @args {targetUserId:"成员id",ennobleType:"爵位类型"}
 */
a_guild_setEnnoble : "a.g.k"
message guild_setEnnoble_args : {
    targetUserId : "_0"//成员id
    ,ennobleType : "_1"//爵位类型
}
,/**
 * 贡献
 * @args {actId:"贡献id"}
 * @returns ds.ExGuildData
 */
a_guildPerson_pickAct : "a.gp.a"
message guildPerson_pickAct_args : {
    actId : "_0"//贡献id
}
,/**
 * 获取成员列表
 * @args
 * @isWorker 1
 * @returns ds.GuildMember
 */
message guildPerson_getMemberList : "a.gp.b"
,/**
 * 操作会员
 * @args {targetUserId:"对方userId",op:"操作类型"}
 * @returns ds.ExGuildData
 */
a_guildPerson_opMember : "a.gp.c"
message guildPerson_opMember_args : {
    targetUserId : "_0"//对方userId
    ,op : "_1"//操作类型
}
,/**
 * 获取个人数据
 * @args
 * @returns ds.MyGuildWarData
 */
message guildWar_getInfo : "a.gw.a"
,/**
 * 获取行会列表
 * @args {guildId:"公会id"}
 * @returns ds.GuildServer
 */
a_guildWar_getGuildList : "a.gw.a1"
message guildWar_getGuildList_args : {
    guildId : "_0"//公会id
}
,/**
 * 获取战斗攻击数据
 * @args {serverId:"服务器id",guildId:"公会id"}
 * @returns ds.GuildWarData
 */
a_guildWar_getWarAttackData : "a.gw.b"
message guildWar_getWarAttackData_args : {
    serverId : "_0"//服务器id
    ,guildId : "_1"//公会id
}
,/**
 * 获取战斗防守数据
 * @args {guildId:"公会id"}
 * @returns ds.GuildWarData
 */
a_guildWar_getWarDefenceData : "a.gw.c"
message guildWar_getWarDefenceData_args : {
    guildId : "_0"//公会id
}
,/**
 * 获取己方防守记录
 * @args
 * @returns ds.GuildWarDefenceRecord
 */
message guildWar_getDefenceRecordList : "a.gw.d"
,/**
 * 获取战况记录
 * @args
 * @returns ds.GuildWarAttackRecord
 */
message guildWar_getAttackRecordList : "a.gw.e"
,/**
 * 获取所有排名
 * @args
 * @returns ds.GuildWarAllRank
 */
message guildWar_getGuildWarAllRank : "a.gw.f"
,/**
 * 获取上次排行
 * @args {groupId:"组别id"}
 * @returns ds.GuildWarAllRank
 */
a_guildWar_getLastRankList : "a.gw.f1"
message guildWar_getLastRankList_args : {
    groupId : "_0"//组别id
}
,/**
 * 获取报名信息
 * @args {guildId:"行会id"}
 * @returns ds.SignData
 */
a_guildWar_getSignUpData : "a.gw.g"
message guildWar_getSignUpData_args : {
    guildId : "_0"//行会id
}
,/**
 * 获取报名信息
 * @args {groupId:"组别id"}
 * @returns groupId
 */
a_guildWar_signUp : "a.gw.g1"
message guildWar_signUp_args : {
    groupId : "_0"//组别id
}
,/**
 * 战斗开始
 * @args {serverId:"服务器id",guildId:"guildId",door:"door"}
 * @returns ds.GuildFightData
 */
a_guildWar_fightStartDoor : "a.gw.h"
message guildWar_fightStartDoor_args : {
    serverId : "_0"//服务器id
    ,guildId : "_1"//guildId
    ,door : "_2"//door
}
,/**
 * 战斗结束
 * @args {serverId:"服务器id",guildId:"guildId",door:"door",isWin:"isWin"}
 * @returns groupId
 */
a_guildWar_fightEndDoor : "a.gw.h1"
message guildWar_fightEndDoor_args : {
    serverId : "_0"//服务器id
    ,guildId : "_1"//guildId
    ,door : "_2"//door
    ,isWin : "_3"//isWin
}
,/**
 * 上阵
 * @args {door:"door"}
 * @returns groupId
 */
a_guildWar_upDoor : "a.gw.i"
message guildWar_upDoor_args : {
    door : "_0"//door
}
,/**
 * 下阵
 * @args {door:"door"}
 * @returns groupId
 */
a_guildWar_downDoor : "a.gw.i1"
message guildWar_downDoor_args : {
    door : "_0"//door
}
,/**
 * 进入行会战
 * @args
 * @returns groupId
 */
message guildWar_enter : "a.gw.j"
,/**
 * 清除cd
 * @args
 * @returns dsNameConsts.ExMyGuildWarData
 */
message guildWar_clearCd : "a.gw.j1"
,/**
 * 鼓舞
 * @args
 * @returns dsNameConsts.ExMyGuildWarData
 */
message guildWar_inspire : "a.gw.j2"
,/**
 * 同步数据
 * @args {sceneType:"场景",attackData:"[服务器id ，行会id]"}
 * @returns dsNameConsts.GuildWarSyncData
 */
a_guildWar_syncData : "a.gw.k"
message guildWar_syncData_args : {
    sceneType : "_0"//场景
    ,attackData : "_1"//[服务器id ，行会id]
}
,/**
 * 获取用户成就信息
 * @args
 */
message honor_getInfo : "a.h.a"
,/**
 * 用户领取成就奖励
 * @args  {honorId:"成就id"}
 */
a_honor_getAward : "a.h.b"
message honor_getAward_args : {
    honorId : "_0"//成就id
}
,/**
 * 结算百分比类效果扣除时照成的收益加成错误修改
 * @args
 */
message honor_bugAlter : "a.h.c"
,/**
 * 获取心法神功数据
 * @args
 */
message heartStunt_getInfo : "a.hs.a"
,/**
 * 选择心法
 * @args  {index:"槽位下标",heartStuntId:"选择心法id"}
 */
a_heartStunt_choMenCulMethods : "a.hs.b"
message heartStunt_choMenCulMethods_args : {
    index : "_0"//槽位下标
    ,heartStuntId : "_1"//选择心法id
}
,/**
 * 心法加点
 * @args  {index:"槽位下标"}
 */
a_heartStunt_stuMenCulMethods : "a.hs.c"
message heartStunt_stuMenCulMethods_args : {
    index : "_0"//槽位下标
}
,/**
 *更换心法
 * @args  {index:"槽位下标",heartStuntId:"选择心法id"}
 */
a_heartStunt_chaMenCulMethods : "a.hs.d"
message heartStunt_chaMenCulMethods_args : {
    index : "_0"//槽位下标
    ,heartStuntId : "_1"//选择心法id
}
,/**
 * 召唤英雄
 * @args {tempId:"英雄模板id",sex:"性别"}
 * @returns ds.ExUserData
 */
a_hero_callHero : "a.he.a"
message hero_callHero_args : {
    tempId : "_0"//英雄模板id
    ,sex : "_1"//性别
}
,/**
 * 技能升级
 * @args {tempId:"英雄模板id",index:"技能下标"}
 * @returns ds.ExUserData
 */
a_hero_upSkill : "a.he.b"
message hero_upSkill_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//技能下标
}
,/**
 * 清除技能CD
 * @args
 */
message hero_clearSkillCd : "a.he.c"
,/**
 * 装备符文块
 * @args {tempId:"英雄模板id",index:"技能下标"}
 * @returns ds.ExUserData
 */
a_hero_wearRune : "a.he.d"
message hero_wearRune_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//技能下标
}
,/**
 * 升级境界
 * @args {tempId:"英雄模板id"}
 */
a_hero_upRealm : "a.he.e"
message hero_upRealm_args : {
    tempId : "_0"//英雄模板id
}
,/**
 * 强化
 * @args {tempId:"英雄模板id",index:"对应装备位置下标"}
 */
a_hero_strength : "a.he.f"
message hero_strength_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//对应装备位置下标
}
,/**
 * 强化精炼
 * @args {tempId:"英雄模板id",index:"装备下标"}
 */
a_hero_equipRefine : "a.he.f1"
message hero_equipRefine_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//装备下标
}
,/**
 * 升星
 * @args {tempId:"英雄模板id",index:"对应装备位置下标"}
 */
a_hero_upStar : "a.he.g"
message hero_upStar_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//对应装备位置下标
}
,/**
 * 升星突破
 * @args {tempId:"英雄模板id",index:"对应装备位置下标"}
 */
a_hero_starTop : "a.he.g1"
message hero_starTop_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//对应装备位置下标
}
,/**
 * 宝石升级
 * @args {tempId:"英雄模板id",index:"对应装备位置下标"}
 */
a_hero_upGem : "a.he.h"
message hero_upGem_args : {
    tempId : "_0"//英雄模板id
    ,index : "_1"//对应装备位置下标
}
,/**
 * 翅膀培养
 * @args {tempId:"英雄模板id",fosType:"培养类型"}
 */
a_hero_wingFos : "a.he.z"
message hero_wingFos_args : {
    tempId : "_0"//英雄模板id
    ,fosType : "_1"//培养类型
}
,/**
 * 翅膀强化
 * @args {tempId:"英雄模板id",part:"部位",isReplace:"是否元宝替代"}
 */
a_hero_wingStrength : "a.he.z1"
message hero_wingStrength_args : {
    tempId : "_0"//英雄模板id
    ,part : "_1"//部位
    ,isReplace : "_2"//是否元宝替代
}
,/**
 * 翅膀一键培养
 * @args {tempId:"英雄模板id",fosType:"培养类型",isUseDiamond:"是否使用元宝"}
 */
a_hero_wingFos2Top : "a.he.z2"
message hero_wingFos2Top_args : {
    tempId : "_0"//英雄模板id
    ,fosType : "_1"//培养类型
    ,isUseDiamond : "_2"//是否使用元宝
}
,/**
 * 翅膀升级
 * @args {tempId:"英雄模板id"}
 */
a_hero_upWing : "a.he.k"
message hero_upWing_args : {
    tempId : "_0"//英雄模板id
}
,/**
 * 翅膀激活
 * @args {tempId:"英雄模板id"}
 */
a_hero_wingActivate : "a.he.l"
message hero_wingActivate_args : {
    tempId : "_0"//英雄模板id
}
,/**
 * 重新计算属性和战力
 * @args
 */
message hero_calPropAndCombat : "a.he.m"
,/**
 * 获取主英雄外观数据
 * @args {userId:"用户id"}
 * @returns [装备显示id,武器显示id,翅膀id,性别]
 */
a_hero_getMainHeroDisplay : "a.he.n"
message hero_getMainHeroDisplay_args : {
    userId : "_0"//用户id
}
,/**
 * 获取主英雄外观数据
 * @args {userId:"用户id",tempId:"英雄模板id"}
 * @returns [装备显示id,武器显示id,翅膀id,性别]
 */
a_hero_getHeroDisplayByTempId : "a.he.o"
message hero_getHeroDisplayByTempId_args : {
    userId : "_0"//用户id
    ,tempId : "_1"//英雄模板id
}
,/**
 * 重新计算属性和战力
 * @args  {userId:"用户id"}
 */
a_hero_getShowHeroData : "a.he.o1"
message hero_getShowHeroData_args : {
    userId : "_0"//用户id
}
,/**
 * 装备符文块
 * @args {tempId:"英雄模板id"}
 * @returns ds.ExUserData
 */
a_hero_wearAllRune : "a.he.p"
message hero_wearAllRune_args : {
    tempId : "_0"//英雄模板id
}
,/**
 * 开启自动注入
 * @args {isOpenIn:"是否开启"}
 * @returns ds.ExUserData
 */
a_hero_autoInfuseSwitch : "a.he.q"
message hero_autoInfuseSwitch_args : {
    isOpenIn : "_0"//是否开启
}
,/**
 * 额外注入
 * @args {type:"类型"}
 * @returns ds.ExUserData
 */
a_hero_extraInfuse : "a.he.q1"
message hero_extraInfuse_args : {
    type : "_0"//类型
}
,/**
 * 保存出战列表
 * @args {fightArr:"顺序数组"}
 * @returns
 */
a_hero_saveFightList : "a.he.q2"
message hero_saveFightList_args : {
    fightArr : "_0"//顺序数组
}
,/**
 * 抽奖
 * @args {type:"抽奖类型",count:"抽奖次数"}
 */
a_lottery_lottery : "a.l.a"
message lottery_lottery_args : {
    type : "_0"//抽奖类型
    ,count : "_1"//抽奖次数
}
,/**
 * 领取探宝值宝箱
 * @args
 */
message lottery_getTreasureChest : "a.l.b"
,/**
 * 初始化数据
 * @args
 */
message lottery_getInfo : "a.l.c"
,/**
 * 初始化数据
 * @args
 */
message task_getInfo : "a.t.a"
,/**
 * 任务奖励领取
 * @args {taskId:"任务id"}
 * @isWorker 1
 */
a_task_taskAward : "a.t.b"
message task_taskAward_args : {
    taskId : "_0"//任务id
}
,/**
 * 领取活跃度宝箱
 * @args {index:"宝箱下标"}
 * @isWorker 1
 */
a_task_getVitalityChest : "a.t.c"
message task_getVitalityChest_args : {
    index : "_0"//宝箱下标
}
,/**
 * 购买挑战次数
 * @args
 * @returns ds.UserEntity
 */
message pk_buyPKNum : "a.p.a"
,/**
 * 获取对手列表
 * @args
 * @returns  [ds.PKUserData]
 */
message pk_getPKUserList : "a.p.b"
,/**
 * 获取对手信息
 * @args {userId:"用户id"}
 * @returns  ds.PKUserData
 */
a_pk_getPKUserData : "a.p.c"
message pk_getPKUserData_args : {
    userId : "_0"//用户id
}
,/**
 * 战斗
 * @args {enemyId:"对手id",isNPC:"是否npc 0|1",fightType:"1、排位赛 2、仇人榜"}
 * @returns  ds.FightResult
 */
a_pk_fight : "a.p.d"
message pk_fight_args : {
    enemyId : "_0"//对手id
    ,isNPC : "_1"//是否npc 0|1
    ,fightType : "_2"//1、排位赛 2、仇人榜
}
,/**
 * 获取仇人列表
 * @args
 * @returns  [ds.PKUserData]
 */
message pk_getEnemyList : "a.p.e"
,/**
 * 获取排行榜
 * @args
 * @returns [ds.PKUserData]
 */
message pk_getUserRanks : "a.p.f"
,/**
 * 获取自己的排名
 * @args
 * @returns 排名
 */
message pk_getRank : "a.p.g"
,/**
 * 改签名
 * @args {sign:"签名"}
 * @returns ds.UserEntity
 */
a_pk_changeSign : "a.p.h"
message pk_changeSign_args : {
    sign : "_0"//签名
}
,/**
 * 设置阅读
 * @args
 */
message pk_setRead : "a.p.i"
,/**
 * 跳过战斗
 * @args
 */
message pk_skip : "a.p.j"
,/**
 * 领取排行奖励
 * @args
 */
message pk_pickRankAward : "a.p.k"
,/**
 * 获取仇人pk记录
 * @args {enemyId:"敌人id"}
 * @returns [ds.HeroChangeRecord]
 */
a_pk_getEnemyRecord : "a.p.l"
message pk_getEnemyRecord_args : {
    enemyId : "_0"//敌人id
}
,/**
 * 获取野外仇人列表
 * @args
 * @returns  [ds.PKUserData]
 */
message pk_getList : "a.p.m"
,/**
 * 开启pk
 * @args
 * @returns ds.PkOutEntity
 */
message pkOut_open : "a.po.a"
,/**
 * 获取对手列表
 * @args
 * @returns ds.ExPkOut
 */
message pkOut_getEnemyList : "a.po.b"
,/**
 * 获取未报仇仇人列表
 * @args
 * @returns [ds.PkOutUserData]
 */
message pkOut_getRevengeEnemyList : "a.po.b1"
,/**
 * 刷新对手
 * @args
 * @returns [ds.PkOutUserData]
 */
message pkOut_refreshEnemy : "a.po.c"
,/**
 * 请求开始战斗
 * @args {enemyId:"对手id",fightType:"战斗类型 c_prop.fightTypeKey",isRevenge:"是否复仇"}
 * @returns ds.ExPkOut
 */
a_pkOut_start : "a.po.d"
message pkOut_start_args : {
    enemyId : "_0"//对手id
    ,fightType : "_1"//战斗类型 c_prop.fightTypeKey
    ,isRevenge : "_2"//是否复仇
}
,/**
 * 结束战斗
 * @args {isWin:"是否胜利", enemyId:"对手的userId",fightData:"战斗数据",fightType:"战斗类型 c_prop.fightTypeKey",isRevenge:"是否复仇"}
 * @returns ds.FightResult
 */
a_pkOut_end : "a.po.e"
message pkOut_end_args : {
    isWin : "_0"//是否胜利
    ,enemyId : "_1"//对手的userId
    ,fightData : "_2"//战斗数据
    ,fightType : "_3"//战斗类型 c_prop.fightTypeKey
    ,isRevenge : "_4"//是否复仇
}
,/**
 * 获取排行列表，返回50名数据
 * @args
 * @returns [ds.Rank]
 */
message pkOut_getRankList : "a.po.f"
,/**
 * 获取个人排名
 * @args
 * @returns 排名
 */
message pkOut_getMyRank : "a.po.g"
,/**
 * 获取个人战斗记录，最多20条
 * @args
 * @returns ds.ArenaRecordEntity
 */
message pkOut_getPkRecordList : "a.po.h"
,/**
 * 获取个人战斗记录，最多20条
 * @args
 * @returns ds.ArenaRecordEntity
 */
message pkOut_getRankPkRecordList : "a.po.h1"
,/**
 * 设置阅读
 * @args
 */
message pkOut_setPkRecordRead : "a.po.i"
,/**
 * 处理被抢
 * @args {fightType:"战斗类型 c_prop.fightTypeKey"}
 */
message pkOut_dealRecord : "a.po.j"
,a_pkOut_dealRecord_args : {
    fightType : "_0"//战斗类型 c_prop.fightTypeKey
}
,/**
 * 清除pk值
 * @args
 */
message pkOut_clearPkValue : "a.po.k"
,/**
 * 设置去掉红点
 * @args
 */
message pkOut_resetBePkKill : "a.po.l"
,/**
 * 隐姓埋名
 * @args
 */
message pkOut_incognito : "a.po.m"
,/**
 * 获取个人战斗记录，最多20条
 * @args
 * @returns ds.TreasureRecordEntity
 */
message pkOut_getTreasurePkRecordList : "a.po.n"
,/**
 * 获取商店数据
 * @args {type:"商店类型c_prop.shopTypeKey.normal"}
 * @isWorker 1
 */
a_shop_getInfo : "a.s.a"
message shop_getInfo_args : {
    type : "_0"//商店类型c_prop.shopTypeKey.normal
}
,/**
 * 刷新商店
 * @args {type:"类型",lvlRefresh:"是否等级刷新"}
 */
a_shop_refreshExShop : "a.s.b"
message shop_refreshExShop_args : {
    type : "_0"//类型
    ,lvlRefresh : "_1"//是否等级刷新
}
,/**
 * 商店购买
 * @args {index:"用户选择的items下标",type:"商店类型c_prop.shopTypeKey.normal",num:"购买数量"}
 * @returns ds.ExUserData
 */
a_shop_buy : "a.s.c"
message shop_buy_args : {
    index : "_0"//用户选择的items下标
    ,type : "_1"//商店类型c_prop.shopTypeKey.normal
    ,num : "_2"//购买数量
}
,/**
 * 购买所有（装备商店）
 * @args {type:"商店类型c_prop.shopTypeKey.normal"}
 * @returns ds.ExUserData
 */
a_shop_buyAll : "a.s.d"
message shop_buyAll_args : {
    type : "_0"//商店类型c_prop.shopTypeKey.normal
}
,/**
 * 获取副本列表
 * @args {type:"副本类型"}
 * @isWorker 1
 */
a_copy_getInfo : "a.c.a"
message copy_getInfo_args : {
    type : "_0"//副本类型
}
,/**
 * 购买挑战次数
 * @args {type:"副本类型",copyId:"副本id"}
 */
a_copy_buyCopyCount : "a.c.b"
message copy_buyCopyCount_args : {
    type : "_0"//副本类型
    ,copyId : "_1"//副本id
}
,/**
 * 购买装备入场卷
 * @args
 */
message copy_buyEquipTessera : "a.c.c"
,/**
 * 购买境界入场卷
 * @args
 */
message copy_buyRealmTessera : "a.c.d"
,/**
 * 扫荡
 * @args {copyId:"副本id"}
 * @returns [ds.FightResult]
 */
a_copy_copyWipe : "a.c.e"
message copy_copyWipe_args : {
    copyId : "_0"//副本id
}
,/**
 * 副本开始
 * @args {copyId:"副本id",biCost:"消耗log"}
 * @returns [ds.ExCopyProgress]
 */
a_copy_start : "a.c.f"
message copy_start_args : {
    copyId : "_0"//副本id
    ,biCost : "_1"//消耗log
}
,/**
 * 副本结束
 * @args {copyId:"副本id",fightData:"战斗验证数据",isWin:"是否胜利"}
 * @returns [ds.ExCopyProgress]
 */
a_copy_end : "a.c.g"
message copy_end_args : {
    copyId : "_0"//副本id
    ,fightData : "_1"//战斗验证数据
    ,isWin : "_2"//是否胜利
}
,/**
 * 更新连胜
 * @args {copyId:"副本id"}
 * @isWorker 1
 * @returns [ds.FightResult]
 */
a_copy_updateWinningStreak : "a.c.h"
message copy_updateWinningStreak_args : {
    copyId : "_0"//副本id
}
,/**
 * 查看
 * @args {copyId:"副本id"}
 * @isWorker 1
 * @returns [ds.CopyProgressEntity]
 */
a_copy_setRead : "a.c.i"
message copy_setRead_args : {
    copyId : "_0"//副本id
}
,/**
 * 行会副本开始
 * @args {copyId:"章节id",bossId:"bossid"}
 * @returns []
 */
a_copy_guildStart : "a.c.j"
message copy_guildStart_args : {
    copyId : "_0"//章节id
    ,bossId : "_1"//bossid
}
,/**
 * 行会副本结束
 * @args {copyId:"章节id",bossId:"bossid",isWin:"结果"}
 * @returns [ds.ExCopyProgress]
 */
a_copy_guildEnd : "a.c.k"
message copy_guildEnd_args : {
    copyId : "_0"//章节id
    ,bossId : "_1"//bossid
    ,isWin : "_2"//结果
}
,/**
 * 行会副本领取奖励
 * @args {type:"boss或章节",typeId:"bossId或章节id"}
 * @returns [ds.ExCopyProgress]
 */
a_copy_guildCopyAward : "a.c.l"
message copy_guildCopyAward_args : {
    type : "_0"//boss或章节
    ,typeId : "_1"//bossId或章节id
}
,/**
 * 行会副本重置
 * @args
 * @returns []
 */
message copy_guildCopyReset : "a.c.m"
,/**
 * 公会副本清除CD
 * @args {bossId:"bossID"}
 */
a_copy_clearGuildCopy : "a.c.n"
message copy_clearGuildCopy_args : {
    bossId : "_0"//bossID
}
,/**
 * 爬塔领取奖励
 * @args {copyId:"副本id"}
 * @returns [ds.ExCopyProgress]
 */
a_copy_paTaAward : "a.c.o"
message copy_paTaAward_args : {
    copyId : "_0"//副本id
}
,/**
 * 爬塔宝库抽奖
 * @args
 * @returns [ds.ExCopyProgress]
 */
message copy_paTaTreasury : "a.c.o1"
,/**
 * 取得王城擂主信息
 * @args
 * @returns [ds.ChallengeCupData]
 */
message challengeCup_getInfo : "a.cc.a"
,/**
 * 开始挑战擂主
 * @args  {championUserId: "挑战擂主的userId"}
 * @return [ds.ExChallengeCupFight]
 */
a_challengeCup_startFight : "a.cc.b"
message challengeCup_startFight_args : {
    championUserId : "_0"//挑战擂主的userId
}
,/**
 * 结束战斗
 * @args  {isWin: "是否战斗胜利"}
 * @return ds.FightResult
 */
a_challengeCup_endFight : "a.cc.c"
message challengeCup_endFight_args : {
    isWin : "_0"//是否战斗胜利
}
,/**
 *消除cd
 * @args
 * @return [...]
 */
message challengeCup_clearCd : "a.cc.d"
,/**
 * 登台，成为第一位擂主
 * @args
 * @returns [ds.ChallengeCupData]
 */
message challengeCup_toBeChampion : "a.cc.e"
,/**
 * 获取伤害排行榜
 * @args
 * @return [ds.ChampionDurationTimeRank]
 */
message challengeCup_getDurationTimeRankList : "a.cc.f"
,/**
 * 取得王城擂主活动是否开启
 * @args
 * @returns [isOpen, now, openTime]
 */
message challengeCup_getIsOpen : "a.cc.g"
,/**
 * 操作，顶，踩
 * @args  {op: "0：踩 1 ：顶"}
 * @return ds.ChallengeCupData
 */
a_challengeCup_op : "a.cc.h"
message challengeCup_op_args : {
    op : "_0"//0：踩 1 ：顶
}
,/**
 * 获取数据
 * @args
 * @returns ds.ExCrystalData
 */
message crystal_getInfo : "a.cr.a"
,/**
 * 保存数据
 * @args {hp:"剩余血量",hpNum:"剩余血量条",nextReplayTime:"下一次回满时间"}
 */
a_crystal_saveProgress : "a.cr.b"
message crystal_saveProgress_args : {
    hp : "_0"//剩余血量
    ,hpNum : "_1"//剩余血量条
    ,nextReplayTime : "_2"//下一次回满时间
}
,/**
 * 完成某个关卡
 * @args {crystalId:"当前id"}
 * @returns ds.CrystalEntity
 */
a_crystal_finish : "a.cr.c"
message crystal_finish_args : {
    crystalId : "_0"//当前id
}
,/**
 * 领取奖励
 * @args {crystalId:"当前id"}
 * @returns ds.UserEntity
 */
a_crystal_pickAward : "a.cr.d"
message crystal_pickAward_args : {
    crystalId : "_0"//当前id
}
,/**
 * 使用技能
 * @args {index:"技能下标"}
 * @returns ds.CrystalEntity
 */
a_crystal_useSkill : "a.cr.e"
message crystal_useSkill_args : {
    index : "_0"//技能下标
}
,/**
 * 刷新技能cd
 * @args {index:"技能下标"}
 * @returns ds.CrystalEntity
 */
a_crystal_refreshSkillCd : "a.cr.f"
message crystal_refreshSkillCd_args : {
    index : "_0"//技能下标
}
,/**
 * 获取排行榜
 * @args {rankType:"排行类型"}
 * @isWorker 1
 * @returns ds.UserRankEntity
 */
a_rank_getRankList : "a.r.a"
message rank_getRankList_args : {
    rankType : "_0"//排行类型
}
,/**
 * 获取个人排行榜
 * @args {rankType:"排行类型"}
 * @returns ds.ExUserRankData
 */
a_rank_getUserRank : "a.r.b"
message rank_getUserRank_args : {
    rankType : "_0"//排行类型
}
,/**
 * 获取排行榜数据
 * @args {rankType:"排行类型"}
 * @returns 【个人排名，个人排行数据，所有排行数据】
 */
a_rank_allRankArr : "a.r.c"
message rank_allRankArr_args : {
    rankType : "_0"//排行类型
}
,/**
 * 获取公会相关排行榜数据
 * @args {rankType:"排行类型"}
 * @returns 【所有排行数据,公会名称{}】
 */
a_rank_getGuildRank : "a.r.d"
message rank_getGuildRank_args : {
    rankType : "_0"//排行类型
}
,/**
 * 转生
 * @args
 * @return ds.Rebirth
 */
message rebirth_rebirth : "a.rb.a"
,/**
 * 购买转生丹
 * @args {index:"转生丹index",num:"转生丹数量"}
 * @return ds.ExUserData
 */
a_rebirth_buyRebirth : "a.rb.b"
message rebirth_buyRebirth_args : {
    index : "_0"//转生丹index
    ,num : "_1"//转生丹数量
}
,/**
 * 获取充值记录信息
 * @args
 * @isWorker 1
 */
message recharge_getInfo : "a.rc.a"
,/**
 * 充值
 * @args {rechargeId:"充值项ID",channelId:"渠道号",receiptData:"苹果验证数据"}
 */
a_recharge_recharge : "a.rc.b"
message recharge_recharge_args : {
    rechargeId : "_0"//充值项ID
    ,channelId : "_1"//渠道号
    ,receiptData : "_2"//苹果验证数据
}
,/**
 * 获取今天累计充值
 * @args
 * @isWorker 1
 */
message recharge_getTodayCount : "a.rc.c"
,/**
 * 获取所有累计充值
 * @args
 * @isWorker 1
 */
message recharge_getAllCount : "a.rc.d"
,/**
 * 请求充值
 * @args {rechargeId:"充值项ID",goodsId:"渠道物品id"}
 * @isWorker 1
 * @returns [请求id,服务器id,支付数据]
 */
a_recharge_getRequest : "a.rc.e"
message recharge_getRequest_args : {
    rechargeId : "_0"//充值项ID
    ,goodsId : "_1"//渠道物品id
}
,/**
 * 处理支付请求
 * @args
 * returns  ["是否处理完","获得钻石","充值项"]
 */
message recharge_handleRequest : "a.rc.g"
,/**
 * 获取红包列表
 * @args
 */
message redEnvelope_getList : "a.re.a"
,/**
 * 发送红包
 * @args {type:"红包类型",spItemId:"红包物品",amount:"红包金额",personNum:"红包领取份数",wish:"祝福文本"}
 */
a_redEnvelope_sendRedEnvelope : "a.re.b"
message redEnvelope_sendRedEnvelope_args : {
    type : "_0"//红包类型
    ,spItemId : "_1"//红包物品
    ,amount : "_2"//红包金额
    ,personNum : "_3"//红包领取份数
    ,wish : "_4"//祝福文本
}
,/**
 * 同步红包
 * @args
 */
message redEnvelope_syncRedEnvelope : "a.re.c"
,/**
 * 获取最新的红包记录
 * @args {lastId:"最后一条的唯一id"}
 * @returns
 */
a_redEnvelope_getNewList : "a.re.d"
message redEnvelope_getNewList_args : {
    lastId : "_0"//最后一条的唯一id
}
,/**
 * 抢红包
 * @args {redEnvelopeId:"红包id"}
 */
a_redEnvelope_receiveBonus : "a.re.e"
message redEnvelope_receiveBonus_args : {
    redEnvelopeId : "_0"//红包id
}
,/**
 * 获取个人红包数据
 * @args
 */
message redEnvelopePersonal_getInfo : "a.rp.a"
,/**
 * 获取最新的聊天记录
 * @args {lastId:"最后一条的唯一id",guildId:"公会id",guildLastId:"最后一条公会的唯一id"}
 * @returns ds.ChatData
 */
a_chat_getNewList : "a.ch.a"
message chat_getNewList_args : {
    lastId : "_0"//最后一条的唯一id
    ,guildId : "_1"//公会id
    ,guildLastId : "_2"//最后一条公会的唯一id
}
,/**
 * 获取最新的系统消息记录
 * @args {lastId:"最后一条的唯一id"}
 * @returns ds.ChatData
 */
a_chat_getNewSysMsgList : "a.ch.hda"
message chat_getNewSysMsgList_args : {
    lastId : "_0"//最后一条的唯一id
}
,/**
 * 发送聊天
 * @args {content:"聊天内容",lastId:"最后一条的唯一id",type:"聊天类型",guildId:"公会id",guildLastId:"公会最后一条的唯一id",isLittleHorn:"true"}
 * @returns ds.ChatData
 */
a_chat_sendData : "a.ch.b"
message chat_sendData_args : {
    content : "_0"//聊天内容
    ,lastId : "_1"//最后一条的唯一id
    ,type : "_2"//聊天类型
    ,guildId : "_3"//公会id
    ,guildLastId : "_4"//公会最后一条的唯一id
    ,isLittleHorn : "_5"//true
}
,/**
 * 使用兑换码
 * @args {code:"兑换码"}
 * @returns ds.ExUserData
 */
a_coupon_use : "a.co.a"
message coupon_use_args : {
    code : "_0"//兑换码
}
,/**
 * 获取数据
 * @args
 * @returns ds.CoffersEntity
 */
message coffers_getInfo : "a.cof.a"
,/**
 * 建设国库
 * @args
 * @returns ds.ExCoffers
 */
message coffers_build : "a.cof.b"
,/**
 * 激励
 * @args
 * @returns ds.ExCoffers
 */
message coffers_addBuff : "a.cof.b1"
,/**
 * 获取英雄记录掠夺记录
 * @args
 * @returns ds.CoffersRecord
 */
message coffers_getLootRecordArr : "a.cof.c"
,/**
 * 获取防守记录
 * @args
 * @returns ds.CoffersRecord
 */
message coffers_getDefeseRecord : "a.cof.c1"
,/**
 * 获取己方守卫数据
 * @args
 * @returns ds.CofferUser
 */
message coffers_getDefeseData : "a.cof.d"
,/**
 * 获取敌方守卫数据
 * @args {serverId:"服务器id"}
 * @returns ds.ExDefenceData
 */
a_coffers_getEnemyDefeseData : "a.cof.d1"
message coffers_getEnemyDefeseData_args : {
    serverId : "_0"//服务器id
}
,/**
* 获取服务器列表状态
* @args
* @param session
* @returns ds.CoffersServer
*/
message coffers_getServerArr : "a.cof.e"
,/**
 * 战斗开始
 * @args {serverId:"服务器id",door:"门类型"}
 * @returns ds.ExCoffers
 */
a_coffers_fightStart : "a.cof.f"
message coffers_fightStart_args : {
    serverId : "_0"//服务器id
    ,door : "_1"//门类型
}
,/**
 * 挑战结束
 * @args {serverId:"服务器id",door:"门类型",isWin:"是否胜利",fightData:"战斗数据"}
 * @returns ds.FightResult
 */
a_coffers_fightEnd : "a.cof.f2"
message coffers_fightEnd_args : {
    serverId : "_0"//服务器id
    ,door : "_1"//门类型
    ,isWin : "_2"//是否胜利
    ,fightData : "_3"//战斗数据
}
,/**
 * 战斗开始
 * @args {serverId:"服务器id"}
 * @returns ds.ExCoffers
 */
a_coffers_fightCoffersStart : "a.cof.g"
message coffers_fightCoffersStart_args : {
    serverId : "_0"//服务器id
}
,/**
 * 挑战结束
 * @args {hurt:"伤害数据",serverId:"serverId",fightData:"战斗数据"}
 * @returns ds.FightResult
 */
a_coffers_fightCoffersEnd : "a.cof.g1"
message coffers_fightCoffersEnd_args : {
    hurt : "_0"//伤害数据
    ,serverId : "_1"//serverId
    ,fightData : "_2"//战斗数据
}
,/**
 * 获取vip
 * @args
 * @isWorker 1
 * @returns ds.SdkVipData
 */
message sdk_getVip : "a.sd.a"
,/**
 * 装备熔炼
 * @args {equipArr:"所要熔炼的装备id数组",choColor:"质量"}
 */
a_smelt_smelt : "a.sm.a"
message smelt_smelt_args : {
    equipArr : "_0"//所要熔炼的装备id数组
    ,choColor : "_1"//质量
}
,/**
 * 装备合成
 * @args {compoundId:"所要合成物品的Id"}
 * @isWorker 1
 */
a_smelt_compound : "a.sm.b"
message smelt_compound_args : {
    compoundId : "_0"//所要合成物品的Id
}
,/**
 * 装备特戒
 * @args {tempId:"英雄id",breakId:"所要装备特戒的Id"}
 */
a_smelt_wearParRing : "a.sm.c"
message smelt_wearParRing_args : {
    tempId : "_0"//英雄id
    ,breakId : "_1"//所要装备特戒的Id
}
,/**
 * 特戒突破
 * @args {tempId:"英雄id",breakId:"所要装备特戒的Id"}
 */
a_smelt_ringBreak : "a.sm.d"
message smelt_ringBreak_args : {
    tempId : "_0"//英雄id
    ,breakId : "_1"//所要装备特戒的Id
}
,/**
 * 获取数据
 * @args
 * @returns ds.King
 */
message king_getInfo : "a.k.a"
,/**
 * 膜拜
 * @args
 * @returns ds.ExKing
 */
message king_worship : "a.k.b"
,/**
 * 领取福利
 * @args
 * @returns ds.ExKing
 */
message king_receiveWelfare : "a.k.c"
,/**
 * 开启buff
 * @args
 * @returns ds.King
 */
message king_openBuff : "a.k.d"
,/**
 * 出售物品
 * @args    {itemId:"id",itemNum:"num"}
 * @returns ds.ExUserData
 */
a_item_sellItems : "a.it.a"
message item_sellItems_args : {
    itemId : "_0"//id
    ,itemNum : "_1"//num
}
,/**
 * 江湖探秘
 * @args
 * @returns [ds.PkOutUserData]
 */
message treasure_spies : "a.tr.a"
,/**
 * 获取新pk额外信息
 * @args
 * @returns ds.ExPkOutInfo
 */
message treasure_getExPkOutInfo : "a.tr.b"
,/**
 * 开启秘宝
 * @args {id:"id"}
 * @returns ds.TreasureInfo
 */
a_treasure_open : "a.tr.c"
message treasure_open_args : {
    id : "_0"//id
}
,/**
 * 开启秘宝
 * @args {itemId:"id"}
 * @returns ds.ComposeInfo
 */
a_treasure_compose : "a.tr.d"
message treasure_compose_args : {
    itemId : "_0"//id
}
,/**
 * 使用法宝道具
 * @args    {itemId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_useTrumpItem : "a.tm.a"
message talisman_useTrumpItem_args : {
    itemId : "_0"//法宝id
}
,/**
 * 穿戴装备
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_wearTrump : "a.tm.b"
message talisman_wearTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 法宝升级
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_upTrumpLvl : "a.tm.c"
message talisman_upTrumpLvl_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 法宝升星
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_upTrumpStar : "a.tm.d"
message talisman_upTrumpStar_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 重铸法宝
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_recastTrump : "a.tm.e"
message talisman_recastTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 法宝合成
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_compoundTrump : "a.tm.f"
message talisman_compoundTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 法宝洗炼
 * @args    {tempId:"英雄id",trumpId:"法宝id",isCheck:"是否开启保险"}
 * @returns ds.ExUserData
 */
a_talisman_baptizeTrump : "a.tm.g"
message talisman_baptizeTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
    ,isCheck : "_2"//是否开启保险
}
,/**
 * 确认洗炼
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_confirmBaptizeTrump : "a.tm.h"
message talisman_confirmBaptizeTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * 取消洗炼
 * @args    {tempId:"英雄id",trumpId:"法宝id"}
 * @returns ds.ExUserData
 */
a_talisman_cancelBaptizeTrump : "a.tm.i"
message talisman_cancelBaptizeTrump_args : {
    tempId : "_0"//英雄id
    ,trumpId : "_1"//法宝id
}
,/**
 * ��ȡ������Ϣ
 * @args
 */
message expedition_getInfo : "a.ex.a"
,/**
 * ��ԪӤ
 * @args {tempId:"ģ��id",soulId:"ԪӤid"}
 * @returns ds.ExpeditionData
 */
a_expedition_wearSoul : "a.ex.b"
message expedition_wearSoul_args : {
    tempId : "_0"//ģ��id
    ,soulId : "_1"//ԪӤid
}
,/**
 * ս����ʼ
 * @args {stageId:"�ؿ�id"}
 * @returns ds.ExpeditionData
 */
a_expedition_startBattle : "a.ex.c"
message expedition_startBattle_args : {
    stageId : "_0"//�ؿ�id
}
,/**
 * ս������
 * @args {isWin:"�Ƿ�ʤ��",herosHp:"ʣ��Ѫ��"}
 * @returns ds.ExpeditionData
 */
a_expedition_endBattle : "a.ex.d"
message expedition_endBattle_args : {
    isWin : "_0"//�Ƿ�ʤ��
    ,herosHp : "_1"//ʣ��Ѫ��
}
,/**
// * ս������
//// * @args {itemId:"��Ʒ��id"}
//////// * @returns ds.ExpeditionData
// */
a_expedition_buyBlackItem : "a.ex.e"
message expedition_buyBlackItem_args : {
    itemId : "_0"//��Ʒ��id
}
,/**
 * 验证常规登录,成功返回null
 * @args {accountId:"账号id",loginKey:"登录key",serverIndexId:"登录key"}
 */
c_account_enterGame : "c.a.a"
message account_enterGame_args : {
    accountId : "_0"//账号id
    ,loginKey : "_1"//登录key
    ,serverIndexId : "_2"//登录key
}
,/**
 * 创建用户
 * @args {name:"名字",heroTempId:"模板id ",sex:"性别 ",serverIndexId:"登录key",shareKey:"可能的分红模块的分享key"}
 * @returns ds.ExUserData
 */
c_account_createUser : "c.a.b"
message account_createUser_args : {
    name : "_0"//名字
    ,heroTempId : "_1"//模板id 
    ,sex : "_2"//性别 
    ,serverIndexId : "_3"//登录key
    ,shareKey : "_4"//可能的分红模块的分享key
}
,/**
 * 获取第三方用户信息
 * @args {}
 * @isWorker 1
 */
message account_getThirdUserInfo : "c.a.hda"
,/**
 * 链接
 * @args
 */
message net_connect : "c.n.a"
,/**
 * 断开链接
 * @args {sessionId:" sessionId"}
 */
c_net_disconnect : "c.n.b"
message c_net_disconnect_args : {
    sessionId : "_0"// sessionId
}
,/**
 * 获取服务器当前时间
 * @args
 */
message c_net_getServerDate : "c.n.c"

// 验证常规登录,成功返回null
message AccountLogin {
    string name = 1; //用户名
    string pwd = 2; //密码
    string channelId = 3; //渠道id
}

// 验证sdk平台登陆,成功返回null
// sdkData的数据说明：
// egret: [token,login_type]
// xiaomi: [uid,sessionId]
message AccountLoginBySdk {
    string channelId = 1; //渠道号id
    string sdkData = 2; //sdk的数据，是一个数组[]
    string deviceId = 3; //机器码
}

// 注册账号
message AccountRegister {
    string name = 1; //账号
    string pwd = 2; //密码
    string channelId = 3; //渠道号id
    string deviceId = 4; //机器码
}

// 获取一条新的公告
message NoticeGetNewOne {
	//
}

// 获取公告列表
message NoticeGetList {
	//
}

// 获取协议内容
 * @args
 * @returns ds.ProtocolContentEntity
 */
message protocolContent_getInfo : "h.pc.a"
,/**
 * 获取所有服务器列表
 * @args {isTest:"是否测试"}
 * @returns [ServerInfoEntity..]
 */
h_serverInfo_getServerList : "h.s.a"
message serverInfo_getServerList_args : {
    isTest : "_0"//是否测试
}
,/**
 * 获取服务器实例数据
 * @args {id:"服务器id"}
 * @returns ServerInfoEntity
 */
h_serverInfo_getServerInfo : "h.s.c"
message serverInfo_getServerInfo_args : {
    id : "_0"//服务器id
}
,/**
 * 获取服务器当前时间
 * @args
 */
message serverInfo_getServerDate : "h.s.e"
,/**
 * 获取拥有角色的服务器
 * @args {accountId:"账号id"}
 * @returns [ServerInfoEntity..]
 */
h_serverInfo_getUserServers : "h.s.f"
message serverInfo_getUserServers_args : {
    accountId : "_0"//账号id
}
,/**
 * 获取账户服务器信息
 * @args {openId:"openId",appId:"wanba",isTest:"1"}
 * @returns [ds.AccountServer]
 */
h_serverInfo_getaccountServers : "h.s.g"
message serverInfo_getaccountServers_args : {
    openId : "_0"//openId
    ,appId : "_1"//wanba
    ,isTest : "_2"//1
}
,/**
 * 获取最新客服系统聊天记录
 * @args {lastId:"最后一条的唯一id",openId:"openId"}
 * @returns ds.ChatData
 */
h_kefu_getList : "h.cs.hda"
message kefu_getList_args : {
    lastId : "_0"//最后一条的唯一id
    ,openId : "_1"//openId
}
,/**
 * 发送客服聊天记录聊天
 * @args {lastId:"最后一条的唯一id",content:"聊天内容",openId:"openId",nickname:"nickname",vipLevel:"vip_level"}
 * @returns ds.ChatData
 */
h_kefu_sendData : "h.cs.hdb"
message kefu_sendData_args : {
    lastId : "_0"//最后一条的唯一id
    ,content : "_1"//聊天内容
    ,openId : "_2"//openId
    ,nickname : "_3"//nickname
    ,vipLevel : "_4"//vip_level
}
,/**
 * 掠夺守卫门
 * @args {attackData:"[攻击玩家id,攻击玩家名，服务器id,服务器名称,是否胜利]",door:"攻击哪个门"}
 * @returns [状态，个人资源，国库资源]
 */
admin_coffers_lootDefense : "admin.coffers.a"
message admin_coffers_lootDefense_args : {
    attackData : "_0"//[攻击玩家id,攻击玩家名，服务器id,服务器名称,是否胜利]
    ,door : "_1"//攻击哪个门
}
,/**
 * 掠夺国库
 * @args {hurt:"伤害",breakNum:"攻破门数"}
 * @returns [状态，个人资源，国库资源]
 */
admin_coffers_lootCoffersDefense : "admin.coffers.a1"
message admin_coffers_lootCoffersDefense_args : {
    hurt : "_0"//伤害
    ,breakNum : "_1"//攻破门数
}
,/**
 * 获取缓存信息
 * @args
 * @returns 缓存信息
 */
message admin_coffers_getCache : "admin.coffers.b"
,/**
 * 重置积分累计积分
 * @args
 * @returns 缓存信息
 */
message admin_coffers_resetPoints : "admin.coffers.c"
,/**
 * 更新缓存
 * @args {data:"[[key,value],[key,value]]"}
 * @returns
 */
admin_coffers_updateCache : "admin.coffers.d"
message admin_coffers_updateCache_args : {
    data : "_0"//[[key,value],[key,value]]
}
,/**
 * 获取缓存信息
 * @args
 * @returns 缓存信息
 */
message admin_guild_getCache : "admin.guild.a"
,/**
 * 获取某个行会数据
 * @args {id:"id"}
 * @returns 缓存信息
 */
admin_guild_getGuildById : "admin.guild.b"
message admin_guild_getGuildById_args : {
    id : "_0"//id
}
,/**
 * 获取某个公会
 * @args {id:"id",data:"[[key,value],[key,value]]"}
 * @returns
 */
admin_guild_updateCache : "admin.guild.c"
message admin_guild_updateCache_args : {
    id : "_0"//id
    ,data : "_1"//[[key,value],[key,value]]
}
,/**
 * 获取僵尸公会
 * @args
 * @returns
 */
message admin_guild_getZombieGuild : "admin.guild.d"
,/**
 * 清除僵尸公会
 * @args {id:"id",data:"[[],[],[],...]"}
 * @returns
 */
admin_guild_clearZombieGuild : "admin.guild.e"
message admin_guild_clearZombieGuild_args : {
    id : "_0"//id
    ,data : "_1"//[[],[],[],...]
}
,/**
 * 会长弹劾
 * @args
 * @returns
 */
message admin_guild_chairmanImpeach : "admin.guild.f"
,/**
 * 获取boss缓存信息
 * @args {bossId:"bossId"}
 * @returns 缓存信息
 */
admin_boss_getBossData : "admin.boss.a"
message admin_boss_getBossData_args : {
    bossId : "_0"//bossId
}
,/**
 * 获取用户缓存信息
 * @args {bossId:"bossId"}
 * @returns 缓存信息
 */
admin_boss_getUserCache : "admin.boss.a1"
message admin_boss_getUserCache_args : {
    bossId : "_0"//bossId
}
,/**
 * 获取某个用户数据
 * @args {id:"id"}
 * @returns 缓存信息
 */
admin_boss_getGuildById : "admin.boss.a2"
message admin_boss_getGuildById_args : {
    id : "_0"//id
}
,/**
 * 更新boss缓存
 * @args {data:"[[key,value],[key,value]]"}
 * @returns
 */
admin_boss_updateBossCache : "admin.boss.b"
message admin_boss_updateBossCache_args : {
    data : "_0"//[[key,value],[key,value]]
}
,/**
 * 更新某个用户数据
 * @args {id:"id",data:"[[key,value],[key,value]]"}
 * @returns
 */
admin_boss_updateUserCache : "admin.boss.c"
message admin_boss_updateUserCache_args : {
    id : "_0"//id
    ,data : "_1"//[[key,value],[key,value]]
}
,/**
 * ���Ϳ�����Ϣ��С���ȣ�
 * @args {nickName:"���Ҳ���",vip:"",content:"",isGM:"",guildName:"",medalTitle:"",isLittleHorn:""}
 * @returns [nickName]
 */
admin_chat_serversChat : "admin.chat.a"
message admin_chat_serversChat_args : {
    nickName : "_0"//���Ҳ���
    ,vip : "_1"//
    ,content : "_2"//
    ,isGM : "_3"//
    ,guildName : "_4"//
    ,medalTitle : "_5"//
    ,isLittleHorn : "_6"//
}
,/**
 * 攻击城门
 * @args {attackData:"[攻击玩家id,攻击玩家名，服务器id,服务器名称,是否直接击破]",isWin:"是否胜利",defenceData:"[行会id,攻击哪个门,防守者名字]"}
 * @returns [状态，个人资源，国库资源]
 */
admin_guildWar_lootDefense : "admin.guildWar.a"
message admin_guildWar_lootDefense_args : {
    attackData : "_0"//[攻击玩家id,攻击玩家名，服务器id,服务器名称,是否直接击破]
    ,isWin : "_1"//是否胜利
    ,defenceData : "_2"//[行会id,攻击哪个门,防守者名字]
}
,/**
 * 增加被攻打消息
 * @args {guildId:"被打行会id", data:"[门，服务器名,行会名,玩家名]"}
 * @returns 0
 */
admin_guildWar_pushBeFightRecord : "admin.guildWar.b"
message admin_guildWar_pushBeFightRecord_args : {
    guildId : "_0"//被打行会id
    ,data : "_1"//[门，服务器名,行会名,玩家名]
}
,/**
 * 获取当前服务器行会信息
 * @args
 * @returns 0
 */
message admin_guildWar_getCurServerGuildWarObj : "admin.guildWar.c"
,/**
 * 插入100条用户，用于压测
 * @args
 * @returns 0
 */
message admin_guildWar_enter100User : "admin.guildWar.d"
,/**
 * 添加服务器
 * @args {curServerData:"[serverGroupId,serverId,serverHost,serverPort]"}
 * @returns 0
 */
admin_guildWarSync_getSyncServer : "admin.guildWarSync.a"
message admin_guildWarSync_getSyncServer_args : {
    curServerData : "_0"//[serverGroupId,serverId,serverHost,serverPort]
}
,/**
 * 获取缓存信息
 * @args
 * @returns 缓存信息
 */
message admin_treasure_getTreasureCash : "admin.treasure.a"
,/**
 * 获取玩家秘宝信息
 * @args
 * @returns 缓存信息
 */
message admin_treasure_getTreasureByUserId : "admin.treasure.b"
,/**
 *
 * @args {userId:"123"}
 * @returns 缓存信息
 */
admin_treasure_setTreasureByUserId : "admin.treasure.c"
message admin_treasure_setTreasureByUserId_args : {
    userId : "_0"//123
}
};