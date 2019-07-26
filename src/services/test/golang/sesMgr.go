package golang

import (
	"fmt"
)

type SessionManager interface {
	Dump()
}

type CoreSessionManager struct {
}

func (this *CoreSessionManager) Dump() {
	fmt.Println("i am core session manager")
}
