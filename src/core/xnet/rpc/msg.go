package rpc

// func (self *RemoteCallReq) GetMsgId() uint16   { return uint16(self.MsgId) }
func (self *RemoteCallReq) GetMsgData() []byte { return self.Data }

// func (self *RemoteCallReq) GetCallId() int64   { return self.CallId }

// func (self *RemoteCallAck) GetMsgId() uint16   { return uint16(self.MsgId) }
func (self *RemoteCallAck) GetMsgData() []byte { return self.Data }

// func (self *RemoteCallAck) GetCallId() int64   { return self.CallId }
