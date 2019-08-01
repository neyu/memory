package golang

import (
	"fmt"
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

func CreateSessionMgr() *coreSessionManager {
	this := &coreSessionManager{}
	return this
}
