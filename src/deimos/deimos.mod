
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
  DRVX 1 [temp,1,1];
  DRVX 2 [temp,1,1];
  DRVX 3 [temp,1,1];
  DRVX 4 [temp,1,1];
  DRVX 5 [temp,1,1];
  DRVX 6 [temp,1,1];
  DRVX 7 [temp,1,1];
  DRVX 8 [temp,1,1];
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
  HVLC 1 [0,0]; /* Unused */
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
