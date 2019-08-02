package codec

import (
	"core/codec"
	"core/xlib"
	"encoding/json"
)

type jsonCodec struct {
	//
}

func (this *jsonCodec) Name() string {
	return "json"
}

func (this *jsonCodec) MimeType() string {
	return "application/json"
}

func (this *jsonCodec) Encode(msgObj interface{}, ctx lib.ContextSet) (data interface{}, err error) {
	return json.Marshal(msgObj)
}

func (this *jsonCodec) Decode(data interface{}, msgObj interface{}) error {
	return json.Unmarshal(data.([]byte), msgObj)
}

func init() {
	codec.RegisterCodec(new(jsonCodec))
}
