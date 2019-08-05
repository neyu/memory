package json

import (
	"core/codec"
	"core/xlib"
	"fmt"
	"reflect"
)

type ChatAck struct {
	Msg   string
	Value int32
}

func (this *ChatAck) String() string {
	return fmt.Sprintf("%+v", *this)
}

type ChatReq struct {
	Msg   string
	Value int32
}

func (this *ChatReq) String() string {
	return fmt.Sprintf("%+v", *this)
}

func init() {
	ackMsg := lib.MessageMeta{
		Codec: codec.MustGetCodec("json"),
		Type:  reflect.TypeOf((*ChatAck)(nil)).Elem(),
		Id:    1234,
	}
	fmt.Println("json.regMsg:", ackMsg.FullName())
	lib.RegisterMessageMeta(&ackMsg)

	reqMsg := lib.MessageMeta{
		Codec: codec.MustGetCodec("json"),
		Type:  reflect.TypeOf((*ChatReq)(nil)).Elem(),
		Id:    1235,
	}
	fmt.Println("json.regMsg:", reqMsg.FullName())
	lib.RegisterMessageMeta(&reqMsg)

}
