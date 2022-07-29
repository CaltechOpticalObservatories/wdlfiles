/* SW and Sx slew rates are critical. *
* Calculate from amplitude and time automatically *
* CDS sampling should also be tied to constants below. */

/* Control signals mark start of pixel for CDS sample timing      */
/* Pixel time = RG + RGsettle + RefSamples +SWsettle + SigSamples */
/* We have always seen a 6 sample offset */
/* so starting the pixel counter on 8 doesn't seem that unusual. */
/* Not understood, though */
0:                            SET S1B TO 0,FAST;
                              SET S2B TO 0,FAST;
                              SET S3B TO 0,FAST;
                              SET RG    TO _RG_CLOCK_HIGH,FAST;

.+G_PixelTFlush/6: SET S2T TO _GSER_CLOCK_HIGH,FAST;
                   SET SW TO _GSW_CLOCK_HIGH,FAST;
.+G_PixelTFlush/6: SET S3T TO _GSER_CLOCK_LOW,FAST;
.+G_PixelTFlush/6: SET S1T TO _GSER_CLOCK_HIGH,FAST;
.+G_PixelTFlush/6: SET S2T TO _GSER_CLOCK_LOW,FAST;
                   SET SW TO _GSW_CLOCK_LOW,FAST;
.+G_PixelTFlush/6: SET S3T TO _GSER_CLOCK_HIGH,FAST;
.+G_PixelTFlush/6: SET S1T TO _GSER_CLOCK_LOW,FAST;

G_PixelTFlush:                  RETURN;


