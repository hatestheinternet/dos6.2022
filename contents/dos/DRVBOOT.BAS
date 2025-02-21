@echo off
rem Batch file to create a bootable, compressed floppy.

set _AM=XXX
if not "%_AM%" == "XXX" goto env_error

set DCMD=12345678
if not "%DCMD%" == "12345678" goto env_error

if "%1" == "/?" goto usage
if not "%1" == "" goto start

:usage
echo.
echo Batch file to create a bootable, compressed floppy. For use only with 
echo high density (1.44 and 1.2 megabyte) diskettes. Lower density diskettes
echo when compressed do not have adequate uncompressed space for system files 
echo required for booting.
echo.
echo Usage:  DRVBOOT drive:
echo.
goto end

:start
echo.
echo This batch file will create a bootable compressed diskette on either
echo a 1.44 megabyte 3.5 inch or 1.2 megabyte 5.25 inch floppy. Lower density
echo diskettes when compressed do not have adequate uncompressed space for system
echo files and should not be used.
choice /c:yn "Do you wish to continue "
if errorlevel 2 goto end

for %%a in (A: a: B: b:) do if '%%a=='%1 goto diskette
echo You have selected drive %1
choice /c:yn "Is this correct "
if errorlevel 2 goto end

:diskette
am drvspace > NUL
if errorlevel 2 goto version_error
if errorlevel 1 SET DCMD=DRVSPACE
am dblspace > NUL
if errorlevel 1 SET DCMD=DBLSPACE
if "%DCMD%" == "12345678" goto drvsp_error
SET _AM=OFF
am %1 > NUL
if errorlevel 1 SET _AM=ON
am %1 OFF > NUL
if errorlevel 1 goto am_error
choice /c:ny "Is diskette already compressed "
if errorlevel 2 goto nocompress
choice /c:yn "Do you wish to format the diskette first "
if errorlevel 2 goto noformat

echo. > c:\drvboot.tmp
echo n >> c:\drvboot.tmp
echo Formatting drive %1...
if not exist c:\drvboot.tmp goto no_temp
format %1 /v:drvboot /u < c:\drvboot.tmp > NUL
del c:\drvboot.tmp > nul
goto noformat
:no_temp
format %1 /u /q
if errorlevel 1 goto format_error

:noformat
echo Compressing drive %1...
%DCMD% /compress %1
:nocompress
%DCMD% /mount %1 > NUL
%DCMD% /size /reserve=.2 %1
copy c:\command.com %1

:mk_bootable
%DCMD% /unmount %1 > NUL

:system
sys %1
rem Create ini file on diskette
deltree /y %1\%DCMD%.ini > nul
echo MaxRemovableDrives=2 > %1\%DCMD%.ini
echo FirstDrive=E >> %1\%DCMD%.ini
echo LastDrive=I >> %1\%DCMD%.ini
echo MaxFileFragments=117 >> %1\%DCMD%.ini
echo ActivateDrive=I,A0 >> %1\%DCMD%.ini
attrib %1\%DCMD%.ini +s +h +r

if "%_AM%"=="ON" am %1 on
choice /c:yn "Mount new compressed drive now "
if errorlevel 2 goto end
%DCMD% /mount %1

goto end

:format_error
echo.
echo An error occured while attemting to format the diskette in drive %1.
echo Please retry with a new diskette.
echo.
goto end

:env_error
echo.
echo ERROR: Not enough environment space to run DRVBOOT.BAT!
echo.
goto end

:am_error
echo.
echo An error occured while disabling DriveSpace automount.
echo.
goto end

:drvsp_error
echo.
echo You need to have DriveSpace installed on your system
echo to be able to make a compressed bootable floppy diskette.
echo.
goto end

:version_error
echo.
echo You need to have MS-DOS 6.20 or greater installed on your system
echo to be able to make a compressed bootable floppy diskette.
echo.
:end
SET _AM=
SET DCMD=
