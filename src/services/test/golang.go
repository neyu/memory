package main

import (
	"services/test/golang"

	"fmt"
	"sync"
	// "fmt"
)

type tcpAcceptor struct {
	// 重点是它有没有被赋值
	golang.SessionManager // 结构体匿名字段，的声明与使用
	age                   byte
}

type embededLock struct {
	sync.Mutex
	n int
}

func main() {
	// p := &tcpAcceptor{
	// 	SessionManager: new(golang.CoreSessionManager),
	// 	age:            255,
	// }
	var p tcpAcceptor
	// a := new(golang.SessionManager) //接口可以初化变量
	var b interface{} = new(golang.CoreSessionManager)
	a1, ok := b.(golang.SessionManager) //接口互转的前提是b是接口interface{}
	if !ok {
		fmt.Println("type conversion fail")
		return
	}
	fmt.Printf("struct p:%+v\n", p)
	fmt.Printf("var a:%+v\n", a1)
	p.age = 3
	p.SessionManager = a1 //如果这个接口不赋值的话，会崩的
	p.Dump()
	fmt.Println("p.age:", p.age)

	// var hits struct {
	// 	sync.Mutex
	// 	n int
	// }
	var hits embededLock
	fmt.Printf("struct hits:%+v\n", hits)

	// hits.Mutex = sync.Mutex{}
	hits.Mutex.Lock()
	// hits.Lock()
	hits.n++
	hits.n++
	hits.n++
	hits.Mutex.Unlock()
	// hits.Unlock()
	fmt.Println("hit.n:", hits.n)
}
