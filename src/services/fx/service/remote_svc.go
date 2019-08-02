package service

import (
	"core/xlib"

	"fmt"
	"sync"
)

type RemoteServiceContext struct {
	Name  string
	SvcID string
}

type NotifyFunc func(ctx *RemoteServiceContext, ses lib.Session)

var (
	connBySvcID        = map[string]lib.Session{}
	connBySvcNameGuard sync.RWMutex
	removeNotify       NotifyFunc
)

func AddRemoteService(ses lib.Session, svcid, name string) {

	connBySvcNameGuard.Lock()
	ses.(lib.ContextSet).SetContext("ctx", &RemoteServiceContext{Name: name, SvcID: svcid})
	connBySvcID[svcid] = ses
	connBySvcNameGuard.Unlock()

	//log.SetColor("green").Infof("remote service added: '%s' sid: %d", svcid, ses.ID())
	fmt.Printf("remote service added: '%s' sid: %d\n", svcid, ses.ID())
}

func RemoveRemoteService(ses lib.Session) {

	ctx := SessionToContext(ses)
	if ctx != nil {

		if removeNotify != nil {
			removeNotify(ctx, ses)
		}

		connBySvcNameGuard.Lock()
		delete(connBySvcID, ctx.SvcID)
		connBySvcNameGuard.Unlock()

		//log.SetColor("yellow").Infof("remote service removed '%s' sid: %d", ctx.SvcID, ses.ID())
		fmt.Printf("remote service removed '%s' sid: %d\n", ctx.SvcID, ses.ID())
	}
}

// 设置服务的通知
func SetRemoteServiceNotify(mode string, callback NotifyFunc) {

	switch mode {
	case "remove":
		removeNotify = callback
	default:
		panic("unknown notify mode")
	}
}

// 取得其他服务器的会话对应的上下文
func SessionToContext(ses lib.Session) *RemoteServiceContext {
	if ses == nil {
		return nil
	}

	if raw, ok := ses.(lib.ContextSet).GetContext("ctx"); ok {
		return raw.(*RemoteServiceContext)
	}

	return nil
}

// 根据svcid获取远程服务的会话
func GetRemoteService(svcid string) lib.Session {
	connBySvcNameGuard.RLock()
	defer connBySvcNameGuard.RUnlock()

	if ses, ok := connBySvcID[svcid]; ok {

		return ses
	}

	return nil
}

// 遍历远程服务(已经连接到本进程)
func VisitRemoteService(callback func(ses lib.Session, ctx *RemoteServiceContext) bool) {
	connBySvcNameGuard.RLock()

	for _, ses := range connBySvcID {

		if !callback(ses, SessionToContext(ses)) {
			break
		}
	}

	connBySvcNameGuard.RUnlock()
}
