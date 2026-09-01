LRIS2 sequencer usage
=====================

The LRIS2 sequencer is a conventional sequencer with internally timed exposure times. At the moment, only reading out through all 4 outputs is supported. Presently, dummy pixels are read. This will change once the LRIS2 VIB goes through safe-2-mate procedure.

exposure time setting
---------------------

The sequencer first waits for a "dark time" with the shutter closed. Then the shutter is opened. Immediately after sending shutter open command, the sequencer waits a further "light time", then closes the shutter. Finally, the sequencer waits a further "shutter wait" time to ensure the shutter is closed before readout. It is crucial this delay is long enough to avoid spurious illuminated exposure during readout shifts.

All three of these waits happen **regardless** of whether the shutter output or the integration trigger output are enabled. 

The "dark time" wait is likely only useful for engineering tests (e.g. doing a photon transfer curve with a given **total** integration time remaining constant while varying the amount of flux incident on the detector. For science operations, it's likely that the "dark time" is set to zero, and the "light time" is varied to set the integration time.


### parameters

`etime_dark_s`- the number of whole seconds in the "dark" wait time (before shutter opening)
` etime_dark_ms` - the number of extra milliseconds in the "dark" wait time (before shutter opening)

`etime_illum_s` - the number of whole seconds in the "light" wait time (after shutter opening)
`etime_illum_ms` - the number of extra milliseconds in the "light" wait time (after shutter opening

`etime_wait_shutter_ms` - the number of milliseconds to wait to ensure shutter closing.


Triggering / aborting an integration
------------------------------------

To start an integration whilst the sequencer is in idle mode, set the **framecount** parameter to 1. While an integration is running, as long as it is during the "light" or "dark" waiting periods within the whole seconds setting, the parameter `abort_integration`
can be set to 1 to abort the current integration.


other parameters
----------------
`run_shutter` - whether to actually open and close the shutter when performing an exposure (does not affect integration time values)

`run_illum_trig` - whether to assert the external BNC trigger while integration (does not affect integration time values)



loopback GPIO monitors
----------------------

**Module 12 DIO 2** - indicates whether the sequencer is currently integrating
**Module 12 DIO 7** - indicates whether the sequencer is currently in readout loop
**Module 12 DIO 8** - indicates whether the sequencer is currently idling

