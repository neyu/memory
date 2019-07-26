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
	a := new(golang.SessionManager)
	fmt.Printf("struct p:%+v\n", p)
	fmt.Printf("var a:%+v\n", *a)
	p.age = 3
	p.SessionManager = *a
	p.Dump()
	fmt.Println("p.age:", p.age)

	// var hits struct {
	// 	sync.Mutex
	// 	n int
	// }
	var hits embededLock
	fmt.Printf("struct hits:%+v\n", hits)
	hits.Mutex = sync.Mutex{}

	hits.Mutex.Lock()
	hits.n++
	hits.n++
	hits.n++
	hits.Mutex.Unlock()
	fmt.Println("hit.n:", hits.n)
}
