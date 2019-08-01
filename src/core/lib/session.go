package lib

// 长连接
type Session interface {
	Raw() interface{}
	Peer() Peer
	Send(msg interface{})
	Close()
	ID() int64
}
