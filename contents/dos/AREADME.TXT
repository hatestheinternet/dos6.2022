

            Notes and Hints for Using AccessDOS 1.1

AccessDOS is a package of utilities which extend the normal
MS-DOS user interface.  Although AccessDOS does a good job of
figuring out which type of hardware and operating system you
are using, you may occasionally run into combinations of
these, and/or an application which does not do things in a
standard way, which might give you a problem.  This AREADME
file provides a discussion of what you might expect in some
situations, as well as hints and secrets for getting around
some of these exceptions if you run into them.

This AREADME document does not provide any information on the
basic operation of AccessDOS.  For general operating
information on AccessDOS, please consult the file ADOS.TXT.
This file can be viewed or printed using any word processor
program.


A. AccessDOS AND MS-DOS


COMPATIBLE VERSIONS OF MS-DOS

AccessDOS was designed to be compatible with MS-DOS versions 3.3
and above.


LOADING AccessDOS INTO HIGH MEMORY

AccessDOS can be loaded into "upper" memory on your computer
to leave more space in your conventional (640K) memory.
(See the ADOS /X command in the AccessDOS user manual for 
important information about loading AccessDOS high.)

AccessDOS can be loaded high using the LOADHIGH command 
in MS-DOS versions 5 and above.  If you are using MS-DOS 6.22, 
you should use the MEMMAKER command to configure your system to 
make optimal use of the available memory.  You can also use a 
memory manager such as Blue Max (TM) and QEMM (TM).



B. AccessDOS AND MICROSOFT WINDOWS


DIFFERENT ACCESS UTILITY NEEDED FOR WINDOWS APPLICATIONS

Microsoft Windows 3.x (TM) is a separate operating environment
from MS-DOS.  None of the AccessDOS functions will affect Windows
applications.

However, Microsoft distributes another package for Windows
which provides most of the same functions as AccessDOS.
The package is called "Access Pack for Microsoft Windows."
Access Pack affects Windows applications only; you will still
need AccessDOS if you want to use the access features when
using non-Windows applications.  You can use both utilities
at the same time if you use both Windows and non-Windows
applications.

Ordering Information

Access Pack for Microsoft Windows is available on the Microsoft
Windows Driver Library as ACCP.EXE or ACCP.ZIP.  If you have a
modem, you can download Windows Driver Library components from
network services, including CompuServer, GEnieTM, Microsoft
On-line, various user-group bulletin boards, including BBSs on
the Association of PC User Groups or APCUG network, and the
electronic download service maintained at Microsoft (phone
206-936-MSDL).  The electronic download service is open 7 days
a week from 2:30A.M. to 1:00A.M.  Modem settings are:

1200,n,8,1
2400,n,8,1
9600,n,8,1 (V.32,V.32bis, V.42, V.42bis)

Customers within the United States who do not have a modem can
obtain disks by calling Microsoft Product Support Services at
206-637-7098.  Customers who are deaf or hard-of-hearing can
call the text telephone (TTor TDD) number at 206-635-4948.
Customers outside of the United States should contact the
Microsoft subsidiary in their country.


USING AccessDOS WITH NON-WINDOWS APPLICATIONS

AccessDOS can be used to to assist you when running non-Windows
applications that you start from within Windows.  These
applications run in an MS-DOS compatibility box under Windows.

You can start AccessDOS for use with Windows in either of
two ways:

1)  You can install AccessDOS before starting Windows.  The
AccessDOS features will then be available every time you enter
an MS-DOS compatibility box.

2)  You can start Windows, open up an MS-DOS compatibility box,
and then load AccessDOS within that compatibility box.  AccessDOS
will only affect applications you run inside that particular
compatibility box.  If you start another compatibility box the
AccessDOS features will not be available until you start AccessDOS
in that compatibility box.


AccessDOS CAN RUN WITH EITHER WINDOWS MODE

Windows 3.x can run in two different modes: Standard mode and
386 enhanced mode.  If your computer has a 386 or higher
processor, you can choose to run either mode; if your computer
has a 286 processor Windows will only run in Standard mode.

