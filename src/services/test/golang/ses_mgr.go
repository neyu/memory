package golang

import (
	"crypto/rand"
	"encoding/hex"
	"fmt"
	"sync"
)

type SessionManager interface {
	// Id uint64 // interface no field
	Dump()
	GenSessionId(byteLen int8) string
}

type coreSessionManager struct {
}

func (this coreSessionManager) Dump() {
	fmt.Println("i am core session manager")
}

func (this coreSessionManager) GenSessionId(byteLen int8) string {
	b := make([]byte, byteLen)
	n, err := rand.Read(b)
	if n != len(b) || err != nil {
		fmt.Println("Could not successfully read from the system CSPRNG")
		return ""
	}
	return hex.EncodeToString(b)
}

func CreateSessionMgr() SessionManager {
	this := &coreSessionManager{}
	return this
}

type Peer interface {
	SayHello()
}

type embededLock struct {
	sync.Mutex     //匿名的会被导出
	N          int // 小写的依然不会被导出，大写的可以
}

type TcpAcceptor struct {
	// 重点是它有没有被赋值
	SessionManager // 结构体匿名字段，的声明与使用
	Age            byte
	embededLock    //匿名的会被导出
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
