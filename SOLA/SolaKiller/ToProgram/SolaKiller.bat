@echo off
color 27
set sola=%systemroot%\Fonts\HIDESE~1
set setup=%systemroot%\Fonts\HIDESE~1\solasetup

title SOLA病毒专杀软件 Made by KAKENHI.
if not exist %systemroot%\system32\Rar.exe goto ERR1
if not exist %systemroot%\system32\sleep.exe goto ERR2
:screen
cls
echo   欢迎，此程序可以帮助您清除计算机中的SOLA病毒。
echo   
echo   
echo   请输入命令：
echo   
echo   KILL     杀除系统中的SOLA病毒及硬盘根目录下的AUTORUN。
echo   SCAN     扫描被SOLA病毒感染的文件，进行文件杀毒。
echo   SET      进行SOLA专杀的相关设置。
echo   UNINST   卸载SOLA专杀程序。
echo   
set command=
set /p command=COMMAND:

if /i "%COMMAND%"=="KILL" goto Kill
if /i "%COMMAND%"=="SCAN" goto Scan
if /i "%COMMAND%"=="SET" goto Set
if /i "%COMMAND%"=="UNINST" goto Uninst
goto screen


:Scan
cls
call %systemroot%\System32\SolaScan.bat
goto screen


:Kill
cls
if not exist %sola%\sola.bat goto NoVirus
echo 请稍候，正在清除...
%systemdrive%
cd %sola%
rd /s /q %setup%
attrib %systemroot%\Tasks\Tasks.job -s -h -r
del %systemroot%\Tasks\Tasks.job
cd "%ALLUSERSPROFILE%\「开始」菜单\程序\启动"
if exist sola.vbs del sola.vbs
if exist tenbatsu.vbs del tenbatsu.vbs
del %sola%\sola.bat
goto UKiller
:NoVirus
set nobd=1
goto UKiller
:UKiller
cls&echo 正在检查磁盘C:&echo 检查结果：&set C=0 & echo 1>C:\solachk1 & findstr . C:\solachk1 & if not errorlevel 1 del C:\solachk1&findstr /C:"SOLA_1.0" C:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set C=1&attrib -s -h -r C:\Autorun.inf&del C:\Autorun.inf&del C:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘D:&echo 检查结果：&set D=0 & echo 1>D:\solachk1 & findstr . D:\solachk1 & if not errorlevel 1 del D:\solachk1&findstr /C:"SOLA_1.0" D:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set D=1&attrib -s -h -r D:\Autorun.inf&del D:\Autorun.inf&del D:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘E:&echo 检查结果：&set E=0 & echo 1>E:\solachk1 & findstr . E:\solachk1 & if not errorlevel 1 del E:\solachk1&findstr /C:"SOLA_1.0" E:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set E=1&attrib -s -h -r E:\Autorun.inf&del E:\Autorun.inf&del E:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘F:&echo 检查结果：&set F=0 & echo 1>F:\solachk1 & findstr . F:\solachk1 & if not errorlevel 1 del F:\solachk1&findstr /C:"SOLA_1.0" F:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set F=1&attrib -s -h -r F:\Autorun.inf&del F:\Autorun.inf&del F:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘G:&echo 检查结果：&set G=0 & echo 1>G:\solachk1 & findstr . G:\solachk1 & if not errorlevel 1 del G:\solachk1&findstr /C:"SOLA_1.0" G:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set G=1&attrib -s -h -r G:\Autorun.inf&del G:\Autorun.inf&del G:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘H:&echo 检查结果：&set H=0 & echo 1>H:\solachk1 & findstr . H:\solachk1 & if not errorlevel 1 del H:\solachk1&findstr /C:"SOLA_1.0" H:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set H=1&attrib -s -h -r H:\Autorun.inf&del H:\Autorun.inf&del H:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘I:&echo 检查结果：&set I=0 & echo 1>I:\solachk1 & findstr . I:\solachk1 & if not errorlevel 1 del I:\solachk1&findstr /C:"SOLA_1.0" I:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set I=1&attrib -s -h -r I:\Autorun.inf&del I:\Autorun.inf&del I:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘J:&echo 检查结果：&set J=0 & echo 1>J:\solachk1 & findstr . J:\solachk1 & if not errorlevel 1 del J:\solachk1&findstr /C:"SOLA_1.0" J:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set J=1&attrib -s -h -r J:\Autorun.inf&del J:\Autorun.inf&del J:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘K:&echo 检查结果：&set K=0 & echo 1>K:\solachk1 & findstr . K:\solachk1 & if not errorlevel 1 del K:\solachk1&findstr /C:"SOLA_1.0" K:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set K=1&attrib -s -h -r K:\Autorun.inf&del K:\Autorun.inf&del K:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘L:&echo 检查结果：&set L=0 & echo 1>L:\solachk1 & findstr . L:\solachk1 & if not errorlevel 1 del L:\solachk1&findstr /C:"SOLA_1.0" L:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set L=1&attrib -s -h -r L:\Autorun.inf&del L:\Autorun.inf&del L:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘M:&echo 检查结果：&set M=0 & echo 1>M:\solachk1 & findstr . M:\solachk1 & if not errorlevel 1 del M:\solachk1&findstr /C:"SOLA_1.0" M:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set M=1&attrib -s -h -r M:\Autorun.inf&del M:\Autorun.inf&del M:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘N:&echo 检查结果：&set N=0 & echo 1>N:\solachk1 & findstr . N:\solachk1 & if not errorlevel 1 del N:\solachk1&findstr /C:"SOLA_1.0" N:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set N=1&attrib -s -h -r N:\Autorun.inf&del N:\Autorun.inf&del N:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘O:&echo 检查结果：&set O=0 & echo 1>O:\solachk1 & findstr . O:\solachk1 & if not errorlevel 1 del O:\solachk1&findstr /C:"SOLA_1.0" O:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set O=1&attrib -s -h -r O:\Autorun.inf&del O:\Autorun.inf&del O:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘P:&echo 检查结果：&set P=0 & echo 1>P:\solachk1 & findstr . P:\solachk1 & if not errorlevel 1 del P:\solachk1&findstr /C:"SOLA_1.0" P:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set P=1&attrib -s -h -r P:\Autorun.inf&del P:\Autorun.inf&del P:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘Q:&echo 检查结果：&set Q=0 & echo 1>Q:\solachk1 & findstr . Q:\solachk1 & if not errorlevel 1 del Q:\solachk1&findstr /C:"SOLA_1.0" Q:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set Q=1&attrib -s -h -r Q:\Autorun.inf&del Q:\Autorun.inf&del Q:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘R:&echo 检查结果：&set R=0 & echo 1>R:\solachk1 & findstr . R:\solachk1 & if not errorlevel 1 del R:\solachk1&findstr /C:"SOLA_1.0" R:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set R=1&attrib -s -h -r R:\Autorun.inf&del R:\Autorun.inf&del R:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘S:&echo 检查结果：&set S=0 & echo 1>S:\solachk1 & findstr . S:\solachk1 & if not errorlevel 1 del S:\solachk1&findstr /C:"SOLA_1.0" S:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set S=1&attrib -s -h -r S:\Autorun.inf&del S:\Autorun.inf&del S:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘T:&echo 检查结果：&set T=0 & echo 1>T:\solachk1 & findstr . T:\solachk1 & if not errorlevel 1 del T:\solachk1&findstr /C:"SOLA_1.0" T:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set T=1&attrib -s -h -r T:\Autorun.inf&del T:\Autorun.inf&del T:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘U:&echo 检查结果：&set U=0 & echo 1>U:\solachk1 & findstr . U:\solachk1 & if not errorlevel 1 del U:\solachk1&findstr /C:"SOLA_1.0" U:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set U=1&attrib -s -h -r U:\Autorun.inf&del U:\Autorun.inf&del U:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘V:&echo 检查结果：&set V=0 & echo 1>V:\solachk1 & findstr . V:\solachk1 & if not errorlevel 1 del V:\solachk1&findstr /C:"SOLA_1.0" V:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set V=1&attrib -s -h -r V:\Autorun.inf&del V:\Autorun.inf&del V:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘W:&echo 检查结果：&set W=0 & echo 1>W:\solachk1 & findstr . W:\solachk1 & if not errorlevel 1 del W:\solachk1&findstr /C:"SOLA_1.0" W:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set W=1&attrib -s -h -r W:\Autorun.inf&del W:\Autorun.inf&del W:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘X:&echo 检查结果：&set X=0 & echo 1>X:\solachk1 & findstr . X:\solachk1 & if not errorlevel 1 del X:\solachk1&findstr /C:"SOLA_1.0" X:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set X=1&attrib -s -h -r X:\Autorun.inf&del X:\Autorun.inf&del X:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘Y:&echo 检查结果：&set Y=0 & echo 1>Y:\solachk1 & findstr . Y:\solachk1 & if not errorlevel 1 del Y:\solachk1&findstr /C:"SOLA_1.0" Y:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set Y=1&attrib -s -h -r Y:\Autorun.inf&del Y:\Autorun.inf&del Y:\SOLA\SOLA.BAT
cls&echo 正在检查磁盘Z:&echo 检查结果：&set Z=0 & echo 1>Z:\solachk1 & findstr . Z:\solachk1 & if not errorlevel 1 del Z:\solachk1&findstr /C:"SOLA_1.0" Z:\Autorun.inf &if not errorlevel 1 echo 发现病毒，正在清除...&set Z=1&attrib -s -h -r Z:\Autorun.inf&del Z:\Autorun.inf&del Z:\SOLA\SOLA.BAT
cls
echo 查杀结果报告：
if "%nobd%"=="1" echo WINDOWS系统中无SOLA病毒，在如下硬盘中找到SOLA病毒并杀除：
if not "%nobd%"=="1" echo WINDOWS系统中发现SOLA病毒，已杀除，并且在如下硬盘中找到SOLA病毒并杀除：
if "%C%"=="1" echo 磁盘:C
if "%D%"=="1" echo 磁盘:D
if "%E%"=="1" echo 磁盘:E
if "%F%"=="1" echo 磁盘:F
if "%G%"=="1" echo 磁盘:G
if "%H%"=="1" echo 磁盘:H
if "%I%"=="1" echo 磁盘:I
if "%J%"=="1" echo 磁盘:J
if "%K%"=="1" echo 磁盘:K
if "%L%"=="1" echo 磁盘:L
if "%M%"=="1" echo 磁盘:M
if "%N%"=="1" echo 磁盘:N
if "%O%"=="1" echo 磁盘:O
if "%P%"=="1" echo 磁盘:P
if "%Q%"=="1" echo 磁盘:Q
if "%R%"=="1" echo 磁盘:R
if "%S%"=="1" echo 磁盘:S
if "%T%"=="1" echo 磁盘:T
if "%U%"=="1" echo 磁盘:U
if "%V%"=="1" echo 磁盘:V
if "%W%"=="1" echo 磁盘:W
if "%X%"=="1" echo 磁盘:X
if "%Y%"=="1" echo 磁盘:Y
if "%Z%"=="1" echo 磁盘:Z
echo 按任意键返回。
pause>nul
goto screen



