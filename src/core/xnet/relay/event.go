package relay

import (
	"core/xlib"
)

type RecvMsgEvent struct {
	Ses lib.Session
	ack *RelayAck
	Msg interface{}
}

func (this *RecvMsgEvent) PassThroughAsInt64() int64 {
	if this.ack == nil {
		return 0
	}

	return this.ack.Int64
}

func (this *RecvMsgEvent) PassThroughAsInt64Slice() []int64 {
	if this.ack == nil {
		return nil
	}

	return this.ack.Int64Slice
}

func (this *RecvMsgEvent) PassThroughAsString() string {
	if this.ack == nil {
		return ""
	}

	return this.ack.Str
}

func (this *RecvMsgEvent) Session() lib.Session {
	return this.Ses
}

func (this *RecvMsgEvent) Message() interface{} {
	return this.Msg
}

// 消息原路返回
func (this *RecvMsgEvent) Reply(msg interface{}) {

	// 没填的值不会被发送
	Relay(this.Ses, msg, this.ack.Int64, this.ack.Int64Slice, this.ack.Str)

}
