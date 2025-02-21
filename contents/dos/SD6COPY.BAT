@echo off
if not "%1"=="" goto checkit
echo To install the Supplemental Utilities, type SETUP at the command prompt.
goto done

:checkit
if "%1"=="CHANGEDISK" goto chngdsk

if not exist %2\%1 goto doit
echo There is already a file named %1 in %2.
%2\choice /c:yn "Do you want to overwrite it?  Yes, No "
if errorlevel 2 goto done

:doit
if "%3"=="NC" goto special
echo   Copying %1 to %2\%1
%2\expand %1 %2\%1  > NUL
if "%3"=="D" setver %1 /D /QUIET > NUL
goto done
:special
echo   Copying %1 to %2
%4\expand %1 %2  > NUL
goto done



:chngdsk
if "%SD6%"=="%2" goto done
if exist %DISK%ID0%2.BAT goto newdisk
echo.
echo Insert Supplemental Disk %2, and then press ENTER.
pause
goto chngdsk

:newdisk
set SD6=%2

:done

