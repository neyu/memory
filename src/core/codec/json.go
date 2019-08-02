package codec

import (
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

func (this *jsonCodec) Encode(msgObj interface{}) (data interface{}, err error) {
	return json.Marshal(msgObj)
}

func (this *jsonCodec) Decode(data interface{}, msgObj interface{}) error {
	return json.Unmarshal(data.([]byte), msgObj)
}

func init() {
	RegisterCodec(new(jsonCodec))
}
