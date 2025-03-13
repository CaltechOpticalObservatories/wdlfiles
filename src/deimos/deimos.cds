/* -*- C -*- */
/** ---------------------------------------------------------------------------
 * @file   wasp.cds
 * @brief  CDS/Deinterlace parameters for WaSP instrument
 */

#include "voltage_timing_parameters.h"

BIGBUF        = _ARCHON_FRAMEBUFS
FRAMEMODE     = 0
  LINECOUNT     = _LINENUM

  //LINECOUNT = 1
  //PIXELCOUNT = 1000
  PIXELCOUNT    = _AMPREADCOLS
RAWENABLE     = _RAW_ENABLE
RAWENDLINE    = _RAW_ENDLINE
RAWSAMPLES    = _RAW_SAMPLES
  //RAWSEL        = _RAW_SELECT
RAWSEL        = 47
RAWSTARTLINE  = _RAW_STARTLINE
RAWSTARTPIXEL = _RAW_STARTPIXEL
SAMPLEMODE    = _ARCHON_SAMPLE_MODE
SHP1          = _FIRST_RESET_SAMPLE
SHP2          = _LAST_RESET_SAMPLE
SHD1          = _FIRST_VIDEO_SAMPLE
SHD2          = _LAST_VIDEO_SAMPLE

  //ADM module installed in slot 7
#define SINGLE_DET_TEST 1

  // NOTE tghere is a re-mapping due to the cameralink cable,
  // that is not accounted for by the current DEIMOS VIB.
  // currently, SCI 2E channel is connected to FCS L1 (which will be channel 9 in the ADM card, tap channel 45)
  // raw channel selection 49
  // SCI 2F channel is connected to SCI 4f (which will be channel 8 in the ADM card, tap channel 44)
  // note this should also be inverted in principle, not sure if that's actually ahppenbing TBD
  // raw channel selection 48

  

#if SINGLE_DET_TEST
TAPLINE0      ="AM45L,1,100"
TAPLINE1      ="AM44R,-1,100"
TAPLINES=2
#else
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
