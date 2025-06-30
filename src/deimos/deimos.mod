deimos_TMP
#include voltage_timing_parameters.h

/* Fast and Slow slew rates are defined here */
/* A boolean is set during a SET..TO command */
/* to select between fast and slow slew rate */



SLOT 1 driverx {
  DRVX  1 [PCLK_fast,PCLK_slow,1] "PCLK_B3_2";
  DRVX  2 [PCLK_fast,PCLK_slow,1] "PCLK_A3_2";
  DRVX  3 [PCLK_fast,PCLK_slow,1] "PCLK_B2_2";
  DRVX  4 [PCLK_fast,PCLK_slow,1] "PCLK_A2_2";
  DRVX  5 [PCLK_fast,PCLK_slow,1] "PCLK_B1_2";
  DRVX  6 [PCLK_fast,PCLK_slow,1] "PCLK_A1_2";
  DRVX  7 [PCLK_fast,PCLK_slow,1] "PCLK_B1_1";
  DRVX  8 [PCLK_fast,PCLK_slow,1] "PCLK_A2_1";
  DRVX  9 [PCLK_fast,PCLK_slow,1] "PCLK_A2_1";
  DRVX 10 [PCLK_fast,PCLK_slow,1] "PCLK_B2_1";
  DRVX 11 [PCLK_fast,PCLK_slow,1] "PCLK_A3_1";
  DRVX 12 [PCLK_fast,PCLK_slow,1] "PCLK_B3_1";
}

SLOT 2 driverx {
  DRVX  1 [1,1,1] "SCI_RGBACKUP2";
  DRVX  2 [1,1,1] "SCI_SWBACKUP1";
  DRVX  3 [1,1,1] "FCS2_S2L";
  DRVX  4 [1,1,1] "FCS1_S2L";
  DRVX  5 [1,1,1] "FCS2_S3L";
  DRVX  6 [1,1,1] "FCS_S1";
  DRVX  7 [1,1,1] "SCI_SWBACKUP2";
  DRVX  8 [1,1,1] "FCS_RG";
  DRVX  9 [1,1,1] "FCS_SW";
  DRVX 10 [1,1,1] "FCS1_S3L";
  DRVX 11 [1,1,0] "Spare1";
  DRVX 12 [1,1,0] "Spare2";
}

SLOT 3 driverx {
  DRVX  1 [TG_fast,TG_slow,1] "TGA1";
  DRVX  2 [SCLK_fast,SCLK_slow,1] "Serial EF";
  DRVX  3 [SCLK_fast,SCLK_slow,1] "Serial E2";
  DRVX  4 [SCLK_fast,SCLK_slow,1] "Serial E1";
  DRVX  5 [SCLK_fast,SCLK_slow,1] "Serial F2";
  DRVX  6 [SCLK_fast,SCLK_slow,1] "Serial F1";
  DRVX  7 [1,1,0];
  DRVX  8 [1,1,0];
  DRVX  9 [1,1,0];
  DRVX 10 [1,1,0];
  DRVX 11 [TG_fast,TG_slow,1] "TGA2";
  DRVX 12 [1,1,0];
}

SLOT 4 xvbias {
  PBIAS 1 0 [0,0];
  PBIAS 2 0 [0,0];
  PBIAS 3 0 [0,0];
  PBIAS 4 0 [0,0];  
  NBIAS 1 1 [0, -0] "SCI Backside";
  NBIAS 2 0 [0,-0];
  NBIAS 3 0 [0,-0];
  NBIAS 4 0 [0,-0];
}

/* SLOT 7 ADM */ 

/****** Bias Power Up Order ******/
/* 1 : Front Substrate           */
/* 1 : Back Substrate to 0V      */
/* 2 : Guard Drain               */
/* 2 : Reset Drain               */
/* 2 : Ouput Drain               */
/* 3 : Output Gate               */
/* 4 : Image Clock High          */
/* 4 : Image Clock Low           */
/* 4 : Register Clock High       */
/* 4 : Register Clock Low        */
/* 4 : Reset Gate High           */
/* 4 : Reset Gate Low            */
/* 5 : Back Substrate to -100V   */

