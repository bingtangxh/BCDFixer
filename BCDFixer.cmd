:start
:init
@echo off
cls
if exist "%AppData%\9826\color.bat" (call "%AppData%\9826\color.bat") else color 0f
if not exist "%temp%\9826\BCDMast\items" mkdir "%temp%\9826\BCDMast\items"
title BCDFixer Ver. 0.4
mode con cols=70 lines=30
echo �ɱ���xh����
echo.
cls

:selfCheck
bcdedit>nul
if not ERRORLEVEL 1 goto selfCheck2
echo ��ȡ��ǰBCD���ݷ������󣬿�����û�й���Ա�������С�
echo.
echo �����򽫳����Թ���Ա����������
if not "%~1"=="" (
    echo.
    echo ��⵽argv[1]���ǿյģ���˲�һ����������������Ȩ��
    echo argv[1]==%1
    echo.
    echo ����������˵��󣬷�����ʾ��BCD·������ȷ����ô�������Թ���Ա�������С�
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
rem ����https://www.bilibili.com/read/cv20376190/

:st
:selfCheck2
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION
IF ERRORLEVEL 1 (
    echo δ������������չ���ӳٱ������롣
    echo.
    echo �����������˳���
    echo.
    pause
    goto end
)

:defineBCDStore
if "%1"=="~1" goto defineBCDStore1
if not "%~1"=="" (
    set store="%~1"
    echo �Ѽ�⵽��1����������ֱ�ӽ������˵���
    echo argv[1]==%1
    echo.
    pause
    goto defineBCDStore2
)
:defineBCDStore1
cls
echo ����������Ҫ�޸��ĸ�BCD�ļ���
echo ���Ϊ�գ���ô��ʹ�õ�ǰϵͳBCD��
echo û��д�½�BCD�Ĺ��ܣ����ֶ�����BCDBOOT��
echo.
echo ��ܰ��ʾ��������������ʱ�Ѿ��ǹ���Ա���ݣ�ͨ��������ק�ļ���
echo.
echo ���·�����·���������ֶ�����˫���š�
echo.
set store=
set /p "store=>"
:defineBCDStore2
if "%store%"=="" (
    if not "%store%"=="" set store=/store "%store:"=%"
) else (
    if not exist "%store:/store =%" (
        echo.
        echo ��������ļ�%store%�����ڣ����������롣
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
    set currentItemGUID=δָ��
    set currentItemDescription=δָ��
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
set The operation completed successfully.=ԭ���������ַ�ʽ���������̫�����ˣ�
cls
echo                     BCD Fixer���˵�
echo.
if "%store%"=="" (echo ��ǰѡ���Ĵ洢����ϵͳ��BCD) else (echo ��ǰѡ���Ĵ洢��%store:/store =%)
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%    %numSelected%
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo ��һ�����������������
    )
)
echo.
echo [1]        ѡȡһ��������Ŀ
rem echo [2]        �½�һ��������Ŀ
if not %numSelected%==-1 echo [3]        ���Ƶ�ǰ������Ŀ
if not %numSelected%==-1 echo [4]        ɾ����ǰ������Ŀ
if not %numSelected%==-1 echo [5]        ����ǰ������Ŀ����ΪĬ��
if not %numSelected%==-1 echo [6]        ����ǰ������Ŀ����Ϊ�´ε�һ������
echo ----------------------------------------
echo [9]        ����BCDȫ���趨
echo [244]      �л���һ��BCD�ļ�
echo [738]      ���ı�����ȫ���趨
echo [0]        �˳�
echo.
echo ������ѡ��ı�ţ�Ȼ����Enter��
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
echo ��������������������롣
echo.
pause
goto mainMenu

:select
cls
:scan0
set num=-1
echo ��0����Ŀ������ͨ����Windows Boot Manager���洢һЩȫ���趨��
echo.
:scan1
set /a num+=1
if not exist "%temp%\9826\BCDMast\items\item%num%.txt" goto scan2
rem �����ѭ�����У���һ��Ҫ��ʾ������ǰ������ʾ�������ţ����һ��Ҫ��ʾ�����Ժ������ʾ���С�
rem ����ֻ��ʾ���������ԡ�
for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%num%.txt") do (
    if %%A==��ʶ�� (
        echo ������ %num%
        echo ��ʶ�� %%B
    )
    if %%A==description (
        echo ��Ŀ���� %%B %%C %%D %%E %%F %%G %%H %%I %%J
        echo.
    )
)
goto scan1
:scan2

