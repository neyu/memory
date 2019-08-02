// Code generated by protoc-gen-go. DO NOT EDIT.
// source: hub.proto

package msgProto

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

type SubscribeChannelReq struct {
	Channel              string   `protobuf:"bytes,1,opt,name=Channel,proto3" json:"Channel,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *SubscribeChannelReq) Reset()         { *m = SubscribeChannelReq{} }
func (m *SubscribeChannelReq) String() string { return proto.CompactTextString(m) }
func (*SubscribeChannelReq) ProtoMessage()    {}
func (*SubscribeChannelReq) Descriptor() ([]byte, []int) {
	return fileDescriptor_b3103f8d3056b01c, []int{0}
}

func (m *SubscribeChannelReq) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_SubscribeChannelReq.Unmarshal(m, b)
}
func (m *SubscribeChannelReq) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_SubscribeChannelReq.Marshal(b, m, deterministic)
}
func (m *SubscribeChannelReq) XXX_Merge(src proto.Message) {
	xxx_messageInfo_SubscribeChannelReq.Merge(m, src)
}
func (m *SubscribeChannelReq) XXX_Size() int {
	return xxx_messageInfo_SubscribeChannelReq.Size(m)
}
func (m *SubscribeChannelReq) XXX_DiscardUnknown() {
	xxx_messageInfo_SubscribeChannelReq.DiscardUnknown(m)
}

var xxx_messageInfo_SubscribeChannelReq proto.InternalMessageInfo

func (m *SubscribeChannelReq) GetChannel() string {
	if m != nil {
		return m.Channel
	}
	return ""
}

type SubscribeChannelAck struct {
	Channel              string   `protobuf:"bytes,1,opt,name=Channel,proto3" json:"Channel,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *SubscribeChannelAck) Reset()         { *m = SubscribeChannelAck{} }
func (m *SubscribeChannelAck) String() string { return proto.CompactTextString(m) }
func (*SubscribeChannelAck) ProtoMessage()    {}
func (*SubscribeChannelAck) Descriptor() ([]byte, []int) {
	return fileDescriptor_b3103f8d3056b01c, []int{1}
}

func (m *SubscribeChannelAck) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_SubscribeChannelAck.Unmarshal(m, b)
}
func (m *SubscribeChannelAck) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_SubscribeChannelAck.Marshal(b, m, deterministic)
}
func (m *SubscribeChannelAck) XXX_Merge(src proto.Message) {
	xxx_messageInfo_SubscribeChannelAck.Merge(m, src)
}
func (m *SubscribeChannelAck) XXX_Size() int {
	return xxx_messageInfo_SubscribeChannelAck.Size(m)
}
func (m *SubscribeChannelAck) XXX_DiscardUnknown() {
	xxx_messageInfo_SubscribeChannelAck.DiscardUnknown(m)
}

var xxx_messageInfo_SubscribeChannelAck proto.InternalMessageInfo

func (m *SubscribeChannelAck) GetChannel() string {
	if m != nil {
		return m.Channel
	}
	return ""
}

type SvcStatusAck struct {
	SvcId                string   `protobuf:"bytes,1,opt,name=SvcId,proto3" json:"SvcId,omitempty"`
	UserCount            int32    `protobuf:"varint,2,opt,name=UserCount,proto3" json:"UserCount,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *SvcStatusAck) Reset()         { *m = SvcStatusAck{} }
func (m *SvcStatusAck) String() string { return proto.CompactTextString(m) }
func (*SvcStatusAck) ProtoMessage()    {}
func (*SvcStatusAck) Descriptor() ([]byte, []int) {
	return fileDescriptor_b3103f8d3056b01c, []int{2}
}

func (m *SvcStatusAck) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_SvcStatusAck.Unmarshal(m, b)
}
func (m *SvcStatusAck) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_SvcStatusAck.Marshal(b, m, deterministic)
}
func (m *SvcStatusAck) XXX_Merge(src proto.Message) {
	xxx_messageInfo_SvcStatusAck.Merge(m, src)
}
func (m *SvcStatusAck) XXX_Size() int {
	return xxx_messageInfo_SvcStatusAck.Size(m)
}
func (m *SvcStatusAck) XXX_DiscardUnknown() {
	xxx_messageInfo_SvcStatusAck.DiscardUnknown(m)
}

var xxx_messageInfo_SvcStatusAck proto.InternalMessageInfo

func (m *SvcStatusAck) GetSvcId() string {
	if m != nil {
		return m.SvcId
	}
	return ""
}

func (m *SvcStatusAck) GetUserCount() int32 {
	if m != nil {
		return m.UserCount
	}
	return 0
}

type ServiceIdentifyAck struct {
	SvcName              string   `protobuf:"bytes,1,opt,name=SvcName,proto3" json:"SvcName,omitempty"`
	SvcId                string   `protobuf:"bytes,2,opt,name=SvcId,proto3" json:"SvcId,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *ServiceIdentifyAck) Reset()         { *m = ServiceIdentifyAck{} }
func (m *ServiceIdentifyAck) String() string { return proto.CompactTextString(m) }
func (*ServiceIdentifyAck) ProtoMessage()    {}
func (*ServiceIdentifyAck) Descriptor() ([]byte, []int) {
	return fileDescriptor_b3103f8d3056b01c, []int{3}
}

func (m *ServiceIdentifyAck) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_ServiceIdentifyAck.Unmarshal(m, b)
}
func (m *ServiceIdentifyAck) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_ServiceIdentifyAck.Marshal(b, m, deterministic)
}
func (m *ServiceIdentifyAck) XXX_Merge(src proto.Message) {
	xxx_messageInfo_ServiceIdentifyAck.Merge(m, src)
}
func (m *ServiceIdentifyAck) XXX_Size() int {
	return xxx_messageInfo_ServiceIdentifyAck.Size(m)
}
func (m *ServiceIdentifyAck) XXX_DiscardUnknown() {
	xxx_messageInfo_ServiceIdentifyAck.DiscardUnknown(m)
}

