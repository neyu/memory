// Copyright 2014 beego Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package logs

import (
	"io"
	"runtime"
	"sync"
	"time"
)

type logWriter struct {
	sync.Mutex
	writer io.Writer
}

func newLogWriter(wr io.Writer) *logWriter {
	return &logWriter{writer: wr}
}

func (lg *logWriter) writeln(when time.Time, msg string) {
	lg.Lock()
	h, _, _ := formatTimeHeader(when)
	lg.writer.Write(append(append(h, msg...), '\n'))
	lg.Unlock()
}

const (
	y1  = `0123456789`
	y2  = `0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789`
	y3  = `0000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999`
	y4  = `0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789`
	mo1 = `000000000111`
	mo2 = `123456789012`
	d1  = `0000000001111111111222222222233`
	d2  = `1234567890123456789012345678901`
	h1  = `000000000011111111112222`
	h2  = `012345678901234567890123`
	mi1 = `000000000011111111112222222222333333333344444444445555555555`
	mi2 = `012345678901234567890123456789012345678901234567890123456789`
	s1  = `000000000011111111112222222222333333333344444444445555555555`
	s2  = `012345678901234567890123456789012345678901234567890123456789`
	ns1 = `0123456789`
)

func formatTimeHeader(when time.Time) ([]byte, int, int) {
	_, mo, d := when.Date()
	h, mi, s := when.Clock()
	ns := when.Nanosecond() / 1000000
	//len("2006/01/02 15:04:05.123 ")==24
	//len("01/02 15:04:05.123 ")==19
	var buf [19]byte
	var i = -5
	// buf[0+i] = y1[y/1000%10]
	// buf[1+i] = y2[y/100]
	// buf[2+i] = y3[y-y/100*100]
	// buf[3+i] = y4[y-y/100*100]
	// buf[4+i] = '/'
	buf[5+i] = mo1[mo-1]
	buf[6+i] = mo2[mo-1]
	buf[7+i] = '/'
	buf[8+i] = d1[d-1]
	buf[9+i] = d2[d-1]
	buf[10+i] = ' '
	buf[11+i] = h1[h]
	buf[12+i] = h2[h]
	buf[13+i] = ':'
	buf[14+i] = mi1[mi]
	buf[15+i] = mi2[mi]
	buf[16+i] = ':'
	buf[17+i] = s1[s]
	buf[18+i] = s2[s]
	buf[19+i] = '.'
	buf[20+i] = ns1[ns/100]
	buf[21+i] = ns1[ns%100/10]
	buf[22+i] = ns1[ns%10]

	buf[23+i] = ' '

	return buf[0:], d, h
}

var (
	green   = string([]byte{27, 91, 57, 55, 59, 52, 50, 109})
	white   = string([]byte{27, 91, 57, 48, 59, 52, 55, 109})
	yellow  = string([]byte{27, 91, 57, 55, 59, 52, 51, 109})
	red     = string([]byte{27, 91, 57, 55, 59, 52, 49, 109})
	blue    = string([]byte{27, 91, 57, 55, 59, 52, 52, 109})
	magenta = string([]byte{27, 91, 57, 55, 59, 52, 53, 109})
	cyan    = string([]byte{27, 91, 57, 55, 59, 52, 54, 109})

	w32Green   = string([]byte{27, 91, 52, 50, 109})
	w32White   = string([]byte{27, 91, 52, 55, 109})
	w32Yellow  = string([]byte{27, 91, 52, 51, 109})
	w32Red     = string([]byte{27, 91, 52, 49, 109})
	w32Blue    = string([]byte{27, 91, 52, 52, 109})
	w32Magenta = string([]byte{27, 91, 52, 53, 109})
	w32Cyan    = string([]byte{27, 91, 52, 54, 109})

	reset = string([]byte{27, 91, 48, 109})
)

var once sync.Once
var colorMap map[string]string

func initColor() {
	if runtime.GOOS == "windows" {
		green = w32Green
		white = w32White
		yellow = w32Yellow
		red = w32Red
		blue = w32Blue
		magenta = w32Magenta
		cyan = w32Cyan
	}
	colorMap = map[string]string{
		//by color
		"green":  green,
		"white":  white,
		"yellow": yellow,
		"red":    red,
		//by method
		"GET":     blue,
		"POST":    cyan,
		"PUT":     yellow,
		"DELETE":  red,
		"PATCH":   green,
		"HEAD":    magenta,
		"OPTIONS": white,
	}
}

// ColorByStatus return color by http code
// 2xx return Green
// 3xx return White
// 4xx return Yellow
// 5xx return Red
func ColorByStatus(code int) string {
	once.Do(initColor)
	switch {
	case code >= 200 && code < 300:
		return colorMap["green"]
	case code >= 300 && code < 400:
		return colorMap["white"]
	case code >= 400 && code < 500:
		return colorMap["yellow"]
	default:
		return colorMap["red"]
	}
}

// ColorByMethod return color by http code
func ColorByMethod(method string) string {
	once.Do(initColor)
	if c := colorMap[method]; c != "" {
		return c
	}
	return reset
}

// ResetColor return reset color
func ResetColor() string {
	return reset
}