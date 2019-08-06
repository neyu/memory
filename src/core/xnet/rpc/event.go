package rpc

import (
	"core/codec"
	"core/log"
	"core/xlib"
)

type RecvMsgEvent struct {
	ses    lib.Session
	Msg    interface{}
	callid int64
}

func (this *RecvMsgEvent) Session() lib.Session {
	return this.ses
}

func (this *RecvMsgEvent) Message() interface{} {
	return this.Msg
}

func (this *RecvMsgEvent) Queue() lib.EventQueue {
	// return this.ses.Peer().(interface {
	// 	Queue() lib.EventQueue
	// }).Queue()
	return this.ses.GetPeer().Queue()
}

func (this *RecvMsgEvent) Reply(msg interface{}) {

	data, meta, err := codec.EncodeMessage(msg)

	if err != nil {
		//log.Errorf("rpc reply message encode error: %s", err)
		log.Error("rpc reply message encode error: %s\n", err)
		return
	}

	this.ses.Send(&RemoteCallAck{
		MsgId:  uint32(meta.Id),
		Data:   data,
		CallId: this.callid,
	})
}
