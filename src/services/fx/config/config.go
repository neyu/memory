package config

import (
	"core/system"

	"encoding/json"
	// "fmt"
	"io/ioutil"
)

var (
	env string

	clientConf map[string]interface{}

	loginConf map[string]interface{}
	gateConf  map[string]interface{}
	gameConf  map[string]interface{}
	hubConf   map[string]interface{}
	projConf  map[string]interface{}
	webConf   map[string]interface{}

	mysqlConf map[string]interface{}
	redisConf map[string]interface{}
	mongoConf map[string]interface{}
)

func Init(_env string) {
	env = _env
	load()
}

func load() {
	clientConfPath := getConfPath("client.json")

	loginConfPath := getConfPath("login.json")
	gateConfPath := getConfPath("gate.json")
	gameConfPath := getConfPath("game.json")
	hubConfPath := getConfPath("hub.json")
	projConfPath := getConfPath("project.json")
	webConfPath := getConfPath("web.json")

	mysqlConfPath := getConfPath("mysql.json")
	redisConfPath := getConfPath("redis.json")
	mongoConfPath := getConfPath("mongo.json")

	loadConf(&clientConf, clientConfPath)

	loadConf(&loginConf, loginConfPath)
	loadConf(&gateConf, gateConfPath)
	loadConf(&gameConf, gameConfPath)
	loadConf(&hubConf, hubConfPath)
	loadConf(&projConf, projConfPath)
	loadConf(&webConf, webConfPath)

	loadConf(&mysqlConf, mysqlConfPath)
	loadConf(&redisConf, redisConfPath)
	loadConf(&mongoConf, mongoConfPath)
}

func Reload() {
	load()
}

func getConfPath(confFile string) string {
	return system.ROOT + "/config/" + env + "/" + confFile
}

func loadConf(data *map[string]interface{}, filePath string) {
	rawData, _ := ioutil.ReadFile(filePath)
	json.Unmarshal(rawData, data)

	// fmt.Printf("load config %s %+v\n", filePath, *data)
}

func GetClient() map[string]interface{} {
	return clientConf
}

func GetLogin() map[string]interface{} {
	return loginConf
}

func GetGate() map[string]interface{} {
	return gateConf
}

func GetGame() map[string]interface{} {
	return gameConf
}

func GetHub() map[string]interface{} {
	return hubConf
}

func GetProj() map[string]interface{} {
	return projConf
}

func GetWeb() map[string]interface{} {
	return webConf
}

func GetMysql() map[string]interface{} {
	return mysqlConf
}

func GetRedis() map[string]interface{} {
	return redisConf
}

func GetMongo() map[string]interface{} {
	return mongoConf
}
