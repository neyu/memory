package lib

import (
	"fmt"
)

type SessionInit struct {
	//
}

type SessionAccepted struct {
	//
}

type SessionConnected struct {
	//
}

type SessionConnectError struct {
	//
}

type CloseReason int32

const (
	CloseReason_IO CloseReason = iota
	CloseReason_Manual
)

func (this CloseReason) String() string {
	switch this {
	case CloseReason_IO:
		return "IO"
	case CloseReason_Manual:
		return "Manual"
	}
	return "Unknown"
}

type SessionClosed struct {
	Reason CloseReason
}

type SessionCloseNotify struct {
	//
}

func (this *SessionInit) String() string         { return fmt.Sprintf("%+v", *this) }
func (this *SessionAccepted) String() string     { return fmt.Sprintf("%+v", *this) }
func (this *SessionConnected) String() string    { return fmt.Sprintf("%+v", *this) }
func (this *SessionConnectError) String() string { return fmt.Sprintf("%+v", *this) }
func (this *SessionClosed) String() string       { return fmt.Sprintf("%+v", *this) }
func (this *SessionCloseNotify) String() string  { return fmt.Sprintf("%+v", *this) }

func (this *SessionInit) SystemMessage()         {}
func (this *SessionAccepted) SystemMessage()     {}
func (this *SessionConnected) SystemMessage()    {}
func (this *SessionConnectError) SystemMessage() {}
func (this *SessionClosed) SystemMessage()       {}
func (this *SessionCloseNotify) SystemMessage()  {}
