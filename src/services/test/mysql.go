package main

import (
	//_ "crud/routers"
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	fmt.Println("向user_t表添加一组数据")
	insert("yuxj", 34, 1)
	insert("zby", 20, 1)
	insert("zsq", 25, 2)
	insert("Mary", 20, 0)

	fmt.Println("准备删掉id=1的数据")
	remove()

	fmt.Println("更新id=2的数据")
	update()

	query()
}

//增加数据
func insert(name string, age int, gender int) {
	db, err := sql.Open("mysql", "root@/xx_zt?charset=utf8")
	checkErr(err)

	stmt, err := db.Prepare(`INSERT user_t (userid,username,userage,usersex) values (?,?,?,?)`)
	checkErr(err)
	res, err := stmt.Exec(0, name, age, gender)
	checkErr(err)
	id, err := res.LastInsertId()
	checkErr(err)
	fmt.Println(id)
}

//删除数据
func remove() {
	db, err := sql.Open("mysql", "root@/xx_zt?charset=utf8")
	checkErr(err)

	stmt, err := db.Prepare(`DELETE FROM user_t WHERE userid=?`)
	checkErr(err)
	res, err := stmt.Exec(1)
	checkErr(err)
	num, err := res.RowsAffected()
	checkErr(err)
	fmt.Println(num)
}

//更新数据
func update() {
	db, err := sql.Open("mysql", "root@/xx_zt?charset=utf8")
	checkErr(err)

	stmt, err := db.Prepare(`UPDATE user_t SET userage=?,usersex=? WHERE userid=?`)
	checkErr(err)
	res, err := stmt.Exec(21, 2, 2)
	checkErr(err)
	num, err := res.RowsAffected()
	checkErr(err)
	fmt.Println(num)
}

//查询数据
func query() {
	db, err := sql.Open("mysql", "root@/xx_zt?charset=utf8")
	checkErr(err)

	rows, err := db.Query("SELECT * FROM user_t")
	checkErr(err)

	//    //普通demo
	for rows.Next() {
		var userid int
		var username string
		var userage int
		var usersex int

		rows.Columns()
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
