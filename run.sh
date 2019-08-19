#!/bin/sh 

sh stop.sh

sleep 1
nohup bin/xlogin > bin/login-1.log 2>&1 &

sleep 1
nohup bin/xgate > bin/gate-1.log 2>&1 &

sleep 1
nohup bin/xgame > bin/game-1.log 2>&1 &

#sleep 1
#nohup bin/xhub > bin/hub-1.log 2>&1 &

#sleep 1
#nohup bin/xweb > bin/web-1.log 2>&1 &

