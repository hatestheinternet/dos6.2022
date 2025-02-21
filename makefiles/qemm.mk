DL_QEMM801_FNAME=Quarterdeck\ QEMM\ 8.01.7z
DL_QEMM801_FILE=${DOWNLOAD_DIR}/${DL_QEMM801_FNAME}
DL_QEMM803_FNAME=QEMM\ 8.03\ Update.7z
DL_QEMM803_FILE=${DOWNLOAD_DIR}/${DL_QEMM803_FNAME}

${DL_QEMM801_FILE}:
	echo "You need to download the QEMM 8.01 installer first"
	echo "https://winworldpc.com/product/qemm/8x"
	exit 1

${DL_QEMM803_FILE}:
	echo "You need to download the QEMM 8.03 update first"
	echo "https://winworldpc.com/product/qemm/8x"
	exit 1

${SOURCES}/${DL_QEMM801_FNAME}: ${DL_QEMM801_FILE}
	cp -v ${DL_QEMM801_FILE} ${SOURCES}/${DL_QEMM801_FNAME}

${SOURCES}/${DL_QEMM803_FNAME}: ${DL_QEMM803_FILE}
	cp -v ${DL_QEMM803_FILE} ${SOURCES}/${DL_QEMM803_FNAME}

${ISOBASE}/apps/qemm/801: ${SOURCES}/${DL_QEMM801_FNAME}
	scripts/extract_images_from ${SOURCES}/${DL_QEMM801_FNAME} ${ISOBASE}/apps/qemm/801
	7z e ${SOURCES}/${DL_QEMM801_FNAME} "Quarterdeck QEMM 8.01 (3.5-1.44mb)/Quarterdeck QEMM 8.01.txt" -so > ${ISOBASE}/apps/qemm/801_info.txt

${ISOBASE}/apps/qemm/803: ${ISOBASE}/apps/qemm/801 ${SOURCES}/${DL_QEMM803_FNAME}
	mkdir -p ${ISOBASE}/apps/qemm/803
	7z e ${SOURCES}/${DL_QEMM803_FNAME} "QEMM 8.03 Update/QEMM803D.EXE" -o${ISOBASE}/apps/qemm/803

CONTENTS+=${ISOBASE}/apps/qemm/803
