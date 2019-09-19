package gateapi

import (
	"services/fx"
	"services/fx/service"
	"services/msg/proto"

	"core/codec"
	"core/logs"
	"core/xlib"

	"fmt"
)

// 关闭所有网关上客户端的连接
func CloseAllClient() {
	service.VisitRemoteService(func(ses lib.Session, ctx *service.RemoteServiceContext) bool {
		if ctx != nil && ctx.Name == "gate" {
			ses.Send(&msgProto.CloseClientAck{
				All: true,
			})
		}
		return true
	})
}

// 广播给所有客户端
func BroadcastAll(msg interface{}) {
	data, meta, err := codec.EncodeMessage(msg)
	if err != nil {
		//log.Errorf("BroadcastAll.EncodeMessage %s", err)
		logs.Debug("BroadcastAll.EncodeMessage %s\n", err)
		return
	}

	service.VisitRemoteService(func(ses lib.Session, ctx *service.RemoteServiceContext) bool {
		if ctx != nil && ctx.Name == "gate" {
			logs.Debug("ctx name is gate to broadcast")
			ses.Send(&msgProto.TransmitAck{
				MsgId:   meta.Id,
				MsgData: data,
				All:     true,
			})
		} else {
			logs.Debug("to broadcast for ctx:", ctx)
		}
		return true
	})
}

// 给客户端发消息
func Send(tag *fx.ClientTag, msg interface{}) {
	g2gSes := service.GetRemoteService(tag.SvcId)
	if g2gSes != nil {
		data, meta, err := codec.EncodeMessage(msg)
		if err != nil {
			//log.Errorf("Send.EncodeMessage %s", err)
			fmt.Printf("Send.EncodeMessage %s\n", err)
			return
		}

		g2gSes.Send(&msgProto.TransmitAck{
			MsgId:    meta.Id,
			MsgData:  data,
			ClientId: tag.SesId,
		})
	}
}

type ClientList struct {
	sesByGateSvcId map[string][]int64
}

// 添加客户端
func (this *ClientList) AddClient(tag *fx.ClientTag) {
	seslist := this.sesByGateSvcId[tag.SvcId]
	seslist = append(seslist, tag.SesId)
	this.sesByGateSvcId[tag.SvcId] = seslist
}

// 关闭列表中客户端的连接
func (this *ClientList) CloseClient() {
	for gateSvcId, sesList := range this.sesByGateSvcId {
		g2gSes := service.GetRemoteService(gateSvcId)
		if g2gSes != nil {
			g2gSes.Send(&msgProto.CloseClientAck{
				Id: sesList,
			})
		}
	}
}

// 将消息广播给列表中的客户端
func (this *ClientList) Broadcast(msg interface{}) {
	data, meta, err := codec.EncodeMessage(msg)
	if err != nil {
		//log.Errorf("ClientList.EncodeMessage %s", err)
		fmt.Printf("ClientList.EncodeMessage %s\n", err)
		return
	}

	for gateSvcId, sesList := range this.sesByGateSvcId {
		g2gSes := service.GetRemoteService(gateSvcId)
		if g2gSes != nil {
			g2gSes.Send(&msgProto.TransmitAck{
				MsgId:        meta.Id,
				MsgData:      data,
				ClientIdList: sesList,
			})
		} else {
			//logs.Warnf("Agent not ready, ignore msg, svcid: '%s' msg: '%+v'", agentSvcId, msg)
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
