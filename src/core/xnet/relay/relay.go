package relay

import (
	"core/codec"
	"core/log"
	"core/xlib"

	"errors"
)

var (
	ErrInvalidPeerSession = errors.New("Require valid lib.Session or lib.TCPConnector")
)

// payload: msg/bytes   passthrough: int64, []int64, string
func Relay(sesDetector interface{}, dataList ...interface{}) error {

	ses, err := getSession(sesDetector)
	if err != nil {
		//log.Errorln("relay.Relay:", err)
		log.Error("relay.Relay err:%v", err)
		return err
	}

	var ack RelayAck

	for _, payload := range dataList {
		switch value := payload.(type) {
		case int64:
			ack.Int64 = value
		case []int64:
			ack.Int64Slice = value

		case string:
			ack.Str = value
		case []byte: // 作为payload
			ack.Bytes = value
		default:
			if ack.MsgId == 0 {
				var meta *codec.MessageMeta
				ack.Msg, meta, err = codec.EncodeMessage(payload)

				if err != nil {
					return err
				}

				ack.MsgId = uint32(meta.Id)
			} else {
				panic("Multi message relay not support")
			}

		}
	}
	//fmt.Printf("relay.Relay:%+v\n", ack)
	ses.Send(&ack)

	return nil
}

func getSession(sesDetector interface{}) (lib.Session, error) {
	switch unknown := sesDetector.(type) {
	case lib.Session:
		return unknown, nil
	// case tcp.TCPConnector:
	// 	return unknown.Session(), nil
	default:
		return nil, ErrInvalidPeerSession
	}
}
