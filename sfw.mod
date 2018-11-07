/** -*- C -*- **/

#define	Iphi_slew_fast	10
#define Iphi_slew_slow	1
#define Rphi_slew_fast	500
#define Rphi_slew_slow	1
#define TG_slew_fast	500
#define TG_slew_slow	100
#define SW_slew_fast	500
#define SW_slew_slow	100

SLOT 3 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}

SLOT 4 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 5 [SW_slew_fast,SW_slew_slow,1];
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 7 [TG_slew_fast,TG_slew_slow,1];
  DRV 8 [Rphi_slew_fast,Rphi_slew_slow,1];
}

SLOT 5 ad {
  CLAMP 1 = 1.0;
  CLAMP 2 = 1.0;
  CLAMP 3 = 1.0;
  CLAMP 4 = 1.0;
  PREAMPGAIN = low;
}

SLOT 6 ad {
  CLAMP 1 = 1.0;
  CLAMP 2 = 1.0;
  CLAMP 3 = 1.0;
  CLAMP 4 = 1.0;
  PREAMPGAIN = low;
}

SLOT 7 ad {
  CLAMP 1 = 1.0;
  CLAMP 2 = 1.0;
  CLAMP 3 = 1.0;
  CLAMP 4 = 1.0;
  PREAMPGAIN = low;
}

SLOT 8 ad {
  CLAMP 1 = 1.0;
  CLAMP 2 = 1.0;
  CLAMP 3 = 1.0;
  CLAMP 4 = 1.0;
  PREAMPGAIN = low;
}

SLOT 9 hvbias {
  HVLC 1  [18,0]; /* Reset Drain 4 G */
  HVLC 2  [18,0]; /* Reset Drain 4 F */
  HVLC 3  [18,0]; /* Reset Drain 4 E */
  HVLC 4  [18,0]; /* Reset Drain 3 H */
  HVLC 5  [18,0]; /* Reset Drain 3 G */
  HVLC 6  [18,0]; /* Reset Drain 3 F */
  HVLC 7  [18,0]; /* Reset Drain 3 E */
  HVLC 8  [18,0]; /* Reset Drain 2 H */
  HVLC 9  [18,0]; /* Reset Drain 2 G */
  HVLC 10 [18,0]; /* Reset Drain 1 H */
  HVLC 11 [18,0]; /* Reset Drain 2 E */
  HVLC 12 [18,0]; /* Reset Drain 2 F */
  HVLC 13 [18,0]; /* Reset Drain 4 H */
  HVLC 14 [2.5,0];/* Output Gate CCD1 */
  HVLC 15 [2.5,0];/* Output Gate CCD2 */
  HVLC 16 [2.5,0];/* Output Gate CCD3 */
  HVLC 17 [2.5,0];/* Output Gate CCD4 */
  HVLC 18 [25,0]; /* Dump Drain CCD1, CCD2 */  /* Note: relative to _PAR_CLOCK_LOW */
  HVLC 19 [18,0]; /* Reset Drain 1 E */
  HVLC 20 [25,0]; /* Dump Drain CCD3, CCD4 */  /* Note: relative to _PAR_CLOCK_LOW */
  HVLC 21 [18,0]; /* Reset Drain 1 F */
  HVLC 22 [0,0];  /* Dump Gate CCD3, CCD4 */
  HVLC 23 [18,0]; /* Reset Drain 1 G */
  HVLC 24 [0,0];  /* Dump Drain CCD1, CCD2 */
  HVHC  1 [5,100,0,1]; /* Reset Gate Low  */
  HVHC  2 [12,100,0,1];/* Reset Gate High */
  HVHC  3 [30,100,0,1];/* Output Drain CCD4 */
  HVHC  4 [30,100,0,1];/* Output Drain CCD1 */
  HVHC  5 [30,100,0,1];/* Output Drain CCD2 */
  HVHC  6 [30,100,0,1];/* Output Drain CCD3 */
}

SLOT 10 driver {
  DRV 1 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 2 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 3 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 4 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 5 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 6 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 7 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 8 [Iphi_slew_fast,Iphi_slew_slow,1];
}

SLOT 11 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 5 [SW_slew_fast,SW_slew_slow,1];
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 7 [TG_slew_fast,TG_slew_slow,1];
  DRV 8 [Rphi_slew_fast,Rphi_slew_slow,1];
}

