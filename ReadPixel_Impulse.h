/* SW and Sx slew rates are critical. *
* Calculate from amplitude and time automatically *
* CDS sampling should also be tied to constants below. */

/* Control signals mark start of pixel for CDS sample timing      */
/* Pixel time = RG + RGsettle + RefSamples +SWsettle + SigSamples */
/* We have always seen a 6 sample offset */
/* so starting the pixel counter on 8 doesn't seem that unusual. */
/* Not understood, though */
   8:                        SET PIXEL   TO High;
 .+1:                        SET PIXEL   TO Low;
                             SET LINE    TO Low;
                             SET FRAME   TO Low;

0:                          SET RG    TO _RG_CLOCK_HIGH,FAST;
.+G_RGT:                        SET RG    TO _RG_CLOCK_LOW,FAST;

G_Test:     SET SW TO _GSW_CLOCK_LOW, FAST;
.+G_RGT: SET SW TO _GSW_CLOCK_HIGH,FAST;

G_Test*2:                  SET SSClock1 TO _GSER_CLOCK_HIGH,FAST;
.+G_RGT:                    SET SSClock1 TO _GSER_CLOCK_LOW,FAST;
G_Test*3:                  SET SSClock2 TO _GSER_CLOCK_HIGH,FAST;
.+G_RGT:                    SET SSClock2 TO _GSER_CLOCK_LOW,FAST;
G_Test*4:                  SET SSClock3 TO _GSER_CLOCK_HIGH,FAST;
.+G_RGT:                    SET SSClock3 TO _GSER_CLOCK_LOW,FAST;
G_Test*5:                  RETURN;


