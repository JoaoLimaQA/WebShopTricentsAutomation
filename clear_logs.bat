@REM DEL /s /q /f *screenshot*
DEL /Q /F "%~dp0*.png"
DEL /s /q /f log.html
DEL /s /q /f output.xml
DEL /s /q /f report.html
DEL /s /q /f interactive_console_output.xml
DEL /s /q /f Resource\Downloads
DEL /q /s Reports\*
RMDIR /q /s Reports
MKDIR Reports