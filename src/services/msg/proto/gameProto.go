package gameProto

import (
	"core/codec"
	_ "core/codec/protos"
	"core/libs"
	"core/rpc"

	"fmt"
	"reflect"
)

const (
	ID_RemoteCallREQ = 500
	ID_RemoteCallACK = 501

	ID_ContentReq_c2s = 1001
	ID_ContentAck_s2c = 1002

	ID_PingACK = 1003

	ID_LoginREQ = 1004
	ID_LoginACK = 1005

	ID_VerifyREQ = 1006
	ID_VerifyACK = 1007

	ID_ChatREQ = 1008
	ID_ChatACK = 1009

	ID_TestACK = 1010

	ID_CloseClientACK  = 1011
	ID_ClientClosedACK = 1012

	ID_TransmitACK = 1013

	ID_SubscribeChannelREQ = 1014
	ID_SubscribeChannelACK = 1015
	ID_SvcStatusACK        = 1016

	ID_ServiceIdentifyACK = 1017
	ID_RelayACK           = 1018
)

func init() {
	RegMsg(ID_RemoteCallREQ, rpc.RemoteCallREQ{})
	RegMsg(ID_RemoteCallACK, rpc.RemoteCallACK{})

	RegMsg(ID_ContentReq_c2s, ContentReq{})
	RegMsg(ID_ContentAck_s2c, ContentAck{})
	RegMsg(ID_PingACK, PingACK{})
	RegMsg(ID_LoginREQ, LoginREQ{})
	RegMsg(ID_LoginACK, LoginACK{})
	RegMsg(ID_VerifyREQ, VerifyREQ{})
	RegMsg(ID_VerifyACK, VerifyACK{})
	RegMsg(ID_ChatREQ, ChatREQ{})
	RegMsg(ID_ChatACK, ChatACK{})
	RegMsg(ID_TestACK, TestACK{})

	RegMsg(ID_CloseClientACK, CloseClientACK{})
	RegMsg(ID_ClientClosedACK, ClientClosedACK{})

	RegMsg(ID_TransmitACK, TransmitACK{})
	RegMsg(ID_SubscribeChannelREQ, SubscribeChannelREQ{})
	RegMsg(ID_SubscribeChannelACK, SubscribeChannelACK{})
	RegMsg(ID_SvcStatusACK, SvcStatusACK{})

	RegMsg(ID_ServiceIdentifyACK, ServiceIdentifyACK{})
	RegMsg(ID_RelayACK, RelayACK{})
}

func RegMsg(msgId int, msg interface{}) {
	metaMsg := lib.MessageMeta{
		Codec: codec.MustGetCodec("proto"),
		Type:  reflect.TypeOf(msg),
		ID:    msgId,
	}
	fmt.Printf("gameProto.regMsg:%d %s\n", metaMsg.ID, metaMsg.FullName())
	lib.RegisterMessageMeta(&metaMsg)
}

var (
	// agent
	Handle_Agent_CloseClientACK = func(ev lib.Event) { panic("'CloseClientACK' not handled") }
	Handle_Agent_Default        func(ev lib.Event)

	// game
	Handle_Game_ChatREQ   = func(ev lib.Event) { panic("'ChatREQ' not handled") }
	Handle_Game_VerifyREQ = func(ev lib.Event) { panic("'VerifyREQ' not handled") }
	Handle_Game_Default   func(ev lib.Event)

	// hub
	Handle_Hub_SubscribeChannelREQ = func(ev lib.Event) { panic("'SubscribeChannelREQ' not handled") }
	Handle_Hub_Default             func(ev lib.Event)

	// login
	Handle_Login_LoginREQ     = func(ev lib.Event) { panic("'LoginREQ' not handled") }
	Handle_Login_SvcStatusACK = func(ev lib.Event) { panic("'SvcStatusACK' not handled") }
	Handle_Login_Default      func(ev lib.Event)

	// match
	Handle_Match_SvcStatusACK = func(ev lib.Event) { panic("'SvcStatusACK' not handled") }
	Handle_Match_Default      func(ev lib.Event)
)

func GetMessageHandler(svcName string) lib.EventCallback {

	switch svcName {
	case "agent":
		return func(ev lib.Event) {
			switch ev.Message().(type) {
			case *CloseClientACK:
				Handle_Agent_CloseClientACK(ev)
			default:
				if Handle_Agent_Default != nil {
					Handle_Agent_Default(ev)
				}
			}
		}
	case "game":
		return func(ev lib.Event) {
			switch ev.Message().(type) {
			case *ChatREQ:
				Handle_Game_ChatREQ(ev)
			case *VerifyREQ:
				Handle_Game_VerifyREQ(ev)
			default:
				if Handle_Game_Default != nil {
					Handle_Game_Default(ev)
				}
			}
		}
	case "hub":
		return func(ev lib.Event) {
			switch ev.Message().(type) {
			case *SubscribeChannelREQ:
				Handle_Hub_SubscribeChannelREQ(ev)
			default:
				if Handle_Hub_Default != nil {
					Handle_Hub_Default(ev)
				}
			}
		}
	case "login":
		return func(ev lib.Event) {
			switch ev.Message().(type) {
			case *LoginREQ:
				Handle_Login_LoginREQ(ev)
			case *SvcStatusACK:
				Handle_Login_SvcStatusACK(ev)
			default:
				if Handle_Login_Default != nil {
					Handle_Login_Default(ev)
				}
			}
		}
	case "match":
		return func(ev lib.Event) {
			switch ev.Message().(type) {
			case *SvcStatusACK:
				Handle_Match_SvcStatusACK(ev)
			default:
				if Handle_Match_Default != nil {
					Handle_Match_Default(ev)
				}
			}
		}
	}

	return nil
}
