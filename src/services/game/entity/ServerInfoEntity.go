/**
主-服务器信息表(ServerInfoEntity)
服务器信息表。用于管理服务器信息。
**/
package tb

var TbServerInfo = "uw_server_info"

type ServerInfoDao mysql.DaoSource

type ServerInfoEntity struct {
	/** id **/
	Id int32 /*id*/
	/** 服务器名称 **/
	Name string /**/
	/** 合服后的名字 **/
	MergerName string /*合服后的名字*/
	/** 游戏区 **/
	Area string /*游戏区*/
	/** 服务器ip **/
	Host string /*服务器ip*/
	/** 端口 **/
	Port string /*端口*/
	/** 是否是新区 **/
	IsNew int8 /*是否是新区*/
	/** 状态 **/
	Status int8 /*状态:0:维护,1:良好，2:正常，3:爆满 ,4:未开放*/
	/** 数据库链接字符串 **/
	DbLink string /*数据库链接字符串*/
	/** 排序 **/
	Sort int32 /*越大越在后面*/
	/** 渠道区分 **/
	AppId string /*渠道区分*/
	/** 服务器id **/
	ServerId int32 /*服务器id*/
	/** 客户端索引id **/
	IndexId int32 /*客户端索引id*/
	/** 是否维护 **/
	IsClose int8 /**/
	/** 维护说明 **/
	CloseExplain string /**/
	/** 开服日期 **/
	ServerDate int64 /**/
	/** 外部数据库链接 **/
	OutLink string /*外部数据库链接*/

}

func (dao *ServerInfoDao) FindAll(inCols []string, outCols [][]interface{}) error {
	if len(inCols) <= 0 || len(outCols) <= 0 || len(inCols) != len(outCols[0]) {
		err := errors.New("server info dao FindAll() param length differ")
		logs.Debug(err)
		return err
	}
	query := `select `
	for idx, item := range inCols {
		if idx != 0 {
			query += `,`
		}
		query += item
	}
	query += ` from ` + TbServerInfo
	logs.Debug("query:", query)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("server info find all err0:", err)
		return err
	}
	defer stmt.Close()

	rows, err := stmt.Query()
	if err != nil {
		logs.Error("server info find all err0:", err)
		return err
	}
	defer rows.Close()

	// _, err = rows.Columns()
	var idx int = 0
	for rows.Next() {
		err := rows.Scan(outCols[idx]...)
		if err != nil {
			logs.Error("server info find all err1:", err)
			continue
		}
		++idx
	}
	if err := rows.Err(); err != nil {
		logs.Error("server info find all err2:", err)
		return err
	}
	return nil
}
