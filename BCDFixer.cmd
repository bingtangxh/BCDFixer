
:start

:init

@echo off
cls

if exist "%AppData%\9826\color.bat" (call "%AppData%\9826\color.bat") else color 0f
if not exist "%temp%\9826\BCDFixer\items" (mkdir "%temp%\9826\BCDFixer\items") else rem
title BCDFixer 0.8.1
mode con cols=70 lines=50
echo �� ����xh ����
echo.
cls

:selfCheck

bcdedit>nul
if not ERRORLEVEL 1 (goto selfCheck2) else rem
echo ��ȡ��ǰ BCD ���ݷ������󣬿�����û�й���Ա������С�
echo.
echo �����򽫳����Թ���Ա���������
if not "%~1"=="" (
    echo.
    echo ��⵽argv[1]���ǿյģ���˲�һ����������������Ȩ��
    echo ����������·�����пո�
    echo.
    echo argv[1]==%1
    echo.
    echo ����������˵��󣬷�����ʾ�� BCD ·������ȷ����ô�������Թ���Ա������С�
    pause
) else echo.
ver|findstr "[3-5]\.[0-9]\.[0-9]*" 1>nul 2>nul && goto st
fltmc 1>nul 2>nul && goto st
set parameters=
:parameter
if not "%~1"=="" (
    set parameters=%parameters% %~1
    rem ���￴�����˰ٷֺţ�û���ø�̾�ţ�ʵ�������ﲻӰ�졣
    shift /1
    goto parameter
) else set parameters="%parameters:~1%"

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
if "%1"=="~1" (goto defineBCDStore1) else rem
if not "%~1"=="" (
    set store="%~1"
    echo �Ѽ�⵽��1����������ֱ�ӽ������˵���
    echo argv[1]==%1
    echo.
    pause
    goto defineBCDStore2
) else rem
:defineBCDStore1
cls
echo ����������Ҫ�޸��ĸ� BCD �ļ���
echo ���Ϊ�գ���ô��ʹ�õ�ǰϵͳ BCD��
echo �����½�һ�� BCD �ļ��������� 639 ��
echo ������ EFI ESP ����û���̷������������ 334377 �����ÿո������
echo �������������ѡ������Ȼ���Զ�ѡ�� BCD �ļ���
echo.
echo ��ܰ��ʾ��������������ʱ�Ѿ��ǹ���Ա��ݣ�ͨ��������ק�ļ���
echo.
echo ���·�����·���������ֶ����˫���ţ��������пո�
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
        echo ��������ļ�%store%�����ڣ����������롣
        echo.
        echo ������·�����пո������������ƶ��ļ�ʹ��·�������ո�
        echo.
        pause
        goto defineBCDStore1
        rem ���ﱾ������ת��defineBCDStore
        rem ���������Ļ���������ݵ�argv[1]�����ڣ���ô����ͻ�������ѭ��
        rem ���Ըĳ������⵽argv[1]�����ھ�ǿ��Ҫ���û�����
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
set /p disk=������Ҫѡ���Ӳ�̱�ţ�
cls
echo select disk %disk% >%temp%\BCDFixerDiskPartScriptTemp.txt
echo list partition>>%temp%\BCDFixerDiskPartScriptTemp.txt
echo exit>>%temp%\BCDFixerDiskPartScriptTemp.txt
diskpart /s %temp%\BCDFixerDiskPartScriptTemp.txt
echo.
set /p partition=������Ҫѡ��ķ�����ţ�
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
    echo Ϊ��ָ���ķ����������̷� %letter%:
    echo ���ǳ��Զ�ȡ %letter%:\EFI\Microsoft\Boot\BCD ʱ����
    echo �����������򽫳��Զ�ȡ %letter%:\Boot\BCD��
) else (
    set store=/store "%letter%:\EFI\Microsoft\Boot\BCD"
    goto convertItems
)
bcdedit /store %letter%:\boot\bcd>nul
if errorlevel 1 (
    echo ��ȡ %letter%:\Boot\BCD Ҳʧ���ˡ�
    echo �����³��Ի�һ��������·����
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
    set currentItemGUID=δָ��
    set currentItemDescription=δָ��
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
set The operation completed successfully.=ԭ���������ַ�ʽ���������̫�����ˣ�
cls
echo                     BCD Fixer ���˵�
echo.
if "%store%"=="" (
    echo ��ǰѡ���Ĵ洢��       ��ϵͳ�� BCD
) else (
    echo ��ǰѡ���Ĵ洢��       %store:/store =%
)
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%    %numSelected%
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
    if %%A==bootsequence (
        if %%B==%currentItemGUID% echo ��һ�����������������
    )
)
echo.
echo [1]        ѡȡһ��������Ŀ
echo [2]        �½�һ��������Ŀ��δʵ�֣�
if not %numSelected%==-1 echo [3]        ���Ƶ�ǰ������Ŀ
if not %numSelected%==-1 echo [4]        ɾ����ǰ������Ŀ
if not %numSelected%==-1 echo [5]        ����ǰ������Ŀ����ΪĬ��
if not %numSelected%==-1 echo [6]        ����ǰ������Ŀ����Ϊ�´ε�һ������
if not %numSelected%==-1 echo [7]        �޸Ļ�ɾ��һ��������Ŀ������
if not %numSelected%==-1 echo [8]        ���һ��������Ŀ������
if not %numSelected%==-1 echo [9]        �༭�����Ŀ�����ݣ���������˳��
if not %numSelected%==-1 echo [737]      ����ָ����������Ϊһ���̷�
if not %numSelected%==-1 echo                  ����֧�� Ramdisk �� VHD(X) �е�ϵͳ��
echo ----------------------------------------
echo [223]      ���� BCD ȫ���趨
echo [738]      ���ı�����ȫ���趨
echo [244]      �л���һ�� BCD �ļ�
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
if "%slt%"=="7" goto modify
if "%slt%"=="8" goto addNew
if "%slt%"=="9" goto editMultiValues
if "%slt%"=="737" goto quickSetdevice
if "%slt%"=="223" goto global
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
if exist "%temp%\9826\BCDFixer\items\item%num%.txt" (
    rem scan1����һ��ѭ������һ���Ǽ���Ƿ���Ҫ��������scanElse��ȫ����Ŀɨ����Ϻ�ִ�С�
    set /a "numPause=num%%5-1"
    if /i !numPause! EQU 0 (
        if /i %num% NEQ 1 (
            echo ����ֱ�Ӱ�Enter�ɲ鿴��һҳ��
            goto inquireSelection
        )   
    )
) else (
    set num=0
    echo ����ֱ�Ӱ�Enter�ɻص���һҳ��
    goto inquireSelection
)
goto inquireSelection2
:inquireSelection
echo ��������Ҫ�޸ĵ���Ŀ��ţ�Ȼ��Enter��
rem echo Ҫ�޸ĵ�ǰ����ϵͳ��������{current}���������������š�
echo.
set numSelected=
set /p "numSelected=>"
if "!numSelected!"=="" (cls) else goto defineSelection


