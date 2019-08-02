package service

import (
	// "core/relay"
	"core/xlib"

	"errors"
)

var (
	ErrInvalidRelayMessage         = errors.New("invalid relay message")
	ErrInvalidRelayPassthroughType = errors.New("invalid relay passthrough type")
)

// // 获取Event中relay的透传数据
// func GetPassThrough(ev lib.Event, ptrList ...interface{}) error {
// 	if relayEvent, ok := ev.(*relay.RecvMsgEvent); ok {

// 		for _, ptr := range ptrList {

// 			switch valuePtr := ptr.(type) {
// 			case *int64:
// 				*valuePtr = relayEvent.PassThroughAsInt64()
// 			case *[]int64:
// 				*valuePtr = relayEvent.PassThroughAsInt64Slice()
// 			case *string:
// 				*valuePtr = relayEvent.PassThroughAsString()
// 			default:
// 				return ErrInvalidRelayPassthroughType
// 			}
// 		}

// 		return nil
// 	} else {
// 		return ErrInvalidRelayMessage
// 	}

// }

// 回复event来源一个消息
func Reply(ev lib.Event, msg interface{}) {

	type replyEvent interface {
		Reply(msg interface{})
	}

	if replyEv, ok := ev.(replyEvent); ok {
		replyEv.Reply(msg)
	} else {
		panic("Require 'ReplyEvent' to reply event")
	}
}
