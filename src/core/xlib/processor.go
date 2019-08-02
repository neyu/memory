package lib

type Event interface {
	Session() Session
	Message() interface{}
}

type MessageTransmitter interface {
	OnRecvMessage(ses Session) (msg interface{}, err error)
	OnSendMessage(ses Session, msg interface{}) error
}

type EventHooker interface {
	OnInboundEvent(input Event) (output Event)
	OnOutboundEvent(input Event) (output Event)
}

type EventCallback func(ev Event)

type ProcessorBundle interface {
	SetTransmitter(v MessageTransmitter)
	SetHooker(v EventHooker)
	SetCallback(v EventCallback)
}

// 让EventCallback保证放在ses的队列里，而不是并发的
func NewQueuedEventCallback(callback EventCallback) EventCallback {

	return func(ev Event) {
		if callback != nil {
			SessionQueuedCall(ev.Session(), func() {

				callback(ev)
			})
		}
	}
}

// 当需要多个Hooker时，使用NewMultiHooker将多个hooker合并成1个hooker处理
type MultiHooker []EventHooker

func (self MultiHooker) OnInboundEvent(input Event) (output Event) {

	for _, h := range self {

		input = h.OnInboundEvent(input)

		if input == nil {
			break
		}
	}

	return input
}

func (self MultiHooker) OnOutboundEvent(input Event) (output Event) {

	for _, h := range self {

		input = h.OnOutboundEvent(input)

		if input == nil {
			break
		}
	}

	return input
}

func NewMultiHooker(h ...EventHooker) EventHooker {

	return MultiHooker(h)
}
