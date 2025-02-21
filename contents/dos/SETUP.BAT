@echo off
if "%2"=="COPY" goto docopy
echo.
echo Installs the MS-DOS 6.22 Supplemental Utilities, including:
echo    * AccessDOS - assists persons with disabilities in using MS-DOS 6.22
echo    * Keyboard utilities, including ISO fonts and Dvorak keyboard layouts
echo    * A program for creating a bootable compressed floppy disk
echo    * Utilities from MS-DOS 5.0 that were not included with MS-DOS 6.22
echo    * Updated network files for MS-DOS 6.22
echo    * MS-DOS Shell
echo.

set OCPCMD=%COPYCMD%
set COPYCMD=/y
if not "%COPYCMD%"=="/y" goto enverr

if "%1"=="" goto usage

echo Which components do you want to install?
echo.
echo   A: All the components (requires about 1.4 MB of free disk space)
echo   S: Selected components only
echo   X: Exit
echo.
choice /c:asx "All, Selected, Exit "
if errorlevel 3 goto done
set SD6=S
if not "%SD6%"=="S" goto enverr
if errorlevel 2 goto checkdir
set SD6=A

:checkdir
set DISK=XXX
if not "%DISK%"=="XXX" goto enverr

if exist 360ID01.bat set DISK=360
if exist 720ID01.bat set DISK=720
if not exist %DISK%ID01.BAT goto direrr

echo.
expand %DISK%id01.bat %1\amjklfgh.000 > NUL
if exist %1\amjklfgh.000 goto package1

echo The %1 directory does not exist.
echo Do you want to create it?
choice /c:yx "Yes, Exit "
if errorlevel 2 goto done

echo Creating the %1 directory.
md %1
expand %DISK%id01.bat %1\amjklfgh.000 > NUL
if not exist %1\amjklfgh.000 goto patherr



:package1
if "%SD6%"=="A" goto auto1
echo.
echo.
echo AccessDOS
echo =========
echo AccessDOS is a package of MS-DOS extensions for users with movement 
echo or hearing disabilities. These extensions provide better access to 
echo computers that run MS-DOS 6.22. AccessDOS requires about 265K of 
echo free disk space.
echo.
echo Do you want to copy the AccessDOS utilities?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto package2

:auto1
echo TAG > %1\amjklfgh.001



:package2
if "%SD6%"=="A" goto auto2
echo.
echo Keyboard Utilities
echo ==================
echo This package includes three Dvorak keyboard layouts, which can be used
echo with any standard keyboard. These layouts are specifically designed to
echo help individuals who type with a single hand or who have difficulty
echo with the standard QWERTY layout.
echo.
echo The package also includes KBDBUF.SYS, which allows you to increase your
echo keyboard type-ahead buffer, and ISO.CPI a monospace (nonproportional)
echo display font.
echo.
echo This package requires about 65K of free disk space.
echo.
echo Do you want to copy the keyboard utilities?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto package3

:auto2
echo TAG > %1\amjklfgh.002



:package3
if "%SD6%"=="A" goto auto3
echo.
echo Creating a Bootable Compressed Floppy Disk
echo ==========================================
echo The DRVBOOT.BAT program creates a bootable compressed floppy disk. 
echo This program requires about 10K of free disk space.
echo.
echo Do you want to copy this program?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto package4

:auto3
echo TAG > %1\amjklfgh.003



:package4
if "%SD6%"=="A" goto auto4
echo.
echo Additional MS-DOS Utilites
echo ==========================
echo This package contains utilities from MS-DOS 5.0 that were not included
echo with MS-DOS 6.22. This package requires about 350K of free disk space.
echo.
echo Do you want to copy these utilities?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto package5
echo.

:auto4
echo TAG > %1\amjklfgh.004



:package5
if "%SD6%"=="A" goto auto5
echo.
echo MS-DOS 6.22 Network Files
echo =========================
echo If you upgraded to MS-DOS 6.22 from a version of MS-DOS less than 5.0,
echo you might need to update your network files.  This package contains the
echo networks files that will work with MS-DOS 6.22. The package requires about
echo 275K of free disk space.
echo.
echo Do you want to copy the network files?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto package6
echo.

:auto5
echo TAG > %1\amjklfgh.005

:package6
if "%SD6%"=="A" goto auto6
echo.
echo MS-DOS Shell
echo ============
echo This package requires about 450K of free disk space.
echo.
echo Do you want to copy the MS-DOS Shell?
choice /c:ynx "Yes, No, Exit "
echo.
if errorlevel 3 goto done
if errorlevel 2 goto copyit
echo.

:auto6
echo TAG > %1\amjklfgh.006

set DSHL=XXXXXX
if not "%DSHL%"=="XXXXXX" goto enverr

