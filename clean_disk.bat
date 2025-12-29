@echo off
title Windows Deep Cleanup Tool
color 0B

:: ==========================================
:: CHECK ADMIN PRIVILEGES
:: ==========================================
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Running as Administrator.
) else (
    echo [ERROR] This script requires Admin privileges.
    echo Right-click the file and select "Run as Administrator".
    pause
    exit
)

echo.
echo ========================================================
echo   WINDOWS DISK CLEANUP UTILITY
echo ========================================================
echo   This will delete temp files, update caches, and
echo   clean the WinSxS component store.
echo.
echo   Press any key to start...
pause >nul
cls

:: ==========================================
:: 1. CLEAN TEMP FILES
:: ==========================================
echo [STEP 1/4] Cleaning Temporary Files...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
echo Done.
echo.

:: ==========================================
:: 2. CLEAN UPDATE CACHE
:: ==========================================
echo [STEP 2/4] Resetting Windows Update Cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

if exist "C:\Windows\SoftwareDistribution" (
    rd /s /q "C:\Windows\SoftwareDistribution" >nul 2>&1
    echo Cache deleted.
)

net start wuauserv >nul 2>&1
net start bits >nul 2>&1
echo Done.
echo.

:: ==========================================
:: 3. SYSTEM COMPONENT CLEANUP (DISM)
:: ==========================================
echo [STEP 3/4] Cleaning Component Store (This may take time)...
dism /online /cleanup-image /startcomponentcleanup /quiet
echo Done.
echo.

:: ==========================================
:: 4. RECYCLE BIN
:: ==========================================
echo [STEP 4/4] Emptying Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1
echo Done.
echo.

:: ==========================================
:: OPTIONAL: AGGRESSIVE SETTINGS
:: Remove "::" below to enable
:: ==========================================

:: echo [OPTIONAL] Disabling Hibernation...
:: powercfg /h off

:: echo [OPTIONAL] Compressing OS...
:: compact.exe /CompactOS:always

echo ========================================================
echo   CLEANUP COMPLETE!
echo ========================================================
pause