:Uninst
echo Windows Registry Editor Version 5.00>C:\Unreg
echo [-HKEY_CLASSES_ROOT\exefile\shell\SOLA病毒专杀]>>C:\Unreg
call %systemroot%\regedit.exe /s C:\Unreg >nul
del Unreg >nul
del %systemroot%\system32\solascan.bat
del %Programfiles%\KAKENHI'S\GUIChecker.bat
if not exist %Programfiles%\KAKENHI'S\* rd /s /q %Programfiles%\KAKENHI'S
rd /s /q "%USERPROFILE%\「开始」菜单\程序\SOLA病毒专杀"

goto End







:Set
cls
echo   SOLA的设置程序。
echo   
echo   
echo   请输入命令：
echo   
echo   ASSOC                取消或进行EXE文件右键检测的关联。
echo   ADDRESS              手动指定SCAN命令的文件扫描地址。
echo   -ADDRESS             恢复SCAN命令自动扫描文件。
echo   BACK                 回到程序的上一级界面。
echo   
set command=
set /p command=COMMAND:
if /i "%COMMAND%"=="BACK" goto screen
if /i "%COMMAND%"=="ASSOC" goto Assoc
if /i "%COMMAND%"=="ADDRESS" goto Address
if /i "%COMMAND%"=="-ADDRESS" goto KAddress
goto set

