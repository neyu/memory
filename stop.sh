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
		func xlogin
		func xgate
		func xgame
        #func hub_t
        #func web_t
    else
		func $1
fi
