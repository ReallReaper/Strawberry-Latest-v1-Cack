@echo off
set /a rand1=(%random%*8998/32768)+1000
set /a rand2=(%random%*8998/32768)+1000
PING localhost -n 1 >NUL

start "" /b /wait "%~dp0volumeid64.exe" c: %rand1%-%rand2% /accepteula
PING localhost -n 10 >NUL