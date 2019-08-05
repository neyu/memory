package rpc

import (
	"core/xlib"

	"errors"
)

var (
	ErrInvalidPeerSession = errors.New("rpc: Invalid peer type, require lib.RPCSessionGetter or lib.Session")
	ErrEmptySession       = errors.New("rpc: Empty session")
)

type RPCSessionGetter interface {
	RPCSession() lib.Session
}

func getPeerSession(ud interface{}) (ses lib.Session, err error) {
	if ud == nil {
		return nil, ErrInvalidPeerSession
	}
	switch i := ud.(type) {
	case RPCSessionGetter:
		ses = i.RPCSession()
	case lib.Session:
		ses = i
	// case peer.TCPConnector:
	// 	ses = i.Session()
	default:
		err = ErrInvalidPeerSession
		return
	}
	if ses == nil {
		return nil, ErrEmptySession
	}
	return
}
