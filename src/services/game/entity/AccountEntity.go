/**
主-账号(AccountEntity)
游戏-账号
**/
package tb

import (
	"core/logs"
	"core/mysql"

	"database/sql"
)

var TbAccount = "uw_account"

type AccountDao mysql.DaoSource

type AccountEntity struct {
	/** 序号 **/
	Id uint64 /*序号*/
	/** 账号名 **/
	Name string /*账号名*/
	/** 邮箱 **/
	Email string /*邮箱*/
	/** 密码 **/
	Pwd string /*密码*/
	/** 机器码 **/
	DeviceId string /*机器码，设备唯一号*/
	/** 账号状态 **/
	Status int8 /*账号状态  0正常 ，1普通封号，2设备封号*/
	/** 渠道id **/
	ChannelId int32 /*渠道id*/
	/** sdk数据 **/
	SdkData string /*sdk数据*/
	/** 扩展数据 **/
	ExData string /*扩展数据*/
	/** 创建时间 **/
	CreateTime int64 /*创建时间*/
	/** 创建ip **/
	CreateIP string /*创建ip*/
	/** 最后修改时间 **/
	LastUpdateTime int64 /*最后修改时间*/
	/** 登陆次数 **/
	LoginCount int32 /**/
	/** 登陆key **/
	LoginKey string /*登陆key*/
	/** 拥有角色的服务器 **/
	UserServers string /*拥有角色的服务器*/
	/** 充值补偿 **/
	RechargeCom string /*充值补偿  [充值元宝数量,是否发送奖励]*/
	/** sdk渠道号 **/
	SdkChannelId string /*sdk渠道号*/
	/** 禁言过期时间 **/
	BendExpireAt int64 /*禁言过期时间*/
	/** 禁言类型，第一位为普通聊天，第二位客服聊天 **/
	BendType int8 /*禁言类型，第一位为普通聊天，第二位客服聊天*/

}

func (this *AccountEntity) NewAccountEntity() {
	//
}

func (this *AccountEntity) Insert() {
	// var sqlStr = "insert into " + tableName + " set ? ";

}

func (this *AccountEntity) InsertList() {
	// var sqlStr = "insert into "+Entity.tableName+" ("+strCols+") values "+values+" ";
}

func (this *AccountEntity) Update() {
	// var sqlStr = "update " + tableName + " set " + cols + cnd.where;
}

func (this *AccountEntity) Select() {
	// var strSql = "select * from " + tableName + cnd.where +" limit 1";
}

func (this *AccountEntity) SelectCols() {
	// var strSql = "select "+strCols+" from " + tableName + cnd.where +" limit 1";
}

func (this *AccountEntity) Del() {
	// var sql = "delete from " + tableName + cnd.where;
}

func (this *AccountEntity) List() {
	// var strSql = "select * from	" + tableName + cnd.where;
}

func (this *AccountEntity) ListCols() {
	// var strSql = "select "+strCols+" from " + tableName + cnd.where;
}

func (this *AccountEntity) Count() {
	// var strSql = "select count(1) as count from " + tableName + cnd.where +" limit 1";
}

var accountInsertStmt = `insert ` + TbAccount + ` set 
	id=?,
	name=?,
	email=?,
	pwd=?,
	sdkData=?,
	exData=?,
	userServers=?
`

// deviceId=?,
// status=?,
// channelId=?,

// createTime=?,
// createIP=?
// lastUpdateTime=?,
// loginCount=?,
// loginKey=?,

// rechargeCom=?,
// sdkChannelId=?,
// bendExpireAt=?,
// bendType=?

func (dao *AccountDao) Save(acc *AccountEntity) error {
	stmt, err := dao.Prepare(accountInsertStmt)
	if err != nil {
		logs.Error("account save err0:", err, "[", accountInsertStmt, "]")
		return err
	}
	defer stmt.Close()

	var defaultVal = []interface{}{
		acc.Id,
		acc.Name,
		acc.Email,
		acc.Pwd,
		"sdk data",
		"",
		"",

		// "",
		// 0,
		// 0,
		// "",
		// "",
		// 0,
		// "",
		// 0,
		// 0,
		// "",
		// "",
		// "",
		// "",
		// 0,
		// 0,
	}

	res, err := stmt.Exec(defaultVal...)
	if err != nil {
		logs.Error("account save err1:", err)
		return err
	}

	id, err := res.LastInsertId()
	if err != nil {
		logs.Error("account save err2:", err)
		return err
	}
	// logs.Debug("new account id:", id)
	acc.Id = uint64(id)

	return nil
}

func (dao *AccountDao) SaveTx(accList []*AccountEntity) error {
	tx, err := dao.Db.Begin()
	if err != nil {
		logs.Error("account tx save err0:", err)
		return err
	}

	daoTx := AccountDao{tx, dao.Db}
	noErr := true
	for _, item := range accList {
		err = daoTx.Save(item)
		if err != nil {
			noErr = false
			logs.Error("account tx save err1:", err)
			break
		}
	}
	if noErr {
		tx.Commit()
	} else {
		tx.Rollback()
		logs.Alert("account tx save rollback")
		return err
	}
	return nil
}

var accountQueryAll = `select id,name,email,pwd,createTime from ` + TbAccount

func (dao *AccountDao) FindAll() []*AccountEntity {
	accList := []*AccountEntity{}

	rows, err := dao.Query(accountQueryAll)
	if err != nil {
		logs.Error("account find all err0:", err)
		return accList
	}
	defer rows.Close()

	// _, err = rows.Columns()
	for rows.Next() {
		acc := &AccountEntity{}
		err := rows.Scan(&acc.Id, &acc.Name, &acc.Email, &acc.Pwd, &acc.CreateTime)
		if err != nil {
			logs.Error("account find all err1:", err)
			continue
		}
		accList = append(accList, acc)
	}
	if err := rows.Err(); err != nil {
		logs.Error("account find all err2:", err)
		return accList
	}
	return accList
}

var accountQuery = `select id,name,email,pwd,createTime from ` + TbAccount + ` where id=?`

func (dao *AccountDao) Find(id uint64) *AccountEntity {
	stmt, err := dao.Prepare(accountQuery)
	if err != nil {
		logs.Error("account find err0:", err)
		return nil
	}
	defer stmt.Close()

	acc := &AccountEntity{}

	err = stmt.QueryRow(id).Scan(&acc.Id, &acc.Name, &acc.Email, &acc.Pwd, &acc.CreateTime)
	switch {
	case err == sql.ErrNoRows:
		logs.Debug("account find err1:", err)
		return nil
	case err != nil:
		logs.Error("account find err2:", err)
		return nil
	default:
		//
	}

	return acc
}
