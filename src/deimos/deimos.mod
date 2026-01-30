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
  DRVX  7 [PCLK_fast,PCLK_slow,1] "PCLK_A1_1";
  DRVX  8 [PCLK_fast,PCLK_slow,1] "PCLK_B1_1";
  DRVX  9 [PCLK_fast,PCLK_slow,1] "PCLK_A2_1";
  DRVX 10 [PCLK_fast,PCLK_slow,1] "PCLK_B2_1";
  DRVX 11 [PCLK_fast,PCLK_slow,1] "PCLK_A3_1";
  DRVX 12 [PCLK_fast,PCLK_slow,1] "PCLK_B3_1";
}

SLOT 2 driverx {
  DRVX  1 [SCLK_fast,SCLK_slow,1] "SCI_RGBACKUP2";
  DRVX  2 [SCLK_fast,SCLK_slow,1] "SCI_SWBACKUP1";
  DRVX  3 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS2_S2L";
  DRVX  4 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS1_S2L";
  DRVX  5 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS2_S3L";
  DRVX  6 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS_S1";
  DRVX  7 [SCLK_fast,SCLK_slow,1] "SCI_SWBACKUP2";
  DRVX  8 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS_RG";
  DRVX  9 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS_SW";
  DRVX 10 [SCLK_fast_FCS,SCLK_slow_FCS,1] "FCS1_S3L";
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
  DRVX  7 [PCLK_fast_FCS,PCLK_slow_FCS,1] "FCS PPhase3U";
  DRVX  8 [PCLK_fast_FCS,PCLK_slow_FCS,1] "FCS PPhase3L";
  DRVX  9 [PCLK_fast_FCS,PCLK_slow_FCS,1] "FCS PPhase2";
  DRVX 10 [PCLK_fast_FCS,PCLK_slow_FCS,1] "FCS PPhase1";
  DRVX 11 [TG_fast,TG_slow,1] "TGA2";
  DRVX 12 [1,1,0] "SCI_RGBACKUP1";
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
  HVLC  2 [24.0,1] "SCI1 Guard Drain";
  HVLC  3 [24.0,1] "SCI2 Guard drain";
  HVLC  4 [0.00,0];
  HVLC  5 [17.5,2] "SCI1 E Reset Drain";
  HVLC  6 [17.5,2] "SCI1 F Reset Drain";
  HVLC  7 [0.00,0];
  HVLC  8 [14.00,2] "FCS1 Reset Drain A";
  HVLC  9 [14.00,2] "FCS1 Reset Drain B";
  HVLC 10 [14.00,2] "FCS2 Reset Drain A";
  HVLC 11 [14.00,2] "FCS2 Reset Drain B";
  HVLC 12 [13.00,1] "FCS Overflow Drain";
  HVLC 13 [24.3,1] "FCS1 Output Drain A";
  HVLC 14 [24.3,1] "FCS1 Output Drain B";
  HVLC 15 [24.3,1] "FCS2 Output Drain A";
  HVLC 16 [24.3,1] "FCS2 Output Drain B";
  HVLC 17 [0.00,0];
  HVLC 18 [0.00,0];
  HVLC 19 [0.00,0];
  HVLC 20 [0.00,0];
  HVLC 21 [17.00,2] "SCI2 E Reset Drain";
  HVLC 22 [17.00,2] "SCI2 F Reset Drain";
  HVLC 23 [0.0,0];
  HVLC 24 [0.0,0]; //TODO: needs re-assignment!
  HVHC  1 [29.0,10.0,3,1] "SCI E Output Drain";
  HVHC  2 [29.0,10.0,3,1] "SCI F Output Drain"; 
  HVHC  3 [29.0,10.0,3,1] "SCI2 E Output Drain";
  HVHC  4 [29.0,10.0,3,1] "SCI2 F Output Drain";
  HVHC  5 [0.0,0.0,0,0];
  HVHC  6 [0.0,0.0,0,0];
}

SLOT 10 lvbias {
   LVLC  1 [3.3,6] "LVDS Receiver Output Enable"; 
   LVLC  2 [00.0,0]; 
   LVLC  3 [3.0,4] "SCI E Output Gate"; 
   LVLC  4 [3.0,4] "SCI F Output Gate";
   LVLC  5 [0.0,0] ;  // NB goes through a line driver 
   LVLC  6 [0.0,0];  // NB goes through a line driver
   LVLC  7 [0.0,0];
   LVLC  8 [0.0,0];  
   LVLC  9 [00.0,0];
   LVLC 10 [-4.0,4] "LastGateA FCS 1"; 
   LVLC 11 [-4.0,4] "LastGateB FCS 1"; 
   LVLC 12 [-4.0,4] "LastGateA FCS 2"; 
   LVLC 13 [-4.0,4] "LastGateB FCS 2";
   LVLC 14 [3.0,4] "SCI E Output Gate 2" ; 
   LVLC 15 [3.0,4] "SCI F Output Gate 2"; 
   LVLC 16 [0.0,0] ; 
   LVLC 17 [00.0,0];
   LVLC 18 [0.0,0] ;
   LVLC 19 [0.0,0] ;
   LVLC 20 [00.0,0]; 
   LVLC 21 [00.0,0]; 
   LVLC 22 [00.0,0] "Video offset FCS"; 
   LVLC 23 [0.50,6] "Video offset SCI"; 
   LVLC 24 [0.50,6] "Video offset SCI2";
   LVHC  1 [2.00,20.0,5,1] "SCI Summing Well - Low";
   LVHC  2 [11.00,20.0,5,1] "SCI Summing Well - High";
   LVHC  3 [12.0,20.0,5,1] "SCI Reset Gate - High";
   LVHC  4 [5.5,20.0,5,1] "SCI Reset Gate - Low";
   LVHC  5 [0.00,0.0,0,0];
   LVHC  6 [0.00,0.0,0,0];
   DIO 1 [0,0] "Driver Output Enable (unused)";
   DIO 2 [0,0] "Loopback 1 IN";
   DIO 3 [2,1] "Loopback 1 OUT";
   DIO 4 [2, 1] "Loopback 2 OUT";
   DIO 5 [0,0] "Loopback 2 IN";
   DIO 6 [0, 0] "Loopback 3 IN";
   DIO 7 [2,1] "Loopback 3 OUT";
   DIO 8 [2,1] "Trig out EXT";
   DIOPOWER = 1;
}

SLOT 12 lvds {
  LVDSL 1 "PD_OE_IN";
  LVDSL 2 "NOP";
  LVDSL 5 "RG_SCI3";
  LVDSL 6 "RG_SCI4";
  LVDSL 7 "RG_SCI1";
  LVDSL 8 "RG_SCI2";
  LVDSL 11 "AC_clamp_FCS";
  LVDSL 12 "AC_clamp";
  LVDSL 13 "SW_SCI4";
  LVDSL 14 "SW_SCI3";
  LVDSL 15 "RG_SCI1";
  LVDSL 16 "SW_SCI2";
  DIO 1 [0,0] "Loopback 4 IN";
  DIO 2 [2,1] "Loopback 4 OUT";
  DIO 3 [0,0] "Loopback 5 IN";
  DIO 4 [2,1] "Loopback 5 OUT";
  DIOPOWER = 1;
    
}









