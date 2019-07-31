package msgProto

import (
	"core/codec"
	"core/lib"
	"core/log"
	"core/net/rpc"

	"reflect"
)

const (
	ID_RemoteCallReq = 500
	ID_RemoteCallAck = 501

	ID_ContentReq_c2s = 1001
	ID_ContentAck_s2c = 1002

	ID_PingAck = 1003

	ID_LoginReq = 1004
	ID_LoginAck = 1005

	ID_VerifyReq = 1006
	ID_VerifyAck = 1007

	ID_ChatReq = 1008
	ID_ChatAck = 1009

	ID_TestAck = 1010

	ID_CloseClientAck  = 1011
	ID_ClientClosedAck = 1012

	ID_TransmitAck = 1013

	ID_SubscribeChannelReq = 1014
	ID_SubscribeChannelAck = 1015
	ID_SvcStatusAck        = 1016

	ID_ServiceIdentifyAck = 1017
	ID_RelayAck           = 1018
)

func init() {
	RegMsg(ID_RemoteCallReq, rpc.RemoteCallReq{})
	RegMsg(ID_RemoteCallAck, rpc.RemoteCallAck{})

	RegMsg(ID_ContentReq_c2s, ContentReq{})
	RegMsg(ID_ContentAck_s2c, ContentAck{})
	RegMsg(ID_PingAck, PingAck{})
	RegMsg(ID_LoginReq, LoginReq{})
	RegMsg(ID_LoginAck, LoginAck{})
	RegMsg(ID_VerifyReq, VerifyReq{})
	RegMsg(ID_VerifyAck, VerifyAck{})
	RegMsg(ID_ChatReq, ChatReq{})
	RegMsg(ID_ChatAck, ChatAck{})
	RegMsg(ID_TestAck, TestAck{})

	RegMsg(ID_CloseClientAck, CloseClientAck{})
	RegMsg(ID_ClientClosedAck, ClientClosedAck{})

	RegMsg(ID_TransmitAck, TransmitAck{})
	RegMsg(ID_SubscribeChannelReq, SubscribeChannelReq{})
	RegMsg(ID_SubscribeChannelAck, SubscribeChannelAck{})
	RegMsg(ID_SvcStatusAck, SvcStatusAck{})

	RegMsg(ID_ServiceIdentifyAck, ServiceIdentifyAck{})
	RegMsg(ID_RelayAck, RelayAck{})
}

func RegMsg(msgId int, msg interface{}) {
	metaMsg := lib.MessageMeta{
		Codec: codec.MustGetCodec("proto"),
		Type:  reflect.TypeOf(msg),
		Id:    msgId,
	}
	log.Debug("gameProto.regMsg:%d %s\n", metaMsg.ID, metaMsg.FullName())
	lib.RegisterMessageMeta(&metaMsg)
}
