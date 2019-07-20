package main

import (
	"core/consts/service"
	. "core/libs"
	"core/libs/guid"
	"core/libs/random"
	"core/service"
	"strconv"

	"services/public/mongoModels"

	"fmt"
)

var (
	g *guid.Guid
)

func init() {
	g = guid.NewGuid(1)
}

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

	newService.StartMongo()

	// 运行测试
	startTest()

	//保持进程
	Run()
}

func startTest() {
	fmt.Println("start test mongo...")

	test_AddUser("yuxj")
}

func test_AddUser(name string) {
	id := strconv.FormatUint(g.NewID(), 10)
	account := name
	if len(account) == 0 {
		account = "ys_" + id // NumToString(id)
	}
	money := int32(random.RandIntRange(1000, 9999))

	dbUser, err := mongoModels.AddUser(id, account, money)
	if dbUser == nil {
		fmt.Println("mongo insert fail:", err)
	} else {
		money = int32(random.RandIntRange(100, 999))
		if !mongoModels.UpdateUserMoney(id, money) {
			fmt.Println("mongo update fail")
		} else {
			dbUser = mongoModels.GetUser(id)
			if dbUser == nil {
				fmt.Println("mongo select fail")
			} else {
				fmt.Printf("User Id:%s Account:%s Money:%d CreateTime:%d\n", dbUser.Id, dbUser.Account, dbUser.Money, dbUser.CreateTime)
			}
		}
	}
}
