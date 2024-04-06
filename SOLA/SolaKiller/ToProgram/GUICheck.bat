@echo off

set File=%*
if not exist "%File%" goto End
attrib "%File%" -s -h -r >nul

if exist C:\lsfile goto Klsfile >nul
goto start >nul

:Klsfile
attrib C:\lsfile\* -s -h -r >nul

rd /s /q C:\lsfile >nul

:Start

findstr "SOLA_2.0_" "%File%" >nul & if not errorlevel 1 goto KillVirus
goto NomalFile

:KillVirus
echo ======清除病毒======
echo 请稍等...
color 27

md C:\lsfile >nul

C: >nul

cd\ >nul

cd C:\lsfile >nul

copy "%File%" "~Runner.exe" >nul

rar e ~Runner.exe >nul

attrib *.* -s -h -r >nul

del Function.dll >nul

FOR /F "tokens=4 delims=." %%i in ('findstr /c:"set Name=" *.bat') do set type=%%i

for /f "tokens=1 delims=." %%i in ("%File%") do set RealName=%%i.%type%

del *.bat

del *.exe

if exist *.* del %File%

if exist *.* type *.*>%RealName%


cd.. >nul

rd /s /q C:\lsfile >nul

echo %RealName%
echo 此文件中病毒已被清除。

sleep 2000

goto End



:NomalFile
color 17
echo %File%
echo 此文件未被感染。

sleep 2000


:End