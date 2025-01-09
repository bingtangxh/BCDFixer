
:start

:init

@echo off
cls

if exist "%AppData%\9826\color.bat" (call "%AppData%\9826\color.bat") else color 0f
if not exist "%temp%\9826\BCDFixer\items" (mkdir "%temp%\9826\BCDFixer\items") else rem
title BCDFixer 0.8.1
mode con cols=70 lines=50
echo 由 冰糖xh 制作
echo.
cls

:selfCheck

bcdedit>nul
if not ERRORLEVEL 1 (goto selfCheck2) else rem
echo 获取当前 BCD 内容发生错误，可能是没有管理员身份运行。
echo.
echo 本程序将尝试以管理员身份重启。
if not "%~1"=="" (
    echo.
    echo 检测到argv[1]不是空的，因此不一定能完美地自行提权。
    echo 本程序不允许路径含有空格。
    echo.
    echo argv[1]==%1
    echo.
    echo 如果进入主菜单后，发现显示的 BCD 路径不正确，那么请自行以管理员身份运行。
    pause
) else echo.
ver|findstr "[3-5]\.[0-9]\.[0-9]*" 1>nul 2>nul && goto st
fltmc 1>nul 2>nul && goto st
set parameters=
:parameter
if not "%~1"=="" (
    set parameters=%parameters% %~1
    rem 这里看似用了百分号，没有用感叹号，实际上这里不影响。
    shift /1
    goto parameter
) else set parameters="%parameters:~1%"

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
if "%1"=="~1" (goto defineBCDStore1) else rem
if not "%~1"=="" (
    set store="%~1"
    echo 已检测到第1个参数，将直接进入主菜单。
    echo argv[1]==%1
    echo.
    pause
    goto defineBCDStore2
) else rem
:defineBCDStore1
cls
echo 请先设置你要修改哪个 BCD 文件。
echo 如果为空，那么将使用当前系统 BCD。
echo 如需新建一个 BCD 文件，请输入 639 。
echo 如果你的 EFI ESP 分区没有盘符，你可以输入 334377 ，不用空格隔开。
echo 本程序会让你挑选分区，然后自动选中 BCD 文件。
echo.
echo 温馨提示：当你来到这里时已经是管理员身份，通常不能拖拽文件。
echo.
echo 在下方输入路径。无需手动添加双引号，但不能有空格。
echo.
set store=
set /p "store=>"
if "%store%"=="334377" goto assignNow
if "%store%"=="639" goto newBCDStore
:defineBCDStore2
if "%store%"=="" (
    if not "%store%"=="" set store=/store "%store:"=%"
) else (
    if not exist "%store:/store =%" (
        echo.
        echo 你输入的文件%store%不存在，请重新输入。
        echo.
        echo 如果你的路径含有空格，请重命名或移动文件使其路径不含空格。
        echo.
        pause
        goto defineBCDStore1
        rem 这里本来是跳转到defineBCDStore
        rem 但是这样的话，如果传递的argv[1]不存在，那么程序就会陷入死循环
        rem 所以改成如果检测到argv[1]不存在就强制要求用户输入
    ) else (
        set store=/store "%store:"=%"
    )
)
set copied=0
set modifiedData=1
set modifiedOrder=1
set numSelected=-1
set menu=mainMenu
goto convertItems

