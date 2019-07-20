package main

import (
	"core/utils"

	"fmt"
)

func init() {
	//
}

func main() {
	fmt.Println("get local ip:", utils.GetLocalIp())

	utils.Run()
}
