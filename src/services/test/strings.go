package main

import (
	"fmt"
	"strings"
)

func main() {
	str := `["1", "2"]`
	str = strings.Trim(str, "[]")
	fmt.Println(str)

	svrStr := strings.Split(str, ", ")
	svrs := []string{}
	for _, item := range svrStr {
		fmt.Println(item)

		svrs = append(svrs, strings.Trim(item, `"`))
	}

	fmt.Println(svrs[0])
	fmt.Println(svrs[1])
}
