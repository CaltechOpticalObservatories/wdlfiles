
#define temp 1

SLOT 1 driverx {
  DRVX  1 [temp,1,1];
  DRVX  2 [temp,1,1];
  DRVX  3 [temp,1,1];
  DRVX  4 [temp,1,1];
  DRVX  5 [temp,1,1];
  DRVX  6 [temp,1,1];
  DRVX  7 [temp,1,1];
  DRVX  8 [temp,1,1];
  DRVX  9 [temp,1,1];
  DRVX 10 [temp,1,1];
  DRVX 11 [temp,1,1];
  DRVX 12 [temp,1,1];
}
SLOT 2 driverx {
  DRVX  1 [temp,1,1];
  DRVX  2 [temp,1,1];
  DRVX  3 [temp,1,1];
  DRVX  4 [temp,1,1];
  DRVX  5 [temp,1,1];
  DRVX  6 [temp,1,1];
  DRVX  7 [temp,1,1];
  DRVX  8 [temp,1,1];
  DRVX  9 [temp,1,1];
  DRVX 10 [temp,1,1];
  DRVX 11 [temp,1,1];
  DRVX 12 [temp,1,1];
}
SLOT 3 driverx {
  DRVX  1 [temp,1,1];
  DRVX  2 [temp,1,1];
  DRVX  3 [temp,1,1];
  DRVX  4 [temp,1,1];
  DRVX  5 [temp,1,1];
  DRVX  6 [temp,1,1];
  DRVX  7 [temp,1,1];
  DRVX  8 [temp,1,1];
  DRVX  9 [temp,1,1];
  DRVX 10 [temp,1,1];
  DRVX 11 [temp,1,1];
  DRVX 12 [temp,1,1];
}
SLOT 4 xvbias {
  XVLC 1 [temp,1,1];
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
  HVLC 1 [0,0];             /* Unused */
  HVLC 2 [0,0];             /* Guard Drain     Science */
  HVLC 3 [3.0,0];           /* Reset Drain    E   Science */
  HVLC 4 [12.0,0];          /* Reset Drain    F   Science */
  HVLC 5 [19,0];            /*  */
  HVLC 6 [19,0];            /* Reset Drain    A 1 FCS */
  HVLC 7 [19,0];            /* Reset Drain    B 1 FCS */
  HVLC 8 [29,0];            /* Reset Drain    A 2 FCS */
  HVLC 9 [3.5,0];           /* Reset Drain    B 2 FCS */
  HVLC 10 [0,0];            /* Overflow Drain     FCS */
  HVLC 11 [19,0];           /*  */
  HVLC 12 [30,0];           /*  */
  HVLC 13 [15,0];           /*  */
  HVLC 14 [15,0];           /*  */
  HVLC 15 [1,0];            /*  */
  HVLC 16 [24,0];           /*  */
  HVLC 17 [15,0];           /*  */
  HVLC 18 [1,0];            /*  */
  HVLC 19 [24,0];           /*  */
  HVLC 20 [15,0];           /*  */
  HVLC 21 [24,0];           /*  */
  HVLC 22 [24,0];           /*  */
  HVLC 23 [24,0];           /*  */
  HVLC 24 [15,0];           /*  */
  HVLC 25 [15,0];           /* Output Drain   E   SCI */
  HVLC 26 [15,0];           /* Output Drain   F   SCI */
  HVLC 27 [15,0];           /* Output Drain   A 1 FCS */
  HVLC 28 [15,0];           /* Output Drain   B 1 FCS */
  HVLC 29 [15,0];           /* Output Drain   A 2 FCS */
  HVLC 30 [15,0];           /* Output Drain   B 2 FCS */
}


SLOT 10 lvbias {
  HVLC 1 [0,0]; /* Unused */
    
}

SLOT 12 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}
