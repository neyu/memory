package main

import (
	"core/libs"
	"core/log"

	"os"
	"os/signal"
	"syscall"

	"fmt"
)

func init() {
	fmt.Println("login server init...")
}

func main() {
	fmt.Println("login server entry")

	queue := lib.NewEventQueue()
	queue.StartLoop()

	// queue.Wait()

	gPeer := createAcceptor(queue)

	// proc.BindProcessorHandler(gPeer, "NetProcName", messageHandler)
	// proc(bundle, userCallback, args...)
	// bundle := peer.(ProcessorBundle)
	gPeer.SetTransmitter(new(TCPMessageTransmitter))
	gPeer.SetHooker(new(MsgHooker))
	gPeer.SetCallback(proc.NewQueuedEventCallback(messageHandler))

	waitExitSignal()
	logs.Info("main exit!")
}

func waitExitSignal() {
	ch := make(chan os.Signal, 1)
	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT, syscall.SIGQUIT)

	logs.Info("receive system signal: %d", <-ch)
}

func createAcceptor(q lib.EventQueue) *lib.GenericPeer {
	p := &tcpAcceptor{
		SessionManager: new(peer.CoreSessionManager),
	}
	p.CoreTCPSocketOption.Init()

	gp := p.(lib.GenericPeer)
	gp.SetName("name")
	gp.SetAddress("addr")
	gp.SetQueue(q)
	return gp
}

func messageHandler(ev lib.Event) {
	fmt.Printf("client recv msg:%+v\n", ev.Message())
	switch msgObj := ev.Message().(type) {
	case *lib.SessionConnected:
		fmt.Println("client connected")
	case lib.SessionClosed:
		fmt.Println("client error")
	case *gameProto.ContentAck:
		fmt.Printf("sid:%d say:%s\n", msgObj.Value, msgObj.Msg)
	default:
		fmt.Printf("msg:%+v\n", msgObj)
	}
}

// 消息处理
var Handle_Game_Default func(ev lib.Event)

func messageHandler(ev lib.Event) {
	switch ev.Message().(type) {
	case *ChatREQ:
		Handle_Game_ChatREQ(ev)
	case *VerifyREQ:
		Handle_Game_VerifyREQ(ev)
	default:
		if Handle_Game_Default != nil {
			Handle_Game_Default(ev)
		}
	}
}

func Handle_Game_ChatREQ(incomingEv lib.Event) {
	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid proto.ClientID
		cid.ID = ev.ClientID

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcID = agentCtx.SvcID
		}

		// userHandler(incomingEv, cid)
		msg := incomingEv.Message().(*proto.ChatREQ)

		fmt.Printf("chat: %+v \n", msg.Content)

		// 消息广播到网关并发给客户端
		agentapi.BroadcastAll(&proto.ChatACK{
			Content: msg.Content,
		})

		// 消息单发给客户端
		agentapi.Send(&cid, &proto.TestACK{
			Dummy: "single send",
		})
	}
}

func Handle_Game_VerifyREQ(incomingEv lib.Event) {
	switch ev := incomingEv.(type) {
	case *backend.RecvMsgEvent:

		var cid proto.ClientID
		cid.ID = ev.ClientID

		if agentCtx := service.SessionToContext(ev.Session()); agentCtx != nil {
			cid.SvcID = agentCtx.SvcID
		}

		// userHandler(incomingEv, cid)
		msg := incomingEv.Message().(*proto.VerifyREQ)

		fmt.Printf("verfiy: %+v \n", msg.GameToken)

		service.Reply(incomingEv, &proto.VerifyACK{})
	}
}
