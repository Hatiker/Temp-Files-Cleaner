@echo off
:: Temp Files Cleaner
:: Author: YourGitHubUsername
:: This script removes temporary files in Windows

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running as Administrator...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit
)

echo Cleaning temporary files...

:: Deleting temp files
del /s /q %temp%\*.*  
del /s /q C:\Windows\Temp\*.*  
del /s /q C:\Windows\Prefetch\*.*  

:: Removing empty folders
for /d %%X in (%temp%\*) do rd /s /q "%%X"
for /d %%X in (C:\Windows\Temp\*) do rd /s /q "%%X"
for /d %%X in (C:\Windows\Prefetch\*) do rd /s /q "%%X"

echo Cleanup completed!
pause