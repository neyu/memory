/**
游戏-角色(UserEntity)
角色，账号进入到每个服中扮演的角色。
**/
package tb

import (
	"core/logs"
	"core/mysql"

	"database/sql"
	"errors"
)

var TbUser = "uw_user"

type UserDao mysql.DaoSource

type UserEntity struct {
	/** 序号 **/
	Id int32 /*序号*/
	/** 账号id **/
	AccountId uint64 /*账号id*/
	/** 头像 **/
	IconId int32 /**/
	/** 昵称 **/
	NickName string /*昵称*/
	/** 金币 **/
	Gold int32 /*金币*/
	/** 总钻石 **/
	Diamond int32 /*钻石*/
	/** 绑定钻石 **/
	GiveDiamond int32 /*绑定钻石，即送的钻石*/
	/** 非绑定钻石 **/
	BuyDiamond int32 /*非绑定钻石，即购买的钻石*/
	/** 等级 **/
	Lvl int32 /*等级(不同于英雄等级)*/
	/** 经验 **/
	Expc int32 /*经验*/
	/** 战力 **/
	Combat int32 /*战力*/
	/** VIP等级 **/
	Vip int32 /*VIP等级*/
	/** VIP积分 **/
	VipScore int32 /*VIP积分*/
	/** 体力 **/
	Strength int32 /**/
	/** 上次恢复体力时间 **/
	StrengthReTime int64 /**/
	/** 签名 **/
	SignName string /*签名*/
	/** 荣誉值 **/
	Honor int32 /*荣誉值*/
	/** 背包（只存放静态物品） **/
	Bag string /*背包(只存放静态物品，格式：{&quot物品id&quot:数量,&quot物品id&quot:数量.............})*/
	/** 装备背包 **/
	EquipBag string /*装备背包 {&quot1&quot:[物品id,[随到的属性值],评价,是否穿戴,name,[基础属性],锁定状态]
	,...}  &quot1&quot:指定id,累加上去的*/
	/** 装备背包购买次数 **/
	EquipBagBuyCount int32 /*装备背包格数*/
	/** 成就数据 **/
	HonorData string /*成就数据
	{&quotid&quot:[是否完成，是否领取],&quotid&quot:[是否完成，是否领取],..........}*/
	/** 蓝钻标记 **/
	BlueDiamond string /*蓝钻标记，为一个对象，key为dsConsts.BlueDiamond中的定义*/
	/** 签到数据 **/
	Sign string /*签到数据,[签到次数,最近一次签到时间]*/
	/** 活动数据 **/
	Activity string /*{&quot活动id&quot:数据}
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
	Record string /*记录数据*/
	/** 扩展数据 **/
	ExData string /*刷新数据
	{key:value}
	具体看c_prop的userExData*/
	/** 今日次数列表 **/
	Counts string /*今日次数列表，是一个数组，对应各自系统的次数。*/
	/** 今日次数列表刷新时间 **/
	CountsRefreshTime string /*今日次数列表刷新时间【】数组对应下标*/
	/** 最后更新时间 **/
	LastUpdateTime int64 /*更新时间*/
	/** 服务器 **/
	ServerId int32 /**/
	/** 最后点技能时间 **/
	LastSkillTime int64 /*最后点技能时间*/
	/** 技能CD **/
	SkillCd int32 /*技能CD(秒)*/
	/** 是否开启野外pk **/
	IsOpenPk int8 /*是否开启野外pk*/
	/** 声望 **/
	Prestige int32 /*声望*/
	/** 红点数据 **/
	RedPointData string /*红点数据*/
	/** 机器人id **/
	RobotId int32 /*机器人id*/
	/** 创建时间 **/
	CreateTime int64 /*创建时间*/
	/** sdk渠道号 **/
	SdkChannelId string /*sdk渠道号*/
	/** 服务器索引 **/
	ServerIndexId int32 /*服务器索引*/
	/** 在线掉落数据 **/
	OnlineLootData string /*在线掉落数据[每秒经验,每秒金币,每波怪多少秒,是否统计]*/
	/** 是否是霸主 **/
	IsKing int8 /*是否是霸主*/
	/** 转生等级 **/
	RebirthLvl int32 /**/
	/** 转生经验 **/
	RebirthExp int32 /**/
	/** 国库累计积分 **/
	CoffersPoints int32 /*国库累计积分*/
	/** 国库今日积分 **/
	TodayCoffersPoints int32 /*国库今日积分*/
	/** 勋章称号 **/
	MedalTitle int32 /**/
	/** 勋章数据 **/
	MedalData string /*{勋章id:[勋章强化等级表id],勋章id:[勋章强化等级表id],...}*/
	/** 真气 **/
	GenuineQi int32 /*真气*/
	/** 属性数据 **/
	PropertyData string /*{id:数据,id:数据,...}*/
	/** 国库杀人数 **/
	CoffersKillNum int32 /*国库杀人数*/
	/** 是否开启注入 **/
	IsOpenIn int8 /*是否开启注入*/
	/** 注入经验 **/
	InfuseExpc int32 /*注入经验*/
	/** 通天塔最高层数 **/
	HighPaTa int32 /*通天塔最高层数*/

}

