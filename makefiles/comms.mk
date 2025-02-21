COMMS_TLX351_URL?=https://archive.org/download/TelixCommunications_1020/telix351.zip

${SOURCES}/telix351.zip:
	wget -O ${SOURCES}/telix351.zip ${COMMS_TLX351_URL}

${SOURCES}/rlfossil.zip:
	echo "You need to find the rlfossil.zip that should've come with this repository"
	exit 1

${ISOBASE}/comms/telix351: ${SOURCES}/telix351.zip
	scripts/extract ${SOURCES}/telix351.zip ${ISOBASE}/comms/telix351

${ISOBASE}/comms/rlfossil: ${SOURCES}/rlfossil.zip
	scripts/extract ${SOURCES}/rlfossil.zip ${ISOBASE}/comms/rlfossil

CONTENTS+=${ISOBASE}/comms/telix351 ${ISOBASE}/comms/rlfossil