:assignNow
cls
echo list disk>%temp%\BCDFixerDiskPartScriptTemp.txt
echo exit>>%temp%\BCDFixerDiskPartScriptTemp.txt
diskpart /s %temp%\BCDFixerDiskPartScriptTemp.txt
echo.
set /p disk=请输入要选择的硬盘编号：
cls
echo select disk %disk% >%temp%\BCDFixerDiskPartScriptTemp.txt
echo list partition>>%temp%\BCDFixerDiskPartScriptTemp.txt
echo exit>>%temp%\BCDFixerDiskPartScriptTemp.txt
diskpart /s %temp%\BCDFixerDiskPartScriptTemp.txt
echo.
set /p partition=请输入要选择的分区编号：
cls
echo select disk %disk% >%temp%\BCDFixerDiskPartScriptTemp.txt
echo select partition %partition% >>%temp%\BCDFixerDiskPartScriptTemp.txt
for %%A in (Z Y X W V U T S R Q P O M N L K J I H G F E D C B A) do if not exist %%A: (
	set letter=%%A
	goto assignNow_pickLetterBreak
)
:assignNow_pickLetterBreak
echo assign letter='%letter%'>>%temp%\BCDFixerDiskPartScriptTemp.txt
echo exit>>%temp%\BCDFixerDiskPartScriptTemp.txt
diskpart /s %temp%\BCDFixerDiskPartScriptTemp.txt
echo.
pause
cls
bcdedit /store %letter%:\EFI\Microsoft\Boot\BCD >nul
if errorlevel 1 (
    echo 为你指定的分区分配了盘符 %letter%:
    echo 但是尝试读取 %letter%:\EFI\Microsoft\Boot\BCD 时出错。
    echo 接下来本程序将尝试读取 %letter%:\Boot\BCD。
) else (
    set store=/store "%letter%:\EFI\Microsoft\Boot\BCD"
    goto convertItems
)
bcdedit /store %letter%:\boot\bcd>nul
if errorlevel 1 (
    echo 读取 %letter%:\Boot\BCD 也失败了。
    echo 请重新尝试换一个分区或路径。
    echo.
    pause
    goto defineBCDStore1
) else (
    set store=/store "%letter%:\Boot\BCD"
    goto convertItems
)
set copied=0
set modifiedData=1
set modifiedOrder=1
set numSelected=-1
set menu=mainMenu
goto convertItems

:convertItems
cls
if %modifiedOrder%==1 (
    set currentItemGUID=未指定
    set currentItemDescription=未指定
    set numSelected=-1
    set modifiedOrder=0
) else rem
set modifiedData=0
del /q "%temp%\9826\BCDFixer\items\*.txt">nul
set num=-1
set A=
for /f "usebackq tokens=1,2 delims=" %%A in (`bcdedit %store% /enum ACTIVE /v`) do (
    set A=%%A
    if "!A:~0,11!"=="-----------" set /a num+=1
    echo %%A>>"%temp%\9826\BCDFixer\items\item!num!.txt"
)
if %copied%==1 (
    set numSelected=%num%
    set copied=0
    goto defineSelection
) else goto %menu%

:mainMenu
set The operation completed successfully.=原来是用这种方式来解决的吗？太厉害了！
cls
echo                     BCD Fixer 主菜单
echo.
if "%store%"=="" (
    echo 当前选定的存储：       此系统的 BCD
) else (
    echo 当前选定的存储：       %store:/store =%
)
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%    %numSelected%
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo 下一次启动将先启动此项。
    )
)
echo.
echo [1]        选取一个启动项目
echo [2]        新建一个启动项目（未实现）
if not %numSelected%==-1 echo [3]        复制当前启动项目
if not %numSelected%==-1 echo [4]        删除当前启动项目
if not %numSelected%==-1 echo [5]        将当前启动项目设置为默认
if not %numSelected%==-1 echo [6]        将当前启动项目设置为下次第一个启动
if not %numSelected%==-1 echo [7]        修改或删除一个单项条目的数据
if not %numSelected%==-1 echo [8]        添加一个单项条目的数据
if not %numSelected%==-1 echo [9]        编辑多个条目的数据（例如启动顺序）
if not %numSelected%==-1 echo [737]      快速指定启动分区为一个盘符
if not %numSelected%==-1 echo                  【不支持 Ramdisk 或 VHD(X) 中的系统】
echo ----------------------------------------
echo [223]      更改 BCD 全局设定
echo [738]      更改本程序全局设定
echo [244]      切换另一个 BCD 文件
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
if "%slt%"=="7" goto modify
if "%slt%"=="8" goto addNew
if "%slt%"=="9" goto editMultiValues
if "%slt%"=="737" goto quickSetdevice
if "%slt%"=="223" goto global
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
if exist "%temp%\9826\BCDFixer\items\item%num%.txt" (
    rem scan1这是一个循环，上一行是检测是否需要跳出。而scanElse在全部项目扫描完毕后执行。
    set /a "numPause=num%%5-1"
    if /i !numPause! EQU 0 (
        if /i %num% NEQ 1 (
            echo 留空直接按Enter可查看下一页。
            goto inquireSelection
        )   
    )
) else (
    set num=0
    echo 留空直接按Enter可回到第一页。
    goto inquireSelection
)
goto inquireSelection2
:inquireSelection
echo 请输入你要修改的项目序号，然后按Enter。
rem echo 要修改当前操作系统，请输入{current}，包括花（大）括号。
echo.
set numSelected=
set /p "numSelected=>"
if "!numSelected!"=="" (cls) else goto defineSelection


