@echo off
C:
cd ~Install

if exist %systemroot%\system32\SolaScan.bat goto Err

md "%ProgramFiles%\KAKENHI'S"
copy /y ToSystem32\*.* %systemroot%\system32\*.*
copy /y ToProgram\GUICheck.bat "%ProgramFiles%\KAKENHI'S\GUICheck.bat"

md "%USERPROFILE%\「开始」菜单\程序\SOLA病毒专杀"
copy ToProgram\SolaKiller.bat "%USERPROFILE%\「开始」菜单\程序\SOLA病毒专杀\SolaKiller.bat"

echo regpath="%ProgramFiles%\KAKENHI'S\GUICheck.bat %1">C:\regdata.vbs
type %systemroot%\system32\SLAData.dll>>C:\regdata.vbs
cscript C:\regdata.vbs>unl
copy C:\regdata.vbs %systemroot%\system32\regdata.vbs
del C:\regdata.vbs
echo >%systemroot%\assoc.txt

goto End

:Err


:End
cd..
rd /q /s ~Install

exit