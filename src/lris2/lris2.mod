/** -*- C -*- **/

/* Nominal values for the biases */
#define V_BiasGate      2.3
#define V_BiasPower     3.3
#define V_DSub           0.55  
#define V_VDD            3.3  
#define V_VReset         0.3  
#define V_VDDA           3.3  
#define V_VRef           2.9 
#define V_CLK_EN         3.3 
#define V_Preamp_EN      2.0  
#define V_VideoPullUp    3.3  
#define VSPARE    0.0  /*  */

SLOT 10 lvxbias { /* slot 10 with cryoscope*/
  LVLC 1  [V_BiasGate,2]       "Bias Gate";           
  LVLC 2  [V_BiasPower,2]      "Bias Power";         
  LVLC 3  [V_DSub,2]           "Diode Sub";    
  LVLC 4  [V_VDD,1]            "Digital Supply";       
  LVLC 5  [V_VReset,2]         "Diode Reset";          
  LVLC 6  [V_VDDA,1]           "Analog Supply";          
  LVLC 7  [V_VRef,1]           "Preamp neg ref";           
  LVLC 8  [V_CLK_EN,2]         "clock enable";      
  LVLC 9  [V_Preamp_EN,2]      "Preamp enable";       
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
  LVHC  1 [V_VideoPullUp,10,3,1] "PullUp";   /* Spare                  */
  LVHC  2 [VSPARE,50,1,0] "Misc 1";   /*    Misc1       */
  LVHC  3 [VSPARE,10,1,0] "Misc 2";   /* Spare                  */
  LVHC  4 [VSPARE,100,1,0] "Misc 3";  /* )    */
  LVHC  5 [VSPARE,10,1,1] "LED IR";  /*                     */
  LVHC  6 [VSPARE,70,1,1] "Light Bulb";   /* Spare                  */
}

SLOT 11 lvds {/* slot 11 with Cryoscope*/
  DIO 1 [0,0];
  DIO 2 [0,0];
  DIO 3 [0,0];
  DIO 4 [0,0];
  DIOPOWER = 0;
}