In either case, AccessDOS 1.1 can be started before starting
Windows, or it can be started within an MS-DOS compatibility box.

However, there are some cases where it is recommended that
you load AccessDOS before starting Windows, and then run
Windows in Standard mode.  These restrictions are discussed
in the following sections.


USING HOT-KEYS IN WINDOWS 386 ENHANCED MODE

If you run Windows in 386 enhanced mode, there are a few
situations where neither the AccessDOS nor the Access Pack
features are available.  This is most apparent in the
following cases:

1)  when you are running a non-Windows application and wish
to use a Windows hot-key to switch to another application.
 For example, if you start a non-Windows application you could
switch back to Windows by pressing the Alt and Tab keys at the
same time; however, if you use the StickyKeys or SerialKeys
features to press this key combination Windows will not
recognize it.  If you rely on StickyKeys or SerialKeys, you
will not be able to switch away from a non-Windows application,
and will have to quit that application to return to Windows.

2)  when a serious error causes Windows to put up a full-screen
message and prompt you to press a key.
 For example, if you press the Control, Alt and Delete keys to
reboot your computer, Windows will display a message screen
asking you to confirm whether you really want to restart your
computer.  In this mode the AccessDOS features are not active.


USING MOUSEKEYS WITH WINDOWS 386 ENHANCED MODE

You need to follow special steps if you want to do all of the
following:

a)  Run Windows in 386 enhanced mode, AND

b)  Start AccessDOS before starting Windows so that it will
be effective in each MS-DOS compatibility box, AND

c)  Use the AccessDOS MouseKeys feature with more than one
non-Windows application at the same time.

If you want to use Windows and AccessDOS in this way, you should
configure Windows so that it will handle AccessDOS appropriately.
You can do this by modifying a line in your the file called
SYSTEM.INI, which is located in your Windows directory.  You can
do this with the following steps:

Step 1:  Change directories to your Windows directory.

Step 2:  Load the file called SYSTEM.INI using a standard text
editor.

Step 3:  Find the section in this file that begins with the line
[386enh]

Step 4:  Within this section, find the line that begins with
"LocalTSRs=" without the quotes.  If this line does not exist
you must add it within this section.

Step 5:  Add the word ADOS to the end of this line.  If there
is already one or more words after the equal sign, leave a space
between the last word and the word ADOS.

Step 6:  Save your changes to the SYSTEM.INI file and exit your
text editor or word processor.


SWITCHING BETWEEN WINDOWS AND MS-DOS APPLICATIONS

If you use the StickyKeys or SerialKeys features and want to be
able to use the Windows hot-keys (such as Alt plus Tab) to switch
away from a non-Windows application, you must load AccessDOS first,
and then start Windows in Standard mode.

If you run Windows in 386 enhanced mode, or do not start AccessDOS
before starting Windows, you will not be able to use StickyKeys or
SerialKeys to switch away from a non-Windows application.


STARTING WINDOWS IN STANDARD MODE

If your computer has a 386 or higher processor, you can force
Windows to run in Standard mode by typing /S on the Windows
command line ("win /s").


RUNNING SERIALKEYS WITH WINDOWS AND NON-WINDOWS APPLICATIONS

If you want to use the SerialKeys feature with both Windows and
non-Windows applications, you will need to use special options
with AccessDOS.  See the section "Running SerialKeys with Windows"
below for further information.


C. AccessDOS AND PARTICULAR APPLICATIONS


HINTS GROUPED BY AccessDOS FUNCTION

Since most of these irregularities affect only one or another
of the functions, the hints are grouped by AccessDOS
functions.  They are presented in the following order:

     1.  StickeyKeys
     2.  Keyboard Response Group (SlowKeys, BounceKeys, and
         RepeatKeys)
     3.  MouseKeys
     4.  ToggleKeys
     5.  ShowSounds
     6.  SerialKeys

