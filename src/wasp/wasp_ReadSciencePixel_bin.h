/* SW and Sx slew rates are critical. *
* Calculate from amplitude and time automatically *
* CDS sampling should also be tied to constants below. */

/* Control signals mark start of pixel for CDS sample timing      */
/* Pixel time = RG + RGsettle + RefSamples +SWsettle + SigSamples */
/* We have always seen a 6 sample offset */
/* so starting the pixel counter on 8 doesn't seem that unusual. */
/* Not understood, though */
  0:                          SET PhiR    TO PhiRHigh;
 RGT:                        SET PhiR    TO PhiRLow;
 RefSamples: =ChgDump      SET SW_EFGH TO _SW_CLOCK_HIGH, FAST;
 /*.+SWsettleT:*/ /* Need this in the CDS parameters */ /* Signal samples start here */
 /*.+SigSamples: = PixelT*/ /* Need in CDS parameters .+SWsettleT + PixelT */
 /* SW starts going high again as soon as charge dump has completed *
* so rise time is as long as possible, even extending into next pixel! */
  ChgDump+SWslewT:            SET SW_EFGH TO _SW_CLOCK_HIGH, SLOW;

/* Coincident Sx edges are spread equally throughout pixel. *
* NB: Sx Slew Time must be set elsewhere to Tpixel/3. *
* Charge is stored on S2 initially */

0:                           SET SciSClock3 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SciSClock1 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  SET SciSClock2 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SciSClock3 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  SET SciSClock1 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SciSClock2 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  RETURN;
