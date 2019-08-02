package main

import (
	"services/msg/proto"

	"core/log"
	"core/xlib"
)

var handleDefault func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *CloseClientAck:
		handleCloseClientAck(ev)
	default:
		if handleDefault != nil {
			handleDefault(ev)
		}
	}
}

func handleCloseClientAck(ev lib.Event) {

	msg := ev.Message().(*msgProto.CloseClientAck)

	// 不给ID,掐线这个网关的所有客户端
	if len(msg.Id) == 0 {
		model.VisitUser(func(user *model.User) bool {
			user.ClientSession.Close()
			return true
		})

	} else {
		// 关闭指定的客户端
		for _, sesid := range msg.Id {
			if u := model.GetUser(sesid); u != nil {
				u.ClientSession.Close()
			}
		}

	}

}
