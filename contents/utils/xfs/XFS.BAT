@echo off
rem XFS Version 1.71

loadhigh ne2000 0x60
loadhigh winpkt 0x60
loadhigh xfskrnl 0x60

xfstool @init

rem done
