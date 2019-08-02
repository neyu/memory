package tcp

import (
	"core/libs"
	"core/util"

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

	opt := ses.Peer().(socketOpt)
	if conn, ok := reader.(net.Conn); ok {
		opt.ApplySocketReadTimeout(conn, func() {
			msg, err = util.RecvLTVPacket(reader, opt.MaxPacketSize())
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

	opt := ses.Peer().(socketOpt)
	opt.ApplySocketWriteTimeout(writer.(net.Conn), func() {
		err = util.SendLTVPacket(writer, ses.(lib.ContextSet), msg)
	})
	return
}
