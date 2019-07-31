package golang

import (
	"fmt"
)

type SessionManager interface {
	// Id uint64 // interface no field
	Dump()
}

type CoreSessionManager struct {
}

func (this CoreSessionManager) Dump() {
	fmt.Println("i am core session manager")
}
