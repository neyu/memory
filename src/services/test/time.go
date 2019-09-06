package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("unix:", time.Now().Unix())
	fmt.Println("unix nano:", time.Now().UnixNano())

}
