package rpc

import (
	"core/codec"
	"core/xlib"

	"errors"
	"fmt"
	"sync"
	"sync/atomic"
)

var (
	rpcIdSeq        int64
	requestByCallId sync.Map
)

type request struct {
	id     int64
	onRecv func(interface{})
}

var ErrTimeout = errors.New("RPC time out3")

func (this *request) RecvFeedback(msg interface{}) {
	this.onRecv(msg)
}

func (this *request) Send(ses lib.Session, msg interface{}) {

	//ctx, _ := ses.(cellnet.ContextSet)

	data, meta, err := codec.EncodeMessage(msg)

	if err != nil {
		//log.Errorf("rpc request message encode error: %s", err)
		fmt.Printf("rpc request message encode error: %s\n", err)
		return
	}

	ses.Send(&RemoteCallReq{
		MsgId:  uint32(meta.Id),
		Data:   data,
		CallId: this.id,
	})

	//codec.FreeCodecResource(meta.Codec, data, ctx)
}

func createRequest(onRecv func(interface{})) *request {
	this := &request{
		onRecv: onRecv,
	}
	this.id = atomic.AddInt64(&rpcIdSeq, 1)
	requestByCallId.Store(this.id, this)
	return this
}

func getRequest(callid int64) *request {
	if v, ok := requestByCallId.Load(callid); ok {
		requestByCallId.Delete(callid)
		return v.(*request)
	}
	return nil
}
