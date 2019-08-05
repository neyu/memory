package tcp

import (
	"core/codec"
	"core/util"

	"encoding/binary"
	"errors"
	"fmt"
	"io"
)

var (
	ErrMaxPacket  = errors.New("packet over size")
	ErrMinPacket  = errors.New("packet short size")
	ErrShortMsgId = errors.New("short msgid")
)

const (
	bodySize  = 2
	msgIdSize = 2
)

func RecvLTVPacket(reader io.Reader, maxPacketSize int) (msg interface{}, err error) {
	//fmt.Printf("recv ltv packet...\n")
	var sizeBuffer = make([]byte, bodySize)
	_, err = io.ReadFull(reader, sizeBuffer)
	if err != nil {
		fmt.Printf("read ltv packet err !!!%s\n", err.Error())
		return
	}
	if len(sizeBuffer) < bodySize {
		return nil, ErrMinPacket
	}
	size := binary.LittleEndian.Uint16(sizeBuffer)
	if maxPacketSize > 0 && size >= uint16(maxPacketSize) {
		return nil, ErrMaxPacket
	}

	body := make([]byte, size)
	_, err = io.ReadFull(reader, body)
	if err != nil {
		return
	}
	if len(body) < msgIdSize {
		return nil, ErrShortMsgId
	}
	msgid := binary.LittleEndian.Uint16(body)
	msgData := body[msgIdSize:]

	msg, _, err = codec.DecodeMessage(int(msgid), msgData)
	if err != nil {
		return nil, err
	}
	return
}

func SendLTVPacket(writer io.Writer, data interface{}) error { //, ctx lib.ContextSet
	//fmt.Printf("send ltv packet...\n")
	var (
		msgData []byte
		msgId   int
		meta    *codec.MessageMeta
	)
	switch m := data.(type) {
	case *codec.RawPacket:
		msgData = m.MsgData
		msgId = m.MsgId
	default:
		var err error
		msgData, meta, err = codec.EncodeMessage(data) //, ctx
		if err != nil {
			return err
		}
		msgId = meta.Id
	}

	pkt := make([]byte, bodySize+msgIdSize+len(msgData))
	binary.LittleEndian.PutUint16(pkt, uint16(msgIdSize+len(msgData)))
	binary.LittleEndian.PutUint16(pkt[bodySize:], uint16(msgId))
	copy(pkt[(bodySize+msgIdSize):], msgData)

	err := util.WriteFull(writer, pkt)
	if err != nil {
		fmt.Printf("write ltv packet err !!!%s\n", err.Error())
	}
	if meta != nil {
		codec.FreeCodecResource(meta.Codec, msgData) //, ctx
	}
	return err
}
