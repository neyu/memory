package util

import (
	"core/logs"

	"runtime"
)

func PrintPanicStack() {
	for i := 0; i < 10; i++ {
		funcName, file, line, ok := runtime.Caller(i)
		if ok {
			funcName := runtime.FuncForPC(funcName).Name()
			logs.Error("frame " + NumToString(i) + ":[func:" + funcName + ", file: " + file + ", line:" + NumToString(line) + "]")
		}
	}
}

func PrintPanicStackError() {
	if x := recover(); x != nil {
		logs.Error(x)
		PrintPanicStack()
	}
}

func CheckError(err error) {
	if err != nil {
		logs.Error("Fatal error: %v", err)
	}
}
