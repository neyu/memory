package backend

import (
	"services/msg/proto"

	"core/codec"
	"core/xlib"

	"fmt"
)

type RecvMsgEvent struct {
	Ses      lib.Session
	Msg      interface{}
	ClientId int64
	AccId    int64
	UserId   int64
}

func (this *RecvMsgEvent) Session() lib.Session {
	return this.Ses
}

func (this *RecvMsgEvent) Message() interface{} {
	return this.Msg
}

func (this *RecvMsgEvent) Reply(msg interface{}) {

	data, meta, err := codec.EncodeMessage(msg)
	if err != nil {
		//log.Errorf("Reply.EncodeMessage %s", err)
		fmt.Printf("Reply.EncodeMessage %s\n", err)
		return
	}

	this.Ses.Send(&msgProto.TransmitAck{
		MsgId:    meta.Id,
		MsgData:  data,
		ClientId: this.ClientId,
	})

}