AccessDOS IS DESIGNED FOR STANDARD CONFIGURATIONS

AccessDOS was designed to work on "standard" hardware
configurations, such as an IBM PS/2 (R) Model 70 with a 101
key keyboard and a PS/2 mouse.  "Standard" is defined as the
purchased configuration of the computer.  If you have altered
the "standard" configuration of your computer, some or all of
the AccessDOS functions may not work properly.  An example of
a "non-standard" computer configuration would be an original
IBM Personal Computer or Personal Computer XT (TM) with a 101
key keyboard.  This is considered "non-standard" because the
original IBM Personal Computer or Personal Computer XT
computer was sold with an 83 key keyboard and the extra keys
of the 101 key keyboard may not be recognized.  If you have a
non-standard configuration and are having difficulties, try
using the original keyboard, etc., and see if the problem
corrects itself.


1.  STICKYKEYS NOTES

On older IBM computers, such as the Personal Computer,
Personal Computer XT, and Personal Computer AT (R), some
application programs retrieve all of their keyboard input
information from a special buffer rather than in the more
conventional manner.  Applications which perform this way on
these older computers can cause a problem with StickyKeys.
If this happens, you may notice that StickyKeys will not
perform the "latch" feature properly.  Normally, the "latch"
feature of StickyKeys will only hold a modifier key "down"
until the next non-modifier key is typed.  If the "latch"
feature is not performing properly, it will probably act like
the "lock" feature, which causes the modifier key you type to
remain "locked" down until you press the modifier key again
to release it.  If you encounter this problem on one of these
older computers, there are two things you can do:

     a. Continue to operate StickyKeys while remembering
        that with this particular application StickyKeys will
        "lock" the modifier key each time you press it, and
        the modifier key must be unlocked.  This problem
        should only occur within the troublesome application
        program.

     b. Purchase the program called "keyb.com" which is included
        with Microsoft MS-DOS versions 4.0 or higher, prior
        to running AccessDOS.  "keyb.com" patches the system
        in these older computers and causes the applications
        to behave.  AccessDOS will then run properly with these
        programs.

One program known to produce this problem is Microsoft Works
2.0 (TM).  While testing with an original IBM XT running
without "keyb.com" a "latch" of the "ctrl" key with an "arrow"
key, which is used to move around inside the database or
spreadsheet sections would cause the "ctrl" key to remain
"locked".  This was not a problem when running Microsoft Works
when "keyb.com" is run ahead of AccessDOS.


2.  KEYBOARD RESPONSE GROUP (SLOWKEYS, BOUNCEKEYS, AND
    REPEATKEYS) NOTES

Some applications produce their own key repeats.  If you
have an application which does this, you must disable this
feature within the application in order to allow the
RepeatKeys feature in AccessDOS to work.  Two applications
which are known to do this are Microsoft Word (TM) and
WordPerfect (TM). In each application, there is a setting
which will disable the application from producing key
repeats.  In Microsoft Word, choose "0" (zero) for cursor
speed from the "Options" menu to disable the key repeats.
For WordPerfect, choose "normal" in the keyboard or cursor
speed setup section to disable key repeats.  If an
application has the key repeating feature and you are not
able to disable it, RepeatKeys will not function properly.

Some applications produce their own key repeats for only
select keys within the application.  An example of this can
be seen in Microsoft Works 2.0.  The database or spreadsheet
will produce key repeats for the cursor or arrow keys.
RepeatKeys will not prevent these keys from repeating at the
rate set within this part of the application.


3.  MOUSEKEYS NOTES

MouseKeys is the most difficult of all the AccessDOS
functions to implement, due to the variety of ways that the
mouse function is implemented and the number of ways that
different application programs interact with the mouse and
its driver.  Below are some notes to help you get the most
from your MouseKeys function.  Also listed are a number of
configurations or programs which MouseKeys does not work with
at this time.


MICE THAT MOUSEKEYS WILL WORK WITH

