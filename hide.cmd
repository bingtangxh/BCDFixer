@echo off
title ��������ļ�
if /i "%1"=="/?" goto help
if /i "%1"=="-?" goto help
mode con lines=10 cols=40

if exist HIDE (
	Move HIDE Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}
	attrib +h +s Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}
	)
if not exist PHolder (
	MD PHolder
	if not exist HIDE md HIDE
	)
if /i "%1"=="/a" set p=%2&goto verify1
if /i "%1"=="-a" set p=%2&goto verify1

echo ��ʹ��/?�����鿴�������衣
echo.&pause&goto end
:input
if exist "%appdata%\9826\color.bat" (call "%appdata%\9826\color.bat") else (color 0a)
if /i "%1"=="/aa" goto input1
if /i "%1"=="-aa" goto input1
goto recordinfo
:recordinfo
echo %computername% %username%>>".\Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}\ATKLOG.TXT"
echo %date% %time% %cd% %cmdextversion%>>".\Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}\ATKLOG.TXT"
echo %cmdcmdline%>>".\Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}\ATKLOG.TXT"
goto input1
:input1
echo ���ã�����������
echo.
set /p "p=>"
if "%p~0,2%=="0x" goto wrong
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO IF "%p~0,1%"=="%%A" SET HN=1
FOR %%B IN (0 1 2 3 4 5 6 7 8 9) DO IF "%p~-1,1%"=="%%B" SET EN=1
if %HN%==1 (
	if %EN%==1 goto verify1
	)
goto wrong
:verify1
if /i "%1"=="-A" goto correctly1
if /i "%1"=="/A" goto correctly1
if /i "%1"=="-AA" goto correctly1
if /i "%1"=="/AA" goto correctly1
:correctly1
attrib -h -s Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}
move Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} HIDE

echo.
echo CORRECTLY
echo.&pause
goto end
:correctly2
echo.
echo ������ȷ
echo.&pause
explorer ".\PHolder"
goto end
:wrong
if /i "%1"=="/A" goto wrong2
if /i "%1"=="-A" goto wrong2
if /i "%1"=="/AA" goto wrong2
if /i "%1"=="-AA" goto wrong2
echo %p%>>".\Personalization.{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}\ATKLOG.TXT"
goto wrong2
:wrong2
cls&echo.
echo ���������������һ��
echo.
goto input1
:help
mode con lines=20 cols=60
echo ������ֻӦ���ڸ�Ŀ¼�����У�����λ��δ���в���
echo �������л��½�һ����ΪPHolder���ļ���
echo ��ѧϰ�����ƶ���PHolder�ļ���
echo Ȼ����������attrib���h��s����
echo �Ժ����Ҫ������ܴ��ˣ���ʼΪ20220201
echo ���������������ַ
echo.
echo https://netlify.4bcgoat.moe/hidefile/UD.html
echo.
echo ��������Internet��ݷ�ʽ������Urlmake.bat
echo.&pause
goto end
:end
exit /b 0