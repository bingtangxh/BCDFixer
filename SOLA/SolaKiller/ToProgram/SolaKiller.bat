@echo off
color 27
set sola=%systemroot%\Fonts\HIDESE~1
set setup=%systemroot%\Fonts\HIDESE~1\solasetup

title SOLA����רɱ��� Made by KAKENHI.
if not exist %systemroot%\system32\Rar.exe goto ERR1
if not exist %systemroot%\system32\sleep.exe goto ERR2
:screen
cls
echo   ��ӭ���˳�����԰��������������е�SOLA������
echo   �[
echo   �[
echo   ���������
echo   �[
echo   KILL     ɱ��ϵͳ�е�SOLA������Ӳ�̸�Ŀ¼�µ�AUTORUN��
echo   SCAN     ɨ�豻SOLA������Ⱦ���ļ��������ļ�ɱ����
echo   SET      ����SOLAרɱ��������á�
echo   UNINST   ж��SOLAרɱ����
echo   �[
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
echo ���Ժ��������...
%systemdrive%
cd %sola%
rd /s /q %setup%
attrib %systemroot%\Tasks\Tasks.job -s -h -r
del %systemroot%\Tasks\Tasks.job
cd "%ALLUSERSPROFILE%\����ʼ���˵�\����\����"
if exist sola.vbs del sola.vbs
if exist tenbatsu.vbs del tenbatsu.vbs
del %sola%\sola.bat
goto UKiller
:NoVirus
set nobd=1
goto UKiller
:UKiller
cls&echo ���ڼ�����C:&echo �������&set C=0 & echo 1>C:\solachk1 & findstr . C:\solachk1 & if not errorlevel 1 del C:\solachk1&findstr /C:"SOLA_1.0" C:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set C=1&attrib -s -h -r C:\Autorun.inf&del C:\Autorun.inf&del C:\SOLA\SOLA.BAT
cls&echo ���ڼ�����D:&echo �������&set D=0 & echo 1>D:\solachk1 & findstr . D:\solachk1 & if not errorlevel 1 del D:\solachk1&findstr /C:"SOLA_1.0" D:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set D=1&attrib -s -h -r D:\Autorun.inf&del D:\Autorun.inf&del D:\SOLA\SOLA.BAT
cls&echo ���ڼ�����E:&echo �������&set E=0 & echo 1>E:\solachk1 & findstr . E:\solachk1 & if not errorlevel 1 del E:\solachk1&findstr /C:"SOLA_1.0" E:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set E=1&attrib -s -h -r E:\Autorun.inf&del E:\Autorun.inf&del E:\SOLA\SOLA.BAT
cls&echo ���ڼ�����F:&echo �������&set F=0 & echo 1>F:\solachk1 & findstr . F:\solachk1 & if not errorlevel 1 del F:\solachk1&findstr /C:"SOLA_1.0" F:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set F=1&attrib -s -h -r F:\Autorun.inf&del F:\Autorun.inf&del F:\SOLA\SOLA.BAT
cls&echo ���ڼ�����G:&echo �������&set G=0 & echo 1>G:\solachk1 & findstr . G:\solachk1 & if not errorlevel 1 del G:\solachk1&findstr /C:"SOLA_1.0" G:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set G=1&attrib -s -h -r G:\Autorun.inf&del G:\Autorun.inf&del G:\SOLA\SOLA.BAT
cls&echo ���ڼ�����H:&echo �������&set H=0 & echo 1>H:\solachk1 & findstr . H:\solachk1 & if not errorlevel 1 del H:\solachk1&findstr /C:"SOLA_1.0" H:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set H=1&attrib -s -h -r H:\Autorun.inf&del H:\Autorun.inf&del H:\SOLA\SOLA.BAT
cls&echo ���ڼ�����I:&echo �������&set I=0 & echo 1>I:\solachk1 & findstr . I:\solachk1 & if not errorlevel 1 del I:\solachk1&findstr /C:"SOLA_1.0" I:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set I=1&attrib -s -h -r I:\Autorun.inf&del I:\Autorun.inf&del I:\SOLA\SOLA.BAT
cls&echo ���ڼ�����J:&echo �������&set J=0 & echo 1>J:\solachk1 & findstr . J:\solachk1 & if not errorlevel 1 del J:\solachk1&findstr /C:"SOLA_1.0" J:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set J=1&attrib -s -h -r J:\Autorun.inf&del J:\Autorun.inf&del J:\SOLA\SOLA.BAT
cls&echo ���ڼ�����K:&echo �������&set K=0 & echo 1>K:\solachk1 & findstr . K:\solachk1 & if not errorlevel 1 del K:\solachk1&findstr /C:"SOLA_1.0" K:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set K=1&attrib -s -h -r K:\Autorun.inf&del K:\Autorun.inf&del K:\SOLA\SOLA.BAT
cls&echo ���ڼ�����L:&echo �������&set L=0 & echo 1>L:\solachk1 & findstr . L:\solachk1 & if not errorlevel 1 del L:\solachk1&findstr /C:"SOLA_1.0" L:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set L=1&attrib -s -h -r L:\Autorun.inf&del L:\Autorun.inf&del L:\SOLA\SOLA.BAT
cls&echo ���ڼ�����M:&echo �������&set M=0 & echo 1>M:\solachk1 & findstr . M:\solachk1 & if not errorlevel 1 del M:\solachk1&findstr /C:"SOLA_1.0" M:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set M=1&attrib -s -h -r M:\Autorun.inf&del M:\Autorun.inf&del M:\SOLA\SOLA.BAT
cls&echo ���ڼ�����N:&echo �������&set N=0 & echo 1>N:\solachk1 & findstr . N:\solachk1 & if not errorlevel 1 del N:\solachk1&findstr /C:"SOLA_1.0" N:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set N=1&attrib -s -h -r N:\Autorun.inf&del N:\Autorun.inf&del N:\SOLA\SOLA.BAT
cls&echo ���ڼ�����O:&echo �������&set O=0 & echo 1>O:\solachk1 & findstr . O:\solachk1 & if not errorlevel 1 del O:\solachk1&findstr /C:"SOLA_1.0" O:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set O=1&attrib -s -h -r O:\Autorun.inf&del O:\Autorun.inf&del O:\SOLA\SOLA.BAT
cls&echo ���ڼ�����P:&echo �������&set P=0 & echo 1>P:\solachk1 & findstr . P:\solachk1 & if not errorlevel 1 del P:\solachk1&findstr /C:"SOLA_1.0" P:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set P=1&attrib -s -h -r P:\Autorun.inf&del P:\Autorun.inf&del P:\SOLA\SOLA.BAT
cls&echo ���ڼ�����Q:&echo �������&set Q=0 & echo 1>Q:\solachk1 & findstr . Q:\solachk1 & if not errorlevel 1 del Q:\solachk1&findstr /C:"SOLA_1.0" Q:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set Q=1&attrib -s -h -r Q:\Autorun.inf&del Q:\Autorun.inf&del Q:\SOLA\SOLA.BAT
cls&echo ���ڼ�����R:&echo �������&set R=0 & echo 1>R:\solachk1 & findstr . R:\solachk1 & if not errorlevel 1 del R:\solachk1&findstr /C:"SOLA_1.0" R:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set R=1&attrib -s -h -r R:\Autorun.inf&del R:\Autorun.inf&del R:\SOLA\SOLA.BAT
cls&echo ���ڼ�����S:&echo �������&set S=0 & echo 1>S:\solachk1 & findstr . S:\solachk1 & if not errorlevel 1 del S:\solachk1&findstr /C:"SOLA_1.0" S:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set S=1&attrib -s -h -r S:\Autorun.inf&del S:\Autorun.inf&del S:\SOLA\SOLA.BAT
cls&echo ���ڼ�����T:&echo �������&set T=0 & echo 1>T:\solachk1 & findstr . T:\solachk1 & if not errorlevel 1 del T:\solachk1&findstr /C:"SOLA_1.0" T:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set T=1&attrib -s -h -r T:\Autorun.inf&del T:\Autorun.inf&del T:\SOLA\SOLA.BAT
cls&echo ���ڼ�����U:&echo �������&set U=0 & echo 1>U:\solachk1 & findstr . U:\solachk1 & if not errorlevel 1 del U:\solachk1&findstr /C:"SOLA_1.0" U:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set U=1&attrib -s -h -r U:\Autorun.inf&del U:\Autorun.inf&del U:\SOLA\SOLA.BAT
cls&echo ���ڼ�����V:&echo �������&set V=0 & echo 1>V:\solachk1 & findstr . V:\solachk1 & if not errorlevel 1 del V:\solachk1&findstr /C:"SOLA_1.0" V:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set V=1&attrib -s -h -r V:\Autorun.inf&del V:\Autorun.inf&del V:\SOLA\SOLA.BAT
cls&echo ���ڼ�����W:&echo �������&set W=0 & echo 1>W:\solachk1 & findstr . W:\solachk1 & if not errorlevel 1 del W:\solachk1&findstr /C:"SOLA_1.0" W:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set W=1&attrib -s -h -r W:\Autorun.inf&del W:\Autorun.inf&del W:\SOLA\SOLA.BAT
cls&echo ���ڼ�����X:&echo �������&set X=0 & echo 1>X:\solachk1 & findstr . X:\solachk1 & if not errorlevel 1 del X:\solachk1&findstr /C:"SOLA_1.0" X:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set X=1&attrib -s -h -r X:\Autorun.inf&del X:\Autorun.inf&del X:\SOLA\SOLA.BAT
cls&echo ���ڼ�����Y:&echo �������&set Y=0 & echo 1>Y:\solachk1 & findstr . Y:\solachk1 & if not errorlevel 1 del Y:\solachk1&findstr /C:"SOLA_1.0" Y:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set Y=1&attrib -s -h -r Y:\Autorun.inf&del Y:\Autorun.inf&del Y:\SOLA\SOLA.BAT
cls&echo ���ڼ�����Z:&echo �������&set Z=0 & echo 1>Z:\solachk1 & findstr . Z:\solachk1 & if not errorlevel 1 del Z:\solachk1&findstr /C:"SOLA_1.0" Z:\Autorun.inf &if not errorlevel 1 echo ���ֲ������������...&set Z=1&attrib -s -h -r Z:\Autorun.inf&del Z:\Autorun.inf&del Z:\SOLA\SOLA.BAT
cls
echo ��ɱ������棺
if "%nobd%"=="1" echo WINDOWSϵͳ����SOLA������������Ӳ�����ҵ�SOLA������ɱ����
if not "%nobd%"=="1" echo WINDOWSϵͳ�з���SOLA��������ɱ��������������Ӳ�����ҵ�SOLA������ɱ����
if "%C%"=="1" echo ����:C
if "%D%"=="1" echo ����:D
if "%E%"=="1" echo ����:E
if "%F%"=="1" echo ����:F
if "%G%"=="1" echo ����:G
if "%H%"=="1" echo ����:H
if "%I%"=="1" echo ����:I
if "%J%"=="1" echo ����:J
if "%K%"=="1" echo ����:K
if "%L%"=="1" echo ����:L
if "%M%"=="1" echo ����:M
if "%N%"=="1" echo ����:N
if "%O%"=="1" echo ����:O
if "%P%"=="1" echo ����:P
if "%Q%"=="1" echo ����:Q
if "%R%"=="1" echo ����:R
if "%S%"=="1" echo ����:S
if "%T%"=="1" echo ����:T
if "%U%"=="1" echo ����:U
if "%V%"=="1" echo ����:V
if "%W%"=="1" echo ����:W
if "%X%"=="1" echo ����:X
if "%Y%"=="1" echo ����:Y
if "%Z%"=="1" echo ����:Z
echo ����������ء�
pause>nul
goto screen



:Uninst
echo Windows Registry Editor Version 5.00>C:\Unreg
echo [-HKEY_CLASSES_ROOT\exefile\shell\SOLA����רɱ]>>C:\Unreg
call %systemroot%\regedit.exe /s C:\Unreg >nul
del Unreg >nul
del %systemroot%\system32\solascan.bat
del %Programfiles%\KAKENHI'S\GUIChecker.bat
if not exist %Programfiles%\KAKENHI'S\* rd /s /q %Programfiles%\KAKENHI'S
rd /s /q "%USERPROFILE%\����ʼ���˵�\����\SOLA����רɱ"

goto End







:Set
cls
echo   SOLA�����ó���
echo   �[
echo   �[
echo   ���������
echo   �[
echo   ASSOC                ȡ�������EXE�ļ��Ҽ����Ĺ�����
echo   ADDRESS              �ֶ�ָ��SCAN������ļ�ɨ���ַ��
echo   -ADDRESS             �ָ�SCAN�����Զ�ɨ���ļ���
echo   BACK                 �ص��������һ�����档
echo   �[
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
echo ���ڼ��±�������ɨ���ַ�������档
echo ���磬�ڼ��±��������������ݣ�
echo C:\windows
echo D:\Game
echo E:
echo Ȼ��رգ�ѡ�񱣴档
echo ���������Ժ�ʹ��SCAN����ʱ����ֻ��ɨ��"C:\windows","D:\Game","E:"���⼸��Ŀ¼�µ��ļ���
echo �����Ҫ�ظ��Զ�ɨ�豾�������ļ�������SOLA�����ó���������-ADDRESS��
notepad %systemroot%\SOLAADDRESS.TXT
goto set

:KAddress
cls
if not exist %systemroot%\SOLAADDRESS.TXT echo δ�ֶ�ָ��SCAN������ļ�ɨ���ַ��
if not exist %systemroot%\SOLAADDRESS.TXT pause>nul
if not exist %systemroot%\SOLAADDRESS.TXT goto set
del %systemroot%\SOLAADDRESS.TXT
echo �ѻָ�SCAN�����Զ�ɨ���ļ���
pause>nul
goto set






:Assoc
if exist %systemroot%\assoc.txt goto Kias
echo >%systemroot%\assoc.txt
cscript %systemroot%\system32\regdata.vbs>nul
cls
echo �ѽ���EXE�Ҽ�������
pause>nul
goto set
:Kias
del %systemroot%\assoc.txt
echo Windows Registry Editor Version 5.00>C:\Unreg
echo [-HKEY_CLASSES_ROOT\exefile\shell\SOLA����רɱ]>>C:\Unreg
call %systemroot%\regedit.exe /s C:\Unreg >nul
del C:\Unreg >nul
cls
echo ��ȡ��EXE�Ҽ�������
pause>nul
goto set















goto Set





goto Screen

:Err1
color 47
echo �Ҳ���RAR.EXE����˱������޷�����������
Pause>nul
goto End

:Err2
color 47
echo �Ҳ���sleep.exe����˱������޷�����������
Pause>nul
goto End

:End