#!/bin/bash
. scripts/functions.inc

EXPANDER_IMG=$(junk_name)
dd if=/dev/zero of=${EXPANDER_IMG} bs=1M count=30

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${EXPANDER_IMG}
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk
    # default, extend partition to end of disk
  t # partition type
  06 # fat16
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF

LOOPDEV=`losetup -a | grep ${EXPANDER_IMG} | cut -d: -f 1`
if [ "x${LOOPDEV}" = "x" ]; then
	sudo losetup -f ${EXPANDER_IMG}
	LOOPDEV=`losetup -a | grep ${EXPANDER_IMG} | cut -d: -f 1`
	if [ "x${LOOPDEV}" = "x" ]; then
		echo "Failed to create loop device!"
		exit 1
	fi
fi
LOOPNM=`echo ${LOOPDEV} | sed 's@/dev/@@'`

DOSPART="/dev/mapper/${LOOPNM}p1"
echo "Using loopback device ${LOOPDEV}, ${DOSPART}"
if [ ! -f "${DOSPART}" ]; then
	sudo kpartx -u -v "${LOOPDEV}"
fi

sudo mkfs.fat -F 16 ${DOSPART} 

HERE=`realpath .`
EXPANDER_MOUNT=${HERE}/$(junk_name)
EXPANDER_BOOT=${HERE}/$(junk_name)

mkdir -v ${EXPANDER_MOUNT}
sudo mount -v "${DOSPART}" ${EXPANDER_MOUNT}

echo "Copying DOS install disks"
sudo ${SCRIPTS}/extract_images_from "${DL_DOS_FILE}" ${EXPANDER_MOUNT}/in

sudo rm -v -f ${EXPANDER_MOUNT}/in/AUTOEXEC.BAT ${EXPANDER_MOUNT}/in/COMMAND.COM ${EXPANDER_MOUNT}/in/CONFIG.SYS ${EXPANDER_MOUNT}/in/IO.SYS ${EXPANDER_MOUNT}/in/MSDOS.SYS

sudo mkdir -v ${EXPANDER_MOUNT}/out
sudo EXPANDER_MOUNT=${EXPANDER_MOUNT} python3 ${SCRIPTS}/expanddos_bat.py
sync

if [ -f "${EXPANDER_MOUNT}/AUTORUN.BAT" ]; then
	sudo umount -v ${EXPANDER_MOUNT}
	sudo kpartx -v -d "${LOOPDEV}"
	sudo losetup -v -d "${LOOPDEV}"

	cp -v ${SOURCES}/dos_boot.img ${EXPANDER_BOOT}
	sudo mount -v ${EXPANDER_BOOT} ${EXPANDER_MOUNT}
	echo -e "C:\\AUTORUN.BAT\r\n" | sudo tee -a ${EXPANDER_MOUNT}/AUTOEXEC.BAT
	sync
	sudo umount -v ${EXPANDER_MOUNT}

	qemu-system-i386 \
		-drive if=floppy,index=0,format=raw,file=${EXPANDER_BOOT} \
		-drive format=raw,file=${EXPANDER_IMG} \
		-m 16 -boot a &
	sleep ${DOS_EXPAND_WAIT} 
	killall qemu-system-i386

	rm -v -f ${EXPANDER_BOOT}
	sudo losetup -v -f ${EXPANDER_IMG} 
	LOOPDEV=`losetup -a | grep ${EXPANDER_IMG} | cut -d: -f 1`
	LOOPNM=`echo ${LOOPDEV} | sed 's@/dev/@@'`
	DOSPART="/dev/mapper/${LOOPNM}p1"
	sudo kpartx -v -u "${LOOPDEV}"
	sudo mount -v "${DOSPART}" ${EXPANDER_MOUNT}
fi

if [ -d ${EXPANDER_MOUNT}/out ]; then
	mkdir -pv ${ISOBASE}/dos
	cp -a -v ${EXPANDER_MOUNT}/out/* ${ISOBASE}/dos/
fi

sudo umount -v ${EXPANDER_MOUNT}
sudo kpartx -v -d "${LOOPDEV}"
sudo losetup -v -d "${LOOPDEV}"
sudo rmdir -v ${EXPANDER_MOUNT}
rm -v ${EXPANDER_IMG}
