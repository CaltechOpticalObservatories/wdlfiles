GFLAGS= +c "/*" "*/" +c "//" "\n" +c "\\\n" ""
GPP = /usr/bin/gpp
PRJ = LRIS2
WDLPATH=${HOME}/Software/wdl/wdl
#I2A=${WDLPATH}/ini2acf.pl
I2A = wdl ini2acf

LRIS2.acf: $(PRJ)_TMP.script $(PRJ)_TMP.states $(PRJ)_TMP.wdl $(PRJ).system $(PRJ).modules $(PRJ).cds geometry.inc
	cat ${PRJ}.conf | ${GPP} ${GFLAGS} | wdl --debug inc - | \
	cat - ${PRJ}_TMP.script ${PRJ}.modules ${PRJ}_TMP.states  ${PRJ}.system | $(I2A) -  > LRIS2.acf


LRIS2.system LRIS2.modules &: $(PRJ).mod geometry.inc $(PRJ).cds
	cat  ${PRJ}.mod | $(GPP) $(GFLAGS) | wdl --debug mod --projname ${PRJ} -
	cat ${PRJ}.cds | $(GPP) $(GFLAGS) | grep .  >> LRIS2.modules


LRIS2_TMP.wdl: $(PRJ).conf $(PRJ).waveform $(PRJ).seq $(PRJ).def geometry.inc
	cat ${PRJ}.conf | ${GPP} ${GFLAGS} | wdl seq  - | ${GPP} ${GFLAGS} | wdl --debug wdl - > ${PRJ}_TMP.wdl

LRIS2_TMP.script LRIS2_TMP.states &: LRIS2_TMP.wdl geometry.inc
	wdl --debug wavgen ${PRJ}_TMP


.PHONY: clean
clean:
	rm *_TMP.* LRIS2.system LRIS2.modules LRIS2.acf
