GFLAGS= +c "/*" "*/" +c "//" "\n" +c "\\\n" ""
GPP = /usr/bin/gpp
PRJ = "LRIS2"

LRIS2.acf: LRIS2_TMP.script LRIS2_TMP.states LRIS2_TMP.wdl LRIS2.system LRIS2.modules LRIS2.cds
	cat ${PRJ}.conf | ${GPP} ${GFLAGS} | wdl --debug inc - | cat - LRIS2.cds | ${GPP} ${GFLAGS} | \
	cat - ${PRJ}_TMP.script ${PRJ}.modules ${PRJ}_TMP.states ${PRJ}.system | wdl ini2acf - > LRIS2.acf


LRIS2.system LRIS2.modules &: LRIS2.mod
	cat  ${PRJ}.mod | $(GPP) $(GFLAGS) | wdl --debug mod --projname ${PRJ} -


LRIS2_TMP.wdl: LRIS2.conf LRIS2.waveform LRIS2.seq LRIS2.def
	cat ${PRJ}.conf | ${GPP} ${GFLAGS} | wdl seq  - | ${GPP} ${GFLAGS} | wdl --debug wdl - > ${PRJ}_TMP.wdl

LRIS2_TMP.script LRIS2_TMP.states &: LRIS2_TMP.wdl
	wdl --debug wavgen ${PRJ}_TMP


