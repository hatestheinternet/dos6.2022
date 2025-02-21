
 QEMM 8.0 README FILE
 ====================

 This file includes information on what's new in this release of
 QEMM, and tips to help you get the most out of the package.  For
 that reason alone, it is worthwhile reading! It also contains
 last-minute information that did not make it into the manual and
 a few corrections to the manual. If you want to print this file
 for future reference, be sure you are in the QEMM directory and
 type "COPY README.TXT PRN:" at the DOS prompt.  Alternatively,
 you may print this file from the Windows Notepad by clicking on
 File, then Print.

 This file may contain information that is NOT in QEMM Setup
 Help's ReadMe sections.


 INSTALLATION AND COMPATIBILITY NOTES
 ====================================

 QEMM TECHNOTES

 There are several helpful technical notes in the TECHNOTE
 subdirectory of the directory into which you installed QEMM. All
 of the QEMM technotes may be viewed by running QEMM Setup
 (QSETUP) either from DOS or from Windows; QEMM Setup incorporates
 a file viewer that allows you to read these notes easily.  The
 Windows version of QEMM Setup features a Windows Help file that
 also incorporates versions of these notes.

 PRODUCTS.TEC contains a list of compatibility issues between QEMM
 and other hardware and software products.  Please read this
 technote before beginning any troubleshooting.  Other online
 documents, including QEMMUTIL.TEC, TESTPRGS.TEC, and QPI.TEC,
 describe utility programs and technical information for
 programmers and advanced users of QEMM.  Still others provide
 background information, compatibility notes, or tips and tricks
 related to various types of hardware and software.


 MACHINES WITH SUPPORT FOR FOUR ENHANCED IDE DRIVES

 On some BIOSes with support for four (EIDE) Enhanced IDE drives,
 there may be a long delay or an apparent hang at boot time or when
 Windows starts up.  If you observe this problem, try adding the
 X=FE00:4K parameter to the end of the QEMM386.SYS line in
 CONFIG.SYS.  For example:

 DEVICE=C:\QEMM\QEMM386.SYS RAM ST:M X=FE00:4K


 SAVING DISK SPACE FOR WINDOWS-ONLY USERS

 If you work exclusively in Microsoft Windows, you can delete the
 contents of the QEMM\TECHNOTE subdirectory, at a savings of about
 400K of disk space.  All the QEMM technotes are also included in
 the Windows Help file, and can be read by selecting Technotes
 from the QEMM Setup Help menu.


 OPTIMIZE'S CONVENTIONAL MEMORY REQUIREMENTS

 It is possible to load so many TSRs and device drivers on your
 system that you may run out of memory during the OPTIMIZE
 process! Please refer to the technical note MAXMEM.TEC in your
 QEMM\TECHNOTE directory for suggestions on improving your
 pre-OPTIMIZE configuration.  In cases where OPTIMIZE does not
 complete successfully, you may wish to try taking advantage of
 expanded memory by skipping the hardware detection phase.  To do
 this, start OPTIMIZE from the DOS command line with the /NH
 parameter as follows:

 OPTIMIZE /NH


 OPTIMIZE, DOS-UP AND BUFFERS

 In versions of MS-DOS up to 6.22, up to 48 DOS BUFFERS could be
 loaded into the High Memory Area (HMA) along with the DOS kernel.
 In MS-DOS 7 (the version of DOS that accompanies Windows 95), it is
 possible for other parts of DOS to be loaded into the HMA, reducing
 the amount of space available for BUFFERS, and causing them to be
 loaded below the HMA.  This may result in a conflict during the
 OPTIMIZE Software Detection phase, such that not enough memory is
 available to determine accurately the memory needed by DOS-Up to
 load BUFFERS above 640K.

 If you are using Windows 95 or the underlying version of DOS that
 accompanies it, and if you are using the DOS=LOW setting in
 CONFIG.SYS, Quarterdeck recommends that you set your BUFFERS=
 value to 30 or less.


 DOS-UP OPTIONS AND WINDOWS 95

 If you are using real-mode Novell NetWare drivers in Microsoft
 Windows 95, Microsoft recommends that you set the LOADTOP=0
 option in the MSDOS.SYS text file.  (Note that Windows 95's
 text-based MSDOS.SYS is NOT the same as the MSDOS.SYS DOS
 component in previous versions of DOS.)  If you choose Windows
 95's default LOADTOP=1 setting to load the command processor at
 the top of conventional memory, you may experience corruption of
 the DOS environment, which includes values for PROMPT, PATH, and
 SET statements.

 This happens irrespective of the presence of Quarterdeck
 software.  However, for similar reasons, if you are using Novell
 NetWare real-mode drivers with Windows 95, you should configure
 the DOS-Up option to load COMMAND.COM low, rather than high.


 DOS-UP, WINDOWS 95, AND PREVIOUS DOS VERSIONS

 If you wish to use DOS-Up and the Windows 95 feature that allows
 you to boot into your previous version of DOS, you should create
 a Windows 95 Boot Menu as described in the technical note
 W95BOOT.TEC, found in your QEMM\TECHNOTE directory, and a DOS 6
 multiple-path CONFIG.SYS as described in your DOS 6 reference
 materials.

 On systems where the previous DOS version is DOS 5, however, DOS
 will not recognize multiple configurations, and thus OPTIMIZE
 cannot create a DOS-UP.DAT file with multiple paths.

 The workaround for this problem is to begin OPTIMIZE in the DOS 5
 environment, and to reboot into DOS 5 at every stage of the
 OPTIMIZE process.  When OPTIMIZE is complete, copy your
 DOS-UP.DAT file to another name (e.g. DOS-UP-5.DAT).  Then edit
 the DOS-UP.SYS line in your CONFIG.SYS file to specify
 DOS-UP-5.DAT as your DOS-UP configuration file, as follows:

 DEVICE=C:\QEMM\DOS-UP.SYS @C:\QEMM\DOS-UP-5.DAT


 QEMM'S STEALTH D*SPACE AND DRIVESPACE

 QEMM supports all versions of DoubleSpace or DriveSpace that
 accompany MS-DOS version 6.00 through 6.22.  QEMM does not
 currently support the version of DriveSpace that comes with
 Windows 95 (or DOS 7), nor the DriveSpace that comes with the
 Microsoft Plus Pack.


 IF LESS MEMORY IS AVAILABLE WITH THIS VERSION

 Some customers may observe less conventional memory available
 with QEMM 8 than with previous versions.  In many cases, this is
 because QEMM attempts automatically to EXCLUDE a byte in the F000
 region, in order to support better Microsoft Windows' MaxBPS=
 SYSTEM.INI setting.  If you have set MaxBPS set to a value
 greater than 200, QEMM's default behavior will likely be
 preferable to you.  If you have MaxBPS set to a value of 200 or
 less, you might wish to try adding the SRBP:N parameter to the
 end of the QEMM386.SYS line in CONFIG.SYS.

 QEMM's superior detection of Plug and Play BIOS and other forms
 of adapter RAM and ROM may cause QEMM to EXCLUDE automatically
 more address space than previous versions.  This is safer than
 including these regions by default, but can result in less High
 RAM or less conventional memory than before, or can result in the
 EMS page frame being placed in conventional memory.  The QEMM
 Analysis procedure, detailed in the manual, may allow you to
 reclaim this High RAM.  You may also wish to check Manifest's
 Hints screen to confirm that Analysis will be helpful.

 Finally, QEMM may have increased extended memory overhead in this
 version on some systems, which may result in a net loss in
 available extended or expanded memory.  There is no remedy for
 this situation.


 QEMM SETUP AND THE CONFIG VARIABLE

 MS-DOS 6 and PC DOS 6 support multiple paths of execution through
 CONFIG.SYS.  DOS 6 can use the CONFIG environment variable and
 the GOTO %CONFIG% batch statement to support separate paths of
 execution in the AUTOEXEC.BAT that correspond to the different
 CONFIG.SYS configuration paths.  When you use QEMM Setup to add a
 new path to your DOS 6 multiple configuration CONFIG.SYS file,
 QEMM Setup does not create an entirely new branch in the
 AUTOEXEC.BAT to correspond to your new CONFIG.SYS path. Instead,
 QEMM Setup makes sure that the new configuration path and the
 existing one that it was based on will execute the same commands
 in AUTOEXEC.BAT.  If you want the new path to execute different
 AUTOEXEC.BAT commands than the path from which it was created,
 you must edit your AUTOEXEC.BAT file to create two separate
 branches to replace the common branch that QEMM Setup creates.
 See the DOS 6 manual for more information on the CONFIG variable.


 MS-DOS 6.22 AND MISSING LABELS IN AUTOEXEC.BAT

 If you have a command in AUTOEXEC.BAT in the form GOTO <LABEL>,
 where there is no corresponding <LABEL> in the AUTOEXEC.BAT file,
 the OPTIMIZE process may simply terminate.  Ensure that all GOTO
 statements in AUTOEXEC.BAT refer to valid labels.


 BATCH FILES AS THE LAST LINE OF AUTOEXEC.BAT

 In order to monitor the boot process properly, OPTIMIZE must
 regain control of the system at the end of AUTOEXEC.BAT. Thus
 the OPTIMIZE process will fail if the last line of your
 AUTOEXEC.BAT file is a batch file that is not "CALLed" (that is,
 a batch file without a CALL command in front of it); such batch
 files never return control to AUTOEXEC.BAT, and thus OPTIMIZE is
 unable to regain control.  If the last line of AUTOEXEC.BAT is a
 batch file, make sure to CALL it -- for example:

 CALL MYBATCH


 OPTIMIZE AND WINDOWS IN MULTIPLE CONFIGURATION PATHS

 In most cases, OPTIMIZE will disable Microsoft Windows during the
 OPTIMIZE process.  However, if you are using a multiple-path
 CONFIG.SYS file, and separate paths of execution in AUTOEXEC.BAT,
 OPTIMIZE will allow Windows to run during certain phases.  To
 ensure that the OPTIMIZE process is complete, make sure that you
 enter and exit Windows for every step of the OPTIMIZE process,
 until you see OPTIMIZE's report on the amount of memory gained.
 Alternatively you should, for the duration of the OPTIMIZE
 process, remove any line in AUTOEXEC.BAT that launches Microsoft
 Windows.


 OPTIMIZE AND MULTICONFIG INCLUDE STATEMENTS

 QEMM 8.0's OPTIMIZE program does not support more than one level
 of INCLUDE statements in a CONFIG.SYS with multiple
 configurations. You can use INCLUDE statements with OPTIMIZE, but
 you cannot use an INCLUDE statement inside a CONFIG.SYS block
 that has already been included in another block. If you have more
 than one level of INCLUDE statements, you must edit your
 CONFIG.SYS file before running OPTIMIZE and make sure that all
 INCLUDE statements below the first level are replaced with the
 actual CONFIG.SYS lines which the INCLUDE statement formerly
 invoked.


 FIXINT13.SYS AND ULTRAFIX.SYS

 FIXINT13.SYS is designed to assist in resolving problems with
 certain disk controllers that hang because they use stacks that
 are too small for the work that they do at the time that they do
 it. It replaces ULTRAFIX.SYS, which was formerly distributed on
 the Quarterdeck bulletin board and other electronic forums.  If
 you use ULTRAFIX.SYS, replace it with FIXINT13.SYS. FIXINT13.SYS
 is documented in the file QEMMUTIL.TEC, located in the
 QEMM\TECHNOTE directory.


 PCMCIA (PC CARD) HARDWARE AND SOFTWARE

 There is a technical note in the QEMM\TECHNOTE directory on the
 subject of maximizing memory while using PCMCIA (PC Card)
 adapters.  This and other technical notes are readable via the
 QEMM Setup program.  In Windows, choose Help from the menu bar,
 and then "Technotes"; in DOS, from the QEMM
 Setup main menu, choose "View QEMM hints, technotes and READ.ME",
 and then "View QEMM technical notes".
 

 QUICKBOOT AND EXPANDED MEMORY RAM DISKS

 With some expanded-memory-using RAM disks, the QuickBoot feature
 may not clear the contents of the RAM disk when you QuickBoot.
 QuickBoot does not intentionally preserve the contents of any RAM
 disk and should not be relied upon for this purpose.  To ensure
 that your RAM disk is cleared, warm boot normally by pressing
 Ctrl-Alt-Del twice in quick succession, thus bypassing QuickBoot.


 VIDEO CARDS AND EXCLUSIONS

 While manufacturers of video cards often recommend EXCLUDEing
 large regions of address space -- for example, A000-C7FF -- this
 is almost never necessary, and these recommendations should be
 taken with a good deal of skepticism.  QEMM is intelligent enough
 to recognize the addresses used by almost all video cards, and
 makes the appropriate exclusions automatically.  QEMM INCLUDEs the
 B000-B7FF region by default, and EXCLUDEs video RAM and ROM
 automatically when appropriate.  A few video cards require that the
 address space between B000-B7FF be EXCLUDEd when using Microsoft
 Windows high-resolution video drivers.  However, it may be possible
 instead to use QEMMExclude=B000-B7FF in the [386Enh] section of the
 Windows SYSTEM.INI file.  This parameter is documented in the
 Technical Reference section of the QEMM manual.


 DESQVIEW/X SERVER AND QEMM'S VCPISHARE PARAMETER

 QEMM's VCPISHARE:Y (VS:Y) is not compatible with the DESQview/X
 SERVER module.  Do not use the VS:Y parameter if you are using
 DESQview/X.


 OPTIMIZE'S STEALTH TESTING PROCESS

 OPTIMIZE's Stealth Testing process is the best way to ensure both
 maximum memory and maximum compatibility with your system. To
 take advantage of this feature, make sure that you're starting
 from a stable, bootable QEMM configuration.  Typically the line

 DEVICE=C:\QEMM\QEMM386.SYS ON

 will allow you to boot your system safely.  From this, you may
 run OPTIMIZE's Stealth Testing procedure in the following way:

 1) At the DOS prompt, type

    OPTIMIZE /REMOVEALL

    This will remove LOADHI commands and parameters from all of
    the lines in CONFIG.SYS, AUTOEXEC.BAT, and any batch files
    called from AUTOEXEC.BAT.

 2) Edit CONFIG.SYS and remove all parameters except ON from the
    QEMM386.SYS line in CONFIG.SYS.

 3) At the DOS prompt, type

    OPTIMIZE /ST
 
 The Stealth Testing process provides maximum compatibility with
 your system, at the possible expense of some High RAM or
 conventional memory.  If this is the case, see the section above,
 "IF LESS MEMORY IS AVAILABLE WITH THIS VERSION".


 WHAT'S NEW IN THIS RELEASE
 ==========================

 The version of QEMM dated 2/14/96 incorporates the following
 significant changes from the first release, dated 11/04/95.

 - Windows 95 by default loads SETVER.EXE and IFSHLP.SYS
   automatically when references to these programs are not found
   in the CONFIG.SYS file.  During the OPTIMIZE process, these
   files are detected and loaded high so that OPTIMIZE can
   control their eventual location.  A problem with this process
   resulted in a "Configuration too large for memory" error message
   in the first release of QEMM, most commonly on systems that had
   DriveSpace 3 from the Microsoft Plus! Pack installed. This
   problem has been fixed.

 - Windows 95 detects obsolete 32-bit device drivers (.VxDs) listed
   in SYSTEM.INI and replaces them silently with Windows 95
   versions. As part of this process, Windows 95 fails to take into
   account QEMM's presence.  This failure would lead to Windows 95
   attempting to return control to the underlying version of DOS.
   Alas, in this case, Windows does so in a way that causes the
   processor to report an Exception #13 at address FFFF:FFFF.  QEMM
   has been altered to adapt to Windows 95's obliviousness in this
   regard.

 - The TESTBIOS program that is part of the OPTIMIZE process has
   been slightly modified to improve Stealth Testing on some
   machines, particularly those with AMI BIOSes.  PLEASE TAKE
   NOTE OF THE SECTION "OPTIMIZE'S STEALTH TESTING PROCESS"
   ABOVE!  This is the best way to ensure that QEMM works
   properly on your machine.

 - A problem in MagnaRAM that caused long delays or apparent
   lockups on Windows 95 machines with caching IDE controllers (e.g.
   the Promise 4030 EIDE VL and the SIIG Professional models) has
   been fixed.  This problem was most commonly seen in combination
   with Symantec's Windows 95 versions of Norton Utilities and
   Norton AntiVirus.

 - There is now an option to suppress the animation of the
   MagnaRAM logo, which could cause stuttering startup sounds on
   some machines.

   Windows 3.1 users who don't like the expanding RAM chip should
   place the line

   FASTLOGO=ON

   in the [Quarterdeck_MagnaRAM] section of the Windows
   SYSTEM.INI file.

   Windows 95 users should use the Windows REGEDIT utility to add
   a new string value to the Registry. Start REGEDIT via the Run
   commmand on the Start Menu; then, in succession, click on

   HKEY_LOCAL_MACHINE
   System
   CurrentControlSet
   Services
   VxD
   Quarterdeck_MagnaRAM

   This will display the MagnaRAM settings.  Select Edit from the
   menu bar, then New, then String Value.  Type "FASTLOGO", and
   press Enter. Then right-click on the word FASTLOGO, and click
   on "Modify".  In the dialog box that appears, type the word
   "ON" in the Value Data field. Click on OK, and close REGEDIT
   via the File menu.

 - Resource Manager has been updated to address conflicts with
   several applications (most notably AutoCAD) and several video
   cards (most significantly certain types that display more than
   256 colors, and those that are compatible with XGA and 8514
   standards, including the ATI mach8, mach32, and mach64 cards).

 - There is a new feature in Resource Manager's .INI file; this
   is the [TurnOffApp] profile string.  By specifying the
   filename of an application that seems to conflict with
   Resource Manager, you turn off Resource Manager's services for
   that application.  For example, if you were to determine that
   the Whizzo Word Processor conflicted with Resource Manager,
   enter the line

   [TurnOffApp]
   whizzo.exe=off

   Note that the value you specify (true, false, on, off, 1, or
   0) doesn't matter; as long as the filename is in place,
   Resource Manager will be off for that application.

 - QEMMWIN, the utility that displays memory information in real
   time under Windows, has been made more robust.  QEMMWIN now
   also includes a feature that allows you to keep the QEMMWIN
   display on top.  This setting can be found under the system
   menu in the upper left corner of the window.  Note that only
   QEMMWIN's main window will remain on top; if you choose to
   display any of the "Details" screens, other applications may
   be displayed over QEMMWIN.

   QEMMWIN's Physical Memory bar chart reports the amount of
   physical memory that Windows' DPMI server took over from the XMS
   memory manager at Windows startup time.  This is neither the
   amount of memory installed on the machine nor the amount
   available after Windows starts up.  Applications such as disk
   caches can allocate memory from XMS before Windows is started,
   reducing the amount of physical memory available to Windows.
   WIN386.EXE and KRNL386.EXE allocate memory from the DPMI server
   when Windows starts, which can account for further differences
   between the amount of physical memory available and the amount of
   physical memory reported by QEMMWIN.

 - Manifest now includes the ability to edit the MSDOS.SYS text
   file that is used for boot configuration options under Windows
   95. Before editing this file, however, get information on the
   options available by consulting any of the widely-available
   books on the innards of Windows 95, or the Microsoft Windows
   95 Resource Kit.  Manifest will check carefully to avoid
   editing a pre-DOS 7 MSDOS.SYS file, and will automatically
   ensure that the Windows 95/DOS 7 file is longer than its
   minimum length of 1024 bytes.

   Manifest has also been updated to improve the detection of
   Cyrix processors and Trident video chipsets.

 - A Manifest hint to run the OPTIMIZE process is no longer as
   persistent as it once was.

 - QSETUP offers the same ability to edit Windows 95's MSDOS.SYS
   as Manifest does.  QSETUP also includes minor changes to
   clarify the display of MagnaRAM's buffer size.


 ERRATA IN THE DOCUMENTATION
 ===========================

 On page 14, the QEMM User Guide describes the buttons on the
 bottom of the QEMM Setup screen.  It does not describe the
 buttons on the right side of the window.  The Reset button
 restores your settings to the values that were in force when you
 entered that page.  The Default button (which appears only on the
 Windows property page) sets the options for FreeMeg, Resource
 Manager, and MagnaRAM to their default settings.  The Help button
 provides context-sensitive online help for the displayed property
 page.

 On page 27, the QEMM User Guide incorrectly suggests that an exit
 button appears on the right side of the QEMM User Interface
 screen.  To exit, press Alt-F4, or choose Exit from the File
 menu.


