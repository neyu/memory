package main

import (
	"database/sql"
	"services/fx/service"
	"services/game/entity"

	"core/logs"
	"core/mysql"
	"core/timer"
	// "database/sql"
)

var accDao *tb.AccountDao

func main() {
	service.StartMysql()

	db := service.Db("mm").Raw().(*sql.DB)
	dbInter := service.Db("mm").Raw().(mysql.SqlExecer)
	accDao = &tb.AccountDao{dbInter, db}

	// insertBenchMark()
	testInsert()
	// testInsertTx()

	// testSelectAll()

	// testSelect(10514)
}

func insertBenchMark() {
	tm_t := timer.NewLogicTimer("2")
	for i := 0; i < 10000; i++ {
		accDao.Save(nil)
	}
	tm_t.Stop()
}

func testInsert() {
	acc := &tb.AccountEntity{
		Id:    0,
		Name:  "yuxj2",
		Email: "xx@gmail.com",
		Pwd:   "goodgoodstudy",
	}
	accDao.Save(acc)
}

func testInsertTx() {
	accList := []*tb.AccountEntity{
		&tb.AccountEntity{
			Id:    0,
			Name:  "right",
			Email: "cc@gmail.com",
			Pwd:   "all ok",
		},
		&tb.AccountEntity{
			Id:    10566,
			Name:  "wrong",
			Email: "xx@gmail.com",
			Pwd:   "goodgoodstudy",
		},
	}
	accDao.SaveTx(accList)
}

func testSelectAll() {
	accList := accDao.FindAll()
	logs.Info("accList:%+v", accList)
	for _, item := range accList {
		logs.Info("item:%+v", item)
	}
}

func testSelect(id uint64) {
	acc := accDao.Find(id)
	logs.Info("acc:%+v", acc)
}
