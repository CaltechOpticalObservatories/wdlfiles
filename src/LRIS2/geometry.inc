#define N_POSCAN 20
#define N_SPSCAN 4
#define N_SOSCAN 20
#define N_OUTPUTS_HORIZ 2
#define N_OUTPUTS_VERT 2


#define RO_COLS #eval N_SPSCAN + N_SOSCAN +  ( 4080 / N_OUTPUTS_HORIZ)


#define RO_ROWS #eval N_POSCAN + ( 4080 / N_OUTPUTS_VERT )
