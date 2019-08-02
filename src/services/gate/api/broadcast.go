package gateapi

import (
	"services/fx/service"
	"services/msg/proto"

	"core/codec"
	"core/log"
	"core/xlib"

	"fmt"
)

// 关闭所有网关上客户端的连接
func CloseAllClient() {

	service.VisitRemoteService(func(ses lib.Session, ctx *service.RemoteServiceContext) bool {

		if ctx.Name == "gate" {
			ses.Send(&msgProto.CloseClientAck{
				All: true,
			})
		}

		return true
	})
}

// 广播给所有客户端
func BroadcastAll(msg interface{}) {

	data, meta, err := codec.EncodeMessage(msg, nil)
	if err != nil {
		//log.Errorf("BroadcastAll.EncodeMessage %s", err)
		log.Debug("BroadcastAll.EncodeMessage %s\n", err)
		return
	}

	service.VisitRemoteService(func(ses lib.Session, ctx *service.RemoteServiceContext) bool {

		if ctx.Name == "gate" {
			fmt.Println("msg for agent to broadcast to all clients")
			ses.Send(&msgProto.TransmitAck{
				MsgId:   uint32(meta.Id),
				MsgData: data,
				All:     true,
			})
		}

		return true
	})
}

// 给客户端发消息
func Send(cid *msgProto.ClientId, msg interface{}) {

	gateSes := service.GetRemoteService(cid.SvcId)
	if gateSes != nil {
		data, meta, err := codec.EncodeMessage(msg, nil)
		if err != nil {
			//log.Errorf("Send.EncodeMessage %s", err)
			fmt.Printf("Send.EncodeMessage %s\n", err)
			return
		}

		gateSes.Send(&msgProto.TransmitAck{
			MsgId:    uint32(meta.Id),
			MsgData:  data,
			ClientId: cid.Id,
		})
	}
}

type ClientList struct {
	sesByGateSvcId map[string][]int64
}

// 添加客户端
func (this *ClientList) AddClient(cid *msgProto.ClientId) {
	seslist := this.sesByAgentSvcId[cid.SvcId]
	seslist = append(seslist, cid.Id)
	this.sesByAgentSvcId[cid.SvcId] = seslist
}

// 关闭列表中客户端的连接
func (this *ClientList) CloseClient() {
	for gateSvcId, sesList := range this.sesByAgentSvcId {

		gateSes := service.GetRemoteService(agentSvcId)
		if gateSes != nil {
			gateSes.Send(&msgProto.CloseClientAck{
				Id: sesList,
			})
		}
	}
}

// 将消息广播给列表中的客户端
func (this *ClientList) Broadcast(msg interface{}) {

	data, meta, err := codec.EncodeMessage(msg, nil)
	if err != nil {
		//log.Errorf("ClientList.EncodeMessage %s", err)
		fmt.Printf("ClientList.EncodeMessage %s\n", err)
		return
	}

	for agentSvcId, sesList := range this.sesByAgentSvcId {

		gateSes := service.GetRemoteService(agentSvcId)
		if gateSes != nil {

			gateSes.Send(&msgProto.TransmitAck{
				MsgId:        uint32(meta.Id),
				MsgData:      data,
				ClientIdList: sesList,
			})

		} else {
			//log.Warnf("Agent not ready, ignore msg, svcid: '%s' msg: '%+v'", agentSvcID, msg)
			fmt.Printf("Agent not ready, ignore msg, svcid: '%s' msg: '%+v'\n", gateSvcId, msg)
		}
	}
}

// 创建一个客户端列表
func NewClientList() *ClientList {

	return &ClientList{
		sesByGateSvcId: make(map[string][]int64),
	}
}
