package main

import (
	"services/msg/proto"

	"core/logs"
	"core/timer"
	"core/xlib"

	"bufio"
	"fmt"
	"os"
	"strings"
	"time"
)

var gateSes lib.Session

func main() {
	logs.Info("client, test for connector to login/gate...")

	gateAddr, _ := login()
	if gateAddr == "" {
		logs.Error("gate addr nil")
		return
	}

	gateSes = getGateSession(gateAddr)

	verifyGameToken("game_1")

	startPing()

	// loop for read console
	startChat()
}

func login() (gateAddr, svcId string) {
	logs.Info("ready to connect to login server")

	// loginSes := connectToLogin()
	loginSes := connectToLoginWs()
	if loginSes == nil {
		logs.Error("connect to login error")
		return
	}

	remoteCall(loginSes, &msgProto.LoginReq{
		Version:  "1.0",
		Platform: "demo",
		Uid:      "1234",
	}, func(ack *msgProto.LoginAck) {
		if ack.Result == msgProto.ResultCode_NoError {
			gateAddr = fmt.Sprintf("%s:%d", ack.Server.Ip, ack.Server.Port)
			svcId = ack.GameSvcId
		} else {
			panic(ack.Result.String())
		}
	})

	loginSes.Close()
	return
}

func getGateSession(addr string) (ret lib.Session) {
	done := make(chan struct{})

	go connectToGateWs(addr, func(ses lib.Session) {
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
	remoteCall(gateSes, &msgProto.VerifyReq{
		GameToken: "token_xxx",
		GameSvcId: svcId,
	}, func(ack *msgProto.VerifyAck) {
		logs.Info("verify ack:%+v", ack)
	})
}

func startPing() {
	timer.NewLoop(nil, time.Second*10, func(loop *timer.Loop) {
		logs.Info("ping...")
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