func (this *UserEntity) NewUserEntity() *UserEntity {
	return &UserEntity{}
}

func (dao *UserDao) Find(inCols []string, outCols []interface{}, accId uint64, svrIdx int32) int32 {
	var err error

	if len(inCols) <= 0 || len(outCols) <= 0 || len(inCols) != len(outCols) {
		err = errors.New("user dao Find() param length differ")
		logs.Debug(err)
		return -1
	}
	query := `select `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item
	}
	query += ` from ` + TbUser + ` where accountId=? and serverIndexId=?`
	logs.Debug("query/param:", query, accId, svrIdx)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("user find err0:", err)
		return -1
	}
	defer stmt.Close()

	err = stmt.QueryRow(accId, svrIdx).Scan(outCols...)
	switch {
	case err == sql.ErrNoRows:
		logs.Debug("user find err1:", err)
		return 1 // loginNoUser
	case err != nil:
		logs.Error("user find err2:", err)
		return -1
	default:
		//
	}
	return 0
}

func (dao *UserDao) FindAll(inCols []string, defCols interface{}, name string) ([]interface{}, int32) {
	var (
		resSet []interface{}
		err    error
	)
	defVal := reflect.ValueOf(defCols)
	defEle := defVal.Elem()
	numField := defEle.NumField()
	if len(inCols) <= 0 || numField <= 0 || len(inCols) != numField {
		err = errors.New("user dao FindInSet() param length differ")
		logs.Debug(err)
		return nil, -1
	}
	query := `select `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item
	}
	query += ` from ` + TbUser + ` where name=?`
	logs.Debug("query:", query)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("user find all err0:", err)
		return nil, -1
	}
	defer stmt.Close()

	rows, err := stmt.Query(name)
	if err != nil {
		logs.Error("user find all err2:", err)
		return nil, -1
	}
	defer rows.Close()

	// _, err = rows.Columns()
	for rows.Next() {
		outCols := []interface{}{}
		record := reflect.New(defEle.Type()).Interface()
		instEle := reflect.ValueOf(record).Elem()
		for i := 0; i < instEle.NumField(); i++ {
			field := instEle.Field(i)
			outCols = append(outCols, field.Addr().Interface())
		}

		err = rows.Scan(outCols...)
		if err != nil {
			logs.Error("user find all err3:", err)
			continue
		}

		resSet = append(resSet, record)
	}
	if err = rows.Err(); err != nil {
		logs.Error("user find all err4:", err)
		return nil, -1
	}
	return resSet, 0
}

// insert uw_user set accountId=1,nickName='测试名',iconId=0,bag='',equipBag='',honorData='',
// activity='',record='',exData='',countsRefreshTime='',serverId=9999,medalData='',propertyData='';
func (dao *UserDao) Insert(inCols []string, vals []interface{}) (uint64, int32) {
	var err error

	if len(inCols) <= 0 || len(vals) <= 0 || len(inCols) != len(vals) {
		err = errors.New("user dao Insert() param length differ")
		logs.Debug(err)
		return 0, -1
	}
	query := `insert ` + TbUser + ` set `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item + `=?`
	}
	logs.Debug("query:", query)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("user insert err0:", err)
		return 0, -1
	}
	defer stmt.Close()

	res, err := stmt.Exec(vals...)
	if err != nil {
		logs.Error("user insert err1:", err)
		return 0, -1
	}

	id, err := res.LastInsertId()
	if err != nil {
		logs.Error("user insert err2:", err)
		return 0, -1
	}
	logs.Debug("new user id:", id)
	return uint64(id), 0
}
