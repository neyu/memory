package frontend

import (
	"services/gate/model"
	"services/msg/proto"

	"core/codec"
	"core/logs"
	"core/xlib"

	"fmt"
	"time"
)

var (
	PingAckMsgId   = codec.MessageMetaByFullName("msgProto.PingAck").Id
	VerifyReqMsgId = codec.MessageMetaByFullName("msgProto.VerifyReq").Id
)

func ProcFrontendPacket(msgId int, msgData []byte, ses lib.Session) (msg interface{}, err error) {
	// agent自己的内部消息以及预处理消息
	switch int(msgId) {
	case PingAckMsgId, VerifyReqMsgId:

		// 将字节数组和消息Id用户解出消息
		msg, _, err = codec.DecodeMessage(msgId, msgData)
		if err != nil {
			// TODO 接收错误时，返回消息
			return nil, err
		}

		switch userMsg := msg.(type) {
		case *msgProto.PingAck:
			logs.Info("recv ping msg")
			u := model.SessionToUser(ses)
			if u != nil {
				u.LastPingTime = time.Now()

				// 回消息
				ses.Send(&msgProto.PingAck{})

				logs.Info("ack ping msg")
			} else {
				logs.Info("close session by ping msg")
				ses.Close()
			}

			// 第一个到网关的消息
		case *msgProto.VerifyReq:
			u, err := bindClientToBackend(userMsg.GameSvcId, ses.Id())
			if err == nil {
				u.TransmitToBackend(userMsg.GameSvcId, msgId, msgData)

			} else {
				ses.Close()
				//log.Errorln("bindClientToBackend", err)
				fmt.Println("bindClientToBackend", err)
			}
		}

	default:
		// 在路由规则中查找消息ID是否是路由规则允许的消息
		// rule := model.GetRuleByMsgId(msgId)
		// if rule == nil {
		// 	return nil, fmt.Errorf("Message not in route table, msgid: %d, execute MakeProto.sh and restart agent", msgId)
		// }

		// 找到已经绑定的用户
		u := model.SessionToUser(ses)

		if u != nil {

			// 透传到后台
			if err = u.TransmitToBackend(u.GetBackend("game"), msgId, msgData); err != nil {
				// logs.Warnf("TransmitToBackend %s, msg: '%s' svc: %s", err, rule.MsgName, rule.SvcName)
				// fmt.Printf("TransmitToBackend %s, msg: '%s' svc: %s\n", err, rule.MsgName, rule.SvcName)
			}

		} else {
			// 这是一个未授权的用户发授权消息,可以踢掉
		}
	}

	return
}

type FrontendEventHooker struct {
}

// 网关内部抛出的事件
func (FrontendEventHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch inputEvent.Message().(type) {
	case *lib.SessionAccepted:
	case *lib.SessionClosed:

		// 通知后台客户端关闭
		u := model.SessionToUser(inputEvent.Session())
		if u != nil {
			u.BroadcastToBackends(&msgProto.ClientClosedAck{
				Id: &msgProto.ClientId{
					Id:    inputEvent.Session().Id(),
					SvcId: model.AgentSvcId,
				},
			})
		}
	}

	return inputEvent
}

// 发送到客户端的消息
func (FrontendEventHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	return inputEvent
}

// func init() {

// 	// 前端的processor
// 	proc.RegisterProcessor("tcp.frontend", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(directTCPTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(
// 			new(tcp.MsgHooker),       //  TCP基础消息及日志
// 			new(FrontendEventHooker), // 内部消息处理
// 		))
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})

// 	// 前端的processor
// 	proc.RegisterProcessor("ws.frontend", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(directWSMessageTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(
// 			new(gorillaws.MsgHooker), //  TCP基础消息及日志
// 			new(FrontendEventHooker), // 内部消息处理
// 		))
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})
// }
