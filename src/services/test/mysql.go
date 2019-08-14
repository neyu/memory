package main

import (
	"services/fx/service"

	"core/logs"

	_ "github.com/go-sql-driver/mysql"

	"database/sql"
	"fmt"
)

func main() {

	// testNakedSql()

	testSqlClient()
}

func testNakedSql(db *sql.DB) {
	db, err := sql.Open("mysql", "root:123456@/test")
	checkErr(err)

	dbOperation(db)
}
func dbOperation(db *sql.DB) {
	fmt.Println("向user表添加一组数据")
	insert(db, "yuxj", 34, 1)
	insert(db, "zby", 20, 1)
	insert(db, "zsq", 25, 2)
	insert(db, "Mary", 20, 0)
	query(db)

	fmt.Println("准备删掉id=1的数据")
	remove(db)
	query(db)

	fmt.Println("更新id=2的数据")
	update(db)

	query(db)
}

//增加数据
func insert(db *sql.DB, name string, age int, gender int) {
	// db, err := sql.Open("mysql", "root:123456@/mm_h5")
	// checkErr(err)

	stmt, err := db.Prepare(`INSERT user (id,name,age,sex) values (?,?,?,?)`)
	checkErr(err)
	res, err := stmt.Exec(0, name, age, gender)
	checkErr(err)
	id, err := res.LastInsertId()
	checkErr(err)
	fmt.Println(id)
}

//删除数据
func remove(db *sql.DB) {
	// db, err := sql.Open("mysql", "root:123456@/test")
	// checkErr(err)

	stmt, err := db.Prepare(`DELETE FROM user WHERE id=?`)
	checkErr(err)
	res, err := stmt.Exec(1)
	checkErr(err)
	num, err := res.RowsAffected()
	checkErr(err)
	fmt.Println(num)
}

//更新数据
func update(db *sql.DB) {
	// db, err := sql.Open("mysql", "root:123456@/test")
	// checkErr(err)

	stmt, err := db.Prepare(`UPDATE user SET age=?,sex=? WHERE id=?`)
	checkErr(err)
	res, err := stmt.Exec(21, 2, 2)
	checkErr(err)
	num, err := res.RowsAffected()
	checkErr(err)
	fmt.Println(num)
}

//查询数据
func query(db *sql.DB) {
	// db, err := sql.Open("mysql", "root:123456@/test")
	// checkErr(err)

	rows, err := db.Query("SELECT * FROM user")
	checkErr(err)

	//    //普通demo
	for rows.Next() {
		var userid int
		var username string
		var userage int
		var usersex int

		cols, err := rows.Columns()
		if err != nil {
			fmt.Println("cols err:", err)
			continue
		}
		fmt.Println("cols:", cols)

		err = rows.Scan(&userid, &username, &userage, &usersex)
		checkErr(err)

		fmt.Print(userid, "\t")
		fmt.Print(username, "\t")
		fmt.Print(userage, "\t")
		fmt.Print(usersex)

		fmt.Println()
	}
}
func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}

func testSqlClient() {
	logs.Notice("test connection to mysql")
	service.StartMysql()

	_ = service.Db("mm").Raw()
	// _ = service.Db("h5").Raw()
	db3 := service.Db("test").Raw()

	dbOperation(db3.(*sql.DB))
}
