package consts

// Session
const (
	AccountId     = "s1"
	UserId        = "s2"
	ServerId      = "s3"
	AreaId        = "s4"
	Ip            = "s5"
	IsGM          = "s6"
	WorkerId      = "s7"
	ServerIndexId = "s8"
)

/**
 * 钻石获得类型
 * @type {)
 */
// DiamondGainType
const (
	Dgt_Activity_1 = 101 //精彩活动-首冲
	Dgt_Activity_2 = 102 //精彩活动-7天登陆
	Dgt_Activity_3 = 103 //精彩活动-每日累充福利
	Dgt_Activity_4 = 104 //精彩活动-全部累充福利
	Dgt_Activity_5 = 105 //精彩活动-每日消费有礼
	Dgt_Activity_6 = 106 //精彩活动-全部消费有礼
	Dgt_Activity_7 = 107 //精彩活动-升级有奖
	Dgt_Activity_8 = 108 //精彩活动-兑换码
	Dgt_Arena_1    = 201 //竞技场-最高纪录奖励
	Dgt_Item_1     = 301 //物品-宝箱   《需要重构》
	Dgt_Task_1     = 401 //任务-主线
	Dgt_Task_2     = 402 //任务-日常
	Dgt_Recharge_1 = 501 //充值
	Dgt_Exchange_1 = 601 //兑换
	Dgt_Mail_1     = 701 //邮件-后台人工
	Dgt_Mail_2     = 702 //邮件-竞技场排行奖励
	Dgt_Mail_3     = 703 //邮件-竞技场幸运排行奖励
	Dgt_Sign_1     = 801 //签到
	Dgt_Tower_1    = 901 //守卫塔-自动战斗宝箱
)

/**
 * 钻石消费类型
 * @type {)
 */
// diamondConsumeType
const (
	Dct_Activity_1 = 101 //精彩活动-限时抢购
	Dct_Arena_1    = 201 //竞技场-重置CD
	Dct_Arena_2    = 202 //竞技场-购买次数
	Dct_Copy_1     = 301 //副本-扫荡
	Dct_Copy_2     = 302 //副本-购买次数
	Dct_Tower_1    = 401 //守卫塔-自动战斗
	Dct_Shop_1     = 501 //商店-购买
	Dct_Shop_2     = 502 //商店-刷新
	Dct_Lottery_1  = 601 //抽奖
	Dct_User_1     = 701 //角色-购买体力
	Dct_User_2     = 702 //角色-购买技能点
	Dct_User_3     = 703 //角色-购买金币
	Dct_User_4     = 704 //角色-改名字
	Dct_User_5     = 705 //角色-购买副本次数
	Dct_User_6     = 706 //角色-购买入场劵
	Dct_User_7     = 707 //角色-清除技能CD
	Dct_Equip_1    = 801 //装备-(一键锻造)
	Dct_Friend_1   = 901 //好友，邀请奖励
)

/**
 * 道具类型
 */
// itemLogicType
const (
	Gift = 1 //物品
	Expc = 2 //经验
	Res  = 3 //资源
)

//培养类型
// trainType
const (
	Train_Normal   = 0 //普通
	Train_Specify1 = 1
	Train_Specify2 = 2
)

// pomeloOnKey
const (
	SysMsg = "a"
)

/**
 *竞技场幸运排名类型
 */
// arenaLuckRankType
const (
	Pass      = 0 //过去
	Today     = 1 //今天
	Yesterday = 2 //昨日
)

/**
 * 抽奖类型
 * @type {{gold = number  diamond = number  vip = number))
 */
// lotteryType
const (
	Gold    = 1 //金币
	Diamond = 2 //钻石
	Vip     = 3 //vip
)

/**
 * 抽奖物品类型
 * @type {{item = number  hero = number))
 */
// lotteryItemType
const (
	Item = 0 //物品
	Hero = 1 //英雄
)