The only mouse drivers that MouseKeys will currently work with
are the IBM PS/2 or Microsoft mouse drivers.  MouseKeys has been
tested with an IBM PS/2 mouse, the Microsoft serial mouse
and the Microsoft PS/2 mouse equivalent.  There are some
third-party mice which also use the Microsoft mouse driver
and may work with MouseKeys.

In this version of AccessDOS, MouseKeys will not work with the
Microsoft mouse driver if you have a Microsoft bus mouse, a
Microsoft InPort mouse, or a Microsoft BallPoint mouse.

NOTE:  The mouse driver software must be installed before
AccessDOS for MouseKeys to function.


USING MOUSEKEYS AND A REAL MOUSE TOGETHER

MouseKeys and the real mouse can be used together; however, a
user should not try to move the mouse cursor with a MouseKey
direction key and with the real mouse at the same instant in
time.

On many applications, the user can lock down a
MouseKey mouse button, and then move the mouse either with a
MouseKey direction key or with the real mouse and perform
what is called a "mouse click and drag" feature.  After
performing this feature, the user must release the MouseKey
mouse button or click the real mouse button.  Not all
applications will allow MouseKeys to perform in this manner
with the real mouse.  WordPerfect 5.1 will not allow a
combined MouseKeys and real mouse "click and drag" feature.
Older versions of PC Paintbrush (TM) (version 1.0) will not
allow the real mouse to release a locked MouseKey mouse
button.  Some experimentation may be necessary on the user's
part.


USING MOUSEKEYS WITHOUT A MOUSE CONNECTED

On computers running MS-DOS, the software which handles
communications between the mouse and the computer application
using a mouse is usually referred to as the mouse driver
software.  The MS-DOS mouse driver software "mouse.sys" or
"mouse.com" is typically loaded in either the user's
"config.sys" or "autoexec.bat" files respectively (both files
are executed when the computer is powered on or rebooted).
Unfortunately, if a real mouse is not attached to the
computer, neither mouse driver will install itself.  This
makes sense in that you would not want the mouse driver
software to install itself and waste valuable computer memory
unless you had a mouse attached to your computer and were
planning to use it.  However, this creates a problem for
MouseKeys, since it must also use the same mouse driver
software to communicate mouse information to the application.
Because of this "non-load" characteristic of the mouse driver
software, a MouseKey user will need to have a real mouse
attached to their computer, whether or not they plan to use it

There is one exception to this rule which applies to
only IBM PS/2 computers.  A utility program on the AccessDOS
disk, called "fakemous.com" will allow MouseKeys to work
without a real mouse attached to the computer.  In order for
this to work, the user must first load or install
"fakemous.com".  Next the user must load or install the mouse
driver called "mouse.com".  Last, the user would load or
install AccessDOS.


APPLICATION MUST SUPPORT A REAL MOUSE

MouseKeys functions as an alternate mouse.  If you have an
application which does not support a mouse, then MouseKeys
will not work with that application.  Basically, the rule of
thumb is "if you can't do it with a regular mouse, don't
expect to be able to do it with MouseKeys."


PERFORMING A "SHIFT-CLICK" WITH MOUSEKEYS

Some applications which use a mouse allow the user to perform
what is called a "shift-click".  What this allows the user to
do is to first highlight some text, then press and hold down
a shift key while clicking the left mouse button to copy the
highlighted text to the current position of the mouse cursor.
The combination of "latching" a StickyKeys shift key and the
MouseKeys mouse button click key will duplicate this feature
on IBM PS/2 computers using a mouse attached to the PS/2
mouse port.  On an IBM computer using a Microsoft serial
mouse, the user will have to "lock" the shift key to
duplicate this feature.  Note, not all applications use or
support this.


USING NUMLOCK KEY TO SWITCH IN AND OUT OF MOUSEKEYS

