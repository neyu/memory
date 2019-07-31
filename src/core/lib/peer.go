package lib

type Peer interface {
	Start() Peer
	Stop()
	TypeName() string
}
