package mysql

import (
	"core/dict"
	"core/logs"
	"errors"

	"github.com/go-sql-driver/mysql"

	"database/sql"
	// "sync"
	"time"
)

type Client struct {
	addr string
	db   *sql.DB

	reconnDur   time.Duration
	poolConnCnt int
}

func (this *Client) IsReady() bool {
	return this.db != nil
}

func (this *Client) Raw() interface{} {
	return this.db
}

func (this *Client) Operate(callback func(Client interface{}) interface{}) interface{} {
	return callback(this.db)
}

func (this *Client) Start() {
	for {
		this.tryConnect()
		if this.reconnDur == 0 || this.IsReady() {
			break
		}
		time.Sleep(this.reconnDur)
	}
}

func (this *Client) Address() string {
	return this.addr
}

func (this *Client) SetAddress(v string) {
	this.addr = v
}

func (this *Client) ReconnDur() time.Duration {
	return this.reconnDur
}

func (this *Client) SetReconnDur(v time.Duration) {
	this.reconnDur = v
}

func (this *Client) tryConnect() {
	config, err := mysql.ParseDSN(this.Address())
	if err != nil {
		logs.Error("Invalid mysql DSN: %s, %s", this.Address(), err.Error())
		return
	}
	logs.Info("Connecting to mysql %s/%s...", config.Addr, config.DBName)

	db, err := sql.Open("mysql", this.Address())
	if err != nil {
		logs.Error("Open mysql database error: %s", err)
		return
	}

	// db不存在时不会立即报错，用ping检测一下
	err = db.Ping()
	if err != nil {
		if db != nil {
			// logs.Error("db:%+v", db)
			db.Close()
		}
		logs.Error("ping err:", err)
		return
	}

	db.SetMaxOpenConns(this.poolConnCnt)
	db.SetMaxIdleConns(this.poolConnCnt / 2)

	this.db = db

	if config != nil {
		logs.Notice("Connected to mysql %s/%s", config.Addr, config.DBName)
	}
}

func (this *Client) Stop() {
	if this.db != nil {
		this.db.Close()
		this.db = nil
	}
}

func NewClient(dbAlias string, conf map[string]interface{}) (*Client, error) {
	dbUser := dict.GetString(conf, "user")
	dbPwd := dict.GetString(conf, "pwd")
	dbHost := dict.GetString(conf, "host")
	dbPort := dict.GetString(conf, "port")
	dbName := dict.GetString(conf, "db")
	dbChar := dict.GetString(conf, "charset")

	//[username[:password]@][protocol[(address)]]/dbname[?param1=value1&...&paramN=valueN]
	dbSrcName := dbUser + ":" + dbPwd + "@tcp(" + dbHost + ":" + dbPort + ")/" + dbName + "?charset=" + dbChar

	cli := &Client{
		addr:        dbSrcName,
		poolConnCnt: 1,
	}
	cli.Start()

	if cli.IsReady() {
		return cli, nil
	} else {
		return nil, errors.New("connect to db error")
	}
}
