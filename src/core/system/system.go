package system

import (
	"os"
	"os/exec"
	"path/filepath"
	// "fmt"
)

var (
	ROOT string
)

func init() {
	initRootPath()
}

func initRootPath() {
	curFilename := os.Args[0]
	// fmt.Println("curFilename:", curFilename)

	binaryPath, err := exec.LookPath(curFilename)
	if err != nil {
		panic(err)
	}
	// fmt.Println("binaryPath:", binaryPath)

	binaryPath, err = filepath.Abs(binaryPath)
	if err != nil {
		panic(err)
	}
	// fmt.Println("abs.binaryPath:", binaryPath)

	ROOT = filepath.Dir(filepath.Dir(binaryPath))
}
