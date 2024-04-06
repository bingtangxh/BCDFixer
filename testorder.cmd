@echo off
if not exist "%temp%\9826\BCDMast\items" mkdir "%temp%\9826\BCDMast\items"
SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION
set BCD1=C:\Users\ninei\Desktop\BCD0127
set num=0
set A=
for /f "usebackq tokens=1,2 delims=" %%A in (`bcdedit /store %BCD1% /enum ACTIVE /v`) do (
    set A=%%A
    if "!A:~0,7!"=="Windows" set /a num+=1
    @rem 这里其实不合适，并不是所有的启动项目类型都是Windows开头。以后会改进。
    echo %%A>>"%temp%\9826\BCDMast\items\item!num!.txt"
)