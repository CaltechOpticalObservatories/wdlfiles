/* -*- C -*- */

#include "voltage_timing_parameters.h"


//attempt pixel timing coincident with the nearest ADM samples. That means multiples of 8
//by eye, try 80 to start
// then it looks like 13 ADM samples, 80 + 13 *8 = 184

  //signal is 13 ADM samples, starting from time 232
  //232 + 13 * 8 = 338
  
  // last sample number must fit the series 8*n-1
  // first sample number must be in the series 8*n
BIGBUF        = 0
RAWSTARTLINE  = 0
  //to view the last prescan and start of the line
  //RAWSTARTPIXEL = 48
  //to view the end of the line
RAWSTARTPIXEL = 1061
SAMPLEMODE    = 1
RAWENABLE     = 1
RAWENDLINE    = 800
RAWSAMPLES    = 20000

  //ADM module installed in slot 7


  // NOTE tghere is a re-mapping due to the cameralink cable,
  // that is not accounted for by the current DEIMOS VIB.
  // currently, SCI 2E channel is connected to FCS L1 (which will be channel 9 in the ADM card, tap channel 45)
  // raw channel selection 49
  // SCI 2F channel is connected to SCI 4f (which will be channel 8 in the ADM card, tap channel 44)
  // note this should also be inverted in principle, not sure if that's actually ahppenbing TBD
  // raw channel selection 48



FRAMEMODE=2
TAPLINE0="AM37L,1,100"
TAPLINE1="AM38R,1,100"
TAPLINE2="AM39L,1,100"
TAPLINE3="AM40R,1,100"
TAPLINE4="AM41L,1,100"
TAPLINE5="AM42R,1,100"
TAPLINE6="AM43L,1,100"
TAPLINE7="AM44R,1,100"
TAPLINE8="AM54L,1,100"
TAPLINE9="AM53R,1,100"
TAPLINE10="AM52L,1,100"
TAPLINE11="AM51R,1,100"
TAPLINE12="AM50L,1,100"
TAPLINE13="AM49R,1,100"
TAPLINE14="AM48L,1,100"
TAPLINE15="AM47R,1,100"
TAPLINES=16

LINECOUNT=_LINENUM
PIXELCOUNT=_AMPREADCOLS
//NOTE RAWSEL of 11 should be E channel of slot 2

RAWSEL        = 11

SHP1          = 200
SHP2          = 447
SHD1          = 535
SHD2          = 831


TRIGOUTFORCE=0
TRIGOUTINVERT=0
TRIGOUTLEVEL=0
TRIGOUTPOWER=1
