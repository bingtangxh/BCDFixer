:start
:init
@echo off
cls
if exist "%AppData%\9826\color.bat" (call "%AppData%\9826\color.bat") else color 0f
if not exist "%temp%\9826\BCDMast\items" mkdir "%temp%\9826\BCDMast\items"
title BCDFixer Ver. 0.4
mode con cols=70 lines=30
echo �1�7�0�8�1�7�1�7�1�7xh�1�7�1�7�1�7�1�7
echo.
cls

:selfCheck
bcdedit>nul
if not ERRORLEVEL 1 goto selfCheck2
echo �1�7�1�7�0�0�1�7�1�7�0�2BCD�1�7�1�7�1�7�1�5�1�7�1�7�1�7�1�7�1�7�1�7�8�5�1�7�1�7�1�7�1�7�1�7�0�4�1�7�ۄ1�7�1�7�1�7�0�3�1�7�1�7�1�7�1�7�1�7�1�7�1�7���1�7
echo.
echo �1�7�1�7�1�7�1�7�1�7�4�1�1�7�1�7�1�7�1�7�0�1�1�7�1�7�1�7�0�3�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7
if not "%~1"=="" (
    echo.
    echo �1�7�1�7�8�9argv[1]�1�7�1�7�1�7�0�6�0�1�0�0�1�7�1�7�1�7�0�2�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7
    echo argv[1]==%1
    echo.
    echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�8�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7BCD���1�7�1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�1�1�7�1�7�1�7�0�3�1�7�1�7�1�7�1�7�1�7�1�7�1�7���1�7
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
rem �1�7�1�7�1�7�1�7https://www.bilibili.com/read/cv20376190/

:st
:selfCheck2
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 (
    echo �Ą1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�0�1�1�3�1�7�1�7�1�7�1�7�1�7�1�7�0�6
    echo.
    echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�3�1�7�1�7�1�7
    echo.
    pause
    goto end
)

:defineBCDStore
if "%1"=="~1" goto defineBCDStore1
if not "%~1"=="" (
    set store="%~1"
    echo �1�7�0�2�1�7�8�9�1�7�1�71�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�1�1�7�0�1�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7
    echo argv[1]==%1
    echo.
    pause
    goto defineBCDStore2
)
:defineBCDStore1
cls
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7�1�0�1�7�1�7�0�0�1�7BCD�1�7�0�4�1�7�1�7�1�7
echo �1�7�1�7�1�7�0�2�1�7�0�3�1�7�1�7�1�7�0�0�1�7�1�7�0�0�1�7�0�1�1�7�0�2�0�3�0�1BCD�1�7�1�7
echo �0�4�1�7�1�7�Մ1�7�0�5�1�7BCD�1�7�0�1�1�7�1�7�1�1�1�7�1�7�1�7�1�7�0�6�1�7�1�7�1�7�1�7�1�7BCDBOOT�1�7�1�7
echo.
echo �1�7�1�7�1�4�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�2�1�7�0�4�1�7�1�7���1�7�1�7�1�7�0�3�1�7�1�7�1�7�1�5�1�7�0�0�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�0�4�1�7�1�7�1�7
echo.
echo �1�7�1�7�1�7���1�7�1�7�1�7�1�7�1�7���1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�0�8�1�7
echo.
set store=
set /p "store=>"
:defineBCDStore2
if "%store%"=="" (
    if not "%store%"=="" set store=/store "%store:"=%"
) else (
    if not exist "%store:/store =%" (
        echo.
        echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�4�1�7%store%�1�7�1�7�1�7�1�7�1�7�1�3�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
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
    set currentItemGUID=�ā0�8�1�7�1�7
    set currentItemDescription=�ā0�8�1�7�1�7
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
set The operation completed successfully.=�0�9�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�0�4�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�9�1�7�1�7�1�7�1�7�1�7�0�7�1�7
cls
echo                     BCD Fixer�1�7�1�7�1�7�0�5�1�7
echo.
if "%store%"=="" (echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�0�6���1�7�1�7�1�7�1�7�0�3�0�1�1�7�1�7BCD) else (echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�0�6���1�7�1�7%store:/store =%)
echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7   %currentItemDescription%
echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�1�7GUID�1�7�1�7       %currentItemGUID%    %numSelected%
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo �1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�6�9
    )
)
echo.
echo [1]        �0�5�0�0�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7
rem echo [2]        �1�7�0�5�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7
if not %numSelected%==-1 echo [3]        �1�7�1�7�1�7�0�1�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�7
if not %numSelected%==-1 echo [4]        �0�1�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�7
if not %numSelected%==-1 echo [5]        �1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�1�7�0�2�0�8�1�7�1�7
if not %numSelected%==-1 echo [6]        �1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�1�7�0�2�1�7�0�7�ń1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7
echo ----------------------------------------
echo [9]        �1�7�1�7�1�7�1�7BCD�0�0�1�7�1�7�1�7څ
echo [244]      �1�7�݄1�7�1�7�1�7�0�5�1�7�1�7BCD�1�7�0�4�1�7
echo [738]      �1�7�1�7�1�7�0�3�1�7�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7څ
echo [0]        �1�7�0�3�1�7
echo.
echo �1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�0�3�1�7�0�0�1�7�0�6�1�7�1�7�1�7�1�7Enter�1�7�1�7
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
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto mainMenu

:select
cls
:scan0
set num=-1
echo �1�7�1�70�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7�1�7Windows Boot Manager�1�7�1�7�1�7���0�5���0�0�1�7�1�7�1�7څ�1�7�1�7
echo.
:scan1
set /a num+=1
if not exist "%temp%\9826\BCDMast\items\item%num%.txt" goto scan2
rem �1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�1�7�1�7���1�7�1�7�1�7�0�5�1�7�1�7�0�8�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7�1�7�0�5�1�7�1�7�0�8�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7���1�7
rem �1�7�1�7�1�7�1�7�0�1�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7
for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%num%.txt") do (
    if %%A==�1�7�1�7�0�7�1�7�1�7 (
        echo �1�7�1�7�1�7�1�7�1�7�1�7 %num%
        echo �1�7�1�7�0�7�1�7�1�7 %%B
    )
    if %%A==description (
        echo �1�7�1�7�0�7�1�7�1�7�1�7�1�7 %%B %%C %%D %%E %%F %%G %%H %%I %%J
        echo.
    )
)
goto scan1
:scan2

