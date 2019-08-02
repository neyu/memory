package backend

import (
	"services/agent/model"
	"services/msg/proto"

	"core/codec"
	"core/lib"

	"fmt"
)

type BackendMsgHooker struct {
}

// 后端服务器接收来自网关的消息
func (BackendMsgHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch incomingMsg := inputEvent.Message().(type) {
	case *msgProto.TransmitAck:

		userMsg, _, err := codec.DecodeMessage(int(incomingMsg.MsgId), incomingMsg.MsgData)
		if err != nil {
			//log.Warnf("Backend msg decode failed, %s, msgid: %d", err.Error(), incomingMsg.MsgID)
			fmt.Printf("Backend msg decode failed, %s, msgid: %d\n", err.Error(), incomingMsg.MsgID)
			return nil
		}

		ev := &RecvMsgEvent{
			Ses:      inputEvent.Session(),
			Msg:      userMsg,
			ClientId: incomingMsg.ClientId,
		}

		outputEvent = ev

	default:
		outputEvent = inputEvent
	}

	return
}

// 后端服务器发送到网关的消息
func (BackendMsgHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch outgoingMsg := inputEvent.Message().(type) {
	case *msgProto.TransmitAck:
		//if log.IsDebugEnabled() {
		writeAgentLog(inputEvent.Session(), "send", outgoingMsg)
		//}
	}
	return inputEvent
}

type broadcasterHooker struct {
}

// 来自后台服务器的消息
func (broadcasterHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch incomingMsg := inputEvent.Message().(type) {
	case *msgProto.TransmitAck:

		rawPkt := &lib.RawPacket{
			MsgData: incomingMsg.MsgData,
			MsgId:   int(incomingMsg.MsgId),
		}

		//if log.IsDebugEnabled() {
		writeAgentLog(inputEvent.Session(), "recv", incomingMsg)
		//}

		// 单发
		if incomingMsg.ClientId != 0 {
			fmt.Println("单发")
			clientSes := model.GetClientSession(incomingMsg.ClientId)

			if clientSes != nil {
				clientSes.Send(rawPkt)
			}
			// 广播
		} else if incomingMsg.ClientIdList != nil {
			fmt.Println("按名单群发")
			for _, cid := range incomingMsg.ClientIdList {
				clientSes := model.GetClientSession(cid)

				if clientSes != nil {
					clientSes.Send(rawPkt)
				}
			}
		} else if incomingMsg.All {
			fmt.Println("群发:", model.FrontendSessionManager.Count())
			model.FrontendSessionManager.VisitSession(func(clientSes lib.Session) bool {
				fmt.Printf("+++++++++++++clientSes:%+v\n", clientSes)
				clientSes.Send(rawPkt)
				return true
			})
		}

		// 本事件已经处理, 不再后传
		return nil
	}

	return inputEvent
}

// 发送给后台服务器
func (broadcasterHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch outgoingMsg := inputEvent.Message().(type) {
	case *msgProto.TransmitAck:
		//if log.IsDebugEnabled() {
		writeAgentLog(inputEvent.Session(), "send", outgoingMsg)
		//}
	}
	return inputEvent
}

func writeAgentLog(ses lib.Session, dir string, ack *msgProto.TransmitAck) {

	// if msglog.IsBlockedMessageByID(int(ack.MsgID)) {
	// 	return
	// }

	peerInfo := ses.Peer().(lib.PeerProperty)

	userMsg, _, err := codec.DecodeMessage(int(ack.MsgID), ack.MsgData)
	if err == nil {
		//log.Debugf("#agent.%s(%s)@%d len: %d %s <%d>| %s",
		fmt.Printf("#agent.%s(%s)@%d len: %d %s <%d>| %s\n",
			dir,
			peerInfo.Name(),
			ses.ID(),
			lib.MessageSize(userMsg),
			lib.MessageToName(userMsg),
			ack.ClientID,
			lib.MessageToString(userMsg))
	} else {

		// 网关没有相关的消息, 只能打出消息号
		//log.Debugf("#agent.%s(%s)@%d len: %d msgid: %d <%d>",
		fmt.Printf("#agent.%s(%s)@%d len: %d msgid: %d <%d>\n",
			dir,
			peerInfo.Name(),
			ses.ID(),
			len(ack.MsgData),
			ack.MsgID,
			ack.ClientID,
		)
	}
}

// func init() {

// 	// 避免默认消息日志显示本条消息
// 	//msglog.BlockMessageLog("proto.TransmitACK")

// 	// 适用于后端服务的处理器
// 	proc.RegisterProcessor("svc.backend", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(
// 			new(service.SvcEventHooker), // 服务互联处理
// 			new(BackendMsgHooker),       // 网关消息处理
// 			new(tcp.MsgHooker)))         // tcp基础消息处理
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})

// 	// 适用于
// 	proc.RegisterProcessor("agent.backend", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(
// 			new(service.SvcEventHooker), // 服务互联处理
// 			new(broadcasterHooker),      // 网关消息处理
// 			new(tcp.MsgHooker)))         // tcp基础消息处理
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})
// }
