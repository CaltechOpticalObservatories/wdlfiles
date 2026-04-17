# WDL File Notes

## Setting the readout speed

### Step 1 — Edit the pixel time in `.waveform`

On line 49, adjust `Tpix`:

```c
#define Tpix    #eval 6 us /*2.85 us */
```

`Tpix` can be set between **6 and 10 microseconds**. For example, `10 us` corresponds to a 100 kHz clocking speed (1 / 10 µs).

### Step 2 — Adjust sample windows in `.def`

Edit lines 38–41 to match your chosen `Tpix`. Example for `Tpix = 6 us`:

```c
#define _FIRST_RESET_SAMPLE       256
#define _LAST_RESET_SAMPLE        592
#define _FIRST_VIDEO_SAMPLE       600
#define _LAST_VIDEO_SAMPLE        600
```

Each Archon clock step is **10 ns**, so sample indices map directly to nanosecond offsets. In the example above, reset samples span 2560 ns → 5920 ns (a 3.36 µs window). Set `_LAST_RESET_SAMPLE` to 80 ns (8 samples) below `Tpix`.

Reference table for common `Tpix` values:

| Tpix  | `_LAST_RESET_SAMPLE` | `_FIRST_VIDEO_SAMPLE` | `_LAST_VIDEO_SAMPLE` |
|-------|----------------------|-----------------------|----------------------|
| 6 µs  | 592                  | 600                   | 600                  |
| 7 µs  | 692                  | 700                   | 700                  |
| 8 µs  | 792                  | 800                   | 800                  |
| 9 µs  | 892                  | 900                   | 900                  |
| 10 µs | 992                  | 1000                  | 1000                 |

> **Note:** The first and last video samples define the CDS sample window. Because this is a CMOS detector (not true CDS), both values are set equal — matching `Tpix` — so the difference is always 0. Do not change this.

---

## Switching between freerun and Expose modes

Edit line 325 of the `.seq` file:
```c
SEQUENCE Guiding_Sequence {
if Expose  GrabWindow();
if Abort    AbortSeq();
GOTO Guiding_Sequence();
}
```

Toggle between `Expose` and `freerun` by writing `if freerun` or `if Expose` on the first `if` line.

> **Warning:** Capitalization matters — `Expose` and `expose` are not interchangeable in case.


## Tuning Bias Values

Voltage tuning should happen in the archon gui. When done, final parameters can be transferred to the hispecatc.mod file. Only the preamp neg ref needed to be tuned for HISPEC to set the reset to a value less than 65k DN.
