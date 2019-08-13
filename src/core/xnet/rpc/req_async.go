package rpc

import (
	"core/logs"
	"core/xlib"

	"time"
)

func Call(sesOrPeer interface{}, reqMsg interface{}, timeout time.Duration, userCallback func(raw interface{})) {
	ses, err := getPeerSession(sesOrPeer)
	if err != nil {
		//log.Errorf("Remote call failed, ", err)
		logs.Error("Remote call failed, %v\n", err)
		lib.SessionQueuedCall(ses, func() {
			userCallback(err)
		})
		return
	}
	req := createRequest(func(raw interface{}) {
		lib.SessionQueuedCall(ses, func() {
			userCallback(raw)
		})
	})
	req.Send(ses, reqMsg)

	time.AfterFunc(timeout, func() {
		if getRequest(req.id) != nil {
			lib.SessionQueuedCall(ses, func() {
				userCallback(ErrTimeout)
			})
		}
	})
}
