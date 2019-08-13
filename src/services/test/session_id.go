package main

import (
	"crypto/rand"
	"encoding/hex"
	"fmt"
)

func main() {
	sid, err := sessionID()
	if err != nil {
		return
	}
	fmt.Println("test generate session id:", sid)
}

//1字节8位2字符
//8字节64位16字符
//int8 1字节8位2字符 -128~127
//int16 2字节16位4字符 -63556~63555
//
func sessionID() (string, error) {
	b := make([]byte, 8) //int64
	n, err := rand.Read(b)
	if n != len(b) || err != nil {
		return "", fmt.Errorf("Could not successfully read from the system CSPRNG")
	}
	return hex.EncodeToString(b), nil
}
