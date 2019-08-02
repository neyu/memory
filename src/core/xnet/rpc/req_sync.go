package rpc

import (
	"time"
)

func CallSync(ud interface{}, reqMsg interface{}, timeout time.Duration) (interface{}, error) {
	ses, err := getPeerSession(ud)
	if err != nil {
		return nil, err
	}
	ret := make(chan interface{})
	req := createRequest(func(feedbackMsg interface{}) {
		ret <- feedbackMsg
	})
	req.Send(ses, reqMsg)

	select {
	case v := <-ret:
		return v, nil
	case <-time.After(timeout):
		getRequest(req.id)
		return nil, ErrTimeout
	}
}
