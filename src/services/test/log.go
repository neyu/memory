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
	log.Info("info file")
	log.Warn("warning file")
	log.Debug("debug file")
	log.Critical("critical file")

	log.DelLogger("file")
	log.SetLogger("console", "")

	log.Trace("trace")
	log.Info("info")
	log.Warn("warning")
	log.Debug("debug")
	log.Critical("critical")

	log.Emergency("Emergency %d", logs.LevelEmergency)
	log.Alert("Alert %d", logs.LevelAlert)
	log.Critical("Critical %d", logs.LevelCritical)
	log.Error("Error %d", logs.LevelError)
	log.Warning("Warning %d", logs.LevelWarning)
	log.Notice("Notice %d", logs.LevelNotice)
	log.Informational("Informational %d", logs.LevelInformational)
	log.Debug("Debug %d", logs.LevelDebug)

	// log.SetLogger("conn", `{"net":"tcp","addr":":7020"}`)
	// log.Info("info")

	// log.SetLogger("smtp", `{"username":"1504651030@qq.com","password":"a19841125","host":"smtp.qq.com:587","sendTos":["240276334@qq.com"]}`)
	// log.Critical("sendmail critical")
	// time.Sleep(time.Second * 30)

	log.Alert("------------------------------")
	log.Alert("")
}