:inquireSelection
echo ��������Ҫ�޸ĵ���Ŀ��ţ�Ȼ��Enter��
rem echo Ҫ�޸ĵ�ǰ����ϵͳ��������{current}���������������š�
echo.
set /p "numSelected=>"
:defineSelection
if "%numSelected%"=="{current}" (
    if "%store%"=="" (
        echo. & echo ��������δ�깤���޷�ȷ������������Ϊ�� & echo. & pause
        for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
            if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
        set currentItemGUID={current}
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE`) do (
            set A=%%A
            if "!A:~0,7!"=="Windows" set /a num+=1
            if %%A==��ʶ�� (
                if %%B=={current} set numSelected=!num!
            )
        )
        goto mainMenu
    ) else (
        echo.
        echo ��ǰѡ���Ĵ洢����ϵͳĬ�ϴ洢�����Բ�������ν��{current}��
        echo ������ѡ��BCD�ļ���
        echo.
        pause
        goto defineBCDStore1
    )
)
if exist "%temp%\9826\BCDMast\items\item%numSelected%.txt" (
    for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDMast\items\item%numSelected%.txt") do (
        rem echo 1
        if %%A==��ʶ�� (
            set currentItemGUID=%%B
        )
        if %%A==description (
            set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
    )
) else (
    echo.
    echo ��������������������롣
    echo.
    pause
    goto select
)
if "%numSelected%"=="{current}" (
    rem (test)��if������
)
goto mainMenu

:create
echo.
echo ǰ��������Ժ�����̽���ɣ�
echo.
pause
goto mainMenu

:copy
cls
echo ��������������Ŀ����������������˫���š�
echo �������򲻸��Ʋ����ء�
echo ������Ϻ�Enter��
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto mainMenu
bcdedit %store% /copy %currentItemGUID% /d "%slt%"
echo.
echo ��ѡ���¸��Ƶ���Ŀ��
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set copied=1
goto convertItems

:delete
cls
echo ���ģ��ҵ��ϻ�ƣ���Ҫɾ������Ŀ��
echo ����˵�������Ҫɾ������Ŀ��
echo.
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%
echo.
echo [1] �ǵģ�����˵�����     [0] �ֻ��ˣ���ɾ��
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto delete
if "%slt%"=="1" goto delete1
if "%slt%"=="0" goto mainMenu
echo ��������������������롣
echo.
pause
goto delete
:delete1
bcdedit %store% /delete %currentItemGUID% /cleanup
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set modified=1
set menu=mainMenu
goto convertItems

:default
echo.
bcdedit %store% /default %currentItemGUID%
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
goto convertItems

:bootSequenceAddFirst
goto bootSequenceAddFirst1
rem ûд����
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo ��һ�����������������
    )
)
:bootSequenceAddFirst1
echo.
bcdedit %store% /bootsequence %currentItemGUID% /addfirst
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set modified=0
set menu=mainMenu
goto convertItems











:global
:globalMainMenu
cls
if "%store%"=="" (echo ��ǰѡ���Ĵ洢����ϵͳ��BCD) else (echo ��ǰѡ���Ĵ洢��%store:/store =%)
echo.
echo [1]       �޸���ʾ�˵���ʱ��
echo [2]       �޸��Ƿ���ʾ�˵�
if "%store%"=="" echo [397]     ������ǰϵͳBCD
if "%store%"=="" echo [467]     ���ⲿ�ļ��滻��ǰϵͳBCD
echo [0]       �������˵�
echo.
echo ������ѡ��ı�ţ�Ȼ����Enter��
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
echo ��������������������롣
echo.
pause
goto globalMainMenu

:timeout
cls
set timeout=δָ��
for /f "tokens=1,2" %%A in ('bcdedit %store%') do (
    if %%A==timeout set timeout=%%B
)
echo ��ǰ�˵�ʱ����%timeout%�룬��ʱ��ȷ����ֵΪ0��Ч����
echo.
echo �������µ���ֵ��ֻ������Ȼ���������򱣳ֲ��䡣
echo.
set /p "timeout=>"
echo.
bcdedit %store% /timeout %timeout%
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
goto globalMainMenu

:changeBool
cls
set bool=δָ��
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDMast\items\item0.txt") do (
    if %%A==%boolName% set bool=%%B
)
echo ��ǰ����ֵΪ��%boolName%   %bool%
echo.
echo ��ѡ����Ҫ��ֵ������..�ɷ��ء�
echo [1] YES    [0] NO
echo.
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto changeBool
if "%slt%"=="1" goto changeBool1
if "%slt%"=="0" goto changeBool1
if "%slt%"==".." goto globalMainMenu
echo ��������������������롣
echo.
pause
goto changeBool
:changeBool1
set bool=%slt%
bcdedit %store% /set {bootmgr} %boolName% %bool%
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
goto convertItems

:currentExport
cls
echo �㽫Ҫ������ǰϵͳBCD��
echo ������Ŀ���ļ�·������������˫���š��˴������·���Ƿ���Ч��
echo ����..�ɷ��ء�
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentExport
if "%slt%"==".." goto globalMainMenu
bcdedit /export "%slt%"
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
goto globalMainMenu
:currentImport
cls
echo �㽫Ҫ���뵱ǰϵͳBCD��
echo �������ʹ��/clean������
echo ��EFI������ϵͳ�ϣ����������ɾ�����е����й̼������
echo.
echo ������Ҫ������ļ�·������������˫���š�
echo ����..�ɷ��ء�
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto currentImport
if "%slt%"==".." goto globalMainMenu
if not exist "%slt%" (
    echo ��������ļ������ڣ����������롣
    echo.
    pause
    goto currentImport
)
bcdedit /import "%slt%" /clean
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
goto globalMainMenu

:settings
:settingsMainMenu
cls
echo BCDMaster ����
echo.
rem echo [1] ����/ɾ���Ҽ��˵�
echo [2] ����������ɫ
echo [0] �������˵�
echo. 
set slt=
set /p "slt=>"
echo.
if "%slt%"=="" goto settingsMainMenu
if "%slt%"=="1" goto contextMenuManage
if "%slt%"=="2" goto changeColor
if "%slt%"=="0" goto mainMenu
echo ��������������������롣
echo.
pause
goto settingsMainMenu

:contextMenuManage
echo �ù�����δ�깤��
echo.
pause
goto settingsMainMenu

:changeColor
if not exist "%AppData%\9826" mkdir "%AppData%\9826"
cls
echo ���ʹ��Windows �ն��������˱���ͼƬ����ô����ʹ�ò�����ɫ����ɫ��
echo.
echo ѡ����Ҫ����ɫ����ĸ�����ִ�Сд��
echo.
echo [1]Ĭ�� [2]���� [3]��ɫ [4]��ɫ [5]���� [6]��ɫ
echo [7]���� [8]�̵� [9]�ҵ� [A]�Ƶ� [B]�ϵ� [C]�۵�
echo [0]����
echo.
set /p co=ѡ��
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
echo ��������������������롣
echo.
pause
goto changeColor

:end
del /q "%temp%\9826\BCDMast\items\*.txt">nul
rd /s /q "%temp%\9826\BCDMast\items">nul
rem pause
