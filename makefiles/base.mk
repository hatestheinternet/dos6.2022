DL_DOS_BOOT?=${DOWNLOAD_DIR}/Dos6.22.img

DL_DOS_FNAME?=Microsoft\ MS-DOS\ 6.22\ Plus\ Enhanced\ Tools.7z
DL_DOS_FILE?=${DOWNLOAD_DIR}/${DL_DOS_FNAME}

DOS_EXPAND_WAIT?=60

${DL_DOS_BOOT}:
	echo "You need to download the DOS 6.22 bootdisk from AllBootDisks"
	echo "https://www.allbootdisks.com/download/dos.html"
	exit 1

${DL_DOS_FILE}:
	echo "You need to download an MS DOS 6.22 installer. Try"
	echo "https://winworldpc.com/product/ms-dos/622"
	exit 1

${SOURCES}/dos_boot.img: ${DL_DOS_BOOT}
	cp -v ${DL_DOS_BOOT} ${SOURCES}/dos_boot.img

${SOURCES}/${DL_DOS_FNAME}: ${DL_DOS_FILE}
	cp -v ${DL_DOS_FILE} ${SOURCES}/${DL_DOS_FNAME}

${ISOBASE}/boot/boot.img: ${SOURCES}/dos_boot.img 
	mkdir -p ${ISOBASE}/boot
	cp -v ${SOURCES}/dos_boot.img ${ISOBASE}/boot/boot.img

${ISOBASE}/dos: ${SOURCES}/dos_boot.img ${SOURCES}/${DL_DOS_FNAME}
	DOS_EXPAND_WAIT=${DOS_EXPAND_WAIT} \
			DL_DOS_FILE=${SOURCES}/${DL_DOS_FNAME} \
			${SCRIPTS}/expanddos.sh

${ISOBASE}/dosinst.bat: ${ISOBASE}/boot/boot.img ${ISOBASE}/dos
	unix2dos -v -n ${SCRIPTS}/dosinst.bat ${ISOBASE}/dosinst.bat

${ISOBASE}/autoexec.cpy: ${SCRIPTS}/autoexec.cpy
	unix2dos -v -n ${SCRIPTS}/autoexec.cpy ${ISOBASE}/autoexec.cpy

${ISOBASE}/config.cpy: ${SCRIPTS}/config.cpy
	unix2dos -v -n ${SCRIPTS}/config.cpy ${ISOBASE}/config.cpy

CONTENTS+=${ISOBASE}/dosinst.bat ${ISOBASE}/autoexec.cpy ${ISOBASE}/config.cpy
