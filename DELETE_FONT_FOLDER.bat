@echo off
REM Delete font folder yang mungkin menyebabkan masalah
REM Font files adalah placeholder, bukan TTF asli

setlocal enabledelayedexpansion

set FONT_DIR="D:\TRPL UGM\SEM 3\PPPB\pppbandroid\app\src\main\res\font"

echo.
echo ========================================
echo Removing Font Placeholder Files
echo ========================================
echo.

if exist %FONT_DIR% (
    echo Deleting font directory: %FONT_DIR%
    rmdir /s /q %FONT_DIR%
    echo Done!
) else (
    echo Font directory not found (already deleted)
)

echo.
echo Now you can:
echo 1. Run CLEAN_BUILD.bat to rebuild
echo 2. Or run gradlew clean build in terminal
echo.
pause

