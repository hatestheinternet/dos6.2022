DL_DV280_FNAME=Quarterdeck\ DESQview\ 2.80.7z
DL_DV280_FILE=${DOWNLOAD_DIR}/${DL_DV280_FNAME}

${DL_DV280_FILE}:
	echo "You need to download the DESQView 2.80 installer first"
	echo "https://winworldpc.com/product/desqview/2x"
	exit 1

${SOURCES}/${DL_DV280_FNAME}: ${DL_DV280_FILE}
	cp -v ${DL_DV280_FILE} ${SOURCES}/${DL_DV280_FNAME}

${ISOBASE}/apps/desqview/280: ${ISOBASE}/apps/qemm/803 ${SOURCES}/${DL_DV280_FNAME}
	scripts/extract_images_from ${SOURCES}/${DL_DV280_FNAME} ${ISOBASE}/apps/desqview/280
	7z e ${SOURCES}/${DL_DV280_FNAME} "Quarterdeck DESQview 2.80 (1996) (3.5-720k)/Serial.txt" -so > ${ISOBASE}/apps/desqview/280_info.txt

CONTENTS+=${ISOBASE}/apps/desqview/280
