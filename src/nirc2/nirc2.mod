#include nirc2.def


/* Nominal values for the biases */
#define VDDCL     -2.0  /* SWITCHED BIAS Drain clamp voltage for the column circuitery  */
#define VGGCL      0.0     /* SWITCHED BIAS Gate of Clamp MOSFET
#define VRSTOFF    2.2  /* SWITCHED BIAS Global Row Reset bias       */
#define VRSTON     2.2  /*             */

#define VROWOFF    0.0     /* Voltage supplied to the row-enable transistors when a row is not selected. Nominal bias is 0.0V  */
#define VROWON    -6.0     /* Voltage supplied to the row-enable transistors when a row is enabled. Nominal bias is -6.0V  */
#define VPROW      0.0     /* Positive digital bias supply for the slow register and decoder */
#define VNROW     -6.0     /* Negative digital bias supply for the slow register and decoder */
#define VPCOL      0.0     /* Positive digital bias supply for the fast register and decoder */
#define VNCOL     -6.0     /* Negative digital bias supply for the fast register and decoder */

#define VDDOUT    -1.5  /* Drain voltage of the PMOS output SF */
#define VDETCOM   -3.4  /* Detector Common Bias. Connected to InSB n-type   */
#define VSSUC      0.0  /* Analog source supply of the current mirror       */
#define VDDUC     -4.0  /*  */

#define TendBias1     1.0  /* Source voltage of the external load of the SF */
#define TendBias2     1.0  /* Source voltage of the external load of the SF */
#define VSSOUT1     1.0  /* Source voltage of the external load of the SF */
#define VSSOUT2     1.0  /* Source voltage of the external load of the SF */
#define VSSOUT3     1.0  /* Source voltage of the external load of the SF */
#define VSSOUT4     1.0  /* Source voltage of the external load of the SF */

#define VSPARE     0.0

SLOT 10 lvbias {
  LVLC 1  [VSPARE,1];           /*               */
  LVLC 2  [VSPARE,1];           /*            */
  LVLC 3  [VSPARE,1];           /*               */
  LVLC 4  [VSPARE,1];           /*                    */
  LVLC 5  [VSPARE,1];           /*                    */
  LVLC 6  [VSPARE,1];           /*                    */
  LVLC 7  [VSPARE,1];           /* Spare              */
  LVLC 8  [VSPARE,1];        /* Spare                  */
  LVLC 9  [VSPARE,1];        /* Spare                  */
  LVLC 10 [VSPARE,1];        /* Spare                  */
  LVLC 11 [VSPARE,1];        /* Spare                  */
  LVLC 12 [VSPARE,1];        /* Spare                  */
  LVLC 13 [VSPARE,1];        /* Spare                  */
  LVLC 14 [VSPARE,1];        /* Spare                  */
  LVLC 15 [VSPARE,1];        /* Spare                  */
  LVLC 16 [VSPARE,1];        /* Spare                  */
  LVLC 17 [VSPARE,1];        /* Spare                  */
  LVLC 18 [VSPARE,1];        /* Spare                  */
  LVLC 19 [VSPARE,1];        /* Spare                  */
  LVLC 20 [VSPARE,1];        /* Spare                  */
  LVLC 21 [VSPARE,1];        /* Spare                  */
  LVLC 22 [VSPARE,1];        /* Spare                  */
  LVLC 23 [VSPARE,1];        /* Spare                  */
  LVLC 24 [VSPARE,1];        /* Spare                  */
  LVHC  1 [VSPARE,10,1,1];   /* Spare                  */
  LVHC  2 [VSPARE,50,1,1];   /*           */
  LVHC  3 [VSPARE,10,1,1];   /* Spare                  */
  LVHC  4 [VSPARE,100,1,1];  /* )    */
  LVHC  5 [VSPARE,100,0,1];  /*                     */
  LVHC  6 [VSPARE,10,1,1];   /* Spare                  */
}

#define clock_fast 500
#define clock_slow 100

SLOT 4 driver {
  DRV 1 [clock_fast, clock_slow, 1] "FSYNC";
  DRV 2 [clock_fast, clock_slow, 1] "PhiF1";
  DRV 3 [clock_fast, clock_slow, 1] "PhiF2";
  DRV 4 [clock_fast, clock_slow, 1] "SSYNC";
  DRV 5 [clock_fast, clock_slow, 1] "PhiS1";
  DRV 6 [clock_fast, clock_slow, 1] "PhiS2";
  DRV 7 [clock_fast, clock_slow, 1] "PhiSOE";
  DRV 8 [clock_fast, clock_slow, 1] "";
}


SLOT 11 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}