:address
if not exist %systemroot%\SOLAADDRESS.TXT type %systemroot%\system32\SOLAADDRESS.TXT>%systemroot%\SOLAADDRESS.TXT
cls
echo 请在记事本中输入扫描地址，并保存。
echo 例如，在记事本中输入以下内容：
echo C:\windows
echo D:\Game
echo E:
echo 然后关闭，选择保存。
echo 这样，在以后使用SCAN命令时，就只会扫描"C:\windows","D:\Game","E:"，这几个目录下的文件。
echo 如果想要回复自动扫描本机所有文件，请在SOLA的设置程序中输入-ADDRESS。
notepad %systemroot%\SOLAADDRESS.TXT
goto set

:KAddress
cls
if not exist %systemroot%\SOLAADDRESS.TXT echo 未手动指定SCAN命令的文件扫描地址。
if not exist %systemroot%\SOLAADDRESS.TXT pause>nul
if not exist %systemroot%\SOLAADDRESS.TXT goto set
del %systemroot%\SOLAADDRESS.TXT
echo 已恢复SCAN命令自动扫描文件。
pause>nul
goto set






:Assoc
if exist %systemroot%\assoc.txt goto Kias
echo >%systemroot%\assoc.txt
cscript %systemroot%\system32\regdata.vbs>nul
cls
echo 已进行EXE右键关联。
pause>nul
goto set
:Kias
del %systemroot%\assoc.txt
echo Windows Registry Editor Version 5.00>C:\Unreg
echo [-HKEY_CLASSES_ROOT\exefile\shell\SOLA病毒专杀]>>C:\Unreg
call %systemroot%\regedit.exe /s C:\Unreg >nul
del C:\Unreg >nul
cls
echo 已取消EXE右键关联。
pause>nul
goto set















goto Set





goto Screen

:Err1
color 47
echo 找不到RAR.EXE，因此本程序无法正常工作。
Pause>nul
goto End

:Err2
color 47
echo 找不到sleep.exe，因此本程序无法正常工作。
Pause>nul
goto End

:End