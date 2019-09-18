package model

import (
	"services/fx"
	"services/fx/service"
	"services/msg/proto"

	"core/xlib"

	"errors"
	"time"
)

type Backend struct {
	SvcName string
	SvcId   string // 只保留绑定后台的svcid,即便后台更换session,也无需同步
}

type User struct {
	ClientSession lib.Session
	Targets       []*Backend
	LastPingTime  time.Time

	Tag fx.ClientTag
}

// 广播到这个用户绑定的所有后台
func (this *User) BroadcastToBackends(msg interface{}) {
	for _, t := range this.Targets {

		backendSes := service.GetRemoteService(t.SvcId)
		if backendSes != nil {
			backendSes.Send(msg)
		}
	}
}

var (
	ErrBackendNotFound = errors.New("backend not found")
)

func (this *User) TransmitToBackend(backendSvcId string, msgId int32, msgData []byte) error {
	backendSes := service.GetRemoteService(backendSvcId)

	if backendSes == nil {
		return ErrBackendNotFound
	}

	backendSes.Send(&msgProto.TransmitAck{
		MsgId:    msgId,
		MsgData:  msgData,
		ClientId: this.Tag.SesId,
	})
	return nil
}

// 绑定用户后台
func (this *User) SetBackend(svcName string, svcId string) {
	for _, t := range this.Targets {
		if t.SvcName == svcName {
			t.SvcId = svcId
			return
		}
	}

	this.Tag = fx.ClientTag{
		SesId: this.ClientSession.Id(),
		SvcId: GateSvcId,
	}

	this.Targets = append(this.Targets, &Backend{
		SvcName: svcName,
		SvcId:   svcId,
	})
}

func (this *User) GetBackend(svcName string) string {
	for _, t := range this.Targets {
		if t.SvcName == svcName {
			return t.SvcId
		}
	}
	return ""
}

func NewUser(clientSes lib.Session) *User {
	return &User{
		ClientSession: clientSes,
		LastPingTime:  time.Now(),
	}
}
