#!/bin/sh 

sh stop.sh

sleep 1
nohup bin/login_t -e local -s 1 > bin/login-1.log 2>&1 &

sleep 1
nohup bin/gate_t -e local -s 1 > bin/gate-1.log 2>&1 &

sleep 1
nohup bin/game_t -e local -s 1 > bin/game-1.log 2>&1 &

#sleep 1
#nohup bin/hub_t -e local -s 1 > bin/hub-1.log 2>&1 &

#sleep 1
#nohup bin/web_t -e local -s 1 > bin/web-1.log 2>&1 &

