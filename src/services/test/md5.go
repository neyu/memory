package main

import (
	"crypto/hmac"
	"crypto/md5"
	"fmt"
	"io"
)

const (
	secret = "kshh1d23hsdas"
	id     = "1"
)

func main() {
	md5Sum()
	md5Hash()

	macHash()
}

func md5Sum() {
	data := []byte(secret)
	val := md5.Sum(data)

	fmt.Println(val)
	fmt.Printf("md5 sum %x\n", val)
	fmt.Println()
}

func md5Hash() {
	h := md5.New()
	io.WriteString(h, id)
	// io.WriteString(h, secret)
	val := h.Sum(nil)

	fmt.Println(val)
	fmt.Printf("md5 hsh %x\n", val)
	fmt.Println()
}

func macHash() {
	h := hmac.New(md5.New, []byte(id))
	io.WriteString(h, secret)
	val := h.Sum(nil)

	fmt.Println(val)
	fmt.Printf("mac hsh %x\n", val)
	fmt.Println()
}
