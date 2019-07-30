package proc

import (
	"core/libs"
)

// 处理器设置接口，由各Peer实现
type ProcessorBundle interface {

	// 设置 传输器，负责收发消息
	SetTransmitter(v lib.MessageTransmitter)

	// 设置 接收后，发送前的事件处理流程
	SetHooker(v lib.EventHooker)

	// 设置 接收后最终处理回调
	SetCallback(v lib.EventCallback)
}

// 让EventCallback保证放在ses的队列里，而不是并发的
func NewQueuedEventCallback(callback lib.EventCallback) lib.EventCallback {

	return func(ev lib.Event) {
		if callback != nil {
			lib.SessionQueuedCall(ev.Session(), func() {

				callback(ev)
			})
		}
	}
}

// 当需要多个Hooker时，使用NewMultiHooker将多个hooker合并成1个hooker处理
type MultiHooker []lib.EventHooker

func (self MultiHooker) OnInboundEvent(input lib.Event) (output lib.Event) {

	for _, h := range self {

		input = h.OnInboundEvent(input)

		if input == nil {
			break
		}
	}

	return input
}

func (self MultiHooker) OnOutboundEvent(input lib.Event) (output lib.Event) {

	for _, h := range self {

		input = h.OnOutboundEvent(input)

		if input == nil {
			break
		}
	}

	return input
}

func NewMultiHooker(h ...lib.EventHooker) lib.EventHooker {

	return MultiHooker(h)
}
