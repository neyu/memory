package ws

import (
	"core/codec"
	// "core/util"
	"core/logs"
	"core/xlib"

	"github.com/gorilla/websocket"

	"encoding/binary"
	// "fmt"
)

var (
	TotalRecv = 0
	TotalSend = 0
)

const (
	MsgLenSize  = 2 // uint16
	MsgIdSize   = 2 // uint16
	MsgHeadSize = 4 // 2 + 2
)

type WSMessageTransmitter struct {
}

func (WSMessageTransmitter) OnRecvMessage(ses lib.Session) (msg interface{}, err error) {

	conn, ok := ses.Raw().(*websocket.Conn)

	// 转换错误，或者连接已经关闭时退出
	if !ok || conn == nil {
		return nil, nil
	}

	var messageType int
	var raw []byte
	messageType, raw, err = conn.ReadMessage()

	TotalRecv += len(raw)
	logs.Notice("total recv bytes:", TotalRecv)

	if err != nil {
		return
	}

	if len(raw) < MsgIdSize {
		return nil, lib.ErrMinPacket
	}

	switch messageType {
	case websocket.BinaryMessage:
		msgID := binary.BigEndian.Uint16(raw)
		msgData := raw[MsgIdSize:]

		msg, _, err = codec.DecodeMessage(int32(msgID), msgData)
	case websocket.TextMessage:
		//
	}

	return
}

func (WSMessageTransmitter) OnSendMessage(ses lib.Session, msg interface{}) error {

	conn, ok := ses.Raw().(*websocket.Conn)

	// 转换错误，或者连接已经关闭时退出
	if !ok || conn == nil {
		return nil
	}

	var (
		msgData []byte
		msgId   int32
	)

	switch m := msg.(type) {
	case *codec.RawPacket: // 发裸包
		msgData = m.MsgData
		msgId = m.MsgId
	default: // 发普通编码包
		var err error
		var meta *codec.MessageMeta

		// 将用户数据转换为字节数组和消息ID
		msgData, meta, err = codec.EncodeMessage(msg)

		if err != nil {
			return err
		}

		msgId = meta.Id
	}
	msgLen := MsgIdSize + len(msgData)
	pkt := make([]byte, msgLen)
	binary.BigEndian.PutUint16(pkt, uint16(msgId))
	copy(pkt[MsgIdSize:], msgData)

	TotalSend += msgLen
	logs.Notice("total send bytes:", TotalSend)

	// fmt.Println("msg send raw:", msgId, pkt)
	conn.WriteMessage(websocket.BinaryMessage, pkt)

	return nil
}
