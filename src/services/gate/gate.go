package main

import (
	"core/lib"
	"core/log"
)

var Handle_Agent_Default func(ev lib.Event)

func gameMsgHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *CloseClientACK:
		Handle_Agent_CloseClientACK(ev)
	default:
		if Handle_Agent_Default != nil {
			Handle_Agent_Default(ev)
		}
	}
}

func Handle_Agent_CloseClientACK(ev lib.Event) {

	msg := ev.Message().(*gameProto.CloseClientACK)

	// 不给ID,掐线这个网关的所有客户端
	if len(msg.ID) == 0 {
		model.VisitUser(func(user *model.User) bool {
			user.ClientSession.Close()
			return true
		})

	} else {
		// 关闭指定的客户端
		for _, sesid := range msg.ID {
			if u := model.GetUser(sesid); u != nil {
				u.ClientSession.Close()
			}
		}

	}

}
