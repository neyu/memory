package tcp

import (
	"core/xlib"

	"time"
)

type TcpSockOpter interface {
	SetSocketBuffer(readBufferSize, writeBufferSize int, noDelay bool)
	SetMaxPacketSize(maxSize int)
	SetSocketDeadline(read, write time.Duration)
}

// type TcpAcceptor interface {
// 	lib.Peer
// 	TcpSockOpter

// 	Port() int
// }

type TcpConnector interface {
	lib.Peer
	TcpSockOpter

	SetReconnectDuration(time.Duration)
	ReconnectDuration() time.Duration

	Session() lib.Session
	// SetSessionManager(raw interface{})

	Port() int
}