:inquireSelection2

rem 在这个循环当中，第一个要显示的属性前加上显示启动项编号，最后一个后加上显示空行。
rem 这里只显示了两个属性。
for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDFixer\items\item%num%.txt") do (
    if %%A==标识符 (
        echo 启动项   %num%
        echo 标识符   %%B
    )
    if %%A==device (
        echo 设备     %%B
    )
    if %%A==description (
        echo 项目描述 %%B %%C %%D %%E %%F %%G %%H %%I %%J
        echo.
    )
)
goto scan1

:scanElse
rem 这里就是两个标签行指向同一脚本块
:defineSelection
goto newC1
rem 该代码块大抵是废弃了
@REM if "%numSelected%"=="{current}" (
@REM     if not "%store%"=="" (
@REM         echo.
@REM         echo 当前选定的存储不是系统默认存储，所以不存在所谓的{current}。
@REM         echo 请重新选定BCD文件。
@REM         echo.
@REM         pause
@REM         goto defineBCDStore1
@REM     ) else (
@REM         for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
@REM             if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
@REM         )
@REM         set currentItemGUID={current}
@REM         goto mainMenu
@REM     )
@REM )
:newC1
if "%numSelected%"=="{current}" (
    if "%store%"=="" (
        rem echo. & echo 该特性尚未完工，无法确定接下来的行为。 & echo. & pause
        for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
            if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
        rem set currentItemGUID={current}
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE`) do (
            set A=%%A
            if "!A:~0,11!"=="-----------" set /a num+=1
            if %%A==标识符 (
                if %%B=={current} set numSelected=!num!
            )
        )
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE /v`) do (
            set A=%%A
            if "!A:~0,11!"=="-----------" set /a num+=1
            if %%A==标识符 (
                if /i !numSelected! EQU !num! (
                    set currentItemGUID=%%B
                )
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
if exist "%temp%\9826\BCDFixer\items\item%numSelected%.txt" (
    for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
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
goto mainMenu

:create
echo.
echo 前面的区域以后再来探索吧？
echo.
pause
goto mainMenu

:copy
cls
echo                     复制当前启动项目
echo.
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%
echo.
echo 请输入新启动项目的描述，无需输入双引号。
echo 如留空则不复制并返回。
echo.
echo 输入完毕后按 Enter。
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
echo                     删除当前启动项目
echo.
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
set modifiedOrder=1
set menu=mainMenu
goto convertItems

:default
echo.
bcdedit %store% /default %currentItemGUID%
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:bootSequenceAddFirst
goto bootSequenceAddFirst1
rem 没写好呢
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
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
set modifiedOrder=0
set menu=mainMenu
goto convertItems

:modify
cls
for /f "usebackq skip=2 tokens=1" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do @echo %%A
echo.
echo 以上是当前项目包含的数据名称，区分大小写。
echo 这里只能编辑单个数据。
echo 如果你编辑的包含多个数据（例如显示顺序），请使用另一个功能。
echo 请输入你要编辑的名称，然后按Enter。
echo 留空可返回。选择有效的名称后不能返回。
echo.
set nameSelected=
set /p "nameSelected=>"
if "%nameSelected%"=="" goto mainMenu 
if "%nameSelected%"=="path" goto setPath
:editSingleValue
set isNameSltExist=0
for /f "usebackq skip=2 tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
    if "!nameSelected!"=="%%A" (
        set isBool=0
        if "%%B"=="Yes" set isBool=1
        if "%%B"=="No" set isBool=1
        if !isBool!==1 (
            cls
            echo.
            echo 是否修改的!nameSelected!是布尔（Y或N）数值？
            echo.
            echo [1]是 [0]否
            echo.
            echo 输入选择并按Enter。
            echo.
            set slt=
            set /p "slt=>"
            echo.
            if "!slt!"=="1" set isNameSltExist=1 & set boolName=!nameSelected! & goto changeBool
            if "!slt!"=="0" (
                set isNameSltExist=1
                cls
                echo 当前选定的启动项目：   %currentItemDescription%
                echo 当前选定的GUID：       %currentItemGUID%
                echo 名称：%%A
                echo 数值：%%B
                echo.
                goto typeNewData
            )
            echo.
            echo 你的输入有误，请重新输入。
            echo.
            pause
            goto editSingleValue
        ) else (
            set isNameSltExist=1
            cls
            echo 当前选定的启动项目：   %currentItemDescription%
            echo 当前选定的GUID：       %currentItemGUID%
            echo 名称：%%A
            echo 数值：%%B %%C %%D %%E %%F %%G %%H %%I %%J
            echo.
            goto typeNewData
        )
    )
)
if %isNameSltExist%==0 (
    echo 你输入的名称%nameSelected%不存在，请重新输入。
    echo.
    pause
    goto modify
)
:typeNewData
echo.
echo 请输入新的数据。如果留空，则会删除这项数据。
echo.
echo 请直接在这里输入数据，禁止在此处输入任何双引号。
echo 如果你设置的数据需要双引号括起来（例如 description），那么就在结尾多输入一个空格。
echo 这样，本程序会自动去掉结尾的第一个空格，然后自动加上首尾的双引号。
echo.
set data=
set /p "data=>"
echo.
if "%data%"=="" (
    bcdedit %store% /deletevalue %currentItemGUID% %nameSelected%
) else (
    if /i "%nameSelected%"=="description" set currentItemDescription=%data:~0,-1%
    if "%data:~-1%"==" " set data="%data:~0,-1%"
    bcdedit %store% /set %currentItemGUID% %nameSelected% !data!
)
if ERRORLEVEL 1 echo 发生了错误。
echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:addNew
cls
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%
echo.
echo 请输入你要添加的数据名称，然后按Enter。
echo 将会检测是否与现有数据重复，留空可返回，输入名称后不能返回。
echo.
set nameSelected=
set /p "nameSelected=>"
if "%nameSelected%"=="" goto mainMenu
if "%nameSelected%"=="path" goto setPath
set isNameSltExist=0
for /f "usebackq skip=2 tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
    if "!nameSelected!"=="%%A" (
        set isNameSltExist=1
    )
)
:nameAlreadyExists
if %isNameSltExist%==1 (
    cls
    echo 你输入的名称%nameSelected%已经存在。
    echo 是否直接前往编辑？
    echo.
    echo [1]编辑单项数据 [2]编辑多项数据 [0]返回
    echo.
    set slt=0
    set /p "slt=>"
    if "!slt!"=="1" cls & goto editSingleValue
    if "!slt!"=="2" goto editMultiValues
    if "!slt!"=="0" goto addNew
    echo.
    echo 你的输入有误，请重新输入。
    echo.
    pause
    goto nameAlreadyExists
)
cls
echo 当前选定的启动项目：   %currentItemDescription%
echo 当前选定的GUID：       %currentItemGUID%
echo 当前选定的数据名称：   %nameSelected%
echo.
echo 请输入数据，然后按Enter。
echo.
echo 请直接在这里输入数据，禁止在此处输入任何双引号。
echo 如果你设置的数据需要双引号括起来（例如 description），那么就在结尾多输入一个空格。
echo 这样，本程序会自动去掉结尾的第一个空格，然后自动加上首尾的双引号。
echo.
set /p "data=>"
echo.
if /i "%nameSelected%"=="description" set currentItemDescription=%data%
if "%data:~-1%"==" " set data="%data:~0,-1%"
bcdedit %store% /set %currentItemGUID% %nameSelected% %data%
if ERRORLEVEL 1 echo 发生了错误。
echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:setPath
cls
echo 你将要设置的是路径。
echo 你可以在下方选择一个预先给好的路径，也可以输入自己想要的。
echo.
echo [1] \windows\system32\winload.efi
echo [2] \windows\system32\winload.exe
echo [3] \windows\system32\boot\winload.efi
echo [4] \windows\system32\boot\winload.exe
echo [5] \windows\system32\winresume.efi
echo [6] \EFI\Microsoft\Boot\bootmgfw.efi
echo [7] \EFI\Microsoft\Boot\memtest.efi
echo [0] 上面都不是我要的，我要自定义
echo.
set slt=
set /p slt=请输入你的选择，然后按 Enter，留空可返回：
if "%slt%"=="" goto mainMenu
if "%slt%"=="1" bcdedit %store% /set %currentItemGUID% path \windows\system32\winload.efi & goto setPathFinish
if "%slt%"=="2" bcdedit %store% /set %currentItemGUID% path \windows\system32\winload.exe & goto setPathFinish
if "%slt%"=="3" bcdedit %store% /set %currentItemGUID% path \windows\system32\boot\winload.efi & goto setPathFinish
if "%slt%"=="4" bcdedit %store% /set %currentItemGUID% path \windows\system32\boot\winload.exe & goto setPathFinish
if "%slt%"=="5" bcdedit %store% /set %currentItemGUID% path \windows\system32\winresume.efi & goto setPathFinish
if "%slt%"=="6" bcdedit %store% /set %currentItemGUID% path \EFI\Microsoft\Boot\bootmgfw.efi & goto setPathFinish
if "%slt%"=="7" bcdedit %store% /set %currentItemGUID% path \EFI\Microsoft\Boot\memtest.efi & goto setPathFinish
if "%slt%"=="0" goto customPath 
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto setPath

:customPath
cls
echo 请输入你的路径，留空可返回。此处不检测是否有效。
echo.
set data=
set /p "data=>"
if "%data%"=="" goto setPath
bcdedit %store% /set %currentItemGUID% path %path%
goto setPathFinish

:setPathFinish
if errorlevel 1 echo. & echo 发生了错误。
echo.
pause
set modifiedData=1
goto convertItems

:editMultiValues
cls
echo 当前指定的数值名称为：%nameSelected%
echo.
echo 请指定你要修改的数值名称是什么，如果留空则使用上面显示的。
echo 输入完毕后按 Enter。
set /p "nameSelected=>"
:editMultiValues1
cls
bcdedit /enum %currentItemGUID%
echo.
echo 请确认你要修改的数值。
echo.
pause
cls
echo 请在下方输入你要添加或删除的数值，然后后面紧跟一个数字：
echo [1] 添加到开头    [2] 添加到结尾    [3] 删除这个数值
echo.
echo 例如：删除 {current} ，就输入 {current}3 ，不用空格隔开。
echo 输入完毕后按 Enter ，留空可返回主菜单。
echo.
set data=
set /p "data=>"
if "%data%"=="" goto mainMenu
if "%data:~-1%"=="1" set data=%data:~-1% /addfirst
if "%data:~-1%"=="2" set data=%data:~-1% /addlast
if "%data:~-1%"=="3" set data=%data:~-1% /remove
cls
set modifiedData=1
bcdedit %store% /set %currentItemGUID% %nameSelected% %data%
if errorlevel 1 echo. & echo 发生了错误。
goto editMultiValuesFinish

:editMultiValuesFinish
echo.
echo 是否需要继续编辑？
echo.
echo [1] 继续编辑 %nameSelected%
echo [0] 返回主菜单
echo.
set slt=
set /p slt=请输入你的选择，然后按 Enter：
if "%slt%"=="1" goto editMultiValues1
if "%slt%"=="0" goto convertItems
echo.
echo 你的输入有误，请重新输入。
echo.
pause
cls
goto editMultiValuesFinish

:quickSetdevice
cls
echo 本功能目前只设定 device ，不设置 osdevice 。
for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%A: fsutil fsinfo drivetype %%A:
echo.
echo （只输入字母，不输入冒号，如果只能输入数字，那也可输入它在字母表中的序号来表示，例如 D 盘就输入 4， A 盘就输入 1）
set slt=
set /p slt=请输入你的选择，然后按 Enter，输入 0 可返回：
if exist "%slt%:" goto quickSetdevice1
if "%slt%"=="0" goto mainMenu
if "%slt%"=="1" set slt=A& goto quickSetdevice1
if "%slt%"=="2" set slt=B& goto quickSetdevice1
if "%slt%"=="3" set slt=C& goto quickSetdevice1
if "%slt%"=="4" set slt=D& goto quickSetdevice1
if "%slt%"=="5" set slt=E& goto quickSetdevice1
if "%slt%"=="6" set slt=F& goto quickSetdevice1
if "%slt%"=="7" set slt=G& goto quickSetdevice1
if "%slt%"=="8" set slt=H& goto quickSetdevice1
if "%slt%"=="9" set slt=I& goto quickSetdevice1
if "%slt%"=="10" set slt=J& goto quickSetdevice1
if "%slt%"=="11" set slt=K& goto quickSetdevice1
if "%slt%"=="12" set slt=L& goto quickSetdevice1
if "%slt%"=="13" set slt=M& goto quickSetdevice1
if "%slt%"=="14" set slt=N& goto quickSetdevice1
if "%slt%"=="15" set slt=O& goto quickSetdevice1
if "%slt%"=="16" set slt=P& goto quickSetdevice1
if "%slt%"=="17" set slt=Q& goto quickSetdevice1
if "%slt%"=="18" set slt=R& goto quickSetdevice1
if "%slt%"=="19" set slt=S& goto quickSetdevice1
if "%slt%"=="20" set slt=T& goto quickSetdevice1
if "%slt%"=="21" set slt=U& goto quickSetdevice1
if "%slt%"=="22" set slt=V& goto quickSetdevice1
if "%slt%"=="23" set slt=W& goto quickSetdevice1
if "%slt%"=="24" set slt=X& goto quickSetdevice1
if "%slt%"=="25" set slt=Y& goto quickSetdevice1
if "%slt%"=="26" set slt=Z& goto quickSetdevice1
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto quickSetdevice

:quickSetdevice1
cls
fsutil volume diskfree %slt%:
echo.
fsutil volume querylabel %slt%:
echo.
if exist %slt%:\Windows\nul (echo 在该分区下找到了 Windows 文件夹。) else (echo 该分区下没有 Windows 文件夹。)
rem if exist "%slt%:\Program Files\nul" (echo 在该分区下找到了 Program Files 文件夹。) else (echo 该分区下没有 Program Files 文件夹。)
if exist %slt%:\Users\nul (echo 在该分区下找到了 Users 文件夹。) else (echo 该分区下没有 Users 文件夹。)
echo.
echo 请确认这就是你要选择的盘符？
echo.
echo [1] 是的，我是说，真的    [0] 不，这不是，我要重选
echo.
set device=%slt%
set slt=
set /p slt=请输入你的选择，然后按 Enter：
if "%slt%"=="1" goto quickSetdevice2
if "%slt%"=="0" goto quickSetdevice
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto quickSetdevice1

:quickSetdevice2
bcdedit %store% /set %currentItemGUID% device partition=%device%:
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems



:global
:globalMainMenu
cls
echo                     更改 BCD 全局设定
echo.
if "%store%"=="" (echo 当前选定的存储：此系统的BCD) else (echo 当前选定的存储：%store:/store =%)
echo.
echo [1]       修改显示菜单的时长
echo [2]       修改是否显示菜单（会改为选定第0项）
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
    set numSelected=0
    set currentItemGUID={bootmgr}
    for /f "usebackq skip=2 tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
        if %%A==标识符 set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
    )
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
echo 当前菜单时长： %timeout% 秒，暂时不确定该值为0的效果。
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
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
    if %%A==%boolName% set bool=%%B
)
echo 当前选定的启动项目：   %currentItemDescription%
echo.
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
bcdedit %store% /set %currentItemGUID% %boolName% %bool%
echo.
if ERRORLEVEL 1 echo 发生了错误。 & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:currentExport
cls
echo 你将要导出当前系统 BCD 。
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
echo 你将要从外部导入并替换当前系统 BCD 。
echo 本程序会使用 /clean 参数。
echo 在 EFI 启动的系统上，这个参数会删除所有的现有固件启动项。
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
echo                     BCDFixer 设置
echo.
echo   当前本程序路径：%~dpnx0
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
echo.
echo 前面的区域以后再来探索吧？
echo.
pause
goto settingsMainMenu

