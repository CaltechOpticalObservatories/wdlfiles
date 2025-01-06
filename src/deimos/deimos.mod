
#define temp 1

/* Fast and Slow slew rates are defined here */
/* A boolean is set during a SET..TO command */
/* to select between fast and slow slew rate */

#define SCLK_fast 500 /* Evaluate Expression  */
#define SCLK_slow 100 /* Evaluate Expression  */
#define PCLK_fast 10
#define PCLK_slow 1
#define SW_fast   500 /* Evaluate Expression  */
#define SW_slow   100 /* Evaluate Expression  */
#define TG_fast   500 /* Evaluate Expression? */
#define TG_slow   100 /* Evaluate Expression? */

SLOT 1 driverx {
  DRVX  1 [PCLK_fast,PCLK_slow,1];
  DRVX  2 [PCLK_fast,PCLK_slow,1];
  DRVX  3 [PCLK_fast,PCLK_slow,1];
  DRVX  4 [PCLK_fast,PCLK_slow,1];
  DRVX  5 [PCLK_fast,PCLK_slow,1];
  DRVX  6 [PCLK_fast,PCLK_slow,1];
  DRVX  7 [PCLK_fast,PCLK_slow,1];
  DRVX  8 [PCLK_fast,PCLK_slow,1];
  DRVX  9 [PCLK_fast,PCLK_slow,1];
  DRVX 10 [PCLK_fast,PCLK_slow,1];
  DRVX 11 [PCLK_fast,PCLK_slow,1];
  DRVX 12 [PCLK_fast,PCLK_slow,1];
}
SLOT 2 driverx {
  DRVX  1 [TG_fast,TG_slow,1];
  DRVX  2 [SCLK_fast,SCLK_slow,1];
  DRVX  3 [SCLK_fast,SCLK_slow,1];
  DRVX  4 [SCLK_fast,SCLK_slow,1];
  DRVX  5 [SCLK_fast,SCLK_slow,1];
  DRVX  6 [SCLK_fast,SCLK_slow,1];
  DRVX  7 [1,1,0];
  DRVX  8 [1,1,0];
  DRVX  9 [1,1,0];
  DRVX 10 [1,1,0];
  DRVX 11 [1,1,0];
  DRVX 12 [1,1,0];
}
SLOT 3 driverx {
  DRVX  1 [1,1,0];
  DRVX  2 [1,1,0];
  DRVX  3 [1,1,0];
  DRVX  4 [1,1,0];
  DRVX  5 [1,1,0];
  DRVX  6 [1,1,0];
  DRVX  7 [1,1,0];
  DRVX  8 [1,1,0];
  DRVX  9 [1,1,0];
  DRVX 10 [1,1,0];
  DRVX 11 [1,1,0];
  DRVX 12 [1,1,0];
}
SLOT 4 xvbias {
  PBIAS 1 [0,0];
  PBIAS 2 [0,0];
  PBIAS 3 [0,0];
  PBIAS 4 [0,0];  
  NBIAS 1 [0,-100] "SCI Backside ";
  NBIAS 2 [0,0];
  NBIAS 3 [0,0];
  NBIAS 4 [0,0];
}
/* review */
SLOT 7 ad {
  CLAMP 1 = 0;
  CLAMP 2 = 0;
  CLAMP 3 = 1.5;
  CLAMP 4 = 1.5;
  PREAMPGAIN = low;
}

