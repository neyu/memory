# memory
thousand years gone, we may revive with memory, to mark !

# we need following parts
1. gate
2. mq
3. web
4. game
5. cache/redis/mysql
6. consul

# what should i do for my mind
an open world for our memory to be continued

# 我们还需要解决以下问题
1. golang的channel并发与eventQueue式的并发哪个更好.
2. 底层消息对象池，消息数据队列的使用.
3. cache怎么雅的编写对接redis和mysql的接口.

// 登录验证服
login->mysql
login->redis
login<-client

// 网关，负责game与client消息转发
gate<-client
gate->login
gate->game

// 游戏逻辑
game<-gate
game->mysql
game->redis

// 日志统计
data_center->mongo

// 服务中心
hub<-login
hub<-gate
hub<-game
hub<-data_center

// 服务发现
discover
consul

