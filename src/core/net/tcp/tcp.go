package tcp

type TcpSockOpt interface {
	SetSocketBuffer(readBufferSize, writeBufferSize int, noDelay bool)
	SetMaxPacketSize(maxSize int)
	SetSocketDeadline(read, write time.Duration)
}

type TcpAcceptor interface {
	lib.Peer
	TcpSockOpt

	Port() int
}

type TcpConnector interface {
	lib.Peer
	TcpSockOpt

	SetReconnectDuration(time.Duration)
	ReconnectDuration() time.Duration

	Session() lib.Session
	// SetSessionManager(raw interface{})

	Port() int
}
