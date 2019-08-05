package lib

import (
	"errors"
	"net"
	"sync"
	"sync/atomic"
	"time"
)

type Peer interface {
	// Start()
	// Stop()
	// TypeName() string

	Name() string
	Address() string
	Queue() EventQueue
	SetName(v string)
	SetAddress(v string)
	SetQueue(v EventQueue)
}

type PeerProp struct {
	name  string
	queue EventQueue
	addr  string

	running        int64
	stoppingWaitor sync.WaitGroup
	stopping       int64

	transmit MessageTransmitter
	hooker   EventHooker
	callback EventCallback

	readBufferSize  int
	writeBufferSize int
	noDelay         bool
	maxPacketSize   int

	readTimeout  time.Duration
	writeTimeout time.Duration
}

func NewPeer() Peer {
	return &PeerProp{
		//
	}
}

func (this *PeerProp) Name() string {
	return this.name
}

func (this *PeerProp) Queue() EventQueue {
	return this.queue
}

func (this *PeerProp) Address() string {
	return this.addr
}

func (this *PeerProp) SetName(v string) {
	this.name = v
}

func (this *PeerProp) SetQueue(v EventQueue) {
	this.queue = v
}

func (this *PeerProp) SetAddress(v string) {
	this.addr = v
}

func (this *PeerProp) IsRunning() bool {
	return atomic.LoadInt64(&this.running) != 0
}

func (this *PeerProp) SetRunning(v bool) {
	if v {
		atomic.StoreInt64(&this.running, 1)
	} else {
		atomic.StoreInt64(&this.running, 0)
	}
}

func (this *PeerProp) WaitStopFinished() {
	this.stoppingWaitor.Wait()
}

func (this *PeerProp) IsStopping() bool {
	return atomic.LoadInt64(&this.stopping) != 0
}

func (this *PeerProp) StartStopping() {
	this.stoppingWaitor.Add(1)
	atomic.StoreInt64(&this.stopping, 1)
}

func (this *PeerProp) EndStopping() {

	if this.IsStopping() {
		this.stoppingWaitor.Done()
		atomic.StoreInt64(&this.stopping, 0)
	}

}

func (this *PeerProp) SetTransmitter(v MessageTransmitter) {
	this.transmit = v
}

func (this *PeerProp) SetHooker(v EventHooker) {
	this.hooker = v
}

func (this *PeerProp) SetCallback(v EventCallback) {
	this.callback = v
}

var notHandled = errors.New("Processor: Transimitter nil")

func (this *PeerProp) ReadMessage(ses Session) (msg interface{}, err error) {
	if this.transmit != nil {
		return this.transmit.OnRecvMessage(ses)
	}
	return nil, notHandled
}

func (this *PeerProp) SendMessage(ev Event) {
	if this.hooker != nil {
		ev = this.hooker.OnOutboundEvent(ev)
	}
	if this.transmit != nil && ev != nil {
		this.transmit.OnSendMessage(ev.Session(), ev.Message())
	}
}

func (this *PeerProp) ProcEvent(ev Event) {
	if this.hooker != nil {
		ev = this.hooker.OnInboundEvent(ev)
	}
	if this.callback != nil && ev != nil {
		this.callback(ev)
	}
}

func (this *PeerProp) SetSocketBuffer(readBufferSize, writeBufferSize int, noDelay bool) {
	this.readBufferSize = readBufferSize
	this.writeBufferSize = writeBufferSize
	this.noDelay = noDelay
}

func (self *PeerProp) SetSocketDeadline(read, write time.Duration) {
	self.readTimeout = read
	self.writeTimeout = write
}

func (self *PeerProp) SetMaxPacketSize(maxSize int) {
	self.maxPacketSize = maxSize
}

func (self *PeerProp) MaxPacketSize() int {
	return self.maxPacketSize
}

func (this *PeerProp) ApplySocketOption(conn net.Conn) {
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

func (this *PeerProp) ApplySocketReadTimeout(conn net.Conn, callback func()) {
	if this.readTimeout > 0 {
		conn.SetReadDeadline(time.Now().Add(this.readTimeout))
		callback()
		conn.SetReadDeadline(time.Time{})
	} else {
		callback()
	}
}

func (this *PeerProp) ApplySocketWriteTimeout(conn net.Conn, callback func()) {
	if this.writeTimeout > 0 {
		conn.SetWriteDeadline(time.Now().Add(this.writeTimeout))
		callback()
		conn.SetWriteDeadline(time.Time{})
	} else {
		callback()
	}
}

func (this *PeerProp) Init() {
	this.readBufferSize = -1
	this.writeBufferSize = -1
}
