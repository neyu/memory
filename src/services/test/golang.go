package main

import (
	"services/test/golang"

	"fmt"
	// "sync"
)

func main() {
	p := golang.NewAcceptor()
	// var p tcpAcceptor
	// a := new(golang.SessionManager) //接口可以初化变量
	// var b interface{} = new(golang.CoreSessionManager)
	var b interface{} = golang.CreateSessionMgr()
	a1, ok := b.(golang.SessionManager) //接口互转的前提是b是接口interface{}
	if !ok {
		fmt.Println("type conversion fail")
		return
	}
	fmt.Printf("struct p 1:%+v\n", p)
	fmt.Printf("var a:%+v\n", a1)

	// p.(golang.TcpAcceptor).Age = byte(199) // error 不能直接赋值
	// p.(golang.TcpAcceptor).SetAge(199) //接口是可以转结构体的

	p.(*golang.TcpAcceptor).Age = byte(199) // ok
	p.(*golang.TcpAcceptor).SetAge(133)     // ok

	// p.Age = byte(199) // no field or method
	// p.SetAge(133)     // no field or method

	fmt.Printf("struct p 2:%+v\n", p)
	// p.SessionManager = a1 //如果这个接口不赋值的话，会崩的
	// p.Dump()
	// fmt.Println("p.age:", p.Age)

	// // var hits struct {
	// // 	sync.Mutex
	// // 	n int
	// // }
	// // var hits embededLock
	// fmt.Printf("struct hits:%+v\n", p.embededLock)

	// // hits.Mutex = sync.Mutex{}
	p.Mutex.Lock()
	// hits.Lock()
	p.n++
	p.n++
	p.n++
	p.Mutex.Unlock()
	// hits.Unlock()
	fmt.Println("hit.n:", p.n)
}
