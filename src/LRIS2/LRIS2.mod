
//these to be redone with synchronous clocking

#define PCLK_FAST 100.0
#define PCLK_SLOW 0.5


SLOT 1  driverx {
  DRVX 1 [PCLK_FAST, PCLK_SLOW,1] "A3x";
  DRVX 2 [PCLK_FAST, PCLK_SLOW,1] "DGy";
  DRVX 3 [PCLK_FAST, PCLK_SLOW,1] "A2x";
  DRVX 4 [PCLK_FAST, PCLK_SLOW,1] "T1y";
  DRVX 5 [PCLK_FAST, PCLK_SLOW,1] "A1x";
  DRVX 6 [PCLK_FAST, PCLK_SLOW,1] "T2y";
  DRVX 7 [PCLK_FAST, PCLK_SLOW,1] "T2x";
  DRVX 8 [PCLK_FAST, PCLK_SLOW,1] "A1y";
  DRVX 9 [PCLK_FAST, PCLK_SLOW,1] "T1x";
  DRVX 10 [PCLK_FAST, PCLK_SLOW,1] "A2y";
  DRVX 11 [PCLK_FAST, PCLK_SLOW,1] "DGx";
  DRVX 12 [PCLK_FAST, PCLK_SLOW,1] "A3y";
     }

#define A1 [A1x, A1y]
#define A2 [A2x, A2y]
#define A3 [A3x, A3y]

#define T1 [T1x, T1y]
#define T2 [T2x, T2y]

#define DG [DGx, DGy]


#define SCLK_FAST 500.0
#define SCLK_SLOW 12.0

SLOT 2 driverx {
  DRVX 1 [SCLK_FAST, SCLK_SLOW, 1] "S3b";
  DRVX 2 [SCLK_FAST, SCLK_SLOW, 1] "S1c";
  DRVX 3 [SCLK_FAST, SCLK_SLOW, 1] "S2b";
  DRVX 4 [SCLK_FAST, SCLK_SLOW, 1] "S2c";
  DRVX 5 [SCLK_FAST, SCLK_SLOW, 1] "S1b";
  DRVX 6 [SCLK_FAST, SCLK_SLOW, 1] "S3c";
  DRVX 7 [SCLK_FAST, SCLK_SLOW, 1] "S3a";
  DRVX 8 [SCLK_FAST, SCLK_SLOW,1] "S1d";
  DRVX 9 [SCLK_FAST, SCLK_SLOW, 1] "S2a";
  DRVX 10 [SCLK_FAST, SCLK_SLOW, 1] "S2d";
  DRVX 11 [SCLK_FAST, SCLK_SLOW, 1] "S1a";
  DRVX 12 [SCLK_FAST, SCLK_SLOW, 1] "S3d";
}

#define S1 [S1a, S1b, S1c, S1d]
#define S2 [S2a, S2b, S2c, S2d]
#define S3 [S3a, S3b, S3c, S3d]


SLOT 3 driverx {
  DRVX 1 [1.0, 1.0, 0 ] "Spare1";
  DRVX 2 [1.0, 1.0, 0] "Spare2";
  DRVX 3 [1.0, 1.0, 0] "Spare3";
  DRVX 4 [500.0,1.0,1] "CLAMP";
  DRVX 5 [SCLK_FAST, SCLK_SLOW, 1] "RGd";
  DRVX 6 [SCLK_FAST, SCLK_SLOW, 1] "SWb";
  DRVX 7 [SCLK_FAST, SCLK_SLOW, 1] "SWd";
  DRVX 8  [SCLK_FAST, SCLK_SLOW, 1] "RGb";
  DRVX 9 [SCLK_FAST, SCLK_SLOW, 1] "SWc";
  DRVX 10 [SCLK_FAST, SCLK_SLOW, 1] "RGa";
  DRVX 11 [SCLK_FAST, SCLK_SLOW, 1] "RGc";
  DRVX 12 [SCLK_FAST, SCLK_SLOW, 1] "SWa";
}

#define RG [RGa, RGb, RGc, RGd]
#define SW [SWa, SWb, SWc, SWd]


//SLOT 4 empty

//SLOT 5 ADM no config

SLOT 6 AD {
  CLAMP1 = 0.0;
  CLAMP2 = 0.0;
  CLAMP3 = 0.0;
  CLAMP4 = 0.0;
  PREAMPGAIN = low;

}

