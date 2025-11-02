@echo off
REM Script untuk membersihkan dan rebuild gradle project

setlocal enabledelayedexpansion

cd /d "D:\TRPL UGM\SEM 3\PPPB\pppbandroid"

echo.
echo ========================================
echo ContactApp - Clean Build Procedure
echo ========================================
echo.

echo [1/5] Stopping gradle daemon...
call gradlew.bat --stop
if errorlevel 1 echo Warning: Could not stop gradle daemon
echo Done!
echo.

echo [2/5] Cleaning project...
call gradlew.bat clean --no-daemon
if errorlevel 1 (
    echo ERROR: Clean failed
    goto :error
)
echo Done!
echo.

echo [3/5] Deleting gradle cache...
if exist ".gradle" (
    echo Removing .gradle folder...
    rmdir /s /q ".gradle"
)
echo Done!
echo.

echo [4/5] Building project...
call gradlew.bat build --no-daemon --stacktrace
if errorlevel 1 (
    echo ERROR: Build failed - see above for details
    goto :error
)
echo Done!
echo.

echo [5/5] Build successful!
echo.
echo ========================================
echo Build Status: SUCCESS ✓
echo ========================================
echo.
pause
exit /b 0

:error
echo.
echo ========================================
echo Build Status: FAILED ✗
echo ========================================
echo.
echo Troubleshooting tips:
echo 1. Check Android Studio for detailed error messages
echo 2. Verify all layout XML files are valid
echo 3. Try: File > Invalidate Caches > Restart
echo 4. Run: gradlew.bat clean build --stacktrace
echo.
pause
exit /b 1

