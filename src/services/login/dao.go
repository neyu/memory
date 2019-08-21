package main

import (
	"services/fx/service"
	"services/game/entity"

	"core/mysql"

	"database/sql"
)

var accDao *tb.AccountDao

func laodDao() {
	db := service.Db("mm").Raw().(*sql.DB)
	dbInter := service.Db("mm").Raw().(mysql.SqlExecer)

	accDao = &tb.AccountDao{dbInter, db}
}
