@echo off
title 隐藏你的文件
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

echo 请使用/?参数查看后续步骤。
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
echo 您好，请输入密码
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
echo 密码正确
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
echo 密码错误，请再输入一次
echo.
goto input1
:help
mode con lines=20 cols=60
echo 本程序只应该在根目录下运行，其他位置未进行测试
echo 初次运行会新建一个名为PHolder的文件夹
echo 将学习资料移动至PHolder文件夹
echo 然后请自行用attrib添加h和s属性
echo 以后就需要密码才能打开了，初始为20220201
echo 详情请查阅以下网址
echo.
echo https://netlify.4bcgoat.moe/hidefile/UD.html
echo.
echo 如需生成Internet快捷方式，请用Urlmake.bat
echo.&pause
goto end
:end
exit /b 0