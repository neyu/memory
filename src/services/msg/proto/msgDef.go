package msgProto

import (
	"core/codec"
	"core/logs"

	"core/xnet/relay"
	"core/xnet/rpc"

	"reflect"
)

const (
	ID_RemoteCallReq = 500
	ID_RemoteCallAck = 501

	ID_RelayAck = 600

	// game.proto
	ID_ContentReq = 1001
	ID_ContentAck = 1002

	// login.proto
	ID_PingAck   = 1003
	ID_LoginReq  = 1004
	ID_LoginAck  = 1005
	ID_VerifyReq = 1006
	ID_VerifyAck = 1007

	// chat.proto
	ID_ChatReq = 1008
	ID_ChatAck = 1009
	ID_TestAck = 1010

	// router.proto
	ID_CloseClientAck  = 1011
	ID_ClientClosedAck = 1012
	ID_TransmitAck     = 1013

	// hub.proto
	ID_SubscribeChannelReq = 1014
	ID_SubscribeChannelAck = 1015
	ID_SvcStatusAck        = 1016
	ID_ServiceIdentifyAck  = 1017

	ID_AccountLogin  = 2000
	ID_LoginResponse = 2001
)

func init() {
	logs.Info("register msg meta")

	// rpc.proto
	RegMsg(ID_RemoteCallReq, rpc.RemoteCallReq{})
	RegMsg(ID_RemoteCallAck, rpc.RemoteCallAck{})

	// relay.proto
	RegMsg(ID_RelayAck, relay.RelayAck{})

	// game.proto
	RegMsg(ID_ContentReq, ContentReq{})
	RegMsg(ID_ContentAck, ContentAck{})

	// login.proto
	RegMsg(ID_PingAck, PingAck{})
	RegMsg(ID_LoginReq, LoginReq{})
	RegMsg(ID_LoginAck, LoginAck{})
	RegMsg(ID_VerifyReq, VerifyReq{})
	RegMsg(ID_VerifyAck, VerifyAck{})

	// chat.proto
	RegMsg(ID_ChatReq, ChatReq{})
	RegMsg(ID_ChatAck, ChatAck{})
	RegMsg(ID_TestAck, TestAck{})

	// route.proto
	RegMsg(ID_CloseClientAck, CloseClientAck{})
	RegMsg(ID_ClientClosedAck, ClientClosedAck{})
	RegMsg(ID_TransmitAck, TransmitAck{})

	// hub.proto
	RegMsg(ID_SubscribeChannelReq, SubscribeChannelReq{})
	RegMsg(ID_SubscribeChannelAck, SubscribeChannelAck{})
	RegMsg(ID_SvcStatusAck, SvcStatusAck{})
	RegMsg(ID_ServiceIdentifyAck, ServiceIdentifyAck{})

	// iface.proto
	RegMsg(ID_AccountLogin, AccountLogin{})
	RegMsg(ID_LoginResponse, LoginResponse{})
}

func RegMsg(msgId int, msg interface{}) {
	metaMsg := codec.MessageMeta{
		Codec: codec.MustGetCodec("proto"),
		Type:  reflect.TypeOf(msg),
		Id:    msgId,
	}
	// logs.Info("register msg meta:%d %s", metaMsg.Id, metaMsg.FullName())
	codec.RegisterMessageMeta(&metaMsg)
}
