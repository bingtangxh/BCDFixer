@echo WScript.Sleep WScript.Arguments.Item(0) > delay.vbs
@cscript //nologo delay.vbs 2500 >nul && del delay.vbs