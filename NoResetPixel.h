/* SW and Sx slew rates are critical. *
* Calculate from amplitude and time automatically *
* CDS sampling should also be tied to constants below. */

/* Control signals mark start of pixel for CDS sample timing      */
/* Pixel time = RG + RGsettle + RefSamples +SWsettle + SigSamples */
/* We have always seen a 6 sample offset */
/* so starting the pixel counter on 8 doesn't seem that unusual. */
/* Not understood, though */

/* We dont' want to increment the pixel counter or covert anything until
 * we have summed many pixels
   8:                        SET PIXEL   TO High;
 .+1:                        SET PIXEL   TO Low;
                             SET LINE    TO Low;
                             SET FRAME   TO Low;
*/

/* 0:                          SET PhiR    TO PhiRHigh;
   RGT:                        SET PhiR    TO PhiRLow;*/
 RefSamples: =ChgDump      SET SWClock TO _SW_CLOCK_LOW, FAST;
 /*.+SWsettleT:*/ /* Need this in the CDS parameters */ /* Signal samples start here */
 /*.+SigSamples: = PixelT*/ /* Need in CDS parameters .+SWsettleT + PixelT */
 /* SW starts going high again as soon as charge dump has completed *
* so rise time is as long as possible, even extending into next pixel! */
  ChgDump+SWslewT:            SET SWClock TO _SW_CLOCK_HIGH, SLOW;

/* Coincident Sx edges are spread equally throughout pixel. *
* NB: Sx Slew Time must be set elsewhere to Tpixel/3. *
* Charge is stored on S2 initially */

0:                           SET SClock3 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SClock1 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  SET SClock2 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SClock3 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  SET SClock1 TO _SER_CLOCK_HIGH, FAST; /*SLOW;*/
                             SET SClock2 TO _SER_CLOCK_LOW,  SLOW;
.+PixelT/3:                  RETURN;


