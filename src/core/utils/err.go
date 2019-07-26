package utils

import "fmt"

type Error struct {
	s       string
	context interface{}
}

func (self *Error) Error() string {
	if self.context == nil {
		return self.s
	}
	return fmt.Sprintf("%s, '%v'", self.s, self.context)
}

func NewError(s string) error {
	return &Error{s: s}
}

func NewErrCxt(s string, context interface{}) error {
	return &Error{s: s, context: context}
}

// 判断网络错误
func IsEOFOrNetReadError(err error) bool {
	if err == io.EOF {
		return true
	}
	ne, ok := err.(*net.OpError)
	return ok && ne.Op == "read"
}
