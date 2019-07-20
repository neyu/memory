#!/bin/sh 

sh stop.sh

sleep 1
nohup bin/game_t -e local -s 1 > bin/game-1.log 2>&1 &
sleep 1
nohup bin/game_t -e local -s 2 > bin/game-2.log 2>&1 &

sleep 1
nohup bin/conn_t -e local -s 1 > bin/conn-1.log 2>&1 &
sleep 1
nohup bin/conn_t -e local -s 2 > bin/conn-2.log 2>&1 &

sleep 1
#nohup bin/api_t -e local -s 1 > bin/api.log 2>&1 &

