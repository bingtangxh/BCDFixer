@echo off
if not exist %systemroot%\system32\Rar.exe goto ERR2
color 27

for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do vol %%i:&if errorlevel 0 set %%i=1
if exist %systemroot%\SOLAResult.txt del %systemroot%\SOLAResult.txt
cls
echo ---------����ɨ�財��----------
if exist %systemroot%\SOLAADDRESS.TXT goto SD

if "%C%"=="1" echo ���ڻ�ȡC�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b C:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%D%"=="1" echo ���ڻ�ȡD�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b D:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%E%"=="1" echo ���ڻ�ȡE�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b E:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%F%"=="1" echo ���ڻ�ȡF�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b F:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%G%"=="1" echo ���ڻ�ȡG�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b G:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%H%"=="1" echo ���ڻ�ȡH�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b H:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%I%"=="1" echo ���ڻ�ȡI�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b I:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%J%"=="1" echo ���ڻ�ȡJ�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b J:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%K%"=="1" echo ���ڻ�ȡK�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b K:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%L%"=="1" echo ���ڻ�ȡL�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b L:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%M%"=="1" echo ���ڻ�ȡM�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b M:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%N%"=="1" echo ���ڻ�ȡN�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b N:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%O%"=="1" echo ���ڻ�ȡO�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b O:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%P%"=="1" echo ���ڻ�ȡP�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b P:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Q%"=="1" echo ���ڻ�ȡQ�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b Q:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%R%"=="1" echo ���ڻ�ȡR�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b R:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%S%"=="1" echo ���ڻ�ȡS�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b S:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%T%"=="1" echo ���ڻ�ȡT�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b T:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%U%"=="1" echo ���ڻ�ȡU�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b U:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%V%"=="1" echo ���ڻ�ȡV�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b V:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%W%"=="1" echo ���ڻ�ȡW�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b W:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%X%"=="1" echo ���ڻ�ȡX�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b X:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Y%"=="1" echo ���ڻ�ȡY�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b Y:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
if "%Z%"=="1" echo ���ڻ�ȡZ�̵��ļ�Ŀ¼...&FOR /F "delims=" %%i in ('dir /s /b Z:\*.exe') do call %systemroot%\system32\CMDCheck.bat %%i
goto Result

:SD
FOR /F "delims=" %%i in (%systemroot%\SOLAADDRESS.TXT) do echo ���ڻ�ȡ"%%i"�е��ļ�Ŀ¼...&FOR /F "delims=" %%j in ('dir /s /b %%i\*.exe') do call %systemroot%\system32\CMDCheck.bat %%j
goto Result



:Result
if not exist %systemroot%\SOLAResult.txt goto ERR1
echo ����ɨ���������ļ��з��ֲ��������
type %systemroot%\SOLAResult.txt
pause>nul
goto End

:Err1
cls
echo ����ɨ��δ���ֲ�����
pause>nul
goto End
:Err2
color 47
echo �Ҳ���RAR.EXE����˴˳����޷�����������
Pause>nul
:End