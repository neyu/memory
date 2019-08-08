package main

import (
	"services/fx"
	"services/fx/config"

	"core/dict"
	"core/log"
	"core/system"
)

func main() {

	logger := logs.NewLogger(10000)
	// logger.DelLogger("console")

	// log.Register(log.AdapterConsole, log.NewColorConsole)
	// logger.SetLogger("console", `{"color":false}`)
	logger.Error("tell me something else !!")

	// logs.SetLogger("console", `{"color":false}`)
	logs.Info("test system environment...")

	logs.Error("你是真的不能出现颜色吗？")
	logs.Debug("Root:%s", system.ROOT)

	fx.Init()

	config.Init("local")

	clientConf := config.GetClient()
	port := dict.GetInt(clientConf, "login_port")
	logs.Info("login port:", port)

	mysqlConf := config.GetMysql()
	db_h5 := dict.GetString2(mysqlConf, "h5", "db")
	logs.Info("mysql db for h5:", db_h5)

}