// MATRIX_TYPE_MAP
const (
	mat_1 = "pos"
	mat_2 = "posArenaD"
	mat_3 = "posArenaA"
	mat_4 = "posMirrorD"
	mat_5 = "posMirrorA"
	mat_6 = "posTower"
	mat_7 = "posTrial"
)

/**
 * 试炼类型
 * @type {{ONE = number  SECOND = number  THREE = number))
 */
// trialType
const (
	ONE    = 0 //试炼1
	SECOND = 1 //试炼2
	THREE  = 2 //试炼3
)

// accountStatus
const (
	Ok         = 0 //正常
	Lock       = 1 //普通封号
	LockDevice = 2 //设备封号
	Test       = 3 //测试账号
	Gm         = 4 //GM账号
)

//用户扩展数据类型
// accountExDataType
const (
	UserLvl    = 0 //用户等级
	FriendList = 1 //好友列表
)

//好友奖励值类型
// friendValueType
const (
	Strength = 0 //赠送的体力
	Invite   = 1 //邀请的奖励
)

//商品购买条件
// shopNeedType
const (
	Sht_HeroNum    = 1 //小弟总数量
	Sht_PayMoney   = 2 //累计充值多少RMB都开启
	Sht_HeroType   = 3 //小弟类型数量
	Sht_CombatEff  = 4 //战斗力达到
	Sht_ProduceNum = 5 //金币生产速度达到
	Sht_UserRank   = 6 //段位达到等级
	Sht_UserLvl    = 7 //召唤师等级
)

//购买商品对应属性
// addValueType
const (
	Avt_Attack       = 1 //提升攻击
	Avt_Defence      = 2 //提升防御
	Avt_Hp           = 3 //提升血量
	Avt_Crit         = 4 //提升暴击
	Avt_ProduceFix   = 5 //提升金币生产速度
	Avt_ProducePer   = 6 //提升金币生产速度百分比
	Avt_CopyWipeRate = 7 //提升刷野倍率
)

//成就完成条件
// honorNeedType
const (
	Hnt_HeroNum     = 1  //小弟总数量
	Hnt_ProduceNum  = 2  //金币生产速度达到
	Hnt_GoldNum     = 3  //获得的金币总量
	Hnt_UserLvl     = 4  //召唤师等级
	Hnt_HeroType    = 5  //小弟类型数量
	Hnt_UserRank    = 6  //段位达到等级
	Hnt_PkWinCount  = 7  //排位赛胜利场次
	Hnt_PkLoseCount = 8  //排位赛失败场次
	Hnt_Attack      = 9  //攻击
	Hnt_Defence     = 10 //防御
	Hnt_Hp          = 11 //血量
	Hnt_Crit        = 12 //暴击
)

const LocalChannelId = 99999

//技能目标类型
//buff目标类型
// skillTargetType
const (
	Self  = 1 //自己
	Enemy = 2 //敌人
)

//buff目标类型
// buffTargetType
// const (
// 	Self  = 1 //自己
// 	Enemy = 2 //敌人
// )

//胜利状态
// winStatus
const (
	Win      = 1 //胜利
	Lose     = 2 //输
	BigWin   = 3 //大胜
	SmallWin = 4 //惨胜
)

