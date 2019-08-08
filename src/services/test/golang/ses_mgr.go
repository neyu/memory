package golang

import (
	"fmt"
	"sync"
)

type SessionManager interface {
	// Id uint64 // interface no field
	Dump()
}

type coreSessionManager struct {
}

func (this coreSessionManager) Dump() {
	fmt.Println("i am core session manager")
}

func CreateSessionMgr() SessionManager {
	this := &coreSessionManager{}
	return this
}

type Peer interface {
	SayHello()
}

type embededLock struct {
	sync.Mutex
	n int
}

type TcpAcceptor struct {
	// 重点是它有没有被赋值
	SessionManager // 结构体匿名字段，的声明与使用
	Age            byte
	embededLock
}

func (this *TcpAcceptor) SayHello() {
	fmt.Println("tcp acceptor age:%d", this.Age)
}

func (this *TcpAcceptor) SetAge(v byte) {
	this.Age = v
}

func NewAcceptor() Peer {
	this := &TcpAcceptor{
		SessionManager: CreateSessionMgr(),
		Age:            255,
	}
	return this
}
