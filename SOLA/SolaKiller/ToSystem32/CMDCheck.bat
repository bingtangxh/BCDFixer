cls
echo ---------����ɨ�財��----------
echo ɨ�裺"%File%"

set File=%*
if not exist "%file%" goto End
findstr "SOLA_2.0_" "%File%" >nul & if not errorlevel 1 goto KillVirus
goto NomalFile

:KillVirus

echo ���ֲ������������...

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

if exist *.* del "%File%"

if exist *.* type *.*>"%RealName%"

echo %RealName%>>%systemroot%\SOLAResult.txt

cd.. >nul

rd /s /q C:\lsfile >nul


goto End



:NomalFile

:End
cls
echo ---------����ɨ�財��----------
echo ɨ�裺