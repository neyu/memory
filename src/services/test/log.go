package main

import (
	"core/log"
	// "core/utils"
	// "time"
)

func init() {
	//
}

func main() {
	test_beego()
}

func test_beego() {
	log := logs.NewLogger(10000)

	log.SetLogger("file", `{"filename":"test.log"}`)

	log.Trace("trace file")
	logs.Info("info file")
	logs.Warn("warning file")
	logs.Debug("debug file")
	log.Critical("critical file")

	log.DelLogger("file")
	log.SetLogger("console", "")

	log.Trace("trace")
	logs.Info("info")
	logs.Warn("warning")
	logs.Debug("debug")
	log.Critical("critical")

	log.Emergency("Emergency %d", logs.LevelEmergency)
	log.Alert("Alert %d", logs.LevelAlert)
	log.Critical("Critical %d", logs.LevelCritical)
	logs.Error("Error %d", logs.LevelError)
	log.Warning("Warning %d", logs.LevelWarning)
	log.Notice("Notice %d", logs.LevelNotice)
	log.Informational("Informational %d", logs.LevelInformational)
	logs.Debug("Debug %d", logs.LevelDebug)

	// log.SetLogger("conn", `{"net":"tcp","addr":":7020"}`)
	// logs.Info("info")

	// log.SetLogger("smtp", `{"username":"1504651030@qq.com","password":"a19841125","host":"smtp.qq.com:587","sendTos":["240276334@qq.com"]}`)
	// log.Critical("sendmail critical")
	// time.Sleep(time.Second * 30)

	log.Alert("------------------------------")
	log.Alert("")
}
