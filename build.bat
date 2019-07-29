@echo off

set GOPATH=%~dp0
echo %GOPATH%

echo build discover...
go build -o bin/discover.exe services/discover

echo build login...
go build -o bin/login.exe services/login

echo build agent...
go build -o bin/agent.exe services/agent

echo build game...
go build -o bin/game.exe services/game

echo build hub...
go build -o bin/hub.exe services/hub

echo build client...
go build -o bin/client.exe services/client

echo.
pause&goto:eof
