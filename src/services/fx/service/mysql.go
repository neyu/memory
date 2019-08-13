package service

import (
	"services/fx/config"

	"core/logs"
	"core/mysql"
)

var sqlClients map[string]*mysql.Client

func StartMysql() {
	sqlClients = make(map[string]*mysql.Client)

	confs := config.GetMysql()
	index := 0
	logs.Info("mysql confs:", confs)
	for key, conf := range confs {
		dbAlias := key
		if index == 0 {
			dbAlias = "default"
		}
		index++

		client, err := mysql.NewClient(dbAlias, conf.(map[string]interface{}))
		if err != nil {
			logs.Error("create mysql client err:", dbAlias, err)
			continue
		}

		if client != nil {
			sqlClients[key] = client
			logs.Notice("mysql_" + key + "连接成功。。。")
		}
	}
	logs.Info("usable sql clients:", sqlClients)
}

func Db(dbAlias string) *mysql.Client {
	if cli, ok := sqlClients[dbAlias]; ok {
		return cli
	} else {
		logs.Debug("db [%s] nil", dbAlias)
		return nil
	}
}