:changeColor
if not exist "%AppData%\9826" mkdir "%AppData%\9826"
cls
echo 如果使用 Windows 终端且设置了背景图片，那么建议使用不带底色的配色。
echo.
echo 选择你要的颜色，字母不区分大小写。
echo.
echo [1]默认 [2]亮白 [3]绿色 [4]紫色 [5]蓝绿 [6]黄色
echo [7]蓝底 [8]绿底 [9]灰底 [A]黄底 [B]紫底 [C]粉底
echo.
echo [0]返回
echo.
set /p co=选择：
if "%co%"=="1" color 07 & echo color 07>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="2" color 0f & echo color 0f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="3" color 0a & echo color 0a>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="4" color 0d & echo color 0d>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="5" color 0b & echo color 0b>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="6" color 0e & echo color 0e>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="7" color 1f & echo color 1f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="8" color 2f & echo color 2f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="9" color 70 & echo color 70>"%AppData%\9826\color.bat" & goto changeColor
rem /i有两种用法，这里是为了不区分大小写
if /i "%co%"=="A" color 6f & echo color 6f>"%AppData%\9826\color.bat" & goto changeColor
if /i "%co%"=="B" color 5f & echo color 5f>"%AppData%\9826\color.bat" & goto changeColor
if /i "%co%"=="C" color df & echo color df>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="0" goto settingsMainMenu
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto changeColor

