package tcp

import (
	"net"
	"time"
)

type TcpSockOpt struct {
	readBufferSize  int
	writeBufferSize int
	noDelay         bool
	maxPacketSize   int

	readTimeout  time.Duration
	writeTimeout time.Duration
}

func (this *TcpSockOpt) SetSocketBuffer(readBufferSize, writeBufferSize int, noDelay bool) {
	this.readBufferSize = readBufferSize
	this.writeBufferSize = writeBufferSize
	this.noDelay = noDelay
}

func (self *TcpSockOpt) SetSocketDeadline(read, write time.Duration) {
	self.readTimeout = read
	self.writeTimeout = write
}

func (self *TcpSockOpt) SetMaxPacketSize(maxSize int) {
	self.maxPacketSize = maxSize
}

func (self *TcpSockOpt) MaxPacketSize() int {
	return self.maxPacketSize
}

func (this *TcpSockOpt) ApplySocketOption(conn net.Conn) {
	if cc, ok := conn.(*net.TCPConn); ok {
		if this.readBufferSize >= 0 {
			cc.SetReadBuffer(this.readBufferSize)
		}
		if this.writeBufferSize >= 0 {
			cc.SetWriteBuffer(this.writeBufferSize)
		}
		cc.SetNoDelay(this.noDelay)
	}
}

func (this *TcpSockOpt) ApplySocketReadTimeout(conn net.Conn, callback func()) {
	if this.readTimeout > 0 {
		conn.SetReadDeadline(time.Now().Add(this.readTimeout))
		callback()
		conn.SetReadDeadline(time.Time{})
	} else {
		callback()
	}
}

func (this *TcpSockOpt) ApplySocketWriteTimeout(conn net.Conn, callback func()) {
	if this.writeTimeout > 0 {
		conn.SetWriteDeadline(time.Now().Add(this.writeTimeout))
		callback()
		conn.SetWriteDeadline(time.Time{})
	} else {
		callback()
	}
}

func (this *TcpSockOpt) Init() {
	this.readBufferSize = -1
	this.writeBufferSize = -1
}