//buff类型
// buffType
const (
	Freeze        = 1  //冰冻
	Poison        = 2  //中毒
	ReplayHp      = 3  //回血
	SuckHp        = 4  //吸血 以伤害最终伤害为基础
	AddProp       = 5  //提升属性
	DelProp       = 6  //降低属性
	Seal          = 9  //沉默
	Stun          = 10 //眩晕
	AbsHurt       = 11 //护盾（抵挡伤害具体值）
	Invincibility = 12 //无敌
	MoveHurt      = 13 //伤害转移
	ReMAttack     = 14 //魔免
	RePAttack     = 15 //物免
	AddSkillRate  = 16 //增加技能触发概率
	DelSkillRate  = 17 //减少技能触发概率
	AbsHurtNum    = 18 //护盾（抵挡次数）
	SunZi         = 19 //嘲讽
	StealProp     = 20 //属性偷取
	AbsorbHurt    = 21 //吸收部分伤害
	Count_release = 22 //伤害累计爆发
	Bleed         = 23 //流血
	Sleep         = 24 //昏睡
	Rebound       = 25 //反弹护盾
	Stone         = 26 //定身/石化
	StrikeBack    = 27 //反击
	Revival       = 28 //重生（复活，复活后血量百分比）
	ClearPositive = 29 //清除敌方增益buff（个数）
	ClearNegatice = 30 //清除友方减益buff（个数）
	AttackAgain   = 31 //追击
)

//buff持续类型
// buffConType
const (
	Continue = 1
	Interval = 2
)

//buff效果类型
// buffEffectType
const (
	Attack  = 1 //攻击
	Defence = 2 //防御
	Hp      = 3 //血量
	Crit    = 4 //暴击
)

//buff效果类型
// pkRoundStatus
const (
	Init     = 1 //初始化
	Fighting = 2 //战斗中
	Over     = 3 //结束
)

//buff正负面类型
// buffSide
const (
	None = 0 //不能移除
	Up   = 1 //正面
	Down = 2 //负面
)

/*1：普通随机类型
2：商店可购买类型
3：活动类型*/
//英雄获得类型
// heroGetType
const (
	GetBy_Normal   = 1
	GetBy_Shop     = 2
	GetBy_Activity = 3
)

//物品类型
// itemType
const (
	Item_Hero       = 1 //英雄
	Item_Diamond    = 2 //钻石
	Item_WipeItem   = 3 //挑战券
	Item_ProducePer = 4 //金币收益
)

//目标对象
// skillTargetObj
const (
	Target_Random       = 1 //1随机
	Target_Group        = 2 //2群体
	Target_F_cross      = 3 //3面前十字
	Target_M_cross      = 4 //4中间十字
	Target_B_cross      = 5 //5后方十字
	Target_Temp6        = 6
	Target_LastAttack   = 7 //7目标是你的对象
	Target_Self         = 8 //8自己
	Target_All          = 9 //9所有人（除了自己）
	Target_Temp10       = 10
	Target_Min_hp       = 11 //11最残血
	Target_Max_hp       = 12 //12最高血
	Target_Min_attack   = 13 //13最低攻
	Target_Max_attack   = 14 //14最高攻
	Target_Min_mDefence = 15 //15最低魔防
	Target_Max_mDefence = 16 //16最高魔法
	Target_Min_pDefence = 17 //17最低护甲
	Target_Max_pDefence = 18 //18最高护甲
	Target_Min_speed    = 19 //19最低速度
	Target_Max_speed    = 20 //20最高速度
)

//目标对象位置
// skillTargetPos
const (
	Dir_All   = 0 //0所有
	Dir_Front = 1 //1前排
	Dir_Back  = 2 //2后面
)

//技能攻击类型
// skillAttackType
const (
	PAttack = 0  //物攻
	MAttack = 1  //魔攻
	Other   = 99 //其他
)

/**
 * 服务器状态
 */
// serverStatus
const (
	Closed  = 0 //维护
	Good    = 1 //良好
	Normal  = 2 //正常
	Hot     = 3 //火爆
	NotOpen = 4 //未开放
)

/**
 * boss状态
 * @type {{closed = number  open = number))
 */
// bossStatus
const (
	Boss_Closed = 0
	Boss_Open   = 1
	Boss_Prize  = 2 //结算中
)

//worker消息类型
// workerMsgType
const (
	Request = 0 //路由
	Remote  = 1 //跨数据
)

//兑换码类型
// couponType
const (
	Once    = 0 //一次
	NoLimit = 1 //无限制
)
