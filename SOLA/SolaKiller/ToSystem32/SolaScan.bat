@echo off
if not exist %systemroot%\system32\Rar.exe goto ERR2
color 27

for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do vol %%i:&if errorlevel 0 set %%i=1
if exist %systemroot%\SOLAResult.txt del %systemroot%\SOLAResult.txt
cls
echo ---------正在扫描病毒----------
if exist %systemroot%\SOLAADDRESS.TXT goto SD

if "%C%"=="1" echo 正在获取C盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b C:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%D%"=="1" echo 正在获取D盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b D:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%E%"=="1" echo 正在获取E盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b E:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%F%"=="1" echo 正在获取F盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b F:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%G%"=="1" echo 正在获取G盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b G:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%H%"=="1" echo 正在获取H盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b H:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%I%"=="1" echo 正在获取I盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b I:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%J%"=="1" echo 正在获取J盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b J:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%K%"=="1" echo 正在获取K盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b K:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%L%"=="1" echo 正在获取L盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b L:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%M%"=="1" echo 正在获取M盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b M:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%N%"=="1" echo 正在获取N盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b N:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%O%"=="1" echo 正在获取O盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b O:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%P%"=="1" echo 正在获取P盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b P:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Q%"=="1" echo 正在获取Q盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b Q:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%R%"=="1" echo 正在获取R盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b R:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%S%"=="1" echo 正在获取S盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b S:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%T%"=="1" echo 正在获取T盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b T:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%U%"=="1" echo 正在获取U盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b U:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%V%"=="1" echo 正在获取V盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b V:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%W%"=="1" echo 正在获取W盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b W:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%X%"=="1" echo 正在获取X盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b X:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Y%"=="1" echo 正在获取Y盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b Y:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Z%"=="1" echo 正在获取Z盘的文件目录...&FOR /F "delims=" %%i in ('dir /s /b Z:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
goto Result

:SD
FOR /F "delims=" %%i in (%systemroot%\SOLAADDRESS.TXT) do echo 正在获取"%%i"中的文件目录...&FOR /F "delims=" %%j in ('dir /s /b %%i\*.exe') do call %systemroot%\system32\CMDCheck.bat %%j
goto Result



:Result
if not exist %systemroot%\SOLAResult.txt goto ERR1
echo 本次扫描在如下文件中发现病毒并清除
type %systemroot%\SOLAResult.txt
pause>nul
goto End

:Err1
cls
echo 本次扫描未发现病毒。
pause>nul
goto End
:Err2
color 47
echo 找不到RAR.EXE，因此此程序无法正常工作。
Pause>nul
:End