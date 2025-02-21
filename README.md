# MS-DOS 6.2022

Off the top: I am a "retro computing aficionado" (read: hoarder of old computer junk). _This_ is what I use to get old crap working again -- err, I mean preserve unique pieces of computing history.

I am in no way sure what I am committing is legal. What I am (mostly) sure of is, if you check out this repository on an Ubuntu machine, `sudo apt install make genisoimage`, then type `make` you will probably wind up with a bootable `dos_6_2022.iso`.

Note you'll probably need a boot floppy for 386/486 and early Pentium-class machines since they didn't really understand CD-ROMs let alone know what to do with them. In that case, `contents/boot/boot.img` should fit on a 1.4mb floppy and is actually what the ISO uses to boot.

## Big Bang
If you are booting the ISO on a VM or just a machine you want to refresh run `fdisk`, but make sure _a_ partition is active otherwise it'll never boot. Don't FAFO, just make it the first on the disk.

Note that, if this is a new machine or fresh drive, you will need to make sure the CD-ROM precedes the hard drive in the BIOS boot order, otherwise you'll see `Operating system not found` or something similarly as bad after `fdisk` makes you reboot.

Also remember this is DOS, you're further ahead breaking a 1gb drive up in to 2 500mb partitions.

## "Installing"
```
A:> format c: /s
A:> r:
R:> dosinst.bat
```
Reboot (making sure hard drive precedes CD-ROM because read Big Bang)

## Sources for Things
A lot of this stuff is old and janky and a "from scratch" build is possible but not recommended. If you know how to read the witness marks in `makefiles/*.mk` you can see everything it downloads is public, winworld/archive dot org abandoned, etc. I *can* strip it back to nothing but who wants to spend all night downloading 30-40 year old software nobody cares about just to see if we can get that old 386/486/Pentium the dude at the flea market was going to throw out booting?

## What's Included
Some useful highlights:

### dosinst.bat
So long as the C: drive is ready (ie `format c: /s`), this will install a bootable MS-DOS 6.22 system with HIMEM, EMM386, and a generic ATAPI CD-ROM driver as drive R:

Note: This also includes `DOSIDLE.EXE` which is started automatically from the installed `AUTOEXEC.BAT` and is the crucial piece to ensure an MS-DOS virtual machine doesn't use 100% CPU 100% of the time.

### The Crynwr Packet Driver Collection
The [Crynwr packet driver collection](http://crynwr.com/) lives in `R:\NET\CRYNWR`.

### TPPATCH.EXE
If you try to run something written in TurboPascal (eg BBS software or door games) on too new a processor (ie > 166MHz Pentium) it will exit with **Runtime error 200**. `R:\UTILS\TPPATCH.EXE` fixes that.

### Windows for Workgroups 3.11
It's in `R:\WINDOWS\WFW311`, think I installed it once and it worked, YMMV.

### DESQview and QEMM
The two technologies which underpinned most multi-node BBS systems in the 90s (note it works on bare metal or under VMware, sometimes in Virtualbox, but I have yet to see QEMM behave under qemu/kvm):
* **QEMM 8.01** lives in `R:\APPS\QEMM\801`. Install this before DESQview, don't worry about the 8.03 upgrade in `R:\APPS\QEMM\803`, it's there but I've never needed it.
* **DESQview 2.80** lives in `R:\APPS\DESQVIEW` and you'll probably want to run your nodes as clones of the `BD` "Big DOS" window

### Telix 3.51
`R:\COMMS\TELIX351`, of course.

### RLFossil
Uses a packet driver to emulate 1-4 FOSSIL COM ports which means, if you use it to launch DESQview, you can run 4 "telnettable" nodes on a single DOS machine/VM. So long as your BBS software and door games etc properly use FOSSIL it's basically an Ethernet X00.SYS.

It responds to a subset of `AT` commands, incoming telnet or rlogin connections result in a `RING`. After the TCP connection is established, it'll fire off `CONNECT 31337` (note 31337 is a placeholder I forget what it says because when it works it works, when it doesn't it _really_ friggin doesn't). `+++ATH0` will end the TCP connection, as will dabbling with the usual carrier things.

### Netware Client
`R:\NET\NOVELL32\DW271E` is the self-extracting ARJ (lol ARJ) droid you seek:
```
MKDIR C:\NVINST
CD C:\NVINST
C:
R:\NET\NOVELL32\DW271E.EXE
NVINST.EXE
```
(last line might not be the installer name, `dir /w` and figure it out. After it's done you can `deltree /y C:\nvinst`)

If you have a NetWare server it will probably auto-register on boot so you can `F:\LOGIN` etc, if not you're at least left with `LSL.COM` and all the IPX goodies you'll need should your friends pop by with their 486es and fancy a couple rounds of Doom 2 or Carmageddon.

### NCSA Suite
`R:\NET\NCSA` contains the NCSA suite including telnet, ftp, finger, lpr, and other crap nobody uses anymore because it's insecure af or just a bad idea.

