#!/bin/sh 

sh stop.sh

sleep 1
nohup bin/xlogin > bin/login.log 2>&1 &

sleep 1
nohup bin/xgame > bin/game.log 2>&1 &

sleep 1
nohup bin/xgate > bin/gate.log 2>&1 &

#sleep 1
#nohup bin/xhub > bin/hub.log 2>&1 &

#sleep 1
#nohup bin/xweb > bin/web.log 2>&1 &