:newBCDStore

:defineWindowsPath
cls
echo 你选择了新建一个 BCD 文件。
echo 本程序目前仅支持使用 BCDBOOT 命令，
echo 所以 Win7 及以下系统需要手动补齐 bcdboot.exe 。
echo BCDBOOT 指令只能指定将 BCD 放置于哪一个盘符，并不能自定义路径。
echo 现在，请先输入 Windows 系统所在的文件夹。例如 C:\Windows 。
echo 不允许含有空格，无需添加双引号。
echo 留空可返回。
echo.
set windowsPath=
set /p "windowsPath=>"
if "%windowsPath%"=="" (goto defineBCDStore1) else (
    if not exist "%windowsPath%" (
        echo.
        echo 你的输入有误，请重新输入。
        echo.
        pause
        goto newBCDStore
    )
)

:defineFirmwareType
cls
echo 请选择该 BCD 是用于 BIOS 还是 UEFI 启动。
echo.
echo [1] BIOS   [2] UEFI     [0]让 BCDBOOT 自行决定
echo.
echo 输入你选择的编号，然后按下 Enter 。留空可返回。
echo.
set firmwareTypeSlt=
set /p "firmwareTypeSlt=>"
if "%firmwareTypeSlt%"=="1" set firmwareType=/f BIOS
if "%firmwareTypeSlt%"=="2" set firmwareType=/f UEFI
if "%firmwareTypeSlt%"=="0" set firmwareType=
if "%firmwareTypeSlt%"=="" goto defineWindowsPath
echo.
echo 你的输入有误，请重新输入。
echo.
pause
goto defineFirmwareType

