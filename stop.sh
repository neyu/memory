#!/bin/sh 

function func(){
    killall -9 $1
	
	killall -0 $1
	while [ $? -ne 1 ]; do
		sleep 1
		killall -0 $1
	done
}

if [ $# -eq 0 ]
	then
		func login_t
		func gate_t
		func game_t
        #func hub_t
        #func web_t
    else
		func $1
fi
