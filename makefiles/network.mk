NET_PKTDRV_URL?=http://www.devili.iki.fi/pub/IBM/PC/packet/pktd11.zip
NET_TELNET_URL?=http://www.devili.iki.fi/pub/IBM/PC/packet/tel2308b.zip

${SOURCES}/pktd11.zip:
	wget -O ${SOURCES}/pktd11.zip ${NET_PKTDRV_URL}

${SOURCES}/tel2308b.zip:
	wget -O ${SOURCES}/tel2308b.zip ${NET_TELNET_URL}

${ISOBASE}/net/ncsa: ${SOURCES}/tel2308b.zip
	scripts/extract ${SOURCES}/tel2308b.zip ${ISOBASE}/net/ncsa

${ISOBASE}/net/pktdrv: ${SOURCES}/pktd11.zip
	scripts/extract ${SOURCES}/pktd11.zip ${ISOBASE}/net/pktdrv
	cp -av ${SOURCES}/extra_pktdrv/* ${ISOBASE}/net/pktdrv/

CONTENTS+=${ISOBASE}/net/ncsa ${ISOBASE}/net/pktdrv
