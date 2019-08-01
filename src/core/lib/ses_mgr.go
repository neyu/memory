package lib

import (
	"sync"
	"sync/atomic"
)

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

	SetIDBase(base int64)
}

type sessionManager struct {
	sesById sync.Map // 使用Id关联会话

	sesIDGen int64 // 记录已经生成的会话ID流水号

	count int64 // 记录当前在使用的会话数量
}

func (self *sessionManager) SetIDBase(base int64) {

	atomic.StoreInt64(&self.sesIDGen, base)
}

func (self *sessionManager) Count() int {
	return int(atomic.LoadInt64(&self.count))
}

func (self *sessionManager) Add(ses Session) {

	id := atomic.AddInt64(&self.sesIDGen, 1)

	atomic.AddInt64(&self.count, 1)

	ses.(interface {
		SetID(int64)
	}).SetID(id)

	self.sesById.Store(id, ses)
}

func (self *sessionManager) Remove(ses Session) {

	self.sesById.Delete(ses.ID())

	atomic.AddInt64(&self.count, -1)
}

// 获得一个连接
func (self *sessionManager) GetSession(id int64) Session {
	if v, ok := self.sesById.Load(id); ok {
		return v.(lib.Session)
	}

	return nil
}

func (self *sessionManager) VisitSession(callback func(Session) bool) {

	self.sesById.Range(func(key, value interface{}) bool {

		return callback(value.(lib.Session))

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
