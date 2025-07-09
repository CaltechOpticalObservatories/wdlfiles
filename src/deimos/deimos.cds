/* -*- C -*- */
/** ---------------------------------------------------------------------------
 * @file   wasp.cds
 * @brief  CDS/Deinterlace parameters for WaSP instrument
 */

#include "voltage_timing_parameters.h"

BIGBUF        = _ARCHON_FRAMEBUFS
  LINECOUNT     = _LINENUM
  PIXELCOUNT    = _AMPREADCOLS
RAWENABLE     = _RAW_ENABLE
RAWENDLINE    = 800
RAWSAMPLES    = 5000
  //RAWSEL        = _RAW_SELECT
  //NOTE RAWSEL of 11 should be E channel of slot 2
RAWSEL        = 11
RAWSTARTLINE  = 0
RAWSTARTPIXEL = 48
SAMPLEMODE    = 0

//attempt pixel timing coincident with the nearest ADM samples. That means multiples of 8
//by eye, try 80 to start
// then it looks like 13 ADM samples, 80 + 13 *8 = 184

  //signal is 13 ADM samples, starting from time 232
  //232 + 13 * 8 = 338
  
  // last sample number must fit the series 8*n-1
  // first sample number must be in the series 8*n
  
  
SHP1          = 80
SHP2          = 183
SHD1          = 232
SHD2          = 327

  //ADM module installed in slot 7
#define SINGLE_DET_TEST 0

  // NOTE tghere is a re-mapping due to the cameralink cable,
  // that is not accounted for by the current DEIMOS VIB.
  // currently, SCI 2E channel is connected to FCS L1 (which will be channel 9 in the ADM card, tap channel 45)
  // raw channel selection 49
  // SCI 2F channel is connected to SCI 4f (which will be channel 8 in the ADM card, tap channel 44)
  // note this should also be inverted in principle, not sure if that's actually ahppenbing TBD
  // raw channel selection 48


  //NOTE due to a small mistake in the VIB schematic, ALL signals come out inverted. Due to a mistake in the mapping of the cameralink cable, the channels are mixed up and some are inverted. This inversion cancels out the other inversion. Hence SCI2F is NOT inverted, but SCI 2E IS

  

#if SINGLE_DET_TEST
TAPLINE0      ="AM45L,-1,100"
TAPLINE1      ="AM44R,1,100"
TAPLINES=2
FRAMEMODE=0

  
#else
FRAMEMODE=2
TAPLINE0      ="AM37L,1,100"
TAPLINE1      ="AM38R,1,100"
TAPLINE2      ="AM39L,1,100"
TAPLINE3      ="AM40R,1,100"
TAPLINE4      ="AM41L,1,100"
TAPLINE5      ="AM42R,1,100"
TAPLINE6      ="AM43L,1,100"
TAPLINE7      ="AM44R,1,100"
TAPLINE8      ="AM45L,1,100"
TAPLINE9      ="AM46R,1,100"
TAPLINE10     ="AM47L,1,100"
TAPLINE11     ="AM48R,1,100"
TAPLINE12     ="AM49L,1,100"
TAPLINE13     ="AM50R,1,100"
TAPLINE14     ="AM51L,1,100"
TAPLINE15     ="AM52R,1,100"
TAPLINES=16

#endif

TRIGOUTFORCE=0
TRIGOUTINVERT=0
TRIGOUTLEVEL=0
TRIGOUTPOWER=1