:inquireSelection
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7�1�0�0�7�1�7�1�7�1�7�0�7�1�7�1�7�0�0�1�7�0�6�1�7�1�7Enter�1�7�1�7
rem echo �0�8�1�7�1�0�0�7�1�7�0�2�1�7�1�7�1�7�1�7�0�3�0�1�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7{current}�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7
echo.
set /p "numSelected=>"
:defineSelection
if "%numSelected%"=="{current}" (
    if "%store%"=="" (
        echo. & echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�Ą1�7�8�7�1�7�1�7�1�7�1�9�1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7 & echo. & pause
        for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
            if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
        set currentItemGUID={current}
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE`) do (
            set A=%%A
            if "!A:~0,7!"=="Windows" set /a num+=1
            if %%A==�1�7�1�7�0�7�1�7�1�7 (
                if %%B=={current} set numSelected=!num!
            )
        )
        goto mainMenu
    ) else (
        echo.
        echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�0�6���1�7�1�7�1�7�1�7�0�3�0�1�0�8�1�7�0�2���1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7�1�7�1�7�1�7�1�7�̈́1�7�1�7{current}�1�7�1�7
        echo �1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7BCD�1�7�0�4�1�7�1�7�1�7
        echo.
        pause
        goto defineBCDStore1
    )
)
if exist "%temp%\9826\BCDMast\items\item%numSelected%.txt" (
    for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%numSelected%.txt") do (
        rem echo 1
        if %%A==�1�7�1�7�0�7�1�7�1�7 (
            set currentItemGUID=%%B
        )
        if %%A==description (
            set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
    )
) else (
    echo.
    echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
    echo.
    pause
    goto select
)
if "%numSelected%"=="{current}" (
    rem (test)�1�7�1�7if�1�7�1�7�1�7�1�7�1�7�1�7
)
goto mainMenu

:create
echo.
echo �0�2�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�0�4�1�7
echo.
pause
goto mainMenu

:copy
cls
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�0�8�1�7
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�9�4�1�7�1�7�0�8�1�7�1�7�1�7�1�7�1�3�1�7
echo �1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7Enter�1�7�1�7
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto mainMenu
bcdedit %store% /copy %currentItemGUID% /d "%slt%"
echo.
echo �1�7�1�7�0�5�1�7�1�7�1�7�0�0�1�7�1�7�0�1�1�7�1�7�1�7�0�7�1�7�1�7
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
set copied=1
goto convertItems

:delete
cls
echo �1�7�1�7�1�7�0�0�1�7�1�7�0�9�1�7�1�7�0�9�1�7�0�3�1�7�1�7�1�7�0�8�0�1�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7
echo �1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�8�0�1�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7
echo.
echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7   %currentItemDescription%
echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�1�7GUID�1�7�1�7       %currentItemGUID%
echo.
echo [1] �1�7�0�7�0�0�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7     [0] �1�7�0�1�1�7�1�7�0�7�1�7�1�7�1�7�0�1�1�7�1�7
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto delete
if "%slt%"=="1" goto delete1
if "%slt%"=="0" goto mainMenu
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto delete
:delete1
bcdedit %store% /delete %currentItemGUID% /cleanup
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
set modified=1
set menu=mainMenu
goto convertItems

:default
echo.
bcdedit %store% /default %currentItemGUID%
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
goto convertItems

:bootSequenceAddFirst
goto bootSequenceAddFirst1
rem �0�4�Մ1�7�1�7�1�7�1�7
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo �1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�6�9
    )
)
:bootSequenceAddFirst1
echo.
bcdedit %store% /bootsequence %currentItemGUID% /addfirst
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
set modified=0
set menu=mainMenu
goto convertItems











:global
:globalMainMenu
cls
if "%store%"=="" (echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�0�6���1�7�1�7�1�7�1�7�0�3�0�1�1�7�1�7BCD) else (echo �1�7�1�7�0�2�0�5�1�7�1�7�1�7�0�6���1�7�1�7%store:/store =%)
echo.
echo [1]       �1�7�1�0�1�7�1�7�1�7�0�5�1�7�0�5�1�7�1�7�1�7�0�2�1�7�1�7
echo [2]       �1�7�1�0�1�7�1�7�0�9�1�7�1�7�1�7�0�5�1�7�0�5�1�7
if "%store%"=="" echo [397]     �1�7�1�7�1�7�1�7�1�7�1�7�0�2�0�3�0�1BCD
if "%store%"=="" echo [467]     �1�7�1�7�1�7�8�9�1�7�0�4�1�7�1�7�I�1�7�1�7�0�2�0�3�0�1BCD
echo [0]       �1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7
echo.
echo �1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�0�3�1�7�0�0�1�7�0�6�1�7�1�7�1�7�1�7Enter�1�7�1�7
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
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto globalMainMenu

:timeout
cls
set timeout=�ā0�8�1�7�1�7
for /f "tokens=1,2" %%A in ('bcdedit %store%') do (
    if %%A==timeout set timeout=%%B
)
echo �1�7�1�7�0�2�1�7�0�5�1�7�0�2�1�7�1�7�1�7�1�7%timeout%�1�7�0�3�1�7�1�7�0�2�1�7�1�7�0�2�1�7�1�7�1�7�1�7�0�5�0�20�1�7�1�7���1�7�1�7�1�7�1�7
echo.
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7�1�7�1�7�0�5�1�7�1�7�0�1�1�7�1�7�1�7�1�7�1�7�1�7�0�6�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�5�7�0�2�1�7�1�7�3�1
echo.
set /p "timeout=>"
echo.
bcdedit %store% /timeout %timeout%
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
goto globalMainMenu

:changeBool
cls
set bool=�ā0�8�1�7�1�7
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==%boolName% set bool=%%B
)
echo �1�7�1�7�0�2�1�7�1�7�1�7�1�7�0�5�0�2�1�7�1�7%boolName%   %bool%
echo.
echo �1�7�1�7�0�5�1�7�1�7�1�7�1�7�0�8�1�7�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7..�1�7�0�4�1�7�1�7�1�3�1�7
echo [1] YES    [0] NO
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto changeBool
if "%slt%"=="1" goto changeBool1
if "%slt%"=="0" goto changeBool1
if "%slt%"==".." goto globalMainMenu
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto changeBool
:changeBool1
set bool=%slt%
bcdedit %store% /set {bootmgr} %boolName% %bool%
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
goto convertItems

:currentExport
cls
echo �1�7�2�8�0�8�1�7�1�7�1�7�1�7�1�7�1�7�0�2�0�3�0�1BCD�1�7�1�7
echo �1�7�1�7�1�7�1�7�1�7�1�7�0�7�1�7�1�7�1�7�0�4�1�7���1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�0�8�1�7�1�7�0�4�1�7�1�7�1�7�1�7�1�7�1�7���1�7�1�7�1�7�0�9�1�7�1�7�1�7���1�7�1�7
echo �1�7�1�7�1�7�1�7..�1�7�0�4�1�7�1�7�1�3�1�7
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentExport
if "%slt%"==".." goto globalMainMenu
bcdedit /export "%slt%"
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
goto globalMainMenu
:currentImport
cls
echo �1�7�2�8�0�8�1�7�1�7�1�7�1�0�0�2�0�3�0�1BCD�1�7�1�7
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�0�1�7�1�7/clean�1�7�1�7�1�7�1�7�1�7�1�7
echo �1�7�1�7EFI�1�7�1�7�1�7�1�7�1�7�1�7�0�3�0�1�1�7�0�5�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�1�1�7�1�7�1�7�1�7�1�7�ք1�7�1�7�1�7�1�7�ہ0�6�1�7�1�7�1�7�1�7�1�7�1�7�6�9
echo.
echo �1�7�1�7�1�7�1�7�1�7�1�7�0�8�1�7�1�7�1�7�1�7�1�7�1�7�0�4�1�7���1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7�1�7�1�7�0�8�1�7
echo �1�7�1�7�1�7�1�7..�1�7�0�4�1�7�1�7�1�3�1�7
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentImport
if "%slt%"==".." goto globalMainMenu
if not exist "%slt%" (
    echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7�1�7�1�7�1�7�1�3�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
    echo.
    pause
    goto currentImport
)
bcdedit /import "%slt%" /clean
echo.
if ERRORLEVEL 1 echo �1�7�1�7�1�7�1�7�1�7�0�4�1�7�1�7�1�7 & echo.
pause
goto globalMainMenu

:settings
:settingsMainMenu
cls
echo BCDMaster �1�7�1�7�1�7�1�7
echo.
rem echo [1] �1�7�1�7�1�7�1�7/�0�1�1�7�1�7�1�7�0�6�1�7�1�7�0�5�1�7
echo [2] �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�2
echo [0] �1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�5�1�7
echo. 
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto settingsMainMenu
if "%slt%"=="1" goto contextMenuManage
if "%slt%"=="2" goto changeColor
if "%slt%"=="0" goto mainMenu
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto settingsMainMenu

:contextMenuManage
echo �1�7���1�7�1�7�1�7�1�7�1�7�Ą1�7�8�7�1�7�1�7
echo.
pause
goto settingsMainMenu

:changeColor
if not exist "%AppData%\9826" mkdir "%AppData%\9826"
cls
echo �1�7�1�7�1�7�0�0�1�7�1�7Windows �1�7�0�2�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�1�1�7�1�7�1�7�0�0�0�2�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7�1�7�0�0�1�7���1�7�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�0�2�1�7�1�7
echo.
echo �0�5�1�7�1�7�1�7�1�7�0�8�1�7�1�7�1�7�1�7�0�2�1�7�1�7�1�7�1�7�0�0�1�7�1�7�1�7�1�7�1�7�0�4�1�7���Մ1�7�1�7
echo.
echo [1]�0�8�1�7�1�7 [2]�1�7�1�7�1�7�1�7 [3]�1�7�1�7�0�2 [4]�1�7�1�7�0�2 [5]�1�7�1�7�1�7�1�7 [6]�1�7�1�7�0�2
echo [7]�1�7�1�7�1�7�1�7 [8]�1�7�0�9�1�7 [9]�1�7�0�9�1�7 [A]�1�7�0�1�1�7 [B]�1�7�0�3�1�7 [C]�1�7�1�5�1�7
echo [0]�1�7�1�7�1�7�1�7
echo.
set /p co=�0�5�1�7�1�7
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
if "%co%"=="" goto settingsMainMenu
echo.
echo �1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�1�7�0�6
echo.
pause
goto changeColor

:end
del /q "%temp%\9826\BCDMast\items\*.txt">nul
rd /s /q "%temp%\9826\BCDMast\items">nul
rem pause
