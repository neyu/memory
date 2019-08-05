package util

import (
	"bufio"
	"bytes"
	"compress/zlib"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"runtime"
	"strings"
)

func WriteFull(writer io.Writer, buf []byte) error {
	total := len(buf)
	for pos := 0; pos < total; {
		n, err := writer.Write(buf[pos:])
		if err != nil {
			return err
		}
		pos += n
	}
	return nil
}

func ReadFileLines(filename string, callback func(line string) bool) error {
	f, err := os.Open(filename)
	if err != nil {
		return err
	}
	defer f.Close()

	reader := bufio.NewScanner(f)
	reader.Split(bufio.ScanLines)
	for reader.Scan() {
		if !callback(reader.Text()) {
			break
		}
	}
	return nil
}

func FileExists(name string) bool {
	if _, err := os.Stat(name); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}
	return true
}

func FileSize(name string) int64 {
	if info, err := os.Stat(name); err == nil {
		return info.Size()
	}
	return 0
}

func CompressBytes(data []byte) ([]byte, error) {
	var buf bytes.Buffer
	writer := zlib.NewWriter(&buf)
	_, err := writer.Write(data)
	if err != nil {
		return nil, err
	}
	writer.Close()

	return buf.Bytes(), nil
}

func DecompressBytes(data []byte) ([]byte, error) {
	reader, err := zlib.NewReader(bytes.NewReader(data))
	if err != nil {
		return nil, err
	}
	defer reader.Close()

	return ioutil.ReadAll(reader)
}

func StackToString(count int) string {
	const startStack = 2
	var sb strings.Builder
	var lastStr string
	for i := startStack; i < startStack+count; i++ {
		_, file, line, ok := runtime.Caller(i)
		var str string

		if ok {
			str = fmt.Sprintf("%s:%d", filepath.Base(file), line)
		} else {
			str = "??"
		}

		// 折叠??
		if lastStr != "??" || str != "??" {
			if i > startStack {
				sb.WriteString(" -> ")
			}

			sb.WriteString(str)
		}
		lastStr = str
	}
	return sb.String()
}
