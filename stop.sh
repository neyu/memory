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
		func conn_t
		func game_t
        #func api_t
    else
		func $1
fi