var xxx_messageInfo_ServiceIdentifyAck proto.InternalMessageInfo

func (m *ServiceIdentifyAck) GetSvcName() string {
	if m != nil {
		return m.SvcName
	}
	return ""
}

func (m *ServiceIdentifyAck) GetSvcId() string {
	if m != nil {
		return m.SvcId
	}
	return ""
}

func init() {
	proto.RegisterType((*SubscribeChannelReq)(nil), "msgProto.SubscribeChannelReq")
	proto.RegisterType((*SubscribeChannelAck)(nil), "msgProto.SubscribeChannelAck")
	proto.RegisterType((*SvcStatusAck)(nil), "msgProto.SvcStatusAck")
	proto.RegisterType((*ServiceIdentifyAck)(nil), "msgProto.ServiceIdentifyAck")
}

func init() { proto.RegisterFile("hub.proto", fileDescriptor_b3103f8d3056b01c) }

var fileDescriptor_b3103f8d3056b01c = []byte{
	// 178 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0xe2, 0xcc, 0x28, 0x4d, 0xd2,
	0x2b, 0x28, 0xca, 0x2f, 0xc9, 0x17, 0xe2, 0xc8, 0x2d, 0x4e, 0x0f, 0x00, 0xb1, 0x94, 0xf4, 0xb9,
	0x84, 0x83, 0x4b, 0x93, 0x8a, 0x93, 0x8b, 0x32, 0x93, 0x52, 0x9d, 0x33, 0x12, 0xf3, 0xf2, 0x52,
	0x73, 0x82, 0x52, 0x0b, 0x85, 0x24, 0xb8, 0xd8, 0xa1, 0x3c, 0x09, 0x46, 0x05, 0x46, 0x0d, 0xce,
	0x20, 0x18, 0x17, 0x9b, 0x06, 0xc7, 0xe4, 0x6c, 0x3c, 0x1a, 0x9c, 0xb8, 0x78, 0x82, 0xcb, 0x92,
	0x83, 0x4b, 0x12, 0x4b, 0x4a, 0x8b, 0x41, 0x2a, 0x45, 0xb8, 0x58, 0x83, 0xcb, 0x92, 0x3d, 0x53,
	0xa0, 0xea, 0x20, 0x1c, 0x21, 0x19, 0x2e, 0xce, 0xd0, 0xe2, 0xd4, 0x22, 0xe7, 0xfc, 0xd2, 0xbc,
	0x12, 0x09, 0x26, 0x05, 0x46, 0x0d, 0xd6, 0x20, 0x84, 0x80, 0x92, 0x0b, 0x97, 0x50, 0x70, 0x6a,
	0x51, 0x59, 0x66, 0x72, 0xaa, 0x67, 0x4a, 0x6a, 0x5e, 0x49, 0x66, 0x5a, 0x25, 0xd4, 0xce, 0xe0,
	0xb2, 0x64, 0xbf, 0xc4, 0xdc, 0x54, 0x98, 0x9d, 0x50, 0x2e, 0xc2, 0x0e, 0x26, 0x24, 0x3b, 0x92,
	0xd8, 0xc0, 0x9e, 0x37, 0x06, 0x04, 0x00, 0x00, 0xff, 0xff, 0x79, 0xa1, 0x81, 0x9d, 0x09, 0x01,
	0x00, 0x00,
}
