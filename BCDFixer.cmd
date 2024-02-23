:start
:init
@echo off
cls
if exist "%AppData%\9826\color.bat" (call "%AppData%\9826\color.bat") else color 0f
if not exist "%temp%\9826\BCDMast\items" mkdir "%temp%\9826\BCDMast\items"
title BCDFixer Ver. 0.4
mode con cols=70 lines=30
echo 由冰糖xh制作
echo.
cls

:selfCheck
bcdedit>nul
if not ERRORLEVEL 1 goto selfCheck2
echo 获取当前BCD内容发生错误，可能是没有管理员身份运行。
echo.
echo 本程序将尝试以管理员身份重启。
if not "%~1"=="" (
    echo.
    echo 检测到argv[1]不是空的，因此不一定能完美地自行提权。
    echo argv[1]==%1
    echo.
    echo 如果进入主菜单后，发现显示的BCD路径不正确，那么请自行以管理员身份运行。
    pause
)
echo.
ver|findstr "[3-5]\.[0-9]\.[0-9]*" 1>nul 2>nul && goto st
fltmc 1>nul 2>nul && goto st
set parameters=
:parameter
if not "%~1"=="" (
    set parameters=%parameters% %~1
    shift /1
    goto :parameter
)
set parameters="%parameters:~1%"

mshta vbscript:createobject("shell.application").shellexecute("%~s0",%parameters%,"","runas",1)(window.close) & exit
cd /d %~dp0 
rem 看的https://www.bilibili.com/read/cv20376190/

:st
:selfCheck2
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 (
    echo 未能启用命令扩展和延迟变量代入。
    echo.
    echo 本程序将立即退出。
    echo.
    pause
    goto end
)

:defineBCDStore
if "%1"=="~1" goto defineBCDStore1
if not "%~1"=="" (
    set store="%~1"
    echo 已检测到第1个参数，将直接进入主菜单。
    echo argv[1]==%1
    echo.
    pause
    goto defineBCDStore2
)
:defineBCDStore1
cls
echo 请先设置你要修改哪个BCD文件。
echo 如果为空，那么将使用当前系统BCD。
echo 没有写新建BCD的功能，请手动运行BCDBOOT。
echo.
echo 温馨提示：当你来到这里时已经是管理员身份，通常不能拖拽文件。
echo.
echo 在下方输入路径。无需手动添加双引号。
echo.
set store=
set /p "store=>"
:defineBCDStore2
if "%store%"=="" (
    if not "%store%"=="" set store=/store "%store:"=%"
) else (
    if not exist "%store:/store =%" (
        echo.
        echo 你输入的文件%store%不存在，请重新输入。
        echo.
        pause
        goto defineBCDStore
    ) else (
        set store=/store "%store:"=%"
    )
)
cls
set copied=0
set modified=1
set numSelected=-1
set menu=mainMenu
goto convertItems

:convertItems
if %modified%==1 (
    set currentItemGUID=未指定
    set currentItemDescription=未指定
    set numSelected=-1
    set modified=0
)
del /q "%temp%\9826\BCDMast\items\*.txt">nul
set num=-1
set A=
for /f "usebackq tokens=1,2 delims=" %%A in (`bcdedit %store% /enum ACTIVE /v`) do (
    set A=%%A
    if "!A:~0,7!"=="Windows" set /a num+=1
    echo %%A>>"%temp%\9826\BCDMast\items\item!num!.txt"
)
if %copied%==1 (
    set numSelected=%num%
    set copied=0
    goto defineSelection
)
goto %menu%

:mainMenu
set The operation completed successfully.=原来是用这种方式来解决的吗？太厉害了！
cls
echo                     BCD Fixer主菜单
echo.
if "%store%"=="" (echo 当前选定的存储：此系统的BCD) else (echo 当前选定的存储：%store:/store =%)
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%    %numSelected%
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo 下一次启动将先启动此项。
    )
)
echo.
echo [1]        选取一个启动项目
rem echo [2]        新建一个启动项目
if not %numSelected%==-1 echo [3]        复制当前启动项目
if not %numSelected%==-1 echo [4]        删除当前启动项目
if not %numSelected%==-1 echo [5]        将当前启动项目设置为默认
if not %numSelected%==-1 echo [6]        将当前启动项目设置为下次第一个启动
echo ----------------------------------------
echo [9]        更改BCD全局设定
echo [244]      切换另一个BCD文件
echo [738]      更改本程序全局设定
echo [0]        退出
echo.
echo 输入你选择的编号，然后按下Enter。
echo.
set slt=
set /p "slt=>"
if "%slt%"=="" goto mainMenu
if "%slt%"=="1" goto select
if "%slt%"=="2" goto create
if "%slt%"=="3" goto copy
if "%slt%"=="4" goto delete
if "%slt%"=="5" goto default
if "%slt%"=="6" goto bootSequenceAddFirst
if "%slt%"=="9" goto global
if "%slt%"=="244" goto defineBCDStore1
if "%slt%"=="738" goto settings
if "%slt%"=="0" goto end
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto mainMenu

