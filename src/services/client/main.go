package main

import (
	"services/msg/proto"

	"core/log"
	"core/xlib"

	"bufio"
	"fmt"
	"os"
	"time"
)

var gateSes lib.Session

func main() {
	logs.Info("client, test for connector to login/gate...")

	gateAddr, gameSvcId := login()

	gateSes = getGateSession(gateAddr)

	verifyGameToken()

	startPing()

	// loop for read console
	startChat()
}

func login() (gateAddr, svcId string) {
	logs.Info("ready to connect to login server")

	loginSes := connectToLogin()

	remoteCall(loginSes, &msgProto.LoginReq{
		Version:  "1.0",
		Platform: "demo",
		Uid:      "1234",
	}, func(ack *msgProto.LoginAck) {
		if ack.Result == msgProto.ResultCode_NoError {
			gateAddr = fmt.Sprintf("%s:%d", ack.Server.IP, ack.Server.Port)
			svcId = ack.SvcId
		} else {
			panic(ack.Result.String())
		}
	})
	return
}

func getGateSession(addr string) (ret lib.Session) {
	done := make(chan struct{})

	go connectToGate(addr, func(ses lib.Session) {
		ret = ses
		done <- struct{}{}
	}, func() {
		logs.Error("connect to gate failed")
		os.Exit(0)
	})

	<-done

	logs.Debug("gate connection ready")
	return
}

func verifyGameToken(svcId string) {
	remoteCall(agentSes, &msgProto.VerifyReq{
		GameToken: "token_xxx",
		GameSvcId: svcId,
	}, func(ack *msgProto.VerifyAck) {
		logs.Info("verify ack:", ack)
	})
}

func startPing() {
	timer.NewLoop(nil, time.Second*5, func(loop *timer.Loop) {
		gateSes.Send(&msgProto.PingAck{})
	}, nil).Start()
}

func startChat() {
	logs.Debug("Start chat now !")

	readConsole(func(word string) {
		// 1.测试远程过程调用
		// RemoteCall(gateSes, &msgProto.ChatReq{
		// 	Content: word,
		// }, func(ack *msgProto.ChatAck) {
		// 	fmt.Println(ack.Content)
		// })

		// 2.直接消息发送
		gateSes.Send(&msgProto.ChatReq{
			Content: word,
		})
	})
}

func readConsole(callback func(string)) {
	for {
		// 从标准输入读取字符串，以\n为分割
		text, err := bufio.NewReader(os.Stdin).ReadString('\n')
		if err != nil {
			break
		}
		// 去掉读入内容的空白符
		text = strings.TrimSpace(text)
		callback(text)
	}
}
