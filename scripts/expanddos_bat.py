#!/usr/bin/env python3
import os
import shutil

extn_maps = {
        'WNTOOLS.GR_': 'WNTOOLS.GRP',
        '.VI_': '.VID',
        '.DO_': '.DOC',
        '.BA_': '.BAS',
        '.CP_': '.CPL',
        '.TX_': '.TXT',
        '.EX_': '.EXE',
        '.SY_': '.SYS',
        '.HL_': '.HLP',
        '.CO_': '.COM',
        '.IN_': '.INI',
        '.38_': '.386',
        '.DL_': '.DLL',
        '.OV_': '.OVL',
        '.PR_': '.PRG',
        '.GR_': '.GRF'
}

lines = []
base = os.getenv('EXPANDER_MOUNT')
for root, dirs, files in os.walk(f"{base}/in"):
    for _ in files:
        if _ in extn_maps:
            lines.append(f"C:\\IN\\EXPAND C:\\IN\\{_} C:\\OUT\\{extn_maps[_]}\r\n")

        else:
            extn = _[-4:]
            if extn in extn_maps:
                lines.append(f"C:\\IN\\EXPAND C:\\IN\\{_} C:\\OUT\\{_[0:-4]}{extn_maps[extn]}\r\n")
            else:
                print(f"Copying {_}")
                shutil.copyfile(f"{base}/in/{_}", f"{base}/out/{_}")

if( len(lines) ):
    with open(f"{base}/AUTORUN.BAT","w") as f:
        f.write("@ECHO OFF\r\n")
        for _ in lines:
            f.write(f"{_}\r\n")
