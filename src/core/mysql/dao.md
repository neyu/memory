# golang mysql有关的基础接口并不多，用好以下几个接口，能高效的处理所有mysql库存有关的问题

1. Exec执行一次命令（包括查询、删除、更新、插入等），不返回任何执行结果。参数args表示query中的占位参数。
func (db *DB) Exec(query string, args ...interface{}) (Result, error)

2. Query执行一次查询，返回多行结果（即Rows），一般用于执行select命令。参数args表示query中的占位参数。
func (db *DB) Query(query string, args ...interface{}) (*Rows, error)

3. QueryRow执行一次查询，并期望返回最多一行结果（即Row）。QueryRow总是返回非nil的值，直到返回值的Scan方法被调用时，才会返回被延迟的错误。
func (db *DB) QueryRow(query string, args ...interface{}) *Row

/////////////////////////////////////////////
4. Prepare创建一个准备好的状态用于之后的查询和命令。返回值可以同时执行多个查询和命令。
func (db *DB) Prepare(query string) (*Stmt, error)

5. Stmt是准备好的状态。Stmt可以安全的被多个go程同时使用。
func (s *Stmt) Exec(args ...interface{}) (Result, error)

6. Query使用提供的参数执行准备好的查询状态，返回Rows类型查询结果。
func (s *Stmt) Query(args ...interface{}) (*Rows, error)

7. QueryRow使用提供的参数执行准备好的查询状态。
func (s *Stmt) QueryRow(args ...interface{}) *Row

////////////////////////////////////////////////
8. Begin开始一个事务。
func (db *DB) Begin() (*Tx, error)

9. Exec执行命令，但不返回结果。例如执行insert和update。
func (tx *Tx) Exec(query string, args ...interface{}) (Result, error)

10. Query执行查询并返回零到多行结果（Rows），一般执行select命令。
func (tx *Tx) Query(query string, args ...interface{}) (*Rows, error)

11. QueryRow执行查询并期望返回最多一行结果（Row）
func (tx *Tx) QueryRow(query string, args ...interface{}) *Row

12. Prepare准备一个专用于该事务的状态
func (tx *Tx) Prepare(query string) (*Stmt, error)	

13. Stmt使用已存在的状态生成一个该事务特定的状态。
func (tx *Tx) Stmt(stmt *Stmt) *Stmt

14. Commit递交事务。
func (tx *Tx) Commit() error

15. Rollback放弃并回滚事务。
func (tx *Tx) Rollback() error

# 
1. select [fields] from table [where] [order by ] [limit]
2. insert into table set a=?,b=?
3. update table set a=?,b=? where ...
4. this.SetOrder("id desc").SetField("name,uid").Get(wh)