:inquireSelection2

rem �����ѭ�����У���һ��Ҫ��ʾ������ǰ������ʾ�������ţ����һ���������ʾ���С�
rem ����ֻ��ʾ���������ԡ�
for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDFixer\items\item%num%.txt") do (
    if %%A==��ʶ�� (
        echo ������   %num%
        echo ��ʶ��   %%B
    )
    if %%A==device (
        echo �豸     %%B
    )
    if %%A==description (
        echo ��Ŀ���� %%B %%C %%D %%E %%F %%G %%H %%I %%J
        echo.
    )
)
goto scan1

:scanElse
rem �������������ǩ��ָ��ͬһ�ű���
:defineSelection
goto newC1
rem �ô�������Ƿ�����
@REM if "%numSelected%"=="{current}" (
@REM     if not "%store%"=="" (
@REM         echo.
@REM         echo ��ǰѡ���Ĵ洢����ϵͳĬ�ϴ洢�����Բ�������ν��{current}��
@REM         echo ������ѡ��BCD�ļ���
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
        rem echo. & echo ��������δ�깤���޷�ȷ������������Ϊ�� & echo. & pause
        for /f "usebackq tokens=1-10" %%A in (`bcdedit /enum {current}`) do (
            if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        )
        rem set currentItemGUID={current}
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE`) do (
            set A=%%A
            if "!A:~0,11!"=="-----------" set /a num+=1
            if %%A==��ʶ�� (
                if %%B=={current} set numSelected=!num!
            )
        )
        set num=-1
        set A=
        for /f "usebackq tokens=1,2" %%A in (`bcdedit %store% /enum ACTIVE /v`) do (
            set A=%%A
            if "!A:~0,11!"=="-----------" set /a num+=1
            if %%A==��ʶ�� (
                if /i !numSelected! EQU !num! (
                    set currentItemGUID=%%B
                )
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
if exist "%temp%\9826\BCDFixer\items\item%numSelected%.txt" (
    for /f "usebackq tokens=1-10" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
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
goto mainMenu

:create
echo.
echo ǰ��������Ժ�����̽���ɣ�
echo.
pause
goto mainMenu

:copy
cls
echo                     ���Ƶ�ǰ������Ŀ
echo.
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%
echo.
echo ��������������Ŀ����������������˫���š�
echo �������򲻸��Ʋ����ء�
echo.
echo ������Ϻ� Enter��
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
echo                     ɾ����ǰ������Ŀ
echo.
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
set modifiedOrder=1
set menu=mainMenu
goto convertItems

:default
echo.
bcdedit %store% /default %currentItemGUID%
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:bootSequenceAddFirst
goto bootSequenceAddFirst1
rem ûд����
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
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
set modifiedOrder=0
set menu=mainMenu
goto convertItems

:modify
cls
for /f "usebackq skip=2 tokens=1" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do @echo %%A
echo.
echo �����ǵ�ǰ��Ŀ�������������ƣ����ִ�Сд��
echo ����ֻ�ܱ༭�������ݡ�
echo �����༭�İ���������ݣ�������ʾ˳�򣩣���ʹ����һ�����ܡ�
echo ��������Ҫ�༭�����ƣ�Ȼ��Enter��
echo ���տɷ��ء�ѡ����Ч�����ƺ��ܷ��ء�
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
            echo �Ƿ��޸ĵ�!nameSelected!�ǲ�����Y��N����ֵ��
            echo.
            echo [1]�� [0]��
            echo.
            echo ����ѡ�񲢰�Enter��
            echo.
            set slt=
            set /p "slt=>"
            echo.
            if "!slt!"=="1" set isNameSltExist=1 & set boolName=!nameSelected! & goto changeBool
            if "!slt!"=="0" (
                set isNameSltExist=1
                cls
                echo ��ǰѡ����������Ŀ��   %currentItemDescription%
                echo ��ǰѡ����GUID��       %currentItemGUID%
                echo ���ƣ�%%A
                echo ��ֵ��%%B
                echo.
                goto typeNewData
            )
            echo.
            echo ��������������������롣
            echo.
            pause
            goto editSingleValue
        ) else (
            set isNameSltExist=1
            cls
            echo ��ǰѡ����������Ŀ��   %currentItemDescription%
            echo ��ǰѡ����GUID��       %currentItemGUID%
            echo ���ƣ�%%A
            echo ��ֵ��%%B %%C %%D %%E %%F %%G %%H %%I %%J
            echo.
            goto typeNewData
        )
    )
)
if %isNameSltExist%==0 (
    echo �����������%nameSelected%�����ڣ����������롣
    echo.
    pause
    goto modify
)
:typeNewData
echo.
echo �������µ����ݡ�������գ����ɾ���������ݡ�
echo.
echo ��ֱ���������������ݣ���ֹ�ڴ˴������κ�˫���š�
echo ��������õ�������Ҫ˫���������������� description������ô���ڽ�β������һ���ո�
echo ��������������Զ�ȥ����β�ĵ�һ���ո�Ȼ���Զ�������β��˫���š�
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
if ERRORLEVEL 1 echo �����˴���
echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:addNew
cls
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%
echo.
echo ��������Ҫ��ӵ��������ƣ�Ȼ��Enter��
echo �������Ƿ������������ظ������տɷ��أ��������ƺ��ܷ��ء�
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
    echo �����������%nameSelected%�Ѿ����ڡ�
    echo �Ƿ�ֱ��ǰ���༭��
    echo.
    echo [1]�༭�������� [2]�༭�������� [0]����
    echo.
    set slt=0
    set /p "slt=>"
    if "!slt!"=="1" cls & goto editSingleValue
    if "!slt!"=="2" goto editMultiValues
    if "!slt!"=="0" goto addNew
    echo.
    echo ��������������������롣
    echo.
    pause
    goto nameAlreadyExists
)
cls
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo ��ǰѡ����GUID��       %currentItemGUID%
echo ��ǰѡ�����������ƣ�   %nameSelected%
echo.
echo ���������ݣ�Ȼ��Enter��
echo.
echo ��ֱ���������������ݣ���ֹ�ڴ˴������κ�˫���š�
echo ��������õ�������Ҫ˫���������������� description������ô���ڽ�β������һ���ո�
echo ��������������Զ�ȥ����β�ĵ�һ���ո�Ȼ���Զ�������β��˫���š�
echo.
set /p "data=>"
echo.
if /i "%nameSelected%"=="description" set currentItemDescription=%data%
if "%data:~-1%"==" " set data="%data:~0,-1%"
bcdedit %store% /set %currentItemGUID% %nameSelected% %data%
if ERRORLEVEL 1 echo �����˴���
echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:setPath
cls
echo �㽫Ҫ���õ���·����
echo ��������·�ѡ��һ��Ԥ�ȸ��õ�·����Ҳ���������Լ���Ҫ�ġ�
echo.
echo [1] \windows\system32\winload.efi
echo [2] \windows\system32\winload.exe
echo [3] \windows\system32\boot\winload.efi
echo [4] \windows\system32\boot\winload.exe
echo [5] \windows\system32\winresume.efi
echo [6] \EFI\Microsoft\Boot\bootmgfw.efi
echo [7] \EFI\Microsoft\Boot\memtest.efi
echo [0] ���涼������Ҫ�ģ���Ҫ�Զ���
echo.
set slt=
set /p slt=���������ѡ��Ȼ�� Enter�����տɷ��أ�
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
echo ��������������������롣
echo.
pause
goto setPath

:customPath
cls
echo ���������·�������տɷ��ء��˴�������Ƿ���Ч��
echo.
set data=
set /p "data=>"
if "%data%"=="" goto setPath
bcdedit %store% /set %currentItemGUID% path %path%
goto setPathFinish

:setPathFinish
if errorlevel 1 echo. & echo �����˴���
echo.
pause
set modifiedData=1
goto convertItems

:editMultiValues
cls
echo ��ǰָ������ֵ����Ϊ��%nameSelected%
echo.
echo ��ָ����Ҫ�޸ĵ���ֵ������ʲô�����������ʹ��������ʾ�ġ�
echo ������Ϻ� Enter��
set /p "nameSelected=>"
:editMultiValues1
cls
bcdedit /enum %currentItemGUID%
echo.
echo ��ȷ����Ҫ�޸ĵ���ֵ��
echo.
pause
cls
echo �����·�������Ҫ��ӻ�ɾ������ֵ��Ȼ��������һ�����֣�
echo [1] ��ӵ���ͷ    [2] ��ӵ���β    [3] ɾ�������ֵ
echo.
echo ���磺ɾ�� {current} �������� {current}3 �����ÿո������
echo ������Ϻ� Enter �����տɷ������˵���
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
if errorlevel 1 echo. & echo �����˴���
goto editMultiValuesFinish

:editMultiValuesFinish
echo.
echo �Ƿ���Ҫ�����༭��
echo.
echo [1] �����༭ %nameSelected%
echo [0] �������˵�
echo.
set slt=
set /p slt=���������ѡ��Ȼ�� Enter��
if "%slt%"=="1" goto editMultiValues1
if "%slt%"=="0" goto convertItems
echo.
echo ��������������������롣
echo.
pause
cls
goto editMultiValuesFinish

:quickSetdevice
cls
echo ������Ŀǰֻ�趨 device �������� osdevice ��
for %%A in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%A: fsutil fsinfo drivetype %%A:
echo.
echo ��ֻ������ĸ��������ð�ţ����ֻ���������֣���Ҳ������������ĸ���е��������ʾ������ D �̾����� 4�� A �̾����� 1��
set slt=
set /p slt=���������ѡ��Ȼ�� Enter������ 0 �ɷ��أ�
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
echo ��������������������롣
echo.
pause
goto quickSetdevice

:quickSetdevice1
cls
fsutil volume diskfree %slt%:
echo.
fsutil volume querylabel %slt%:
echo.
if exist %slt%:\Windows\nul (echo �ڸ÷������ҵ��� Windows �ļ��С�) else (echo �÷�����û�� Windows �ļ��С�)
rem if exist "%slt%:\Program Files\nul" (echo �ڸ÷������ҵ��� Program Files �ļ��С�) else (echo �÷�����û�� Program Files �ļ��С�)
if exist %slt%:\Users\nul (echo �ڸ÷������ҵ��� Users �ļ��С�) else (echo �÷�����û�� Users �ļ��С�)
echo.
echo ��ȷ���������Ҫѡ����̷���
echo.
echo [1] �ǵģ�����˵�����    [0] �����ⲻ�ǣ���Ҫ��ѡ
echo.
set device=%slt%
set slt=
set /p slt=���������ѡ��Ȼ�� Enter��
if "%slt%"=="1" goto quickSetdevice2
if "%slt%"=="0" goto quickSetdevice
echo.
echo ��������������������롣
echo.
pause
goto quickSetdevice1

:quickSetdevice2
bcdedit %store% /set %currentItemGUID% device partition=%device%:
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems



:global
:globalMainMenu
cls
echo                     ���� BCD ȫ���趨
echo.
if "%store%"=="" (echo ��ǰѡ���Ĵ洢����ϵͳ��BCD) else (echo ��ǰѡ���Ĵ洢��%store:/store =%)
echo.
echo [1]       �޸���ʾ�˵���ʱ��
echo [2]       �޸��Ƿ���ʾ�˵������Ϊѡ����0�
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
    set numSelected=0
    set currentItemGUID={bootmgr}
    for /f "usebackq skip=2 tokens=1,2,3,4,5,6,7,8,9,10" %%A in ("%temp%\9826\BCDFixer\items\item0.txt") do (
        if %%A==��ʶ�� set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
        if %%A==description set currentItemDescription=%%B %%C %%D %%E %%F %%G %%H %%I %%J
    )
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
echo ��ǰ�˵�ʱ���� %timeout% �룬��ʱ��ȷ����ֵΪ0��Ч����
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
for /f "usebackq tokens=1,2" %%A in ("%temp%\9826\BCDFixer\items\item%numSelected%.txt") do (
    if %%A==%boolName% set bool=%%B
)
echo ��ǰѡ����������Ŀ��   %currentItemDescription%
echo.
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
bcdedit %store% /set %currentItemGUID% %boolName% %bool%
echo.
if ERRORLEVEL 1 echo �����˴��� & echo.
pause
set modifiedData=1
set menu=mainMenu
goto convertItems

:currentExport
cls
echo �㽫Ҫ������ǰϵͳ BCD ��
echo ������Ŀ���ļ�·�����������˫���š��˴������·���Ƿ���Ч��
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
echo �㽫Ҫ���ⲿ���벢�滻��ǰϵͳ BCD ��
echo �������ʹ�� /clean ������
echo �� EFI ������ϵͳ�ϣ����������ɾ�����е����й̼������
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
echo                     BCDFixer ����
echo.
echo   ��ǰ������·����%~dpnx0
echo.
rem echo [1] ���/ɾ���Ҽ��˵�
echo [2] ���������ɫ
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
echo.
echo ǰ��������Ժ�����̽���ɣ�
echo.
pause
goto settingsMainMenu

:changeColor
if not exist "%AppData%\9826" mkdir "%AppData%\9826"
cls
echo ���ʹ�� Windows �ն��������˱���ͼƬ����ô����ʹ�ò�����ɫ����ɫ��
echo.
echo ѡ����Ҫ����ɫ����ĸ�����ִ�Сд��
echo.
echo [1]Ĭ�� [2]���� [3]��ɫ [4]��ɫ [5]���� [6]��ɫ
echo [7]���� [8]�̵� [9]�ҵ� [A]�Ƶ� [B]�ϵ� [C]�۵�
echo.
echo [0]����
echo.
set /p co=ѡ��
if "%co%"=="1" color 07 & echo color 07>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="2" color 0f & echo color 0f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="3" color 0a & echo color 0a>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="4" color 0d & echo color 0d>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="5" color 0b & echo color 0b>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="6" color 0e & echo color 0e>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="7" color 1f & echo color 1f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="8" color 2f & echo color 2f>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="9" color 70 & echo color 70>"%AppData%\9826\color.bat" & goto changeColor
rem /i�������÷���������Ϊ�˲����ִ�Сд
if /i "%co%"=="A" color 6f & echo color 6f>"%AppData%\9826\color.bat" & goto changeColor
if /i "%co%"=="B" color 5f & echo color 5f>"%AppData%\9826\color.bat" & goto changeColor
if /i "%co%"=="C" color df & echo color df>"%AppData%\9826\color.bat" & goto changeColor
if "%co%"=="0" goto settingsMainMenu
echo.
echo ��������������������롣
echo.
pause
goto changeColor

:newBCDStore

:defineWindowsPath
cls
echo ��ѡ�����½�һ�� BCD �ļ���
echo ������Ŀǰ��֧��ʹ�� BCDBOOT ���
echo ���� Win7 ������ϵͳ��Ҫ�ֶ����� bcdboot.exe ��
echo BCDBOOT ָ��ֻ��ָ���� BCD ��������һ���̷����������Զ���·����
echo ���ڣ��������� Windows ϵͳ���ڵ��ļ��С����� C:\Windows ��
echo �������пո��������˫���š�
echo ���տɷ��ء�
echo.
set windowsPath=
set /p "windowsPath=>"
if "%windowsPath%"=="" (goto defineBCDStore1) else (
    if not exist "%windowsPath%" (
        echo.
        echo ��������������������롣
        echo.
        pause
        goto newBCDStore
    )
)

:defineFirmwareType
cls
echo ��ѡ��� BCD ������ BIOS ���� UEFI ������
echo.
echo [1] BIOS   [2] UEFI     [0]�� BCDBOOT ���о���
echo.
echo ������ѡ��ı�ţ�Ȼ���� Enter �����տɷ��ء�
echo.
set firmwareTypeSlt=
set /p "firmwareTypeSlt=>"
if "%firmwareTypeSlt%"=="1" set firmwareType=/f BIOS
if "%firmwareTypeSlt%"=="2" set firmwareType=/f UEFI
if "%firmwareTypeSlt%"=="0" set firmwareType=
if "%firmwareTypeSlt%"=="" goto defineWindowsPath
echo.
echo ��������������������롣
echo.
pause
goto defineFirmwareType

:defineBCDVolume
cls
echo ������Ҫ��� BCD ���̷���
echo ����ֻ��Ҫ����һ����ĸ���ɣ���Ҫ����ð�š�
echo BCDBOOT �������ѡ��Ĺ̼����ͷ�����������������Ѱ�ҵ��ļ��С�
echo ���տɷ��ء�
echo.
set BCDVolume=
set /p "BCDVolume=>"
if "%BCDVolume%"=="" (goto defineFirmwareType) else (
    if exist "%BCDVolume%:NUL" (
        bcdboot %windowsPath% /s %BCDVolume%: %firmwareType% /l zh-cn
        if errorlevel 1 (echo �����˴��� & echo.) else rem
        pause
        goto defineBCDStore1
    ) else (
        echo.
        echo ��������������������롣
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