// SLOT 7 empty
//SLOT 8 empty

#define VRD 15.0
#define VOD 24.0
#define VDD 20.0
#define VOTG -1.0

SLOT 9 HVXBias {
  HVLC 1 [VDD, 2] "Dump Drain x";
  HVLC 2 [VOD, 1] "Output Drain b";
  HVLC 3 [VRD, 1] "Reset Drain b";
  HVLC 4 [VOD, 1] "Output Drain a";
  HVLC 5 [VRD, 1] "Reset Drain a";
  HVLC 6 [VOTG, 3] "Output Gate a";
  HVLC 7 [VOTG, 3] "Output Gate d";
  HVLC 8 [VDD, 2] "Dump Drain y";
  HVLC 9 [VOD, 1] "Output Drain d";
  HVLC 10 [VRD, 1] "Reset Drain d";
  HVLC 11 [VOD, 1] "Output Drain c"
  HVLC 12 [VRD, 1] "Reset Drain c";
  HVLC 13 [0.0, 0] "NC";
  HVLC 14 [VOTG, 3] "Output Gate b";
  HVLC 15 [0.0, 0] "NC";
  HVLC 16 [0.0, 0] "NC";
  HVLC 17 [0.0, 0] "OFFSET a";
  HVLC 18 [0.0, 0] "OFFSET b";
  HVLC 19 [0.0, 0] "OFFSET c";
  HVLC 20 [0.0, 0] "OFFSET d";
  HVLC 21 [0.0, 0] "NC";
  HVLC 22 [0.0, 0], "NC";
  HVLC 23 [0.0, 0] "NC";
  HVLC 24 [0.0, 0] "NC";
  HVHC 1 [VOTG, 5.0,  3, 1] "Output Gate c";
  HVHC 2 [0.0, 0.0, 0, 0] "NC";
  HVHC 3 [5.0, 20.0, 0, 1] "+5V";
  HVHC 4 [0.0, 20.0, 0, 1] "should be -5V";
  HVHC 5 [0.0, 20.0, 0, 1] "should be -5V CCD";
  HVHC 6 [5.0, 20.0, 0, 1] "+5V CCD";
}

SLOT 10 xvbias {
  PBIAS 1 1 [0, 20.0] "Scupper Drain";
  PBIAS 2 0 [0, 0] ;
  PBIAS 3 0 [0, 0];
  PBIAS 4 0 [0,0];
  NBIAS 1 1 [0, -0] "Back Bias";
  NBIAS 2 0 [0, -0];
  NBIAS 3 0 [0, -0];
  NBIAS 4 0 [0, -0];
}

#define HTR_CTRL_LOOP_TIME_MS 2000

SLOT 11 heaterx {
  DIOPOWER=1;
  HEATERUPDATETIME=HTR_CTRL_LOOP_TIME_MS;
  
  //detector heater (enabled, target -110C)
  //Heater is 100 Ohm, 6.25W, 25V max (STA4850 datasheet)
  HEATERAENABLE=1;
  HEATERAFORCE=0;
  HEATERATARGET=-110;


  //getter heater (disabled by default, target 30 C for bakeout)
  HEATERBENABLE=0;
  HEATERBFORCE=0;
  HEATERBTARGET=30;


  //sensor A (detector on board)
  SENSORATYPE=4; //RTD1000

  //sensor B (getter cold plate)
  SENSORBTYPE=4; //RTD1000

  //sensor C (cryostat wall at cryocooler end)
  SENSORCTYPE=4; //RTD1000
  
}

SLOT 12 heaterx {
  DIOPOWER=1;
  HEATERUPDATETIME=HTR_CTRL_LOOP_TIME_MS;
  
  //heater A (cryocooler heater)
  HEATERAENABLE=0;
  HEATERAFORCE=0;
  HEATERATARGET=-130;

  //heater B disabled (not used)
  HEATERBENABLE=0;

  //sensor A (cryocooler side of getter heat strap)
  SENSORATYPE=4; //RTD1000

  //sensor B (getter side of getter heat strap)
  SENSORBTYPE=4; //RTD1000
  
  //sensor C (cryostat walll at detector end)
  SENSORCTYPE=4; //RTD1000
  
}





