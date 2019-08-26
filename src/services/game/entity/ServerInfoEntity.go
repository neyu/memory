/**
主-服务器信息表(ServerInfoEntity)
服务器信息表。用于管理服务器信息。
**/
package tb

import (
	"core/logs"
	"core/mysql"

	"database/sql"
	"errors"
	"reflect"
)

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

func (dao *ServerInfoDao) FindAll(inCols []string, defCols interface{}) ([]interface{}, int32) {
	var (
		resSet []interface{}
		code   int32
	)
	defVal := reflect.ValueOf(defCols)
	defEle := defVal.Elem()
	numField := defEle.NumField()
	if len(inCols) <= 0 || numField <= 0 || len(inCols) != numField {
		err = errors.New("server info dao FindAll() param length differ")
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
	query += ` from ` + TbServerInfo
	logs.Debug("query:", query)

	stmt, err := dao.Prepare(query)
	if err != nil {
		logs.Error("server info find all err0:", err)
		return nil, -1
	}
	defer stmt.Close()

	rows, err := stmt.Query()
	switch {
	case err == sql.ErrNoRows:
		logs.Debug("server info find all err1:", err)
		return nil, fx.TipCode("noOpenNow")
	case err != nil:
		logs.Error("server info find all err2:", err)
		return nil, -1
	default:
		//
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

		err := rows.Scan(outCols...)
		if err != nil {
			logs.Error("server info find all err3:", err)
			continue
		}

		resSet = append(resSet, record)
	}
	if err = rows.Err(); err != nil {
		logs.Error("server info find all err4:", err)
		return nil, -1
	}
	return resSet, 0
}

func (dao *ServerInfoDao) FindInSet(ids string, inCols []string) []*ServerInfoEntity {
	query = `select `
	return nil
}
