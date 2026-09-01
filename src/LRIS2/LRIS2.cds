//tap line configuration for single STA4850 detector
//taplines in thhe order a, b, d, c

//the output arrangement of STA4850 is
//    a -- -- -- b
//    |          |
//    |          |
//    |          |
//    d -- -- -- c
//


#include "geometry.inc"


SAMPLEMODE=1 //32-bit samples

FRAMEMODE=2 //split frame top bottom


//setup for reading thru all 4 outputs
LINECOUNT= RO_ROWS
PIXELCOUNT= RO_COLS

//NOTE: it looks like this currently isn't supported by archon firmware. Talk to Greg about
#define USE_BOTH


#ifdef USE_BOTH 

TAPLINE0="AM16L,1,100" //tapline a

TAPLINE1="AM18R,1,100" //tapline b

TAPLINE2="AD7L,1,100" //tapline a

TAPLINE3="AD8R,1,100" //tapline b

TAPLINE4="AM12L,1,100" //tapline d

TAPLINE5="AM14R,1,100" //tapline c

TAPLINE6="AD6L,1,100" //tapline d

TAPLINE7="AD5R,1,100" //tapline c

TAPLINES=8


#elif  defined(USE_ADM)

TAPLINE0="AM16L,1,100" //tapline a

TAPLINE1="AM18R,1,100" //tapline b

TAPLINE2="AM12L,1,100" //tapline d

TAPLINE3="AM14R,1,100" //tapline c

TAPLINES=4

#else
TAPLINE0="AD7L,1,100" //tapline a

TAPLINE1="AD8R,1,100" //tapline b

TAPLINE2="AD6L,1,100" //tapline d

TAPLINE3="AD5R,1,100" //tapline c

TAPLINES=4


#endif


//dummy values for now
SHP1=50
SHP2=100
SHD1=101
SHD2=151