SLOT 9 hvbias {
  HVLC  1 [0.00,0];             
  HVLC  2 [20.0,1] "SCI Guard Drain";
  HVLC  3 [0.00,0];
  HVLC  4 [0.00,0];
  HVLC  5 [17.0,2] "SCI E Reset Drain";
  HVLC  6 [17.0,2] "SCI F Reset Drain";
  HVLC  7 [0.00,0];
  HVLC  8 [14.00,0] "FCS1 Reset Drain A";
  HVLC  9 [14.00,0] "FCS1 Reset Drain B";
  HVLC 10 [14.00,0] "FCS2 Reset Drain A";
  HVLC 11 [14.00,0] "FCS2 Reset Drain B";
  HVLC 12 [13.00,1] "FCS Overflow Drain"; //TODO: what voltage?
  HVLC 13 [0.00,0];
  HVLC 14 [0.00,0];
  HVLC 15 [0.00,0];
  HVLC 16 [0.00,0];
  HVLC 17 [0.00,0];
  HVLC 18 [0.00,0];
  HVLC 19 [0.00,0];
  HVLC 20 [0.00,0];
  HVLC 21 [17.00,2] "SCI2 E Reset Drain";
  HVLC 22 [17.00,2] "SCI2 F Reset Drain";
  HVLC 23 [29.00,1] "SCI2 E Output Drain" ; //TODO: needs re-assignment!
  HVLC 24 [29.00,1] "SCI2 F Output Drain"; //TODO: needs re-assignment!
  HVHC  1 [29.0,2.0,3,1] "SCI E Output Drain";
  HVHC  2 [29.0,7.0,3,1] "SCI F Output Drain"; 
  HVHC  3 [24.3,2.0,0,1] "FCS1 Output Drain A";
  HVHC  4 [24.3,2.0,0,1] "FCS1 Output Drain B";
  HVHC  5 [24.3,2.0,0,1] "FCS2 Output Drain A";
  HVHC  6 [24.3,2.0,0,1] "FCS2 Output Drain B";
}

SLOT 10 lvbias {
   LVLC  1 [3.3,6] "LVDS Receiver Output Enable"; 
   LVLC  2 [00.0,0]; 
   LVLC  3 [3.00,4] "SCI E Output Gate"; 
   LVLC  4 [3.00,4] "SCI F Output Gate";
   LVLC  5 [1.00,5] "SCI Summing Well - Low";  // NB goes through a line driver 
   LVLC  6 [9.0,5] "SCI Summing Well - High";  // NB goes through a line driver 

     LVLC  7 [11.50,5] "SCI Reset Gate - HIGH";  // NB at the moment RG low and high are swapped in the cable by accident!
//   LVLC  7 [5.00,5] "SCI Reset Gate - Low";  // NB goes through a line driver 
  // LVLC  8 [11.5,5] "SCI Reset Gate - High";  // NB goes through a line driver
   LVLC  8 [5.5,5] "SCI Reset Gate - LOW";  //// NB at the moment RG low and high are swapped in the cable by accident! 
   LVLC  9 [00.0,0]; 
   LVLC 10 [-4.0,0] "LastGateA FCS 1"; 
   LVLC 11 [-4.0,0] "LastGateB FCS 1"; 
   LVLC 12 [-4.0,0] "LastGateA FCS 2"; 
   LVLC 13 [-4.0,0] "LastGateB FCS 2";
   LVLC 14 [3.3,0] "SCI E Output Gate 2" ; 
   LVLC 15 [3.3,0] "SCI F Output Gate 2"; 
   LVLC 16 [0.0,0] ; 
   LVLC 17 [00.0,0];
   LVLC 18 [0.0,0] ;
   LVLC 19 [0.0,0] ;
   LVLC 20 [00.0,0]; 
   LVLC 21 [00.0,0]; 
   LVLC 22 [00.0,0] "Video offset FCS"; 
   LVLC 23 [00.0,0] "Video offset SCI"; 
   LVLC 24 [00.0,0];
   LVHC  1 [0.00,0.0,0,0];
   LVHC  2 [0.00,0.0,0,0];
   LVHC  3 [0.00,0.0,0,0];
   LVHC  4 [0.00,0.0,0,0];
   LVHC  5 [0.00,0.0,0,0];
   LVHC  6 [0.00,0.0,0,0];
   DIO 1 [0,0];
   DIO 2 [0,0];
   DIO 3 [0,0];
   DIO 4 [0,0];
   DIO 5 [0,0];
   DIO 6 [0,0];
   DIO 7 [0,0];
   DIO 8 [0,0];
}

SLOT 12 lvds {
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
    
}









