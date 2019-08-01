package lib

type Peer interface {
	Start() Peer
	Stop()
	TypeName() string

	Name() string
	Address() string
	Queue() EventQueue
	SetName(v string)
	SetAddress(v string)
	SetQueue(v EventQueue)
}
