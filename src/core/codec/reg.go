package codec

var registerCodecs []Codec

func RegisterCodec(c Codec) {
	if GetCodec(c.Name()) != nil {
		panic("duplicate codec:" + c.Name())
	}
	registerCodecs = append(registerCodecs, c)
}

func GetCodec(name string) Codec {
	for _, c := range registerCodecs {
		if c.Name() == name {
			return c
		}
	}
	return nil
}

func MustGetCodec(name string) Codec {
	codec := GetCodec(name)
	if codec == nil {
		panic("codec not register!" + name)
	}
	return codec
}
