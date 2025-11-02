@echo off
REM Build dengan verbose output untuk melihat error detail
cd /d "D:\TRPL UGM\SEM 3\PPPB\pppbandroid"

echo.
echo ======================================
echo Building ContactApp dengan verbose output
echo ======================================
echo.

REM Run gradle build dengan stacktrace
gradlew.bat build --stacktrace 2>&1 | tee build_output.log

echo.
echo Build selesai. Output disimpan di: build_output.log
pause

