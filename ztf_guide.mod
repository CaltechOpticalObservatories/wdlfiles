/* -*- C -*- */
#define	Iphi_slew_fast	100
#define Iphi_slew_slow	1
#define Rphi_slew_fast	500
#define Rphi_slew_slow	12
#define TG_slew_fast	500
#define TG_slew_slow	100
#define SW_slew_fast	500
#define SW_slew_slow	3


SLOT 3 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}


SLOT 4 driver {
  DRV 1 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 2 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 3 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 4 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 5 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 6 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 7 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 8 [Iphi_slew_fast,Iphi_slew_slow,1];
}

SLOT 5 ad {
  CLAMP 1 = 1.1;
  CLAMP 2 = 1.1;
  CLAMP 3 = 1.1;
  CLAMP 4 = 1.1;
  PREAMPGAIN = low;
}

SLOT 6 ad {
  CLAMP 1 = 1.1;
  CLAMP 2 = 1.1;
  CLAMP 3 = 1.1;
  CLAMP 4 = 1.1;
  PREAMPGAIN = low;
}

SLOT 9 hvbias {
  HVLC 1 [15,0];            /* RD Focus 2 UL         15V Nom */
  HVLC 2 [15,0];            /* RD Focus 2 UR         15V Nom */
  HVLC 3 [15,0];            /* RD Focus 2 BL         15V Nom */
  HVLC 4 [15,0];            /* RD Focus 3 BR         15V Nom */
  HVLC 5 [15,0];            /* RD Focus 1 UL         15V Nom */
  HVLC 6 [15,0];            /* RD Focus 1 UR         15V Nom */
  HVLC 7 [15,0];            /* RD Focus 1 BL         15V Nom */
  HVLC 8 [15,0];            /* RD Focus 1 BR         15V Nom */
  HVLC 9 [1,0];             /* OTG Focus 2           -1V Nom, use 0V  */
  HVLC 10 [0,0];            /* HVB - extra high voltage */
  HVLC 11 [0,0];            /* HVA - extra high voltage */
  HVLC 12 [1,0];            /* OTG Focus 1           -1V Nom, use 0V */
  HVLC 13 [1,0];            /* OTG Focus 3           -1V Nom, use 0V */
  HVLC 14 [1,0];            /* OTG Guider 4          -1V Nom, use 0V */
  HVLC 15 [15,0];           /* RD Focus 3 BR         15V Nom */
  HVLC 16 [15,0];           /* RD Focus 3 BL         15V Nom */
  HVLC 17 [15,0];           /* RD Focus 3 UR         15V Nom */
  HVLC 18 [15,0];           /* RD Focus 3 UL         15V Nom */
  HVLC 19 [15,0];           /* RD Focus 4 BR         15V Nom */
  HVLC 20 [15,0];           /* RD Focus 4 BL         15V Nom */
  HVLC 21 [15,0];           /* RD Focus 4 UL         15V Nom */
  HVLC 22 [15,0];           /* RD Focus 4 UR         15V Nom */
  HVLC 23 [24,0];           /* HV_XTRA - extra high voltage */
  HVLC 24 [24,1];            /* VBB Control            0V Nom, starts out HV off */
  HVHC  1 [15,100,0,1];      /* Scupper Voltage 1 and 2    26 */
  HVHC  2 [24,100,0,1];     /* Output Drain Focus 2       27 */
  HVHC  3 [24,100,0,1];     /* Output Drain Focus 1       28 */
  HVHC  4 [24,100,0,1];     /* Output Drain Focus 3       29 */
  HVHC  5 [24,100,0,1];     /* Output Drain Guider 4      30 */
  HVHC  6 [15,100,0,1];      /* Scupper Voltage 3 and 4    31 */
}

SLOT 10 driver {
  DRV 1 [Rphi_slew_fast, Rphi_slew_slow, 1]; /*Serial*/
  DRV 2 [TG_slew_fast, TG_slew_slow, 1]; /*Reset Gate*/
  DRV 3 [Rphi_slew_fast, Rphi_slew_slow, 1]; /*Serial*/
  DRV 4 [SW_slew_fast, SW_slew_slow, 1]; /*SW*/
  DRV 5 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 6 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 7 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 8 [Rphi_slew_fast, Rphi_slew_slow, 1];
}

SLOT 11 driver {
  DRV 1 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 2 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 3 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 4 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 5 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 6 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 7 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 8 [Iphi_slew_fast, Iphi_slew_slow, 1];
}

