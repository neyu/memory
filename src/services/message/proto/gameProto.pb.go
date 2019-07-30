// Code generated by protoc-gen-go. DO NOT EDIT.
// source: gameProto.proto

package gameProto

import (
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

// chat service
//-----------------------------------------------------------------------------
type ContentReq struct {
	Msg                  string   `protobuf:"bytes,1,opt,name=Msg,proto3" json:"Msg,omitempty"`
	Value                int32    `protobuf:"varint,2,opt,name=Value,proto3" json:"Value,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *ContentReq) Reset()         { *m = ContentReq{} }
func (m *ContentReq) String() string { return proto.CompactTextString(m) }
func (*ContentReq) ProtoMessage()    {}
func (*ContentReq) Descriptor() ([]byte, []int) {
	return fileDescriptor_f75c29d4c87a5733, []int{0}
}

func (m *ContentReq) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ContentReq.Unmarshal(m, b)
}
func (m *ContentReq) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ContentReq.Marshal(b, m, deterministic)
}
func (m *ContentReq) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ContentReq.Merge(m, src)
}
func (m *ContentReq) XXX_Size() int {
	return xxx_messageInfo_ContentReq.Size(m)
}
func (m *ContentReq) XXX_DiscardUnknown() {
	xxx_messageInfo_ContentReq.DiscardUnknown(m)
}

var xxx_messageInfo_ContentReq proto.InternalMessageInfo

func (m *ContentReq) GetMsg() string {
	if m != nil {
		return m.Msg
	}
	return ""
}

func (m *ContentReq) GetValue() int32 {
	if m != nil {
		return m.Value
	}
	return 0
}

type ContentAck struct {
	Msg                  string   `protobuf:"bytes,1,opt,name=Msg,proto3" json:"Msg,omitempty"`
	Value                int32    `protobuf:"varint,2,opt,name=Value,proto3" json:"Value,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *ContentAck) Reset()         { *m = ContentAck{} }
func (m *ContentAck) String() string { return proto.CompactTextString(m) }
func (*ContentAck) ProtoMessage()    {}
func (*ContentAck) Descriptor() ([]byte, []int) {
	return fileDescriptor_f75c29d4c87a5733, []int{1}
}

func (m *ContentAck) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ContentAck.Unmarshal(m, b)
}
func (m *ContentAck) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ContentAck.Marshal(b, m, deterministic)
}
func (m *ContentAck) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ContentAck.Merge(m, src)
}
func (m *ContentAck) XXX_Size() int {
	return xxx_messageInfo_ContentAck.Size(m)
}
func (m *ContentAck) XXX_DiscardUnknown() {
	xxx_messageInfo_ContentAck.DiscardUnknown(m)
}

var xxx_messageInfo_ContentAck proto.InternalMessageInfo

func (m *ContentAck) GetMsg() string {
	if m != nil {
		return m.Msg
	}
	return ""
}

func (m *ContentAck) GetValue() int32 {
	if m != nil {
		return m.Value
	}
	return 0
}

func init() {
	proto.RegisterType((*ContentReq)(nil), "gameProto.ContentReq")
	proto.RegisterType((*ContentAck)(nil), "gameProto.ContentAck")
}

func init() { proto.RegisterFile("gameProto.proto", fileDescriptor_f75c29d4c87a5733) }

var fileDescriptor_f75c29d4c87a5733 = []byte{
	// 103 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0xe2, 0x4f, 0x4f, 0xcc, 0x4d,
	0x0d, 0x28, 0xca, 0x2f, 0xc9, 0xd7, 0x2b, 0x00, 0x91, 0x42, 0x9c, 0x70, 0x01, 0x25, 0x13, 0x2e,
	0x2e, 0xe7, 0xfc, 0xbc, 0x92, 0xd4, 0xbc, 0x92, 0xa0, 0xd4, 0x42, 0x21, 0x01, 0x2e, 0x66, 0xdf,
	0xe2, 0x74, 0x09, 0x46, 0x05, 0x46, 0x0d, 0xce, 0x20, 0x10, 0x53, 0x48, 0x84, 0x8b, 0x35, 0x2c,
	0x31, 0xa7, 0x34, 0x55, 0x82, 0x49, 0x81, 0x51, 0x83, 0x35, 0x08, 0xc2, 0x41, 0xd2, 0xe5, 0x98,
	0x9c, 0x4d, 0xac, 0xae, 0x24, 0x36, 0xb0, 0xed, 0xc6, 0x80, 0x00, 0x00, 0x00, 0xff, 0xff, 0xba,
	0x8b, 0x71, 0xb7, 0x90, 0x00, 0x00, 0x00,
}
