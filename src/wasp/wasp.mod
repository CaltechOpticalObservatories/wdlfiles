#include wasp.def


#define	Iphi_slew_fast	10
#define Iphi_slew_slow	1
#define Rphi_slew_fast	#eval (12*3*100)/PixelT + 30  /*500*/ /* 500 was too fast */
#define Rphi_slew_slow	#eval (12*3*100)/PixelT /*35*/ /* 12V/340ns = 35 V/us */

#define TG_slew_fast	500
#define TG_slew_slow	100
#define SW_slew_fast	500
#define SW_slew_slow	#eval (100*12)/(PixelT/2 + PixelT/6) + 3 /*20*/ /*100*/ /*20*/

SLOT 2 driver {
  DRV 1 [Iphi_slew_fast,1,1];
  DRV 2 [Iphi_slew_fast,1,1];
  DRV 3 [Iphi_slew_fast,1,1];
  DRV 4 [Iphi_slew_fast,1,1];
  DRV 5 [Iphi_slew_fast,1,1];
  DRV 6 [Iphi_slew_fast,1,1];
  DRV 7 [Iphi_slew_fast,1,1];
  DRV 8 [Iphi_slew_fast,1,1];
}

SLOT 3 driver {
  DRV 1 [500,1,1];
  DRV 2 [800,1,1];
  DRV 3 [100,1,1];
  DRV 4 [100,1,1];
  DRV 5 [Iphi_slew_fast,1,1];
  DRV 6 [Iphi_slew_fast,1,1];
  DRV 7 [Iphi_slew_fast,1,1];
  DRV 8 [Iphi_slew_fast,1,1];
}

SLOT 4 driver {
  DRV 1 [100,10,1];
  DRV 2 [100,10,1];
  DRV 3 [100,10,1];
  DRV 4 [100,10,1];
  DRV 5 [100,10,1];
  DRV 6 [100,10,1];
  DRV 7 [100,10,1];
  DRV 8 [100,10,1];
}

SLOT 5 ad {
  CLAMP 1 = 0;
  CLAMP 2 = 0;
  CLAMP 3 = 1.5;
  CLAMP 4 = 1.5;
  PREAMPGAIN = low;
}

SLOT 6 ad {
  CLAMP 1 = 1.9;
  CLAMP 2 = 1.9;
  CLAMP 3 = 1.9;
  CLAMP 4 = 1.9;
  PREAMPGAIN = low;
}
 /*Update made for the new VIB*/
SLOT 8 hvbias {
  HVLC 1 [0,0];             /* Unused */
  HVLC 2 [0,0];             /* Science Dump Gate */
  HVLC 3 [3.0,0];           /* Science Reset Gate Low */
  HVLC 4 [12.0,0];          /* Science Reset Gate High */
  HVLC 5 [19,0];            /* Science Reset Drain (F) */
  HVLC 6 [19,0];            /* Science Reset Drain (E) */
  HVLC 7 [19,0];            /* Science Reset Drain (H) */
  HVLC 8 [29,0];            /* Science Dump Drain */
  HVLC 9 [3.5,0];           /* Science Output Gate (E,F,G,H) */
  HVLC 10 [0,0];            /* Substrate */
  HVLC 11 [19,0];           /* Reset Drain (G) */
  HVLC 12 [30,0];          /*Unused*/ /* Before: Output Drain, Dummy Output Drain (E,F,G,H) */
  HVLC 13 [15,0];           /* Guider Reset Drain (BL) */
  HVLC 14 [15,0];           /* Guider Reset Drain (BR) */
  HVLC 15 [1,0];          /*Unused*/ /* Before: Guider Output Gate (BR, BL) */
  HVLC 16 [24,0];         /* Guider Output Drain (UR, BR) */
  HVLC 17 [15,0];           /* Guider Reset Drain (UR) */
  HVLC 18 [1,0];          /*Unused *//*Before: Guider Output Gate (UR, UL) */
  HVLC 19 [24,0];           /* Guider Scupper (UR) */
  HVLC 20 [15,0];           /* Guider Reset Drain (UL) */
  HVLC 21 [24,0];           /* Guider Output Drain (UL, BL) */
  HVLC 22 [24,0];           /* Focus Output Drain (UR, BR) */
  HVLC 23 [24,0];           /* Focus Output Drain (UL, BL) */
  HVLC 24 [15,0];           /* Focus Reset Drain (UL) */
  HVHC  1 [15,100,0,1];     /* Focus Reset Drain (BR)     25 */
  HVHC  2 [15,100,0,1];     /* Focus Reset Drain (BL)     26 */
  HVHC  3 [30,100,0,1];    /*Science Output Drain*/ /*Before: Focus Output Gate (BR, BL) 27 */
  HVHC  4 [26,100,0,1];     /* Focus Scupper              28 */
  HVHC  5 [1,100,0,1];    /*Unused*/ /*Before:  Focus Output Gate (UR, UL  29 */
  HVHC  6 [15,100,0,1];     /* Focus Reset Drain (UR)     30 */
}

SLOT 9 driver {
  DRV 1 [TG_slew_fast, TG_slew_slow, 1];
  DRV 2 [SW_slew_fast, SW_slew_slow, 1];
  DRV 3 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 4 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 5 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 6 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 7 [Rphi_slew_fast, Rphi_slew_slow, 1];
  DRV 8 [Rphi_slew_fast, Rphi_slew_slow, 1];
}

SLOT 10 driver {
  DRV 1 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 2 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 3 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 4 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 5 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 6 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 7 [Iphi_slew_fast, Iphi_slew_slow, 1];
  DRV 8 [Iphi_slew_fast, Iphi_slew_slow, 1];
}

SLOT 11 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}
