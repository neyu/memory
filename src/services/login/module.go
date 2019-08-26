package main

import (
	"services/game/entity"

	"core/logs"
	// "core/xlib"
)

func _createNewAccount(ent *tb.AccountEntity) int32 {
	ent.SdkData = ""
	ent.ExData = ""
	ent.UserServers = ""
	id, code := accDao.Insert([]string{"name", "pwd", "channelId", "deviceId", "sdkData", "exData", "userServers"},
		[]interface{}{&ent.Name, &ent.Pwd, &ent.ChannelId, &ent.DeviceId, &ent.SdkData, &ent.ExData, &ent.UserServers})
	if code != 0 {
		logs.Debug("_createNewAccount err code:", code)
		return code
	}
	ent.Id = id

	return _newLoginKey(ent)
}

func _newLoginKey(ent *tb.AccountEntity) int32 {
	ent.LoginKey = "xxx"
	ent.LoginCount = 1
	ent.SdkData = "sdk_data"

	return accDao.Update([]string{"loginKey", "loginCount", "sdkData"},
		[]interface{}{&ent.LoginKey, &ent.LoginCount, &ent.SdkData, &ent.Id})
}
