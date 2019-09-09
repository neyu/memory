package frontend

import (
	"encoding/binary"
	"errors"
	"io"
)

var (
	ErrMaxPacket  = errors.New("packet over size")
	ErrMinPacket  = errors.New("packet short size")
	ErrShortMsgId = errors.New("short msgid")
)

const (
	bodySize  = 2 // 包体大小字段
	msgIdSize = 2 // 消息ID字段
)

// 接收Length-Type-Value格式的封包流程
func RecvLTVPacketData(reader io.Reader, maxPacketSize int) (msgId int32, msgData []byte, err error) {

	// Size为uint16，占2字节
	var sizeBuffer = make([]byte, bodySize)

	// 持续读取Size直到读到为止
	_, err = io.ReadFull(reader, sizeBuffer)

	// 发生错误时返回
	if err != nil {
		return
	}

	if len(sizeBuffer) < bodySize {
		err = ErrMinPacket
		return
	}

	// 用小端格式读取Size
	// size := binary.LittleEndian.Uint16(sizeBuffer)
	size := binary.BigEndian.Uint16(sizeBuffer)

	if maxPacketSize > 0 && size >= uint16(maxPacketSize) {
		err = ErrMaxPacket
		return
	}

	// 分配包体大小
	// TODO 内存池优化发送后删除
	body := make([]byte, size)

	// 读取包体数据
	_, err = io.ReadFull(reader, body)

	// 发生错误时返回
	if err != nil {
		return
	}

	if len(body) < bodySize {
		err = ErrShortMsgId
		return
	}

	// msgId = int(binary.LittleEndian.Uint16(body))
	msgId = int32(binary.BigEndian.Uint16(body))

	msgData = body[msgIdSize:]

	return
}
