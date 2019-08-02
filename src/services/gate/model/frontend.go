package model

import (
	"core/lib"
)

var (
	FrontendSessionManager lib.SessionManager
	AgentSvcId             string // 网关id
)

func GetClientSession(sesid int64) lib.Session {

	return FrontendSessionManager.GetSession(sesid)
}

func GetUser(sesid int64) *User {
	return SessionToUser(GetClientSession(sesid))
}

// 创建一个网关用户
func CreateUser(clientSes lib.Session) *User {

	u := NewUser(clientSes)

	// 绑定到session上
	clientSes.(lib.ContextSet).SetContext("user", u)
	return u
}

// 用session获取用户
func SessionToUser(clientSes lib.Session) *User {

	if clientSes == nil {
		return nil
	}

	if raw, ok := clientSes.(lib.ContextSet).GetContext("user"); ok {
		return raw.(*User)
	}

	return nil
}

// 遍历所有的用户
func VisitUser(callback func(*User) bool) {
	FrontendSessionManager.VisitSession(func(clientSes lib.Session) bool {

		if u := SessionToUser(clientSes); u != nil {
			return callback(u)
		}

		return true
	})
}
