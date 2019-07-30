package main

import (
	"bufio"
	"core/libs"
	"core/log"
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

	remoteCall(loginSes, &gameProto.LoginReq{
		Version:  "1.0",
		Platform: "demo",
		Uid:      "1234",
	}, func(ack *gameProto.LoginAck) {
		if ack.Result == gameProto.ResultCode_NoError {
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
	remoteCall(agentSes, &gameProto.VerifyReq{
		GameToken: "token_xxx",
		GameSvcId: svcId,
	}, func(ack *gameProto.VerifyAck) {
		logs.Info("verify ack:", ack)
	})
}

func startPing() {
	timer.NewLoop(nil, time.Second*5, func(loop *timer.Loop) {
		gateSes.Send(&gameProto.PingAck{})
	}, nil).Start()
}

func startChat() {
	logs.Debug("Start chat now !")

	readConsole(func(word string) {
		// 1.测试远程过程调用
		// RemoteCall(gateSes, &gameProto.ChatREQ{
		// 	Content: word,
		// }, func(ack *gameProto.ChatACK) {
		// 	fmt.Println(ack.Content)
		// })

		// 2.直接消息发送
		gateSes.Send(&gameProto.ChatREQ{
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
