package main

import (
	"core/log"
	"core/utils"
)

func main() {
	// 测试脚本

	// 生成节点实例
	worker, err := util.NewWorker(1)

	if err != nil {
		logs.Error(err)
		return
	}

	ch := make(chan int64)
	count := 10000
	// 并发 count 个 goroutine 进行 snowflake ID 生成
	for i := 0; i < count; i++ {
		go func() {
			id := worker.GetId()
			ch <- id
		}()
	}

	defer close(ch)

	m := make(map[int64]int)
	for i := 0; i < count; i++ {
		id := <-ch
		// 如果 map 中存在为 id 的 key, 说明生成的 snowflake ID 有重复
		_, ok := m[id]
		if ok {
			logs.Error("ID is not unique!\n")
			return
		}
		// 将 id 作为 key 存入 map
		m[id] = i
		logs.Info("snowflake ID:%4d %d", i, id)
	}
	// 成功生成 snowflake ID
	logs.Info("All", count, "snowflake ID Get successed!")
}
