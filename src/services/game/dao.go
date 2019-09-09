package main

import (
	"services/fx/service"
	"services/game/entity"

	"core/mysql"

	"database/sql"
)

var accDao *tb.AccountDao
var svrInfoDao *tb.ServerInfoDao
var userDao *tb.UserDao
var heroDao *tb.HeroDao

func laodDao() {
	db := service.Db("mm").Raw().(*sql.DB)
	dbInter := service.Db("mm").Raw().(mysql.SqlExecer)

	accDao = &tb.AccountDao{dbInter, db}
	svrInfoDao = &tb.ServerInfoDao{dbInter, db}
	userDao = &tb.UserDao{dbInter, db}
	heroDao = &tb.HeroDao{dbInter, db}
}
