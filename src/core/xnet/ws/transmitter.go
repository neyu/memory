package ws

import (
	"core/codec"
	"core/logs"
	"core/xlib"

	"github.com/gorilla/websocket"

	"encoding/binary"
)

const (
	MsgIDSize = 2 // uint16
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

	if err != nil {
		return
	}

	if len(raw) < MsgIDSize {
		return nil, util.ErrMinPacket
	}

	switch messageType {
	case websocket.BinaryMessage:
		msgID := binary.LittleEndian.Uint16(raw)
		msgData := raw[MsgIDSize:]

		msg, _, err = codec.DecodeMessage(int(msgID), msgData)
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
		msgID   int
	)

	switch m := msg.(type) {
	case *lib.RawPacket: // 发裸包
		msgData = m.MsgData
		msgID = m.MsgID
	default: // 发普通编码包
		var err error
		var meta *lib.MessageMeta

		// 将用户数据转换为字节数组和消息ID
		msgData, meta, err = codec.EncodeMessage(msg, nil)

		if err != nil {
			return err
		}

		msgID = meta.ID
	}

	pkt := make([]byte, MsgIDSize+len(msgData))
	binary.LittleEndian.PutUint16(pkt, uint16(msgID))
	copy(pkt[MsgIDSize:], msgData)

	conn.WriteMessage(websocket.BinaryMessage, pkt)

	return nil
}
