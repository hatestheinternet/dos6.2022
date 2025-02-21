HERE=$(realpath .)
ISOBASE?=${HERE}/contents
SOURCES?=${HERE}/sources
SCRIPTS?=${HERE}/scripts
DOWNLOAD_DIR?=${HOME}/Downloads

export ISOBASE SCRIPTS SOURCES

.SILENT:

dos6.2022: dos_6_2022.iso 

${SOURCES}:
	mkdir -pv ${SOURCES}

#include makefiles/*.mk

dos_6_2022.iso: ${SOURCES} ${CONTENTS}
	mkisofs \
		-eltorito-boot boot/boot.img \
		-input-charset cp437 \
		-iso-level 1 \
		-output dos_6_2022.iso \
		-rational-rock \
		${ISOBASE}

clean:
	rm -rf dos_6_2022.iso ${ISOBASE} build.log
