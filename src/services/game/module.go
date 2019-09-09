package main

import (
	"services/game/entity"

	"core/logs"
)

func _handleAndGetData() int32 {
	// do something

	return _handleData()
}

func _handleData() int32 {
	// do something

	return _getOtherData()
}

func _getOtherData() int32 {
	// do something
}

func _handleLogin() {
	// save session, cache user data
}

func getIconId(tempId int32, sex int8) int32 {
	return 1
}

func _createHeroByTempId(userData, tempId, sex, count, cb) {

	hero := tb.NewHeroEntity()

	ret := heroDao.Find()

	id, ret := heroDao.Insert()

}
