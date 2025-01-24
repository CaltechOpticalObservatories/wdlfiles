/** ---------------------------------------------------------------------------
 * Define clock voltage levels here (units are in volts)
 * All voltages are set relative to front substrate voltage (typ. 0V)
 * evaluations relative to FSS should be implemented if variability is required
/*/     

#define _PAR_CLOCK_HIGH    12 /* [ 8.00, 14.0] */
#define _PAR_CLOCK_LOW      0 /* [-0.50, 0.50] */

#define _TG_CLOCK_HIGH     12 /* [ 8.00, 14.0] */
#define _TG_CLOCK_LOW       0 /* [-0.50, 0.50] */

#define _SER_CLOCK_HIGH    12 /* [ 8.00, 14.0] */
#define _SER_CLOCK_LOW      1 /* [-0.50, 1.50] */
#define _SER_CLOCK_RCV     13 /* Higher than serial clock high */

#define _RESET_DRAIN       17 /* [ 15.0, 20.0] */
#define _OUTPUT_DRAIN      29 /* [ 27.0, 32.0] */

/** ---------------------------------------------------------------------------
 * Define timing parameters here (units are in ticks - 10ns)
 * Evaluations are used for specific timing parameters and slew rates
/*/ 


#define clockfreq  100000000                      /* 100 MHz master clock frequency in Hz */
#define sec        *(clockfreq)                   /* clock cycles per second              */
#define ms         *(clockfreq/1000)              /* clock cycles per millisec            */
#define us         *(clockfreq/1000000)           /* clock cycles per microsec            */
#define ns         *(clockfreq/10000000)          /* clock cycles per nanosecond          */
#define clicks	   *(clockfreq/100000000)	      /* clock cycles per nanosecond          */

/* Timing defines */
/* Generic timing parameters */
#define TICK	      #eval 1 clicks		  /* 10 nsec */
#define 1ns           #eval 1 ns 
#define 1us           #eval 1 us
#define 2us           #eval 2 us
#define 10us          #eval 10 us
#define 20us          #eval 20 us
#define 25us          #eval 25 us
/* #define 1ms	          #eval 99999 clicks	  /* 999 usec WHY */
#define 10ms          #eval 10 ms


/* Line transfer timing definitions */
#define TDRT 20us
#define TOI  20us
#define TDTR 20us

/* Serial transfer timing definitions */

#define SCLK_RCV_RESET #eval 60 ns /* Serial clock recieving to reset */
#define TWX #eval 170 ns /* Reset Pulse Width    */
#define TOR #eval 130 ns /* Serial Clock Overlap */
#define TSW #eval Pixel_T/2 ns
#define TSR #eval Pixel_T/3 ns