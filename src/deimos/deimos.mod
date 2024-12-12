
#define temp 1

SLOT 1 drvr {
  DRV  1 [temp,1,1];
  DRV  2 [temp,1,1];
  DRV  3 [temp,1,1];
  DRV  4 [temp,1,1];
  DRV  5 [temp,1,1];
  DRV  6 [temp,1,1];
  DRV  7 [temp,1,1];
  DRV  8 [temp,1,1];
  DRV  9 [temp,1,1];
  DRV 10 [temp,1,1];
  DRV 11 [temp,1,1];
  DRV 12 [temp,1,1];
}
SLOT 2 drvr {
  DRV  1 [temp,1,1];
  DRV  2 [temp,1,1];
  DRV  3 [temp,1,1];
  DRV  4 [temp,1,1];
  DRV  5 [temp,1,1];
  DRV  6 [temp,1,1];
  DRV  7 [temp,1,1];
  DRV  8 [temp,1,1];
  DRV  9 [temp,1,1];
  DRV 10 [temp,1,1];
  DRV 11 [temp,1,1];
  DRV 12 [temp,1,1];
}
SLOT 3 drvr {
  DRV  1 [temp,1,1];
  DRV  2 [temp,1,1];
  DRV  3 [temp,1,1];
  DRV  4 [temp,1,1];
  DRV  5 [temp,1,1];
  DRV  6 [temp,1,1];
  DRV  7 [temp,1,1];
  DRV  8 [temp,1,1];
  DRV  9 [temp,1,1];
  DRV 10 [temp,1,1];
  DRV 11 [temp,1,1];
  DRV 12 [temp,1,1];
}
SLOT 4 xvbias {
  DRV 1 [temp,1,1];
  DRV 2 [temp,1,1];
  DRV 3 [temp,1,1];
  DRV 4 [temp,1,1];
  DRV 5 [temp,1,1];
  DRV 6 [temp,1,1];
  DRV 7 [temp,1,1];
  DRV 8 [temp,1,1];
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


Slot 10 lvbias {
  HVLC 1 [0,0]; /* Unused */
    
}

Slot 12 lvds {
  DIO  7 [0,0];
  DIO  8 [0,0];
  DIO 12 [0,0];
  DIO 15 [0,0];
  DIO 16 [0,0];
}
