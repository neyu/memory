package codec

import (
	"core/codec"
	"core/xlib"

	"github.com/golang/protobuf/proto"
)

type protoCodec struct {
	//
}

func (this *protoCodec) Name() string {
	return "proto"
}

func (this *protoCodec) MimeType() string {
	return "application/x-protobuf"
}

func (this *protoCodec) Encode(msgObj interface{}, ctx lib.ContextSet) (data interface{}, err error) {
	return proto.Marshal(msgObj.(proto.Message))
}

func (this *protoCodec) Decode(data interface{}, msgObj interface{}) error {
	return proto.Unmarshal(data.([]byte), msgObj.(proto.Message))
}

func init() {
	codec.RegisterCodec(new(protoCodec))
}
