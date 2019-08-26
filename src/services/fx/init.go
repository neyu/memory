package fx

import (
	"core/logs"
	// "core/util"
	"core/xlib"

	"os"
	"runtime"
)

var (
	binDir  string
	confDir string
	exeName string
)

func Init() {
	workdir, _ := os.Getwd()
	logs.Info("Execuable: %s", os.Args[0])
	logs.Info("WorkDir: %s", workdir)
	// logs.Info("ProcName: '%s'", GetProcName())
	logs.Info("PID: %d", os.Getpid())
	// logs.Info("Discovery: '%s'", *flagDiscoveryAddr)
	// logs.Info("LinkRule: '%s'", linkRule)
	// logs.Info("SvcGroup: '%s'", GetSvcGroup())
	// logs.Info("SvcIndex: %d", GetSvcIndex())
	logs.Info("LANIP: '%s'", lib.GetLocalIP())
	// logs.Info("WANIP: '%s'", util.GetWANIP())

	logs.Info("使用CPU数量:", runtime.GOMAXPROCS(-1))
	logs.Info("初始GoroutineNum:", runtime.NumGoroutine())
	// INFO("服务平台:", service.env)
	// INFO("服务名称:", service.name)
	// INFO("服务ID:", service.id)
}
