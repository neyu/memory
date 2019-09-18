package fx

import (
	"services/fx/config"

	"core/dict"
)

type Service struct {
	env  string
	name string
	id   string

	ip    string
	ports map[string]string
}

type ClientTag struct {
	SesId int64
	SvcId string
}

func TipCode(name string) int32 {
	msgCode := config.GetCode()
	code := dict.GetInt(msgCode[name], "id")
	return int32(code)
}