:dshloop
cls
Echo Enter your display type by pressing the appropriate function key.
Echo.
Echo MS-DOS can use the following display types:
Echo.
Echo F1  -  Monochrome
Echo F2  -  CGA
Echo F3  -  EGA
Echo F4  -  EGA Monochrome
Echo F5  -  VGA
Echo F6  -  VGA Monochrome
Echo F7  -  Hercules
Echo F8  -  MCGA
Echo F9  -  8514
Echo F10 -  Quit
Echo.
:get_key
get_func.com
if errorlevel 69 goto get_key
if errorlevel 68 goto dshdone
if errorlevel 67 if not errorlevel 68 goto 8514
if errorlevel 66 if not errorlevel 67 goto mcga
if errorlevel 65 if not errorlevel 66 goto herc
if errorlevel 64 if not errorlevel 65 goto vgamono
if errorlevel 63 if not errorlevel 64 goto vga
if errorlevel 62 if not errorlevel 63 goto egamono
if errorlevel 61 if not errorlevel 62 goto ega
if errorlevel 60 if not errorlevel 61 goto cga
if errorlevel 59 if not errorlevel 60 goto mono
goto dshloop

:mono
Echo You selected "Monochrome". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpmono
goto dshdone

:cga
Echo You selected "CGA". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpcga
goto dshdone

:ega
Echo You selected "EGA". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpega
goto dshdone

:egamono
Echo You selected "EGA Monochrome". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpegam
goto dshdone

:vga
Echo You selected "VGA". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpvga
goto dshdone

:vgamono
Echo You selected "VGA Monochrome". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpvgam
goto dshdone

:herc
Echo You selected "Hercules". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpherc
goto dshdone

:mcga
Echo You selected "MCGA". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cpmcga
goto dshdone

:8514
Echo You selected "8514". Is this correct?
choice /c:yn "Yes, No "
if errorlevel 2 goto dshloop
set DSHL=cp8514
goto dshdone

:dshdone
if "%DSHL%"=="XXXXXX" goto dshlrerr

:copyit
if not exist %1\amjklfgh.00? goto done

echo.
echo Please Wait...
copy sd6copy.bat %1 > NUL
if exist %1\choice.com ren %1\choice.com choice.999 > NUL
copy choice.com %1 > NUL
if exist %1\expand.exe ren %1\expand.exe expand.999 > NUL
copy expand.exe %1 > NUL
copy setup.bat %1\sd6setup.bat > NUL
%1\sd6setup %1 COPY

:docopy
set SD6=1
echo.
echo Copying Supplemental Utilities...
echo ---------------------------------------


if not exist %1\amjklfgh.001 goto copy2
call %1\sd6copy ADOS.OVL %1
call %1\sd6copy ADOS.COM %1
call %1\sd6copy ADOS.CFG %1
call %1\sd6copy ADOS.TXT %1
call %1\sd6copy AREADME.TXT %1
call %1\sd6copy FAKEMOUS.COM %1


:copy2
if not exist %1\amjklfgh.002 goto copy3
call %1\sd6copy DVORAK.SYS %1
call %1\sd6copy DVORAK.TXT %1
call %1\sd6copy KBDBUF.SYS %1
call %1\sd6copy ISO.CPI %1
call %1\sd6copy ISO.TXT %1


:copy3
if not exist %1\amjklfgh.003 goto copy4
call %1\sd6copy DRVBOOT.BAT %1
call %1\sd6copy AM.EXE %1


:copy4
if not exist %1\amjklfgh.004 goto copy5
call %1\sd6copy ASSIGN.COM %1 D
call %1\sd6copy BACKUP.EXE %1 D
call %1\sd6copy COMP.EXE %1
call %1\sd6copy CV.COM %1
call %1\sd6copy EDLIN.EXE %1 D
call %1\sd6copy JOIN.EXE %1 D
call %1\sd6copy 4201.CPI %1
call %1\sd6copy 4208.CPI %1
call %1\sd6copy 5202.CPI %1
call %1\sd6copy LCD.CPI %1
call %1\sd6copy GORILLA.BAS %1
call %1\sd6copy MONEY.BAS %1
call %1\sd6copy NIBBLES.BAS %1
call %1\sd6copy REMLINE.BAS %1
call %1\sd6copy EXE2BIN.EXE %1 D
call %1\sd6copy GRAFTABL.COM %1 D
call %1\sd6copy MIRROR.COM %1
call %1\sd6copy MSHERC.COM %1
call %1\sd6copy PRINTER.SYS %1
call %1\sd6copy PRINTFIX.COM %1
call %1\sd6copy COMMANDS.TXT %1


:copy5
if not exist %1\amjklfgh.005 goto copy6

if "%DISK%"=="360" call %1\sd6copy CHANGEDISK 2

call %1\sd6copy NET.1XE %1
call %1\sd6copy SETNAME.EXE %1
call %1\sd6copy NETBEUI.DOS %1
call %1\sd6copy NETWKSTA.1XE %1
call %1\sd6copy NETWKSTA.2XE %1
call %1\sd6copy REDIR.1XE %1
call %1\sd6copy REDIR.2XE %1
call %1\sd6copy NET.TXT %1

:copy6
if not exist %1\amjklfgh.006 goto donecopy

if "%DISK%"=="360" call %1\sd6copy CHANGEDISK 3
if "%DISK%"=="720" call %1\sd6copy CHANGEDISK 2

