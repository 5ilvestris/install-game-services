@echo off


:: Enter Admin Mode
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
echo Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"


::Call Batch Code Colors
setlocal
call :setESC

::Installation Code
cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[36m.Net Framework Installing...%ESC%[0m
start /wait dotNetFx40.exe /install /quiet /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[36mDirectX Installing...%ESC%[0m
start /wait dxwebsetup.exe /q


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[36mOpenAL Installing...%ESC%[0m
start /wait oalinst.exe /silent


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[36mXNA Framework Installing...%ESC%[0m
start /wait xnaf40.msi /passive


set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[36m2005%ESC%[0m %ESC%[34m2008 2010 2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2005_x86.exe /q

cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005%ESC%[0m%ESC%[36m 2008%ESC%[0m %ESC%[34m2010 2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2008_x86.exe /qb


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008%ESC%[0m%ESC%[36m 2010%ESC%[0m %ESC%[34m2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2010_x86.exe /passive /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010%ESC%[0m%ESC%[36m 2012%ESC%[0m %ESC%[34m2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2012_x86.exe /passive /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010 2012%ESC%[0m%ESC%[36m 2013%ESC%[0m %ESC%[34m2015-22%ESC%[0m )
start /wait cpp/vcredist2013_x86.exe /passive /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010 2012 2013%ESC%[0m%ESC%[36m 2015-22%ESC%[0m )
start /wait cpp/vcredist2015-22_x86.exe /passive /norestart

goto END

:X64


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[36m2005%ESC%[0m %ESC%[34m2008 2010 2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2005_x86.exe /q
start /wait cpp/vcredist2005_x64.exe /q


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005%ESC%[0m%ESC%[36m 2008%ESC%[0m %ESC%[34m2010 2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2008_x86.exe /qb
start /wait cpp/vcredist2008_x64.exe /qb


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008%ESC%[0m%ESC%[36m 2010%ESC%[0m %ESC%[34m2012 2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2010_x86.exe /passive /norestart
start /wait cpp/vcredist2010_x64.exe /passive /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010%ESC%[0m%ESC%[36m 2012%ESC%[0m %ESC%[34m2013 2015-22%ESC%[0m )
start /wait cpp/vcredist2012_x86.exe /passive /norestart
start /wait cpp/vcredist2012_x64.exe /passive /norestart


cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010 2012%ESC%[0m%ESC%[36m 2013%ESC%[0m %ESC%[34m2015-22%ESC%[0m )
start /wait cpp/vcredist2013_x86.exe /passive /norestart
start /wait cpp/vcredist2013_x64.exe /passive /norestart

cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[36mC++ Runtime Packages Installing...%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010 2012 2013%ESC%[0m%ESC%[36m 2015-22%ESC%[0m )
start /wait cpp/vcredist2015-22_x86.exe /passive /norestart
start /wait cpp/vcredist2015-22_x64.exe /passive /norestart

:END
cls
echo       %ESC%[31mSilvestris Game Services Installer%ESC%[0m
echo.
echo    %ESC%[32m.Net Framework Installed%ESC%[0m
echo    %ESC%[32mDirectX Installed%ESC%[0m
echo    %ESC%[32mOpenAL Installed%ESC%[0m
echo    %ESC%[32mXNA Framework Installed%ESC%[0m
echo    %ESC%[32mC++ Runtime Packages Installed%ESC%[0m
echo    ( %ESC%[32m2005 2008 2010 2012 2013 2015-22%ESC%[0m )

pause


::Batch Code Color
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0