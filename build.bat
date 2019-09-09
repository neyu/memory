@echo off

set GOPATH=%~dp0
echo %GOPATH%


echo build login...
go build -o bin/login.exe services/login

echo build gate...
go build -o bin/gate.exe services/gate

echo build game...
go build -o bin/game.exe services/game

::echo build hub...
::go build -o bin/hub.exe services/hub

::echo build web...
::go build -o bin/web.exe services/web

echo build client...
go build -o bin/client.exe services/client

echo build over !!!
echo.
pause&goto:eof
