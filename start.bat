@echo off

start bin/discover
call:sleep 2000 discover

start bin/login
call:sleep 2000 login

start bin/agent
call:sleep 2000 agent

start bin/game
call:sleep 2000 game

start bin/hub
call:sleep 2000 hub

echo wait for client
//start bin/client

echo.
pause&goto:eof

::创建定时器
:sleep
set /a time = %1/1000
echo sleep %time%s for %2...
echo Wscript.sleep 1000 > y.vbs
call y.vbs && del y.vbs
goto:eof