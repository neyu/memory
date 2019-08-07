# memory
1. 20190720
2. thousand years gone, we may revive with memory, to mark !

# we need following parts
1. web/login
2. gate
3. game
4. hub
5. consul
6. redis/mysql
7. mq

# what should i do for my mind
an open world for our memory to be continued
服务太多不好维护，能整合到一起的服务决不拆成两个。核心服务自己维护，非核心的丢给第三方。
所有服务在计划之中创建，需要扩展的不必留框架来解决，直接编码。
一切以运行效率性能为主，假定服务是有限的，提升现有业务的逻辑和玩法的质量。
不为未知的未来做过度设计。不为非专业(不擅长学习)的小白做设计。


# 我们还需要解决以下问题
1. golang的channel并发与eventQueue式的并发哪个更好.
2. 底层消息对象池，消息数据队列的使用.
3. cache怎么雅的编写对接redis和mysql的接口.

// 网关、登录，广播，网络IO密集
web/login<-client
gate<-client
gate->game

// 游戏服务，计算密集
game<-gate
game->mysql
game->redis

// 服务中心
hub<-gate
hub<-game

// 服务发现，单机多进程，
consul

# 开始进业务逻辑
1. 20190807