SLOT 9 hvbias {
  HVLC  1 [0.00,0];                             /* Unused */
  HVLC  2 [20.0,0] "SCI Guard Drain"  ;         /* Guard Drain        SCI */
  HVLC  3 [0.00,0];                             /* Unused */
  HVLC  4 [0.00,0];                             /* Unused */
  HVLC  5 [17.0,0] "SCI E Reset Drain";         /* Reset Drain    E   SCI */
  HVLC  6 [17.0,0] "SCI F Reset Drain";         /* Reset Drain    F   SCI */
  HVLC  7 [0.00,0];                             /* Unused */
  HVLC  8 [0.00,0];                             /* Reset Drain    A 1 FCS */
  HVLC  9 [0.00,0];                             /* Reset Drain    B 1 FCS */
  HVLC 10 [0.00,0];                             /* Reset Drain    A 2 FCS */
  HVLC 11 [0.00,0];                             /* Reset Drain    B 2 FCS */
  HVLC 12 [0.00,0];                             /* Overflow Drain     FCS */
  HVLC 13 [0.00,0];                             /*  */
  HVLC 14 [0.00,0];                             /*  */
  HVLC 15 [0.00,0];                             /*  */
  HVLC 16 [0.00,0];                             /*  */
  HVLC 17 [0.00,0];                             /*  */
  HVLC 18 [0.00,0];                             /*  */
  HVLC 19 [0.00,0];                             /*  */
  HVLC 20 [0.00,0];                             /*  */
  HVLC 21 [0.00,0];                             /*  */
  HVLC 22 [0.00,0];                             /*  */
  HVLC 23 [0.00,0];                             /*  */
  HVLC 24 [0.00,0];                             /*  */
  HVHC  1 [29.0,0.1,0,1] "SCI E Output Drain "; /* Output Drain   E   SCI */
  HVHC  2 [29.0,0.1,0,1] "SCI F Output Drain "; /* Output Drain   F   SCI */
  HVHC  3 [0.00,0.1,0,0];                       /* Output Drain   A 1 FCS */
  HVHC  4 [0.00,0.1,0,0];                       /* Output Drain   B 1 FCS */
  HVHC  5 [0.00,0.1,0,0];                       /* Output Drain   A 2 FCS */
  HVHC  6 [0.00,0.1,0,0];                       /* Output Drain   B 2 FCS */
}


SLOT 10 lvbias {
  LVLC  1 [0.00,0];                             /* Unused */
  LVLC  2 [20.0,0];                             /* Unused */
  LVLC  3 [3.00,0] "SCI E Output Gate";         /* SCI E Output Gate */
  LVLC  4 [3.00,0] "SCI F Output Gate";         /* SCI F Output Gate */
  LVLC  5 [1.00,0] "SCI Summing Well - Low";    /* SCI Summing Well - Low  */
  LVLC  6 [12.0,0] "SCI Summing Well - High";   /* SCI Summing Well - High */
  LVLC  7 [1.00,0] "SCI Reset Gate - Low";      /* SCI Reset Gate - Low    */
  LVLC  8 [12.0,0] "SCI Reset Gate - High";     /* SCI Reset Gate - High    */
  LVLC  9 [0.00,0];                             /* Unused */
  LVLC 10 [0.00,0];                             /* FCS A 1 Last Gate */
  LVLC 11 [0.00,0];                             /* FCS B 1 Last Gate */
  LVLC 12 [0.00,0];                             /* FCS A 2 Last Gate */
  LVLC 13 [0.00,0];                             /* FCS B 2 Last Gate */
  LVLC 14 [0.00,0];                             /* Unused  */
  LVLC 15 [0.00,0];                             /* FCS Summing Well - Low */
  LVLC 16 [0.00,0];                             /* FCS Summing Well - High */
  LVLC 17 [0.00,0];                             /* Unused */
  LVLC 18 [0.00,0];                             /* FCS Reset Gate - Low */
  LVLC 19 [0.00,0];                             /* FCS Reset Gate - High */
  LVLC 20 [0.00,0];                             /* Unused */
  LVLC 21 [0.00,0];                             /* Unused */
  LVLC 22 [0.00,0];                             /* FCS Video Offset */
  LVLC 23 [0.00,0];                             /* SCI Video Offset */
  LVLC 24 [0.00,0];                             /*  */
  LVHC  1 [0.00,0.0,0,0];                       /*  */
  LVHC  2 [0.00,0.0,0,0];                       /*  */
  LVHC  3 [0.00,0.0,0,0];                       /*  */
  LVHC  4 [0.00,0.0,0,0];                       /*  */
  LVHC  5 [0.00,0.0,0,0];                       /*  */
  LVHC  6 [0.00,0.0,0,0];                       /*  */
}

SLOT 12 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}
