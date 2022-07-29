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
SET S1B TO 0,FAST;
SET S2B TO 0,FAST;
SET S3B TO 0,FAST;

 
   0:                        SET RG      TO _RG_CLOCK_HIGH,FAST;
  G_RGT:                    SET RG      TO _RG_CLOCK_LOW,FAST;

   G_PixelT/3: =ChgDump      SET SW      TO _GSW_CLOCK_LOW, FAST;
 /*.+SWsettleT:*/ /* Need this in the CDS parameters */ /* Signal samples start here */
 /*.+SigSamples: = PixelT*/ /* Need in CDS parameters .+SWsettleT + PixelT */
 /* SW starts going high again as soon as charge dump has completed *
* so rise time is as long as possible, even extending into next pixel! */
   ChgDump+G_SWslewT:        SET SW      TO _GSW_CLOCK_HIGH,FAST; 

/* Coincident Sx edges are spread equally throughout pixel. *
* NB: Sx Slew Time must be set elsewhere to Tpixel/3. *
* Charge is stored on S2 initially */

 0:                          SET S2T TO _GSER_CLOCK_HIGH, SLOW;
                             SET S3T TO _GSER_CLOCK_LOW, SLOW;
.+G_PixelT/3:                SET S1T TO _GSER_CLOCK_HIGH, FAST;
.+G_SWslewT:                 SET S2T TO _GSER_CLOCK_LOW, FAST;
.+G_SWslewT:                 SET S3T TO _GSER_CLOCK_HIGH, SLOW;
                             SET S1T TO _GSER_CLOCK_LOW, SLOW;
504:                    RETURN;
