package main

import (
	"core/log"
	"core/system"
)

func main() {

	// logger := log.NewLogger(10000)
	// logger.DelLogger("console")

	// log.Register(log.AdapterConsole, log.NewColorConsole)
	// logger.SetLogger("console", `{"color":true}`)

	logs.Info("test system environment...")

	logs.Error("你是真的不能出现颜色吗？")
	logs.Debug("Root:%s", system.ROOT)
}
