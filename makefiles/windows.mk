DL_WFW311_FNAME=Microsoft\ Windows\ for\ Workgroups\ 3.11.7z
DL_WFW311_FILE=${DOWNLOAD_DIR}/${DL_WFW311_FNAME}

${DL_WFW311_FILE}:
	echo "You need to download Windows for Workgroups 3.11 first"
	echo "https://winworldpc.com/product/windows-3/wfw-311"
	exit 1

${SOURCES}/${DL_WFW311_FNAME}: ${DL_WFW311_FILE}
	cp -v ${DL_WFW311_FILE} ${SOURCES}/${DL_WFW311_FNAME}

${ISOBASE}/apps/windows/wfw311: ${SOURCES}/${DL_WFW311_FNAME}
	scripts/extract_images_from ${SOURCES}/${DL_WFW311_FNAME} ${ISOBASE}/apps/windows/wfw311

CONTENTS+=${ISOBASE}/apps/windows/wfw311
