package service

import (
	"core/logs"
	"core/xlib"

	"sync"
)

type RemoteServiceContext struct {
	Name  string
	SvcId string
}

type NotifyFunc func(ctx *RemoteServiceContext, ses lib.Session)

var (
	connBySvcId        = map[string]lib.Session{}
	connBySvcNameGuard sync.RWMutex
	removeNotify       NotifyFunc
)

func AddRemoteService(ses lib.Session, svcId, name string) {
	connBySvcNameGuard.Lock()
	defer connBySvcNameGuard.Unlock()

	ses.SetContext("ctx", &RemoteServiceContext{Name: name, SvcId: svcId})
	connBySvcId[svcId] = ses

	//log.SetColor("green").Infof("remote service added: '%s' sid: %d", svcid, ses.Id())
	logs.Info("remote service added: '%s' sid: %d, connBySvcId:%+v", svcId, ses.Id(), connBySvcId)
}

func RemoveRemoteService(ses lib.Session) {
	ctx := SessionToContext(ses)
	if ctx != nil {

		if removeNotify != nil {
			removeNotify(ctx, ses)
		}

		connBySvcNameGuard.Lock()
		delete(connBySvcId, ctx.SvcId)
		connBySvcNameGuard.Unlock()

		//log.SetColor("yellow").Infof("remote service removed '%s' sid: %d", ctx.SvcId, ses.Id())
		logs.Info("remote service removed '%s' sid: %d connBySvcId:%+v", ctx.SvcId, ses.Id(), connBySvcId)
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
	if raw, ok := ses.GetContext("ctx"); ok {
		return raw.(*RemoteServiceContext)
	}
	return nil
}

// 根据svcid获取远程服务的会话
func GetRemoteService(svcId string) lib.Session {
	connBySvcNameGuard.RLock()
	defer connBySvcNameGuard.RUnlock()

	logs.Info("remote service query: '%s' connBySvcId: %+v", svcId, connBySvcId)
	if ses, ok := connBySvcId[svcId]; ok {
		return ses
	}
	return nil
}

// 遍历远程服务(已经连接到本进程)
func VisitRemoteService(callback func(ses lib.Session, ctx *RemoteServiceContext) bool) {
	connBySvcNameGuard.RLock()
	defer connBySvcNameGuard.RUnlock()

	for _, ses := range connBySvcId {

		if !callback(ses, SessionToContext(ses)) {
			break
		}
	}
}