:select
cls
:scan0
set num=-1
echo 第0个项目的描述通常是Windows Boot Manager，存储一些全局设定。
echo.
:scan1
set /a num+=1
if not exist "%temp%\9826\BCDMast\items\item%num%.txt" goto scan2
rem 在这个循环当中，第一个要显示的属性前加上显示启动项编号，最后一个要显示的属性后加上显示空行。
rem 这里只显示了两个属性。
for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%num%.txt") do (
    if %%A==标识符 (
        echo 启动项 %num%
        echo 标识符 %%B
    )
    if %%A==description (
        echo 项目描述 %%B %%C %%D %%E %%F %%G %%H %%I %%J
        echo.
    )
)
goto scan1
:scan2

:inquireSelection
echo 请输入你要修改的项目序号，然后按Enter。
rem echo 要修改当前操作系统，请输入{current}，包括花（大）括号。
echo.
set /p "numSelected=>"
:defineSelection
if "%numSelected%"=="{current}" (
    if "%store%"=="" (
        echo. & echo 该特性尚未完工，无法确定接下来的行为。 & echo. & pause
        for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
            if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
        set currentItemGUID={current}
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE`) do (
            set A=%%A
            if "!A:~0,7!"=="Windows" set /a num+=1
            if %%A==标识符 (
                if %%B=={current} set numSelected=!num!
            )
        )
        goto mainMenu
    ) else (
        echo.
        echo 当前选定的存储不是系统默认存储，所以不存在所谓的{current}。
        echo 请重新选定BCD文件。
        echo.
        pause
        goto defineBCDStore1
    )
)
if exist "%temp%\9826\BCDMast\items\item%numSelected%.txt" (
    for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%numSelected%.txt") do (
        rem echo 1
        if %%A==标识符 (
            set currentItemGUID=%%B
        )
        if %%A==description (
            set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
    )
) else (
    echo.
    echo 你的输入有误，请重新输入。
    echo.
    pause
    goto select
)
if "%numSelected%"=="{current}" (
    rem (test)此if语句废弃
)
goto mainMenu

:create
echo.
echo 前面的区域以后再来探索吧？
echo.
pause
goto mainMenu

:copy
cls
echo 请输入新启动项目的描述，无需输入双引号。
echo 如留空则不复制并返回。
echo 输入完毕后按Enter。
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto mainMenu
bcdedit %store% /copy %currentItemGUID% /d "%slt%"
echo.
echo 将选中新复制的项目。
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set copied=1
goto convertItems

:delete
cls
echo 天哪，我的老伙计，你要删除此项目吗？
echo 我是说，你真的要删除此项目吗？
echo.
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%
echo.
echo [1] 是的，我是说，真的     [0] 手滑了，不删除
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto delete
if "%slt%"=="1" goto delete1
if "%slt%"=="0" goto mainMenu
echo 你的输入有误，请重新输入。
echo.
pause
goto delete
:delete1
bcdedit %store% /delete %currentItemGUID% /cleanup
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set modified=1
set menu=mainMenu
goto convertItems

:default
echo.
bcdedit %store% /default %currentItemGUID%
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
goto convertItems

:bootSequenceAddFirst
goto bootSequenceAddFirst1
rem 没写好呢
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo 下一次启动将先启动此项。
    )
)
:bootSequenceAddFirst1
echo.
bcdedit %store% /bootsequence %currentItemGUID% /addfirst
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set modified=0
set menu=mainMenu
goto convertItems











:global
:globalMainMenu
cls
if "%store%"=="" (echo 当前选定的存储：此系统的BCD) else (echo 当前选定的存储：%store:/store =%)
echo.
echo [1]       修改显示菜单的时长
echo [2]       修改是否显示菜单
if "%store%"=="" echo [397]     导出当前系统BCD
if "%store%"=="" echo [467]     用外部文件替换当前系统BCD
echo [0]       返回主菜单
echo.
echo 输入你选择的编号，然后按下Enter。
set slt=
set /p "slt=>" 
echo.
if "%slt%"=="" goto globalMainMenu
if "%slt%"=="1" goto timeout
if "%slt%"=="2" (
    set boolName=displaybootmenu
    set menu=globalMainMenu
    goto changeBool
)
if "%slt%"=="397" goto currentExport
if "%slt%"=="467" goto currentImport
if "%slt%"=="0" goto mainMenu
echo 你的输入有误，请重新输入。
echo.
pause
goto globalMainMenu

:timeout
cls
set timeout=未指定
for /f "tokens=1,2" %%A in ('bcdedit %store%') do (
    if %%A==timeout set timeout=%%B
)
echo 当前菜单时长：%timeout%秒，暂时不确定该值为0的效果。
echo.
echo 请输入新的数值，只能是自然数。留空则保持不变。
echo.
set /p "timeout=>"
echo.
bcdedit %store% /timeout %timeout%
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
goto globalMainMenu

:changeBool
cls
set bool=未指定
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==%boolName% set bool=%%B
)
echo 当前布尔值为：%boolName%   %bool%
echo.
echo 请选择你要的值。输入..可返回。
echo [1] YES    [0] NO
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto changeBool
if "%slt%"=="1" goto changeBool1
if "%slt%"=="0" goto changeBool1
if "%slt%"==".." goto globalMainMenu
echo 你的输入有误，请重新输入。
echo.
pause
goto changeBool
:changeBool1
set bool=%slt%
bcdedit %store% /set {bootmgr} %boolName% %bool%
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
goto convertItems

:currentExport
cls
echo 你将要导出当前系统BCD。
echo 请输入目标文件路径，无需添加双引号。此处不检测路径是否有效。
echo 输入..可返回。
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentExport
if "%slt%"==".." goto globalMainMenu
bcdedit /export "%slt%"
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
goto globalMainMenu
:currentImport
cls
echo 你将要导入当前系统BCD。
echo 本程序会使用/clean参数。
echo 在EFI启动的系统上，这个参数会删除所有的现有固件启动项。
echo.
echo 请输入要导入的文件路径，无需输入双引号。
echo 输入..可返回。
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentImport
if "%slt%"==".." goto globalMainMenu
if not exist "%slt%" (
    echo 你输入的文件不存在，请重新输入。
    echo.
    pause
    goto currentImport
)
bcdedit /import "%slt%" /clean
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
goto globalMainMenu

:settings
:settingsMainMenu
cls
echo BCDMaster 设置
echo.
rem echo [1] 添加/删除右键菜单
echo [2] 管理界面颜色
echo [0] 返回主菜单
echo. 
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto settingsMainMenu
if "%slt%"=="1" goto contextMenuManage
if "%slt%"=="2" goto changeColor
if "%slt%"=="0" goto mainMenu
echo 你的输入有误，请重新输入。
echo.
pause
goto settingsMainMenu

:contextMenuManage
echo 该功能尚未完工。
echo.
pause
goto settingsMainMenu

:changeColor
if not exist "%AppData%\9826" mkdir "%AppData%\9826"
cls
echo 如果使用Windows 终端且设置了背景图片，那么建议使用黑白颜色。
echo.
echo 选择你要的颜色
echo [1]粉底 [2]黄色 [3]绿色 [4]亮紫 [5]蓝绿 [6]蓝底
echo [7]黑白 [8]绿底 [9]灰黑 [a]黄底 [b]紫底
echo.
set /p co=选择：
if "%co%"=="1" set co= & color df & echo color df>>"%AppData%\9826\color.bat"
if "%co%"=="2" set co= & color 0e & echo color 0e>>"%AppData%\9826\color.bat"
if "%co%"=="3" set co= & color 0a & echo color 0a>>"%AppData%\9826\color.bat"
if "%co%"=="4" set co= & color 0d & echo color 0d>>"%AppData%\9826\color.bat"
if "%co%"=="5" set co= & color 0b & echo color 0b>>"%AppData%\9826\color.bat"
if "%co%"=="6" set co= & color 1f & echo color 1f>>"%AppData%\9826\color.bat"
if "%co%"=="7" set co= & color 0f & echo color 0f>>"%AppData%\9826\color.bat"
if "%co%"=="8" set co= & color 2f & echo color 2f>>"%AppData%\9826\color.bat"
if "%co%"=="9" set co= & color 70 & echo color 70>>"%AppData%\9826\color.bat"
if /i "%co%"=="a" set co= & color 6f & echo color 6f>>"%AppData%\9826\color.bat"
if /i "%co%"=="b" set co= & color 5f & echo color 5f>>"%AppData%\9826\color.bat"
if "%co%"=="" pause & goto settingsMainMenu
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto changeColor

:end
del /q "%temp%\9826\BCDMast\items\*.txt">nul
rd /s /q "%temp%\9826\BCDMast\items">nul
rem pause
