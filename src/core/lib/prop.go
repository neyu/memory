package lib

type PeerProperty struct {
	name  string
	queue EventQueue
	addr  string
}

// 获取通讯端的名称
func (this *PeerProperty) Name() string {
	return this.name
}

// 获取队列
func (this *PeerProperty) Queue() cellnet.EventQueue {
	return this.queue
}

// 获取SetAddress中的侦听或者连接地址
func (this *PeerProperty) Address() string {

	return this.addr
}

func (this *PeerProperty) SetName(v string) {
	this.name = v
}

func (this *PeerProperty) SetQueue(v cellnet.EventQueue) {
	this.queue = v
}

func (this *PeerProperty) SetAddress(v string) {
	this.addr = v
}
