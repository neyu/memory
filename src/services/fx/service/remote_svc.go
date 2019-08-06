package service

import (
	"core/log"
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

func AddRemoteService(ses lib.Session, svcid, name string) {

	connBySvcNameGuard.Lock()
	// 20190805 for test
	// ses.(lib.ContextSet).SetContext("ctx", &RemoteServiceContext{Name: name, SvcId: svcid})
	connBySvcId[svcid] = ses
	connBySvcNameGuard.Unlock()

	//log.SetColor("green").Infof("remote service added: '%s' sid: %d", svcid, ses.Id())
	log.Info("remote service added: '%s' sid: %d, connBySvcId:%+v", svcid, ses.Id(), connBySvcId)
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
		log.Info("remote service removed '%s' sid: %d connBySvcId:%+v", ctx.SvcId, ses.Id(), connBySvcId)
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

	// 20190805 for test
	// if raw, ok := ses.(lib.ContextSet).GetContext("ctx"); ok {
	// 	return raw.(*RemoteServiceContext)
	// }

	return nil
}

// 根据svcid获取远程服务的会话
func GetRemoteService(svcid string) lib.Session {
	connBySvcNameGuard.RLock()
	defer connBySvcNameGuard.RUnlock()

	log.Info("remote service query: '%s' connBySvcId: %+v", svcid, connBySvcId)

	if ses, ok := connBySvcId[svcid]; ok {

		return ses
	}

	return nil
}

// 遍历远程服务(已经连接到本进程)
func VisitRemoteService(callback func(ses lib.Session, ctx *RemoteServiceContext) bool) {
	connBySvcNameGuard.RLock()

	for _, ses := range connBySvcId {

		if !callback(ses, SessionToContext(ses)) {
			break
		}
	}

	connBySvcNameGuard.RUnlock()
}
