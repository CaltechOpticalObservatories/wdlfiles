/** -*- C -*- **/
#include zztf_science.def


#define	Iphi_slew_fast	100
#define Iphi_slew_slow	0.018 /*0.025*/ /* 10*/  /*10*/
/*#define Rphi_slew_fast	500 /* default value on 20170630 */
/*#define Rphi_slew_slow	450 /* per experiments of 20170630 */
#define Rphi_slew_fast	#eval (14*3*100)/PixelT + 30 /*500*/ /* 500 was too fast */
#define Rphi_slew_slow	#eval (14*3*100)/PixelT /*35*/ /* 12V/340ns = 35 V/us */
#define TG_slew_fast	500
#define TG_slew_slow	100
#define SW_slew_fast	500 /*40*/ /* 500 was too fast changed on 07/07/2017 */
#define SW_slew_slow	#eval (100*12)/(PixelT/2 + PixelT/6) + 3 /*20*/ /*100*/ /*20*/

#define OutputDrain     31 /*30.5*/

#define OutputGate      1.5 /*2.5*/ /*2.5*/

#define ResetDrain      18.5
#define Brown           19
#define Green           18.5
#define Redplus         18.25
#define Red             18

#define ResetGateLow    3 /*5*/
#define ResetGateHi     14
/*#include ztf_science.def*/

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
  CLAMP 1 = 1.9;
  CLAMP 2 = 1.9;
  CLAMP 3 = 1.9;
  CLAMP 4 = 1.9;
  PREAMPGAIN = low;
}

SLOT 6 ad {
  CLAMP 1 = 1.9;
  CLAMP 2 = 1.9;
  CLAMP 3 = 1.9;
  CLAMP 4 = 1.9;
  PREAMPGAIN = low;
}

SLOT 7 ad {
  CLAMP 1 = 1.9;
  CLAMP 2 = 1.9;
  CLAMP 3 = 1.9;
  CLAMP 4 = 1.9;
  PREAMPGAIN = low;
}

SLOT 8 ad {
  CLAMP 1 = 1.9;
  CLAMP 2 = 1.9;
  CLAMP 3 = 1.9;
  CLAMP 4 = 1.9;
  PREAMPGAIN = low;
}

SLOT 9 hvbias {
  HVLC 6  [19.0,0]; /* Reset Drain 3 F */
  HVLC 7  [19.0,0]; /* Reset Drain 3 E */
  HVLC 4  [19.0,0]; /* Reset Drain 3 H */
  HVLC 5  [19.0,0]; /* Reset Drain 3 G */
  HVLC 21 [19.0,0]; /* Reset Drain 1 F */
  HVLC 19 [19.0,0]; /* Reset Drain 1 E */
  HVLC 10 [19.0,0]; /* Reset Drain 1 H */
  HVLC 23 [19.0,0]; /* Reset Drain 1 G */
  HVLC 2  [19.0,0]; /* Reset Drain 4 F */
  HVLC 3  [19.0,0]; /* Reset Drain 4 E */
  HVLC 13 [19.0,0]; /* Reset Drain 4 H */
  HVLC 1  [19.0,0]; /* Reset Drain 4 G */
  HVLC 12 [19.3,0]; /* Reset Drain 2 F */
  HVLC 11 [19.0,0]; /* Reset Drain 2 E */
  HVLC 8  [19.2,0]; /* Reset Drain 2 H */
  HVLC 9  [19.0,0]; /* Reset Drain 2 G */
  HVLC 14 [OutputGate,0];/* Output Gate CCD1 */
  HVLC 15 [OutputGate,0];/* Output Gate CCD2 */
  HVLC 16 [OutputGate,0];/* Output Gate CCD3 */
  HVLC 17 [OutputGate,0];/* Output Gate CCD4 */
  HVLC 18 [25,0]; /* Dump Drain CCD1, CCD2 */  /* Note: relative to _PAR_CLOCK_LOW */
  HVLC 20 [25,0]; /* Dump Drain CCD3, CCD4 */  /* Note: relative to _PAR_CLOCK_LOW */

  HVLC 22 [0,0];  /* Dump Gate CCD3, CCD4 */
  HVLC 24 [0,0];  /* Dump Gate CCD1, CCD2 */
  HVHC  1 [ResetGateLow,100,0,1]; /* Reset Gate Low  */
  HVHC  2 [ResetGateHi ,100,0,1];/* Reset Gate High */
  HVHC  3 [OutputDrain,100,0,1];/* Output Drain CCD4 */
  HVHC  4 [OutputDrain,100,0,1];/* Output Drain CCD1 */
  HVHC  5 [OutputDrain,100,0,1];/* Output Drain CCD2 */
  HVHC  6 [OutputDrain,100,0,1];/* Output Drain CCD3 */
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

