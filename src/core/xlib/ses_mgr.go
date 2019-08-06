package lib

import (
	"sync"
	"sync/atomic"
)

// 长连接
type Session interface {
	Raw() interface{}
	GetPeer() Peer
	Send(msg interface{})
	Close()
	Id() int64
}

// 完整功能的会话管理
type SessionManager interface {
	// cellnet.SessionAccessor
	GetSession(int64) Session
	VisitSession(func(Session) bool)
	SessionCount() int
	CloseAllSession()

	Add(Session)
	Remove(Session)
	Count() int

	SetIdBase(base int64)
}

type sessionManager struct {
	sesById sync.Map // 使用Id关联会话

	sesIdGen int64 // 记录已经生成的会话Id流水号

	count int64 // 记录当前在使用的会话数量
}

func (self *sessionManager) SetIdBase(base int64) {

	atomic.StoreInt64(&self.sesIdGen, base)
}

func (self *sessionManager) Count() int {
	return int(atomic.LoadInt64(&self.count))
}

func (self *sessionManager) Add(ses Session) {

	id := atomic.AddInt64(&self.sesIdGen, 1)

	atomic.AddInt64(&self.count, 1)

	ses.(interface {
		SetId(int64)
	}).SetId(id)

	self.sesById.Store(id, ses)
}

func (self *sessionManager) Remove(ses Session) {

	self.sesById.Delete(ses.Id())

	atomic.AddInt64(&self.count, -1)
}

// 获得一个连接
func (self *sessionManager) GetSession(id int64) Session {
	if v, ok := self.sesById.Load(id); ok {
		return v.(Session)
	}

	return nil
}

func (self *sessionManager) VisitSession(callback func(Session) bool) {

	self.sesById.Range(func(key, value interface{}) bool {

		return callback(value.(Session))

	})
}

func (self *sessionManager) CloseAllSession() {

	self.VisitSession(func(ses Session) bool {

		ses.Close()

		return true
	})
}

// 活跃的会话数量
func (self *sessionManager) SessionCount() int {

	v := atomic.LoadInt64(&self.count)

	return int(v)
}

func NewSessionManager() *sessionManager {
	this := &sessionManager{
		//
	}
	return this
}
