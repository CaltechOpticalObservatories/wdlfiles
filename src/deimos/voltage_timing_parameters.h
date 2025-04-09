/** ---------------------------------------------------------------------------
 * Define clock voltage levels here (units are in volts)
 * All voltages are set relative to front substrate voltage (typ. 0V)
 * evaluations relative to FSS should be implemented if variability is required
/*/     

#define _PAR_CLOCK_HIGH     8.0 /* [ 8.00, 14.0] */
#define _PAR_CLOCK_LOW     0.0 /* [-0.50, 0.50] */

#define _TG_CLOCK_HIGH      9.0 /* [ 8.00, 14.0] */
#define _TG_CLOCK_LOW       0.0 /* [-0.50, 0.50] */

#define _SER_CLOCK_HIGH    9.0 /* [ 8.00, 14.0] */
#define _SER_CLOCK_LOW     1.0 /* [-0.50, 1.50] */
#define _SER_CLOCK_RCV     10.0 /* Higher than serial clock high */

#define _RESET_DRAIN       17 /* [ 15.0, 20.0] */
#define _OUTPUT_DRAIN      29 /* [ 27.0, 32.0] */

#define _RG_LOW            5.0 /* [-0.5, 1.0] */
#define _RG_HIGH           12.0 /* [8.0, 14.0] */

#defeval _SW_LOW            _SER_CLOCK_LOW /* [-0.5, 1.0] */
#defeval _SW_HIGH           _SER_CLOCK_HIGH /* [8.0, 14.0] */


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
#define 1ms	      #eval 100000 clicks	  /* 999 usec WHY */
#define 10ms          #eval 10 ms
#define 1s            #eval 1000 ms


/* Line transfer timing definitions */
#define TDRT 20us
#define TOI  20us
#define TDTR 20us

#define TGDELAY 20us
#define SERTRANSDELAY 10us



/* Serial transfer timing definitions */

#define SCLK_RCV_RESET #eval 60 TICK /* Serial clock recieving to reset */
#define TWX #eval 8 TICK /* Reset Pulse Width    */
#define TOR #eval 56 TICK  /* Serial Clock Overlap */
#define TSW #eval Pixel_T/2 TICK 
#define TSR #eval Pixel_T/3 TICK

/** basic constants to assist in somewhat automating slew rate for triange clocking.
    For now we are just entering a slew time manually, then calculating the rate to make
    sure we hit the intended voltage at the top of the triangle waveform **/

/** basic slew rate logic: you are doing 1024 serial transfer cycles (for each amp), each lasing around 1us. In this time 3 parallel clock transfers happen, up and down once each. Therefore in 2048us we need to do 3 slews from top to bottom, hence the slew time is 1024 / 6 = 171 */

#define Pixel_T       1000 /* Full pixel time : 10s of ns */
#define SER_SLEW_TIME_TICKS        333

#define SER_SLEW_TIME_US          3.33

#defeval PAR_SLEW_TIME_US          ((2048)/2 + 50 + 20) * (Pixel_T / 100)   / 3
#define PAR_SLEW_TIME_TICKS       PAR_SLEW_TIME_US * 100



//NOTE: OH DEAR, does GPP not do floating point calculations?
//UGLY HACK: for now we call a command line calculator to do it

//NOTE archon slew rates are defined in Volts per microsecond, NOT in volts per Archon clock tick
//NOTE waveforms currently use parallel SLOW slew rate to mean triangular clock,
// and FAST to mean immediate clock

//these exec constructs only work on bash shell, and therefore fail on ubuntu where /bin/sh
//is still INEXPLICABLY dash rather than bash. wah wah.
//#define P_TRI_SLEW_RATE    #exec printf '%2.1f' $(bc  <<< "scale=2; (_PAR_CLOCK_HIGH - _PAR_CLOCK_LOW) / PAR_SLEW_TIME_US")
//#define S_TRI_SLEW_RATE    #exec printf '%2.1f' $(bc  <<< "scale=2; (_SER_CLOCK_HIGH - _SER_CLOCK_LOW) / SER_SLEW_TIME_US")
#define P_TRI_SLEW_RATE    #exec printf "%2.4f" $(echo "scale=4; (_PAR_CLOCK_HIGH - _PAR_CLOCK_LOW) / PAR_SLEW_TIME_US" | bc)
#define S_TRI_SLEW_RATE    #exec printf "%2.4f" $(echo "scale=4; (_SER_CLOCK_HIGH - _SER_CLOCK_LOW) / SER_SLEW_TIME_US" | bc)




#define PCLK_slow           P_TRI_SLEW_RATE

//e2v says need on average 1.us rise time, for "normal" clocking calculate PCLK_fast that way

#define PCLK_fast           #exec printf "%2.4f" $(echo "scale=4; (_PAR_CLOCK_HIGH - _PAR_CLOCK_LOW) / 1.5" | bc)


//e2v says need on average 90ns rise time for a serial clock
#define SCLK_fast           #exec printf "%2.4f" $(echo "scale=4; (_SER_CLOCK_HIGH - _SER_CLOCK_LOW) / 0.09" | bc)

//NOTE: waveforms currently use serial "slow" slew rate for triangular waveform
// serial "FAST" is for immediate changes (like e.g. resetting serial register)
#define SCLK_slow           S_TRI_SLEW_RATE   //nominal value for now

//transfer gate uses only one slew rate

#define TG_fast              PCLK_fast
#define TG_slow              12


#define NOISETEST 0
#define CLAMPTEST 0
#define RESETTEST 0
