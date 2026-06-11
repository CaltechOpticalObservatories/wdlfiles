GFLAGS= +c "/*" "*/" +c "//" "\n" +c "\\\n" ""
GPP = /usr/bin/gpp
PRJ = "LRIS2"

LRIS2.system LRIS2.modules &: LRIS2.mod
	cat  ${PRJ}.mod | $(GPP) $(GFLAGS) | wdl --debug mod --projname ${PRJ}  -


LRIS2.wdl: LRIS2.conf LRIS2.waveform LRIS2.seq LRIS2.def LRIS2.cds
	cat ${PRJ}.conf | ${GPP} ${GFLAGS} | wdl seq  - > ${PRJ}.wdl

LRIS2.script LRIS2.states &: LRIS2.wdl
	cat ${PRJ}.wdl | ${GPP} ${GFLAGS} | wdl --debug wdl -