call %1\sd6copy dosshell.com    %1
call %1\sd6copy dosshell.exe    %1
call %1\sd6copy dosshell.hlp    %1
call %1\sd6copy dosswap.exe     %1
goto %DSHL%

:cpmono
call %1\sd6copy mono.grb        %1\dosshell.grb NC %1
call %1\sd6copy mono.ini        %1\dosshell.ini NC %1
call %1\sd6copy mono.vid        %1\dosshell.vid NC %1
goto cpddone

:cpcga
call %1\sd6copy cga.grb         %1\dosshell.grb NC %1
call %1\sd6copy cga.ini         %1\dosshell.ini NC %1
call %1\sd6copy cga.vid         %1\dosshell.vid NC %1
goto cpddone

:cpega
call %1\sd6copy ega.grb         %1\dosshell.grb NC %1
call %1\sd6copy ega.ini         %1\dosshell.ini NC %1
call %1\sd6copy ega.vid         %1\dosshell.vid NC %1
goto egainst

:cpegam
call %1\sd6copy egamono.grb     %1\dosshell.grb NC %1
call %1\sd6copy ega.ini         %1\dosshell.ini NC %1
call %1\sd6copy ega.vid         %1\dosshell.vid NC %1
goto egainst

:cpvga
call %1\sd6copy vga.grb         %1\dosshell.grb NC %1
call %1\sd6copy ega.ini         %1\dosshell.ini NC %1
call %1\sd6copy vga.vid         %1\dosshell.vid NC %1
goto cpddone

:cpvgam
call %1\sd6copy vgamono.grb     %1\dosshell.grb NC %1
call %1\sd6copy ega.ini         %1\dosshell.ini NC %1
call %1\sd6copy vga.vid         %1\dosshell.vid NC %1
goto cpddone

:cpherc
call %1\sd6copy herc.grb        %1\dosshell.grb NC %1
call %1\sd6copy mono.ini        %1\dosshell.ini NC %1
call %1\sd6copy herc.vid        %1\dosshell.vid NC %1
goto cpddone

:cpmcga
call %1\sd6copy vga.grb         %1\dosshell.grb NC %1
call %1\sd6copy cga.ini         %1\dosshell.ini NC %1
call %1\sd6copy cga.vid         %1\dosshell.vid NC %1
goto cpddone

:cp8514
call %1\sd6copy vga.grb         %1\dosshell.grb NC %1
call %1\sd6copy ega.ini         %1\dosshell.ini NC %1
call %1\sd6copy 8514.vid        %1\dosshell.vid NC %1
goto cpddone


:egainst
FIND /C /I "EGA.SYS" c:\config.sys > NUL
if errorlevel 1 goto cpegasys
goto cpddone
:cpegasys
call %1\sd6copy ega.sys %1
Echo DEVICE=%1\EGA.SYS > %1\egasysad.dln
copy c:\config.sys+%1\egasysad.dln c:\config.sys > NUL
echo ---------------------------------------
Echo.
Echo The DEVICE=%1\EGA.SYS command has been added to your CONFIG.SYS file.
Echo This command is required if you plan to use the MS-DOS Shell Task 
Echo Swapper with an EGA monitor. 
Echo.
Echo If you have an EGA monitor and also use a mouse, you can save memory 
Echo by ensuring that the DEVICE command for EGA.SYS is loaded before the
Echo mouse driver.
Echo.
goto cpddone

:cpddone

:donecopy
del %1\amjklfgh.00? > NUL
del %1\sd6copy.bat > NUL
del %1\expand.exe > NUL
del %1\choice.com > NUL
if exist %1\egasysad.dln del %1\egasysad.dln > NUL
if exist %1\expand.999 ren %1\expand.999 expand.exe > NUL
if exist %1\choice.999 ren %1\choice.999 choice.com > NUL
echo ---------------------------------------
echo.
echo The MS-DOS 6.22 Supplemental Utilities have been successfully installed.
echo.
echo NOTE  If you installed the additional utilities from MS-DOS 5.0,
echo       you must restart your computer before you can run them.
%DISK%id0%SD6% %1




:usage
echo SETUP [drive:][path]
echo.
echo   [drive:][path] - Directory to install the utilities into.
echo                    (ie. "C:\MSDOS", "C:").
goto done

:patherr
echo.
echo Setup was unable to create the directory %1!
echo.
echo Note: The supplied directory name must not have a trailing \.  If you are
echo       installing to the root directory, just specify the drive letter and
echo       colon (ie. "C:").
goto done

:enverr
echo.
echo ERROR: Not enough environment space to run SETUP.BAT!
goto done

:direrr
echo.
echo ERROR: You must run SETUP.BAT from the drive and directory that contains
echo        your supplemental disk files.
goto done

:dshlrerr
echo.
echo An Error occoured while choosing video display for the MS-DOS Shell.
goto done

:done
if exist %1\amjklfgh.00? del %1\amjklfgh.00? > NUL
set SD6=
set DSHL=
set DISK=
set COPYCMD=%OCPCMD%
set OCPCMD=