While you are running MouseKeys, the Num Lock key is
disabled; that is, you cannot use it to switch back and forth
between the cursor pad and number pad modes on your keyboard.
Instead, pressing the Num Lock key will toggle MouseKeys on
and off.  This allows you to use the keypad both to access
MouseKeys and to use whichever normal mode you were in when
you launched MouseKeys.  If you want to change between the
normal keypad modes (cursor pad and number pad), you should
turn MouseKeys off first by pressing
"left-alt+left-shift+numlock."


USING MOUSEKEYS WITH WORDPERFECT 5.1

To use MouseKeys with WordPerfect 5.1, the mouse driver must
be passed a switch.  For example, type "mouse /v70" from the
same directory your mouse driver software is in, or have the
correct path to the mouse driver software in the instruction
(i.e., "c:\utils\mouse /v70").  This particular mouse switch
changes the sensitivity of the mouse driver software in the
vertical direction and works well if the MouseKey speed in
AccessDOS is set to 80.  Please refer to your mouse manual
for more information about mouse command line switches.


USING MOUSEKEYS WITH THE PC-DOS 4.00 OR 4.01 SHELL

If you are using IBM PC-DOS version 4.00 or 4.01 and your
DOSSHELL.BAT file contains a command line with the instruction
"/MOS:PC...MOS", remove the instruction prior to running MouseKeys.
MouseKeys expects to use either the file "mouse.sys" which is loaded
in your "config.sys" file, or the file "mouse.com" which can be run
at any time but is typically included in the "autoexec.bat" file.
The MS-DOS shell mouse works fine with either of these mouse files.


MOUSEKEYS DOES NOT WORK WITH. . .

MouseKeys will not function properly in applications which
produce their own key repeats (see RepeatKeys for a
discussion on how to disable key repeats from within an
application).

MouseKeys will not function on the IBM Dual Asynchronous Card
using older Microsoft serial mice (pre-generation 3).
(MouseKeys may not function with older [pre-generation 3]
Microsoft serial mice on any serial port.)

MouseKeys and StickyKeys cannot be used to operate the
Microsoft mouse "cpanel" program.

The ability to press Button 1 and Button 2 down
simultaneously via MouseKeys is not available on older
keyboards, because they have fewer keys available on the
numeric keypad (see manual).


4. TOGGLEKEYS NOTES

If you want to turn ToggleKeys on or off, you should do it
before you turn MouseKeys on.  ToggleKeys cannot be turned on
or off while MouseKeys is on.  You can, of course, turn
MouseKeys off, turn ToggleKeys on or off, and then turn
MouseKeys back on any time you wish.

5.  SHOWSOUNDS NOTES

ShowSounds has two options for providing a visual display
when a sound is emitted from the computer.  One option is to
provide a small visual cue consisting of one or two symbols
in the upper left-hand corner of the screen whenever a sound
is emitted.  The other option is to flash or blink the screen
whenever a sound is emitted.

