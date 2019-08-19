package frontend

import (
	"core/codec"
	"core/xlib"

	// "core/xnet/tcp"

	"github.com/gorilla/websocket"

	"encoding/binary"
	"io"
	"net"
)

type socketOpt interface {
	MaxPacketSize() int
	ApplySocketReadTimeout(conn net.Conn, callback func())
	ApplySocketWriteTimeout(conn net.Conn, callback func())
}

type DirectTCPTransmitter struct {
}

// 来自客户端的消息
func (DirectTCPTransmitter) OnRecvMessage(ses lib.Session) (msg interface{}, err error) {

	reader, ok := ses.Raw().(io.Reader)

	// 转换错误，或者连接已经关闭时退出
	if !ok || reader == nil {
		return nil, nil
	}

	opt := ses.GetPeer().Prop()

	if conn, ok := ses.Raw().(net.Conn); ok {

		for {

			// 有读超时时，设置超时
			opt.ApplySocketReadTimeout(conn, func() {

				var msgId int
				var msgData []byte

				// 接收来自客户端的封包
				msgId, msgData, err = RecvLTVPacketData(reader, opt.MaxPacketSize())

				// 尝试透传到后台或者解析
				if err == nil {
					msg, err = ProcFrontendPacket(msgId, msgData, ses)
				}

			})

			// 有错退出
			if err != nil {
				break
			}

			// msg=nil时,透传了客户端的封包到后台, 不用传给下一个proc, 继续重新读取下一个包
		}

	}

	return
}

// 网关发往客户端的消息
func (DirectTCPTransmitter) OnSendMessage(ses lib.Session, msg interface{}) (err error) {

	writer, ok := ses.Raw().(io.Writer)

	// 转换错误，或者连接已经关闭时退出
	if !ok || writer == nil {
		return nil
	}

	opt := ses.GetPeer().Prop()

	// 有写超时时，设置超时
	opt.ApplySocketWriteTimeout(writer.(net.Conn), func() {

		err = lib.SendLTVPacket(writer, msg)

	})

	return
}

const (
	MsgIdSize = 2 // uint16
)

type DirectWSMessageTransmitter struct {
}

func (DirectWSMessageTransmitter) OnRecvMessage(ses lib.Session) (msg interface{}, err error) {

	conn, ok := ses.Raw().(*websocket.Conn)

	// 转换错误，或者连接已经关闭时退出
	if !ok || conn == nil {
		return nil, nil
	}

	var (
		messageType int
		raw         []byte
	)

	for {
		messageType, raw, err = conn.ReadMessage()

		if err != nil {
			break
		}

		switch messageType {
		case websocket.BinaryMessage:
			// msgId := binary.LittleEndian.Uint16(raw)
			msgId := binary.BigEndian.Uint16(raw)
			msgData := raw[MsgIdSize:]

			// 尝试透传到后台或者解析
			if err == nil {
				msg, err = ProcFrontendPacket(int(msgId), msgData, ses)
			}
		}

		if err != nil {
			break
		}

	}

	return

}

func (DirectWSMessageTransmitter) OnSendMessage(ses lib.Session, msg interface{}) error {

	conn, ok := ses.Raw().(*websocket.Conn)

	// 转换错误，或者连接已经关闭时退出
	if !ok || conn == nil {
		return nil
	}

	var (
		msgData []byte
		msgId   int
	)

	switch m := msg.(type) {
	case *codec.RawPacket: // 发裸包
		msgData = m.MsgData
		msgId = m.MsgId
	default: // 发普通编码包
		var err error
		var meta *codec.MessageMeta

		// 将用户数据转换为字节数组和消息Id
		msgData, meta, err = codec.EncodeMessage(msg)

		if err != nil {
			return err
		}

		msgId = meta.Id
	}

	pkt := make([]byte, MsgIdSize+len(msgData))
	// binary.LittleEndian.PutUint16(pkt, uint16(msgId))
	binary.BigEndian.PutUint16(pkt, uint16(msgId))
	copy(pkt[MsgIdSize:], msgData)

	conn.WriteMessage(websocket.BinaryMessage, pkt)

	return nil
}
