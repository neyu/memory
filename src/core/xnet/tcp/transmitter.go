package tcp

import (
	// "core/util"
	"core/xlib"

	//"fmt"
	"io"
	"net"
)

type TCPMessageTransmitter struct {
	//
}

type socketOpt interface {
	MaxPacketSize() int
	ApplySocketReadTimeout(conn net.Conn, callback func())
	ApplySocketWriteTimeout(conn net.Conn, callback func())
}

func (TCPMessageTransmitter) OnRecvMessage(ses lib.Session) (msg interface{}, err error) {
	//fmt.Printf("on recv message of transmitter msg:%+v\n", msg)
	reader, ok := ses.Raw().(io.Reader)
	if !ok || reader == nil {
		return nil, nil
	}

	opt := ses.GetPeer().Prop() //.(socketOpt)
	if conn, ok := reader.(net.Conn); ok {
		opt.ApplySocketReadTimeout(conn, func() {
			msg, err = lib.RecvLTVPacket(reader, opt.MaxPacketSize())
		})
	}
	return
}

func (TCPMessageTransmitter) OnSendMessage(ses lib.Session, msg interface{}) (err error) {
	//fmt.Printf("on send message of transmitter msg:%+v\n", msg)
	writer, ok := ses.Raw().(io.Writer)
	if !ok || writer == nil {
		return nil
	}

	opt := ses.GetPeer().Prop() //.(socketOpt)
	opt.ApplySocketWriteTimeout(writer.(net.Conn), func() {
		err = lib.SendLTVPacket(writer, msg) //, ses.(lib.ContextSet)
	})
	return
}
