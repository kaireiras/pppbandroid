@echo off
REM Fix for AVD Medium_Phone emulator termination issue
REM Run this script as Administrator

echo.
echo ======================================
echo Android Emulator Fix Script
echo ======================================
echo.

REM Set paths
set ANDROID_HOME=%USERPROFILE%\AppData\Local\Android\Sdk
set AVD_PATH=%USERPROFILE%\.android\avd\Medium_Phone.avd

echo Checking Android SDK location...
if not exist "%ANDROID_HOME%" (
    echo Error: Android SDK not found in %ANDROID_HOME%
    echo Please set ANDROID_HOME environment variable
    pause
    exit /b 1
)

echo Android SDK found at: %ANDROID_HOME%
echo.

REM Backup existing AVD
if exist "%AVD_PATH%" (
    echo Backing up existing AVD...
    if not exist "%AVD_PATH%_backup" (
        xcopy "%AVD_PATH%" "%AVD_PATH%_backup" /E /I /Y
        echo Backup created at: %AVD_PATH%_backup
    )
)

echo.
echo ======================================
echo Emulator Configuration Fixes:
echo ======================================
echo.

echo 1. Clearing emulator cache and data...
echo Deleting cached data (keeping configuration)...
if exist "%AVD_PATH%\cache.img" del "%AVD_PATH%\cache.img"
if exist "%AVD_PATH%\cache.img.qcow2" del "%AVD_PATH%\cache.img.qcow2"
if exist "%AVD_PATH%\userdata-qemu.img" del "%AVD_PATH%\userdata-qemu.img"

echo Done!
echo.

echo 2. Checking AVD config file...
if exist "%AVD_PATH%\config.ini" (
    echo config.ini found. Current settings:
    type "%AVD_PATH%\config.ini"
    echo.
) else (
    echo Warning: config.ini not found
)

echo.
echo 3. Creating optimized config.ini...
(
    echo hw.ramSize=2048
    echo hw.vm.heapSize=512
    echo disk.dataPartition.size=2048M
    echo hw.device.manufacturer=Google
    echo hw.device.name=medium_phone
    echo hw.gpu.enabled=yes
    echo hw.gpu.mode=auto
    echo hw.mainKeys=no
    echo image.sysdir.1=system-images/android-36/google_apis/x86_64/
    echo showDeviceFrame=yes
    echo skin.dynamic=yes
    echo skin.name=medium_phone
    echo tag.display=Google APIs
    echo tag.id=google_apis
    echo vm.heapSize=512
) > "%AVD_PATH%\config.ini.new"

echo Optimized config created!
echo.

echo 4. Recommending next steps...
echo.
echo IMPORTANT - Choose ONE option:
echo.
echo Option A (QUICK FIX):
echo   1. Delete the corrupted AVD:
echo      - Open Device Manager in Android Studio
echo      - Right-click "Medium_Phone" and select "Delete"
echo   2. Create a new AVD with these settings:
echo      - Device: Pixel 6 or similar
echo      - API Level: 34 or 35
echo      - RAM: 2048 MB
echo      - Storage: 2048 MB
echo      - Graphics: Hardware acceleration (Auto)
echo.
echo Option B (MANUAL CONFIG FIX):
echo   1. Open: %AVD_PATH%\config.ini
echo   2. Replace with optimized version
echo   3. Restart Android Studio
echo   4. Try running emulator
echo.
echo Option C (GRADLE REBUILD):
echo   1. Open Terminal in Android Studio
echo   2. Run: gradlew clean build
echo   3. Run: gradlew installDebug
echo.
echo Option D (X86 EMULATOR):
echo   1. Create new AVD with x86_64 architecture
echo   2. Faster and uses less RAM
echo.

echo.
echo ======================================
echo Troubleshooting Tips:
echo ======================================
echo.
echo - Disable unnecessary apps and background processes
echo - Allocate more RAM to emulator (minimum 2048 MB)
echo - Use x86_64 architecture instead of ARM64
echo - Enable hardware acceleration in BIOS if available
echo - Update Android SDK tools to latest version
echo - Clear Android Studio cache: File > Invalidate Caches
echo.
echo Press any key to exit...
pause

