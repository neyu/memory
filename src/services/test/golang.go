package main

import (
	"services/test/golang"

	"fmt"
	// "sync"
)

func main() {
	testTcpAcceptor()

	testSessionId()
}

func testTcpAcceptor() {
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

	pInst := p.(*golang.TcpAcceptor)
	// // hits.Mutex = sync.Mutex{}
	pInst.Lock()
	// hits.Lock()
	pInst.N++
	pInst.N++
	pInst.N++
	pInst.Unlock()
	// hits.Unlock()
	fmt.Println("hit.n:", pInst.N)
}

func testSessionId() {
	ses_mgr := golang.CreateSessionMgr()
	fmt.Println("session id bytes 008位[01]:", ses_mgr.GenSessionId(1))
	fmt.Println("session id bytes 016位[02]:", ses_mgr.GenSessionId(2))
	fmt.Println("session id bytes 032位[04]:", ses_mgr.GenSessionId(4))
	fmt.Println("session id bytes 064位[08]:", ses_mgr.GenSessionId(8))
	fmt.Println("session id bytes 128位[16]:", ses_mgr.GenSessionId(16))
}