The visual cue and the screen flash cannot both be active at
the same time.  (It doesn't do any good to display the visual
cue while the screen was blanked - you wouldn't see it.)

When using the visual cue option, sounds produced by computer
programs will display a single "musical note" or visual cue
in the upper left-hand corner, provided the sounds are long
enough in duration to be detected by AccessDOS.  However,
When the sounds are generated from within AccessDOS itself, a
second character will appear next to the musical note to give
you some information about the type of sound.  An up-siren
produced by AccessDOS, for example, will show a musical note
with an up-arrow next to it.  (See manual.)

The "musical note" or visual cue is not compatible with all
applications.  Do not use the "musical note" or visual cue
with PC Paintbrush or Lotus 1-2-3 (TM) while running either
application with a color monitor.  You should not use the
"musical note" visual cue when in the MS-DOS 4 Shell.
It is also not compatible with applications that produce more
than one screen of information simultaneously, such as split
screens in text editors.  The "musical note" or visual cue
may work in some parts of programs while not in others.
For example, the visual cue does not work with the document
viewer or equation editor in WordPerfect, but works well in
the word processing portion of WordPerfect.  The "musical note"
or visual cue may also encounter trouble with some CGA monitors.

In general, the screen flash or blink is compatible with more
software applications and monitors.  However, the screen
flash or blink feature is dependent on the video hardware,
and may not be compatible with all monitors.  For example,
some AST VGA cards are not compatible, nor is the PS/2 Model
25/30 with the 8086 processor.


6. SERIALKEYS NOTES

SerialKeys is a very special function which allows you to use
a communication aid or other special input device instead of
the computer's standard keyboard or mouse.  To use
SerialKeys, you would connect your communication aid or
interface to the computer's serial port.  SerialKeys then
transforms input to the serial port into keystrokes and mouse
movements.

To use SerialKeys, your computer must have a serial port
available.  The computer's standard keyboard should also be
connected to the computer.  Also, if you want the SerialKeys
program to provide mouse functions, you must have a
compatible mouse driver loaded in your computer.  This
usually means that you must also have a mouse connected to
your computer (see MouseKeys discussion above).  Some older
(pre-generation 3) Microsoft mice will not work with
SerialKeys.

SerialKeys is designed to allow the user to provide input via
a special aid connected to the computer's serial port.
However, SerialKeys does not disable the standard input
devices such as the keyboard and mouse.  If another computer
user chooses to enter input at the keyboard while someone is
using SerialKeys for access to the same computer, key states
such as the CAPS LOCK, SCROLL LOCK OR NUM LOCK may get out of
synchronization between the keyboard and the computer.
Likewise, if another user operates the mouse while someone is
moving the mouse cursor via SerialKeys, the mouse cursor will
get out of synchronization between SerialKeys and computer.

Some applications do a lot of processing of the input they
receive from the keyboard.  If you are running SerialKeys
with these types of application, you may lose keystrokes or
characters in transmission, even at a slow baudrate.  First,
try slowing down your transmission speed or baudrate to see
if that improves the problem.  Second, limit the number of
characters you send per a single selection on your aid.

SerialKeys may not work on some applications on older IBM
computers (PC, XT, and AT), especially if the
application is designed to only retrieve keyboard information
when a key is pressed.  On these computers, SerialKeys places
the keyboard character it is trying to emulate into the same
buffer the keyboard would put a character except that the
application will not read the buffer because you never
actually pressed a key on the keyboard.  One such software
program is Microsoft Works.  One solution is to run MS-DOS
version 4.0 or above and run the program "keyb.com" prior to
running AccessDOS and SerialKeys.

Moving the mouse with SerialKeys assumes the mouse is
operating within an application which allows the mouse to
move equally in both the horizontal and vertical directions.
If you experience problems moving the mouse cursor with
SerialKeys, especially when you move large distances or move
quickly between the same two locations, the mouse driver
software may be the cause.  Many mouse drivers contain a
"threshold" speed, beyond which the mouse cursor movements in
the horizontal and vertical direction no longer correspond to
the resolution or "mouse scaling" used within the
application.  Please refer to the mouse driver software
manual if you need to turn this feature off.  Another
solution is to limit the size of your SerialKeys mouse
movements such that you never exceed this "threshold".

RUNNING SERIALKEYS WITH WINDOWS

The SerialKeys feature in AccessDOS only works within MS-DOS.
However, if you would like to use SerialKeys with Microsoft
Windows 3.x, there is an access utility for Windows 3.x which
also contains a SerialKeys function.  (See Windows discussion
above.)

If you want to run SerialKeys in both AccessDOS and Microsoft
Windows 3.x, you need to do two things.  First, you need to
have both AccessDOS (to give you SerialKeys in MS-DOS) and the
Access Utility for Windows 3.0 (to give you SerialKeys in
Windows).  Next, you need to set some special AccessDOS
command line switches.  These switches, which are best placed
in a "batch" file (see below), are only needed if you want
SerialKeys to function in both AccessDOS and Windows.  The
SerialKeys function in AccessDOS and in the Access Utility
for Windows are the same, so once you program your
communication device, you will be able to work in either
operating environment.


BATCH FILES FOR RUNNING IN WINDOWS

Batch files can be created in MS-DOS, and are typically used to
execute a series of commands by entering a single
instruction.  A batch file is easy to recognize, since it
should always have a filename followed by the three character
extension, "bat".  The easiest way to create a batch file is
to use a word processor which has the capability to read,
write, and save a "text" or "ASCII" file.  If you are
attempting to run SerialKeys in both AccessDOS and in Windows
while in standard mode, you should create a batch file with
the following three commands:

     ados /skw
     win /s
     ados /ske

An example of a working batch file that was placed in the
"c:\ >" root directory follows.  It assumes that AccessDOS
was stored in the MS-DOS sub-directory and that Windows was
stored in another directory.  You may need to change the
directory paths to match your own computer setup.

     c:\dos\ados /skw
     c:\windows\win /s
     c:\dos\ados /ske

Remember, you will need to have Access Pack for Microsoft
Windows (see discussion under Operating Systems) in
order to run SerialKeys once inside Windows.  Also note that
your AccessDOS "saved settings" file, which is called
"ADOS.CFG", should have SerialKeys saved "on" prior to
running this batch file (see manual for discussion on how to
save settings).

NOTE:  If you do not intend to run SerialKeys inside of
Windows, you should not ever use these special command line
switches.

ADVANCED SERIALKEYS NOTES

SerialKeys was designed to automatically lower the
transmission or baud rate to 300 baud, any time 3 consecutive
characters are received with data transmission errors.  This
is an important feature when SerialKeys is used in a
multi-user environment.  It can however, be a nuisance for a
single user, especially if they are having problems with
their communication aid.  If you are using SerialKeys as a
single user, you may want to disable this feature of
SerialKeys.  To disable this automatic baudrate lowering or
"reset-on-error" feature of SerialKeys, use the special
command line switch "/sks" along with "ados" when you load or
install AccessDOS.  For example, to start AccessDOS with the
"reset-on-error" feature disabled and for a color monitor,
you would use the following instruction:

     ados /c /sks

NOTE:  This special command line switch can not be saved in
the "ADOS.CFG" file, so if it is useful to you, you will have
to type it each time you start up your computer to run
AccessDOS.  You should not use this special command line
switch if you are not the only person using SerialKeys on a
particular computer.



D. MISCELLANEOUS

It is recommended that you store AccessDOS (ADOS.COM,
ADOS.OVL, and ADOS.CFG) on your computer hard disk in your
MS-DOS sub-directory or on your floppy disk which contains MS-DOS.
While this is not absolutely necessary, it reduces confusion
since most MS-DOS computer users have a directory for all their
MS-DOS utilities and a MS-DOS "path" command to find their MS-DOS
utilities.

When AccessDOS is loading, it will make an attempt to
determine your computer speed (actually CPU speed) and set
counters for the various beeps AccessDOS produces based upon
that speed.  If you have a computer which has multiple
speeds, you should load or install AccessDOS while the
computer is at the speed you intend to operate AccessDOS.
Changing speeds while AccessDOS is running may cause the
beeps produced by AccessDOS to become unrecognizable.

On some computers, the sounds made by AccessDOS (and other
programs) may be less audible, due to the design or placement
of the speaker.

AccessDOS is not compatible with most terminal emulators,
such as the IBM PC 3270 (TM).




     Blue Max is a trademark of Qualitas.

     IBM, Personal Computer AT, Personal System/2, and PS/2
     are registered trademarks of the International Business
     Machines Corporation.

     Personal Computer XT and PC 3270 are trademarks of the
     International Business Machines Corporation.

     1-2-3 is a registered trademark of Lotus Development
     Corporation.

     PC Paintbrush is a registered trademark of ZSoft Corporation.

     QEMM is a trademark of Quarterdeck Office Systems.

     Microsoft, MS-DOS and InPort are registered trademarks,
     and Windows and BallPoint are trademarks of the Microsoft
     Corporation.

     WordPerfect is a registered trademark of WordPerfect
     Corporation.
