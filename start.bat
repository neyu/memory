@echo off

start bin/login
call:sleep 2000 login

start bin/game
call:sleep 2000 game

start bin/gate
call:sleep 2000 gate

::start bin/hub
::call:sleep 2000 hub

::start bin/web
::call:sleep 2000 web

echo wait for client...
::start bin/client

echo.
pause&goto:eof

::
:sleep
set /a time = %1/1000
echo sleep %time%s for %2...
echo Wscript.sleep 1000 > y.vbs
call y.vbs && del y.vbs
goto:eof