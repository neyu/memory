package main

import (
	"core/consts/service"
	. "core/lib"
	"strconv"

	"core/service"

	"services/public/mysqlModels"
	"services/public/redisCaches"
	"services/public/redisInstances"
	"services/public/redisKeys"

	"github.com/go-redis/redis"

	"fmt"
)

func main() {
	//初始化Service
	newService := service.NewService(Service.Test)
	fmt.Println("test server info....")
	fmt.Printf("env:%s\n", newService.Env())
	fmt.Printf("name:%s\n", newService.Name())
	fmt.Printf("ip:%s\n", newService.Ip())
	fmt.Printf("ID:%d\n", newService.ID())
	fmt.Printf("Port:%s\n", newService.Port(Service.Test))
	fmt.Printf("Identify:%s\n", newService.Identify())

	newService.StartRedis()

	// 运行测试
	startTest()

	//保持进程
	Run()
}

func startTest() {
	fmt.Println("start test redis...")

	test_getNullKey()
	//test_WorldRankClear()

	// test_WorldRankScoreSet()
	// test_WorldRankScoreGet()

	// test_UserCombatSet()
	// test_UserCombatGet()

	// score, err := redisInstances.User().Raw().ZScore(redisKeys.Rank_combat, "106").Result()
	// if err != nil {
	// 	fmt.Println("106 not in tdk.rank.combat score/err", score, err) //0, redis.nil
	// 	return
	// }
	// fmt.Println("106 in tdk.rank.combat score:", score)

	// test_CombatChange_InFullRank()
	// test_CombatChange_NotInFullRank()

	// test_CombatChange_InHalfRank()
	// test_CombatChange_NotInHalfRank()

	//test_CombatChange_NullRank()
}

func test_getNullKey() {
	userDat, err := redisInstances.User().Raw().Get("tdk:user:2335").Result()
	fmt.Println("userDat:", userDat)
	fmt.Println("err:", err)

	userDat, err = redisInstances.User().Raw().Get("tdk:account:o1De15MxC7xjKM7GK73_2oUqctSw").Result()
	fmt.Println("userDat:", userDat)
	fmt.Println("err:", err)
}

func test_WorldRankClear() {
	fmt.Println("\ntest_WorldRankClear...")
	keys, err := redisInstances.User().Raw().Keys("*").Result()
	if err != nil || len(keys) == 0 {
		fmt.Println("keys * nil or error:", err)
		return
	}
	for _, item := range keys {
		fmt.Println("try to del:", item)
	}
	count, err := redisInstances.User().Raw().Del(keys...).Result()
	if err != nil {
		fmt.Println("del * error:", err)
		return
	}
	fmt.Printf("del %d keys\n", count)
}

func test_WorldRankScoreSet() {
	fmt.Println("\ntest_WorldRankScoreSet...")
	ranks := []redis.Z{
		{Score: 100, Member: 100},
		{Score: 99, Member: 101},
		{Score: 98, Member: 102},
		{Score: 97, Member: 103},
		{Score: 96, Member: 104},
	}
	redisInstances.User().Raw().ZAdd(redisKeys.Rank_combat, ranks...)
}

func test_WorldRankGet() ([]mysqlModels.RankCombat, error) {
	fmt.Println("\ntest_WorldRankGet...")
	return redisCaches.GetCombatRank()
}

func test_WorldRankScoreGet() {
	fmt.Println("\ntest_WorldRankScoreGet...")
	scoreList, err := redisInstances.User().Raw().ZRevRangeWithScores(redisKeys.Rank_combat, 0, -1).Result()
	if err != nil {
		fmt.Println("get world rank score error:", err)
		return
	}
	for _, item := range scoreList {
		score := item.Score
		member := item.Member
		fmt.Printf("world rank member:%s score:%d\n", member, int64(score))
	}
}

func test_UserCombatSet() {
	fmt.Println("\ntest_UserCombatSet...")
	combatDat := []map[string]interface{}{
		{"account": "acc100", "nickName": "name100", "avatarUrl": "url100", "rank": 0, "combatHigh": 0, "combatLow": 50},
		{"account": "acc101", "nickName": "name101", "avatarUrl": "url101", "rank": 0, "combatHigh": 0, "combatLow": 45},
		{"account": "acc102", "nickName": "name102", "avatarUrl": "url102", "rank": 0, "combatHigh": 0, "combatLow": 40},
		{"account": "acc103", "nickName": "name103", "avatarUrl": "url103", "rank": 0, "combatHigh": 0, "combatLow": 35},
		{"account": "acc104", "nickName": "name104", "avatarUrl": "url104", "rank": 0, "combatHigh": 0, "combatLow": 30},
	}
	for idx, item := range combatDat {
		objKey := redisKeys.Obj_combat + strconv.FormatInt(int64(100+idx), 10)
		redisInstances.User().Raw().HMSet(objKey, item)
	}
}

func test_UserCombatGet() {
	fmt.Println("\ntest_UserCombatSet...")
	ranks, err := test_WorldRankGet()
	if err != nil {
		fmt.Println("user combat get error:", err)
		return
	}
	for _, item := range ranks {
		fmt.Printf("user combat:%+v\n", item)
	}
}

func test_CombatChange_NullRank() {
	fmt.Println("\ntest_CombatChange_NullRank...")
	newRank := &mysqlModels.RankCombat{
		Id:         107,
		Account:    "acc107",
		NickName:   "name107",
		AvatarUrl:  "url107",
		Rank:       0,
		CombatHigh: 0,
		CombatLow:  46,
	}
	redisCaches.CombatChanged(newRank)
	test_UserCombatGet()
	test_WorldRankScoreGet()
}

func test_CombatChange_NotInHalfRank() {
	fmt.Println("\ntest_CombatChange_NotInHalfRank...")
	newRank := &mysqlModels.RankCombat{
		Id:         107,
		Account:    "acc107",
		NickName:   "name107",
		AvatarUrl:  "url107",
		Rank:       0,
		CombatHigh: 0,
		CombatLow:  46,
	}
	redisCaches.CombatChanged(newRank)
	test_UserCombatGet()
	test_WorldRankScoreGet()
}

func test_CombatChange_InHalfRank() {
	fmt.Println("\ntest_CombatChange_InHalfRank...")
	newRank := &mysqlModels.RankCombat{
		Id:         102,
		Account:    "acc102",
		NickName:   "name102",
		AvatarUrl:  "url102",
		Rank:       0,
		CombatHigh: 0,
		CombatLow:  48,
	}
	redisCaches.CombatChanged(newRank)
	test_UserCombatGet()
	test_WorldRankScoreGet()
}

func test_CombatChange_NotInFullRank() {
	fmt.Println("\ntest_CombatChange_NotInFullRank...")
	newRank := &mysqlModels.RankCombat{
		Id:         107,
		Account:    "acc107",
		NickName:   "name107",
		AvatarUrl:  "url107",
		Rank:       0,
		CombatHigh: 0,
		CombatLow:  46,
	}
	redisCaches.CombatChanged(newRank)
	test_UserCombatGet()
	test_WorldRankScoreGet()
}

func test_CombatChange_InFullRank() {
	fmt.Println("\ntest_CombatChange_InFullRank...")
	newRank := &mysqlModels.RankCombat{
		Id:         102,
		Account:    "acc102",
		NickName:   "name102",
		AvatarUrl:  "url102",
		Rank:       0,
		CombatHigh: 0,
		CombatLow:  48,
	}
	redisCaches.CombatChanged(newRank)
	test_UserCombatGet()
	test_WorldRankScoreGet()

}
