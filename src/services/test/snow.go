package main

import (
	"core/logs"
	"core/utils"
)

var testId1 = `
513 6442 4221 9184 5376
506 9142 8658 3820 6976
436 7824 7750 6654 6176
377 7283 2722 5848 2176
`

var testId2 = `
42 0654 2232 2342 7072
42 0654 2905 2103 4752
42 0654 9918 4221 7984
42 0655 5823 8344 3968
`

func main() {
	logs.Info("test for snow flake algorithm")
	curWorker := util.IdWorker{}
	curWorker.InitIdWorker(1, 1)

	id1, err := curWorker.NextId()
	if err != nil {
		logs.Error("get snowflake id err:", err)
		return
	}

	// id2 使用起来还是比较靠谱的
	worker, err := util.NewWorker(1)
	id2 := worker.GetId()

	logs.Debug("snowflake ID:%d %d", id1, id2)
}
