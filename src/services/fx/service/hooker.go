package service

import (
	"services/msg/proto"

	"core/log"
	"core/xlib"
)

// 服务互联消息处理
type SvcEventHooker struct {
}

func (SvcEventHooker) OnInboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	switch msg := inputEvent.Message().(type) {
	case *msgProto.ServiceIdentifyAck:

		if pre := GetRemoteService(msg.SvcId); pre == nil {

			// 添加连接上来的对方服务
			log.Debug("ServiceIdentifyAck to AddRemoteService:%+v", msg)
			AddRemoteService(inputEvent.Session(), msg.SvcId, msg.SvcName)
		}
	case *lib.SessionConnected:
		// ctx := inputEvent.Session().Peer().(lib.ContextSet)

		// var sd *discovery.ServiceDesc
		// if ctx.FetchContext("sd", &sd) {

		// 用Connector的名称（一般是ProcName）让远程知道自己是什么服务，用于网关等需要反向发送消息的标识
		inputEvent.Session().Send(&msgProto.ServiceIdentifyAck{
			SvcName: "procName", //GetProcName(),
			SvcId:   "game_1",   //GetLocalSvcId(),
		})

		log.Debug("SessionConnected to AddRemoteService:%+v", msg)
		// AddRemoteService(inputEvent.Session(), sd.Id, sd.Name)
		AddRemoteService(inputEvent.Session(), "game_1", GetProcName())
		// }

	case *lib.SessionClosed:

		RemoveRemoteService(inputEvent.Session())
	}

	return inputEvent

}

func (SvcEventHooker) OnOutboundEvent(inputEvent lib.Event) (outputEvent lib.Event) {

	return inputEvent
}

// func init() {

// 	// 服务器间通讯协议
// 	proc.RegisterProcessor("tcp.svc", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(new(SvcEventHooker), new(tcp.MsgHooker)))
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})

// 	// 与客户端通信的处理器
// 	proc.RegisterProcessor("tcp.client", func(bundle proc.ProcessorBundle, userCallback lib.EventCallback) {

// 		bundle.SetTransmitter(new(tcp.TCPMessageTransmitter))
// 		bundle.SetHooker(proc.NewMultiHooker(new(tcp.MsgHooker)))
// 		bundle.SetCallback(proc.NewQueuedEventCallback(userCallback))
// 	})
// }
