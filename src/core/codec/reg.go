package codec

import (
	"core/libs"
)

var registerCodecs []lib.Codec

func RegisterCodec(c lib.Codec) {
	if GetCodec(c.Name()) != nil {
		panic("duplicate codec:" + c.Name())
	}
	registerCodecs = append(registerCodecs, c)
}

func GetCodec(name string) lib.Codec {
	for _, c := range registerCodecs {
		if c.Name() == name {
			return c
		}
	}
	return nil
}

func MustGetCodec(name string) lib.Codec {
	codec := GetCodec(name)
	if codec == nil {
		panic("codec not register!" + name)
	}
	return codec
}