:defineBCDVolume
cls
echo 请输入要存放 BCD 的盘符。
echo 这里只需要输入一个字母即可，不要输入冒号。
echo BCDBOOT 会根据你选择的固件类型放置于启动管理器会寻找的文件夹。
echo 留空可返回。
echo.
set BCDVolume=
set /p "BCDVolume=>"
if "%BCDVolume%"=="" (goto defineFirmwareType) else (
    if exist "%BCDVolume%:NUL" (
        bcdboot %windowsPath% /s %BCDVolume%: %firmwareType% /l zh-cn
        if errorlevel 1 (echo 发生了错误。 & echo.) else rem
        pause
        goto defineBCDStore1
    ) else (
        echo.
        echo 你的输入有误，请重新输入。
        echo.
        pause
        goto defineBCDVolume
    )
)

:end
del /q "%temp%\9826\BCDFixer\items\*.txt">nul
rd /s /q "%temp%\9826\BCDFixer\items">nul
if defined letter (
    echo select disk %disk% >%temp%\BCDFixerDiskPartScriptTemp.txt
    echo select partition %partition% >>%temp%\BCDFixerDiskPartScriptTemp.txt
    echo remove>>%temp%\BCDFixerDiskPartScriptTemp.txt
    echo exit>>%temp%\BCDFixerDiskPartScriptTemp.txt
    diskpart /s %temp%\BCDFixerDiskPartScriptTemp.txt
)
endlocal
endlocal
rem pause