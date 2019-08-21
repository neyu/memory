package main

import (
	"services/fx/config"
	"services/fx/service"
	"services/game/entity"

	"core/dict"
	"core/mysql"

	"database/sql"
)

var accDao *tb.AccountDao
var svrInfoDao *tb.ServerInfoDao

func laodDao() {
	db := service.Db("mm").Raw().(*sql.DB)
	dbInter := service.Db("mm").Raw().(mysql.SqlExecer)

	accDao = &tb.AccountDao{dbInter, db}
	svrInfoDao = &tb.ServerInfoDao{dbInter, db}
}

func msgCode(name string) int32 {
	msgCode := config.GetCode()
	code := dict.GetInt(msgCode[name], "id")
	return int32(code)
}
