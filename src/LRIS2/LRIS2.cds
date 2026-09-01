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

#define USE_BOTH


#ifdef USE_BOTH 

TAPLINE0="AM16L,1,100" //tapline a

TAPLINE1="AM36R,1,100" //tapline b

TAPLINE2="AM32L,1,100" //tapline d

TAPLINE3="AM30R,1,100" //tapline c


TAPLINE4="AD7L,1,100" //tapline a

TAPLINE5="AD8R,1,100" //tapline b

TAPLINE6="AD6L,1,100" //tapline d

TAPLINE7="AD5R,1,100" //tapline c


#elif  defined(USE_ADM)

TAPLINE0="AM16L,1,100" //tapline a

TAPLINE1="AM36R,1,100" //tapline b

TAPLINE2="AM32L,1,100" //tapline d

TAPLINE3="AM30R,1,100" //tapline c

#else
TAPLINE0="AD7L,1,100" //tapline a

TAPLINE1="AD8R,1,100" //tapline b

TAPLINE2="AD6L,1,100" //tapline d

TAPLINE3="AD5R,1,100" //tapline c


#endif


//dummy values for now
SHP1=50
SHP2=100
SHP3=101
SHP4=151

