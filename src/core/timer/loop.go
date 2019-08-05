package timer

import (
	"core/xlib"

	"sync/atomic"
	"time"
)

// 轻量级的持续Tick循环
type Loop struct {
	Context      interface{}
	Duration     time.Duration
	userCallback func(*Loop)

	running int64

	Queue lib.EventQueue
}

func (this *Loop) Running() bool {
	return atomic.LoadInt64(&this.running) != 0
}

func (this *Loop) setRunning(v bool) {

	if v {
		atomic.StoreInt64(&this.running, 1)
	} else {
		atomic.StoreInt64(&this.running, 0)
	}

}

// 开始Tick
func (this *Loop) Start() bool {

	if this.Running() {
		return false
	}

	atomic.StoreInt64(&this.running, 1)

	this.rawPost()

	return true
}

func (this *Loop) rawPost() {

	if this.Duration == 0 {
		panic("seconds can be zero in loop")
	}

	if this.Running() {
		After(this.Queue, this.Duration, func() {

			tick(this, false)
		}, nil)
	}
}

func (this *Loop) NextLoop() {

	this.Queue.Post(func() {
		tick(this, true)
	})
}

func (this *Loop) Stop() {

	this.setRunning(false)
}

// 马上调用一次用户回调
func (this *Loop) Notify() *Loop {
	this.userCallback(this)
	return this
}

func tick(ctx interface{}, nextLoop bool) {

	loop := ctx.(*Loop)

	if !nextLoop && loop.Running() {

		// 即便在Notify中发生了崩溃，也会使用defer再次继续循环
		defer loop.rawPost()
	}

	loop.Notify()
}

// 执行一个循环, 持续调用callback, 周期是duration
// context: 将context上下文传递到带有context指针的函数回调中
func NewLoop(q lib.EventQueue, duration time.Duration, callback func(*Loop), context interface{}) *Loop {

	this := &Loop{
		Context:      context,
		Duration:     duration,
		userCallback: callback,
		Queue:        q,
	}

	return this
}
