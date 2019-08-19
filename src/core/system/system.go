package system

import (
	// "fmt"
	"os"
	"os/exec"

	// "path"
	"path/filepath"
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
	// fmt.Println("filepath.Base:", filepath.Base(curFilename))
	// fmt.Println("filepath.Dir:", filepath.Dir(curFilename))
	// fmt.Println("filepath.Ext:", filepath.Ext(curFilename))

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

	// ROOT = filepath.Dir(filepath.Dir(binaryPath))
	// ROOT = "D:/rpgGame2/memory"
	ROOT = "/work/cqh1"
}
