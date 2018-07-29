@echo off
set var=%~d0%~p0%
cd "%var%"
set "var=%cd%\ACLight.psm1"
echo.
echo  Welcome, starting ACLight scan
powershell -noprofile -ExecutionPolicy Bypass Import-Module '%var%' -force ; Start-ACLsAnalysis
pause