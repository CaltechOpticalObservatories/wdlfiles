modulefile zztf_science2.mod
signalfile zztf_science.signals

sequence Start:
CALL wCloseShutter
CALL SerialReceiving
CALL SynchedLineTransfer
CALL wReset
CALL Wait1us
CALL wUnsetReset
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
CALL Idling(IdleLines)

sequence WaitForExpose:
CALL Idling
if Expose CALL DoExpose
GOTO WaitForExpose

sequence WaitForReadout:
if Readout CALL DoScienceReadout
GOTO WaitForReadout

sequence DoFauxSignal:
FauxFlag--
Readout--
CALL wFrame
CALL FauxRead
CALL FauxToZero
GOTO WaitForExpose

sequence FauxRead:
CALL DoLevel1(PartialLines)
CALL DoLevel2(PartialLines)
CALL DoLevel3(PartialLines)
CALL DoLevel4(PartialLines)
CALL DoLevel5(PartialLines)
CALL DoLevel6(PartialLines)
CALL DoLevel7(PartialLines)
CALL DoLevel8(PartialLines)
RETURN FauxRead

sequence DoLevel1:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel1(FauxPixels)
CALL Wait1ms
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel1

sequence DoLevel2:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel2(FauxPixels)
CALL Wait1ms
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel2

sequence DoLevel3:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel3(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel3

sequence DoLevel4:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel4(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel4

sequence DoLevel5:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel5(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel5

sequence DoLevel6:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel6(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel6

sequence DoLevel7:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel7(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel7

sequence DoLevel8:
CALL DoLineTransfer
CALL wLine
CALL FauxLevel8(FauxPixels)
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
CALL OpenBLC
CALL ADClamp_
RETURN DoLevel8

sequence DoClampedInput:
Expose--
CALL GroundBLC
CALL wFrame
CALL ClampedRead
CALL FauxToZero
RETURN DoClampedInput

sequence ClampedRead:
CALL CLevel1(SplitLines)
RETURN ClampedRead

sequence CLevel1:
CALL DoLineTransfer
CALL ADClamp_
CALL wLine
CALL FauxLevel1(FauxPixels)
CALL Wait1ms
CALL GroundBLC
CALL ADClamp
CALL Wait1ms
RETURN CLevel1

sequence Idling:
CALL wReset
CALL SynchedLineTransfer
CALL FastSerialOutputClocking(Pixels)
CALL SerialReceiving
CALL wReset
CALL Wait1us
CALL wUnsetReset
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
RETURN Idling

sequence DoExpose:
Expose--
CALL SetParallelExpose
if exptime CALL MilliSec(exptime)
if exptime CALL DoShutterDelay(shutdelay)
GOTO WaitForReadout

sequence MilliSec:
CALL Wait1ms
RETURN MilliSec

sequence DoShutterDelay:
CALL Wait1ms
RETURN DoShutterDelay

sequence DoFlush:
CALL SerialReceiving
if PSplit CALL SynchedLineTransfer(SplitLines)
if PUp CALL ParallelUp(SplitLines)
if PDown CALL ParallelDown(SplitLines)
if SSplit CALL SerialOutputClocking(Pixels)
if SRight CALL RightSerialOutputClocking(Pixels)
if SLeft CALL LeftSerialOutputClocking(Pixels)
RETURN DoFlush

sequence DoScienceReadout:
Readout--
CALL SetParallelTransfer
CALL FastSerialOutputClocking(Pixels)
CALL SerialReceiving
CALL wOpenShutter
CALL wFrame
CALL ScienceRead(SplitLines)
CALL SerialReceiving
CALL wCloseShutter
GOTO WaitForExpose

sequence DoRoiScienceReadout:
RoiReadout--
CALL SerialReceiving
CALL wFrame
CALL RoiScience(RoiLines)
if PSplit CALL SynchedLineTransfer(RemainingLines)
if PUp CALL ParallelUp(RemainingLines)
if PDown CALL ParallelDown(RemainingLines)
if SSplit CALL SerialOutputClocking(Pixels)
if SRight CALL RightSerialOutputClocking(Pixels)
if SLeft CALL LeftSerialOutputClocking(Pixels)
RETURN DoRoiScienceReadout

sequence ScienceRead:
CALL SynchedLineTransfer
CALL wLine
CALL FastSerialOutputClocking(Pixels)
CALL SerialReceiving
CALL wReset
CALL Wait1us
CALL wUnsetReset
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
RETURN ScienceRead

sequence RoiScience:
if PSplit CALL SynchedLineTransfer
if PUp CALL ParallelUp
if PDown CALL ParallelDown
CALL OpenBLC
CALL ADClamp_
CALL wLine
if SSplit CALL SerialOutputClocking(Pixels)
if SRight CALL RightSerialOutputClocking(Pixels)
if SLeft CALL LeftSerialOutputClocking(Pixels)
CALL GroundBLC
CALL ADClamp
RETURN RoiScience

waveform Wait1ms:
99999 RETURN Wait1ms

waveform Wait1us:
100 RETURN Wait1us

waveform Wait25us:
2500 RETURN Wait25us

waveform OpenBLC:
0 3 2 0.0
0 3 8 0.0
1 RETURN OpenBLC

waveform GroundBLC:
0 3 2 1.0
0 3 8 1.0
1 RETURN GroundBLC

waveform SyncParallel:
0 10 6 3.0
0 10 7 1
0 10 2 3.0
0 10 3 1
0 10 10 3.0
0 10 11 1
0 10 14 -8.0
0 10 15 1
10000 10 6 3.0
10000 10 7 1
10000 10 2 3.0
10000 10 3 1
10000 10 10 -8.0
10000 10 11 1
10000 10 14 -8.0
10000 10 15 1
10001 RETURN SyncParallel

waveform wParallelInversion:
0 10 14 -8.0
0 10 15 1
0 10 10 -8.0
0 10 11 1
0 10 6 -8.0
0 10 7 1
0 10 2 -8.0
0 10 3 1
0 10 0 -8.0
0 10 1 1
0 10 4 -8.0
0 10 5 1
0 10 8 -8.0
0 10 9 1
0 10 12 -8.0
0 10 13 1
1 RETURN wParallelInversion

waveform wAllSerialLow:
0 11 4 0.0
0 11 5 1
0 4 4 0.0
0 4 5 1
0 11 10 0.0
0 11 11 1
0 4 10 0.0
0 4 11 1
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
0 11 2 0.0
0 11 3 1
0 4 2 0.0
0 4 3 1
0 11 6 0.0
0 11 7 1
0 4 6 0.0
0 4 7 1
1 RETURN wAllSerialLow

waveform SerialReceiving:
0 11 0 12.0
0 11 1 1
0 4 0 12.0
0 4 1 1
0 11 14 12.0
0 11 15 1
0 4 14 12.0
0 4 15 1
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
21 RETURN SerialReceiving

waveform OldSerialOutputClocking:
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
30 11 8 12.0
30 11 9 1
30 4 8 12.0
30 4 9 1
30 11 2 12.0
30 11 3 1
30 4 2 12.0
30 4 3 1
30 11 6 12.0
30 11 7 1
30 4 6 12.0
30 4 7 1
30 11 4 0.0
30 11 5 1
30 4 4 0.0
30 4 5 1
30 11 10 0.0
30 11 11 1
30 4 10 0.0
30 4 11 1
40 3 0 0.0
40 3 10 0.0
40 3 1 0.0
40 3 9 0.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
82 11 8 0.0
82 11 9 1
82 4 8 0.0
82 4 9 1
82 11 2 0.0
82 11 3 1
82 4 2 0.0
82 4 3 1
82 11 6 0.0
82 11 7 1
82 4 6 0.0
82 4 7 1
82 11 0 12.0
82 11 1 1
82 4 0 12.0
82 4 1 1
82 11 14 12.0
82 11 15 1
82 4 14 12.0
82 4 15 1
122 3 3 0.0
123 RETURN OldSerialOutputClocking

waveform SerialOutputClocking:
0 3 0 1.0
0 3 10 1.0
0 3 1 1.0
0 3 9 1.0
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
10 11 8 12.0
10 11 9 1
10 4 8 12.0
10 4 9 1
10 11 2 12.0
10 11 3 1
10 4 2 12.0
10 4 3 1
10 11 6 12.0
10 11 7 1
10 4 6 12.0
10 4 7 1
10 11 4 0.0
10 11 5 1
10 4 4 0.0
10 4 5 1
10 11 10 0.0
10 11 11 1
10 4 10 0.0
10 4 11 1
20 3 0 0.0
20 3 10 0.0
20 3 1 0.0
20 3 9 0.0
21 0 3 1.0
22 0 3 0.0
22 0 1 0.0
22 0 2 0.0
62 11 8 0.0
62 11 9 1
62 4 8 0.0
62 4 9 1
62 11 2 0.0
62 11 3 1
62 4 2 0.0
62 4 3 1
62 11 6 0.0
62 11 7 1
62 4 6 0.0
62 4 7 1
62 11 0 12.0
62 11 1 1
62 4 0 12.0
62 4 1 1
62 11 14 12.0
62 11 15 1
62 4 14 12.0
62 4 15 1
92 11 4 12.0
92 11 5 1
92 4 4 12.0
92 4 5 1
92 11 10 12.0
92 11 11 1
92 4 10 12.0
92 4 11 1
92 11 0 0.0
92 11 1 1
92 4 0 0.0
92 4 1 1
92 11 14 0.0
92 11 15 1
92 4 14 0.0
92 4 15 1
102 RETURN SerialOutputClocking

waveform SlowSerialOutputClocking:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
203 11 4 12.0
203 11 5 1
203 4 4 12.0
203 4 5 1
203 11 10 12.0
203 11 11 1
203 4 10 12.0
203 4 11 1
403 11 0 0.0
403 11 1 1
403 4 0 0.0
403 4 1 1
403 11 14 0.0
403 11 15 1
403 4 14 0.0
403 4 15 1
603 3 0 1.0
603 3 10 1.0
603 3 1 1.0
603 3 9 1.0
803 11 8 12.0
803 11 9 1
803 4 8 12.0
803 4 9 1
1003 11 2 12.0
1003 11 3 1
1003 4 2 12.0
1003 4 3 1
1003 11 6 12.0
1003 11 7 1
1003 4 6 12.0
1003 4 7 1
1203 11 4 0.0
1203 11 5 1
1203 4 4 0.0
1203 4 5 1
1203 11 10 0.0
1203 11 11 1
1203 4 10 0.0
1203 4 11 1
1403 3 0 0.0
1403 3 10 0.0
1403 3 1 0.0
1403 3 9 0.0
1603 11 0 12.0
1603 11 1 1
1603 4 0 12.0
1603 4 1 1
1603 11 14 12.0
1603 11 15 1
1603 4 14 12.0
1603 4 15 1
1803 11 8 0.0
1803 11 9 1
1803 4 8 0.0
1803 4 9 1
2003 11 2 0.0
2003 11 3 1
2003 4 2 0.0
2003 4 3 1
2003 11 6 0.0
2003 11 7 1
2003 4 6 0.0
2003 4 7 1
2203 3 3 0.0
2204 RETURN SlowSerialOutputClocking

waveform FastSerialOutputClocking:
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
30 11 8 12.0
30 11 9 1
30 4 8 12.0
30 4 9 1
30 11 2 12.0
30 11 3 1
30 4 2 12.0
30 4 3 1
30 11 6 12.0
30 11 7 1
30 4 6 12.0
30 4 7 1
30 11 4 0.0
30 11 5 1
30 4 4 0.0
30 4 5 1
30 11 10 0.0
30 11 11 1
30 4 10 0.0
30 4 11 1
40 3 0 0.0
40 3 10 0.0
40 3 1 0.0
40 3 9 0.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
102 11 8 0.0
102 11 9 1
102 4 8 0.0
102 4 9 1
102 11 2 0.0
102 11 3 1
102 4 2 0.0
102 4 3 1
102 11 6 0.0
102 11 7 1
102 4 6 0.0
102 4 7 1
102 11 0 12.0
102 11 1 1
102 4 0 12.0
102 4 1 1
102 11 14 12.0
102 11 15 1
102 4 14 12.0
102 4 15 1
162 RETURN FastSerialOutputClocking

waveform SmoothSerialOutputClocking:
0 3 0 1.0
0 3 10 1.0
0 3 1 1.0
0 3 9 1.0
0 11 4 0.0
0 11 5 0
0 4 4 0.0
0 4 5 0
0 11 10 0.0
0 11 11 0
0 4 10 0.0
0 4 11 0
0 11 2 12.0
0 11 3 0
0 4 2 12.0
0 4 3 0
0 11 6 12.0
0 11 7 0
0 4 6 12.0
0 4 7 0
0 11 8 12.0
0 11 9 1
0 4 8 12.0
0 4 9 1
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
11 3 0 0.0
11 3 10 0.0
11 3 1 0.0
11 3 9 0.0
40 11 0 12.0
40 11 1 0
40 4 0 12.0
40 4 1 0
40 11 14 12.0
40 11 15 0
40 4 14 12.0
40 4 15 0
40 11 2 0.0
40 11 3 0
40 4 2 0.0
40 4 3 0
40 11 6 0.0
40 11 7 0
40 4 6 0.0
40 4 7 0
71 11 8 0.0
71 11 9 1
71 4 8 0.0
71 4 9 1
80 11 0 0.0
80 11 1 0
80 4 0 0.0
80 4 1 0
80 11 14 0.0
80 11 15 0
80 4 14 0.0
80 4 15 0
80 11 4 12.0
80 11 5 0
80 4 4 12.0
80 4 5 0
80 11 10 12.0
80 11 11 0
80 4 10 12.0
80 4 11 0
122 RETURN SmoothSerialOutputClocking

waveform OverlapSerialOutputClocking:
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
10 11 0 0.0
10 11 1 1
10 4 0 0.0
10 4 1 1
10 11 14 0.0
10 11 15 1
10 4 14 0.0
10 4 15 1
30 3 0 1.0
30 3 10 1.0
30 3 1 1.0
30 3 9 1.0
40 11 8 12.0
40 11 9 1
40 4 8 12.0
40 4 9 1
40 11 2 12.0
40 11 3 1
40 4 2 12.0
40 4 3 1
40 11 6 12.0
40 11 7 1
40 4 6 12.0
40 4 7 1
50 11 4 0.0
50 11 5 1
50 4 4 0.0
50 4 5 1
50 11 10 0.0
50 11 11 1
50 4 10 0.0
50 4 11 1
60 3 0 0.0
60 3 10 0.0
60 3 1 0.0
60 3 9 0.0
61 0 3 1.0
62 0 3 0.0
62 0 1 0.0
62 0 2 0.0
122 11 0 12.0
122 11 1 1
122 4 0 12.0
122 4 1 1
122 11 14 12.0
122 11 15 1
122 4 14 12.0
122 4 15 1
132 11 8 0.0
132 11 9 1
132 4 8 0.0
132 4 9 1
132 11 2 0.0
132 11 3 1
132 4 2 0.0
132 4 3 1
132 11 6 0.0
132 11 7 1
132 4 6 0.0
132 4 7 1
192 RETURN OverlapSerialOutputClocking

waveform SerialOutputClocking:
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
30 11 8 12.0
30 11 9 1
30 4 8 12.0
30 4 9 1
30 11 2 12.0
30 11 3 1
30 4 2 12.0
30 4 3 1
30 11 6 12.0
30 11 7 1
30 4 6 12.0
30 4 7 1
30 11 4 0.0
30 11 5 1
30 4 4 0.0
30 4 5 1
30 11 10 0.0
30 11 11 1
30 4 10 0.0
30 4 11 1
40 3 0 0.0
40 3 10 0.0
40 3 1 0.0
40 3 9 0.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
82 11 8 0.0
82 11 9 1
82 4 8 0.0
82 4 9 1
82 11 2 0.0
82 11 3 1
82 4 2 0.0
82 4 3 1
82 11 6 0.0
82 11 7 1
82 4 6 0.0
82 4 7 1
82 11 0 12.0
82 11 1 1
82 4 0 12.0
82 4 1 1
82 11 14 12.0
82 11 15 1
82 4 14 12.0
82 4 15 1
122 RETURN SerialOutputClocking

waveform DummySerialOutputClocking:
0 3 3 1.0
20 3 3 1.0
30 3 3 1.0
40 3 3 1.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
102 3 3 1.0
162 RETURN DummySerialOutputClocking

waveform RawPixel:
162 RETURN RawPixel

waveform RightSerialOutputClocking:
0 11 4 0.0
0 11 5 1
0 4 4 0.0
0 4 5 1
0 11 14 0.0
0 11 15 1
0 4 14 0.0
0 4 15 1
0 11 0 12.0
0 11 1 1
0 4 0 12.0
0 4 1 1
0 11 10 12.0
0 11 11 1
0 4 10 12.0
0 4 11 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
30 11 8 12.0
30 11 9 1
30 4 8 12.0
30 4 9 1
30 11 2 12.0
30 11 3 1
30 4 2 12.0
30 4 3 1
30 11 6 12.0
30 11 7 1
30 4 6 12.0
30 4 7 1
30 11 0 0.0
30 11 1 1
30 4 0 0.0
30 4 1 1
30 11 10 0.0
30 11 11 1
30 4 10 0.0
30 4 11 1
40 3 0 0.0
40 3 10 0.0
40 3 1 0.0
40 3 9 0.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
102 11 8 0.0
102 11 9 1
102 4 8 0.0
102 4 9 1
102 11 2 0.0
102 11 3 1
102 4 2 0.0
102 4 3 1
102 11 6 0.0
102 11 7 1
102 4 6 0.0
102 4 7 1
102 11 4 12.0
102 11 5 1
102 4 4 12.0
102 4 5 1
102 11 14 12.0
102 11 15 1
102 4 14 12.0
102 4 15 1
162 3 3 0.0
163 RETURN RightSerialOutputClocking

waveform wReset:
0 3 0 1.0
0 3 10 1.0
0 3 1 1.0
0 3 9 1.0
1 RETURN wReset

waveform wUnsetReset:
0 3 0 0.0
0 3 10 0.0
0 3 1 0.0
0 3 9 0.0
1 RETURN wUnsetReset

waveform LeftSerialOutputClocking:
0 11 0 0.0
0 11 1 1
0 4 0 0.0
0 4 1 1
0 11 10 0.0
0 11 11 1
0 4 10 0.0
0 4 11 1
0 11 4 12.0
0 11 5 1
0 4 4 12.0
0 4 5 1
0 11 14 12.0
0 11 15 1
0 4 14 12.0
0 4 15 1
20 3 0 1.0
20 3 10 1.0
20 3 1 1.0
20 3 9 1.0
30 11 8 12.0
30 11 9 1
30 4 8 12.0
30 4 9 1
30 11 2 12.0
30 11 3 1
30 4 2 12.0
30 4 3 1
30 11 6 12.0
30 11 7 1
30 4 6 12.0
30 4 7 1
30 11 4 0.0
30 11 5 1
30 4 4 0.0
30 4 5 1
30 11 14 0.0
30 11 15 1
30 4 14 0.0
30 4 15 1
40 3 0 0.0
40 3 10 0.0
40 3 1 0.0
40 3 9 0.0
41 0 3 1.0
42 0 3 0.0
42 0 1 0.0
42 0 2 0.0
102 11 8 0.0
102 11 9 1
102 4 8 0.0
102 4 9 1
102 11 2 0.0
102 11 3 1
102 4 2 0.0
102 4 3 1
102 11 6 0.0
102 11 7 1
102 4 6 0.0
102 4 7 1
102 11 0 12.0
102 11 1 1
102 4 0 12.0
102 4 1 1
102 11 10 12.0
102 11 11 1
102 4 10 12.0
102 4 11 1
162 3 3 0.0
163 RETURN LeftSerialOutputClocking

waveform DoLineTransfer:
0 10 6 3.0
0 10 7 1
0 10 12 -8.0
0 10 13 1
0 10 2 3.0
0 10 3 1
0 10 8 3.0
0 10 9 1
0 10 10 -8.0
0 10 11 1
0 10 0 -8.0
0 10 1 1
0 10 14 -8.0
0 10 15 1
0 10 4 3.0
0 10 5 1
10000 10 12 3.0
10000 10 13 1
10000 10 14 3.0
10000 10 15 1
10000 11 12 12.0
10000 11 13 1
10000 4 12 12.0
10000 4 13 1
20000 10 6 -8.0
20000 10 7 1
20000 10 4 -8.0
20000 10 5 1
30000 10 10 3.0
30000 10 11 1
30000 10 0 3.0
30000 10 1 1
40000 10 2 -8.0
40000 10 3 1
40000 10 8 -8.0
40000 10 9 1
50000 10 6 3.0
50000 10 7 1
50000 10 4 3.0
50000 10 5 1
60000 10 12 -8.0
60000 10 13 1
60000 10 14 -8.0
60000 10 15 1
60000 11 12 -8.0
60000 11 13 1
60000 4 12 -8.0
60000 4 13 1
70000 10 8 3.0
70000 10 9 1
80000 10 0 -8.0
80000 10 1 1
80001 RETURN DoLineTransfer

waveform SynchedLineTransfer:
2500 10 14 -8.0
2500 10 15 0
2500 10 10 3.0
2500 10 11 0
2500 10 6 3.0
2500 10 7 0
2500 10 2 3.0
2500 10 3 0
2500 10 12 3.0
2500 10 13 0
2500 10 8 3.0
2500 10 9 0
2500 10 4 3.0
2500 10 5 0
2500 10 0 -8.0
2500 10 1 0
2500 11 12 -8.0
2500 11 13 0
2500 4 12 -8.0
2500 4 13 0
12500 11 12 12.0
12500 11 13 0
12500 4 12 12.0
12500 4 13 0
22500 10 10 -8.0
22500 10 11 0
22500 10 4 -8.0
22500 10 5 0
32500 10 14 3.0
32500 10 15 0
32500 10 0 3.0
32500 10 1 0
42500 10 6 -8.0
42500 10 7 0
42500 10 8 -8.0
42500 10 9 0
52500 10 10 3.0
52500 10 11 0
52500 10 4 3.0
52500 10 5 0
62500 10 2 -8.0
62500 10 3 0
62500 10 12 -8.0
62500 10 13 0
62500 11 12 -8.0
62500 11 13 0
62500 4 12 -8.0
62500 4 13 0
72500 10 6 3.0
72500 10 7 0
72500 10 8 3.0
72500 10 9 0
82500 10 14 -8.0
82500 10 15 0
82500 10 0 -8.0
82500 10 1 0
92500 10 2 3.0
92500 10 3 0
92500 10 12 3.0
92500 10 13 0
95000 RETURN SynchedLineTransfer

waveform SetParallelExpose:
0 10 14 0.0
0 10 15 0
0 10 10 10.0
0 10 11 0
0 10 6 10.0
0 10 7 0
0 10 2 10.0
0 10 3 0
0 10 12 10.0
0 10 13 0
0 10 8 10.0
0 10 9 0
0 10 4 10.0
0 10 5 0
0 10 0 0.0
0 10 1 0
1 RETURN SetParallelExpose

waveform SetParallelTransfer:
0 10 14 -8.0
0 10 15 0
0 10 10 3.0
0 10 11 0
0 10 6 3.0
0 10 7 0
0 10 2 3.0
0 10 3 0
0 10 12 3.0
0 10 13 0
0 10 8 3.0
0 10 9 0
0 10 4 3.0
0 10 5 0
0 10 0 -8.0
0 10 1 0
1 RETURN SetParallelTransfer

waveform DummyLineTransfer:
0 3 3 1.0
10000 3 3 1.0
20000 3 3 1.0
30000 3 3 1.0
40000 3 3 1.0
50000 3 3 1.0
60000 3 3 1.0
70000 3 3 1.0
80000 3 3 1.0
90000 3 3 1.0
90001 RETURN DummyLineTransfer

waveform IdleSynchedLineTransfer:
0 10 6 3.0
0 10 7 1
0 10 2 3.0
0 10 3 1
0 10 10 3.0
0 10 11 1
0 10 14 -8.0
0 10 15 1
10000 10 6 3.0
10000 10 7 1
10000 10 2 3.0
10000 10 3 1
10000 10 10 -8.0
10000 10 11 1
10000 10 14 -8.0
10000 10 15 1
20000 10 12 3.0
20000 10 13 1
20000 10 14 3.0
20000 10 15 1
20000 11 12 12.0
20000 11 13 1
20000 4 12 12.0
20000 4 13 1
30000 10 6 -8.0
30000 10 7 1
30000 10 4 -8.0
30000 10 5 1
40000 10 10 3.0
40000 10 11 1
40000 10 0 3.0
40000 10 1 1
50000 10 2 -8.0
50000 10 3 1
50000 10 8 -8.0
50000 10 9 1
60000 10 6 3.0
60000 10 7 1
60000 10 4 3.0
60000 10 5 1
70000 10 12 -8.0
70000 10 13 1
70000 10 14 -8.0
70000 10 15 1
70000 11 12 -8.0
70000 11 13 1
70000 4 12 -8.0
70000 4 13 1
80000 10 8 3.0
80000 10 9 1
90000 10 0 -8.0
90000 10 1 1
90001 RETURN IdleSynchedLineTransfer

waveform ParallelUp:
0 10 6 3.0
0 10 7 1
0 10 2 3.0
0 10 3 1
0 10 10 3.0
0 10 11 1
0 10 14 -8.0
0 10 15 1
10000 10 6 3.0
10000 10 7 1
10000 10 2 3.0
10000 10 3 1
10000 10 10 -8.0
10000 10 11 1
10000 10 14 -8.0
10000 10 15 1
20000 10 0 3.0
20000 10 1 1
20000 10 14 3.0
20000 10 15 1
20000 11 12 12.0
20000 11 13 1
20000 4 12 12.0
20000 4 13 1
30000 10 6 -8.0
30000 10 7 1
30000 10 8 -8.0
30000 10 9 1
40000 10 10 3.0
40000 10 11 1
40000 10 12 3.0
40000 10 13 1
50000 10 2 -8.0
50000 10 3 1
50000 10 4 -8.0
50000 10 5 1
60000 10 6 3.0
60000 10 7 1
60000 10 8 3.0
60000 10 9 1
70000 10 0 -8.0
70000 10 1 1
70000 10 14 -8.0
70000 10 15 1
70000 11 12 -8.0
70000 11 13 1
70000 4 12 -8.0
70000 4 13 1
80000 10 4 3.0
80000 10 5 1
90000 10 12 -8.0
90000 10 13 1
90001 RETURN ParallelUp

waveform ParallelDown:
0 10 10 3.0
0 10 11 1
0 10 14 3.0
0 10 15 1
0 10 6 3.0
0 10 7 1
0 10 2 -8.0
0 10 3 1
10000 10 10 3.0
10000 10 11 1
10000 10 14 3.0
10000 10 15 1
10000 10 6 -8.0
10000 10 7 1
10000 10 2 -8.0
10000 10 3 1
20000 10 12 3.0
20000 10 13 1
20000 10 2 3.0
20000 10 3 1
20000 11 12 12.0
20000 11 13 1
20000 4 12 12.0
20000 4 13 1
30000 10 10 -8.0
30000 10 11 1
30000 10 4 -8.0
30000 10 5 1
40000 10 6 3.0
40000 10 7 1
40000 10 0 3.0
40000 10 1 1
50000 10 14 -8.0
50000 10 15 1
50000 10 8 -8.0
50000 10 9 1
60000 10 10 3.0
60000 10 11 1
60000 10 4 3.0
60000 10 5 1
70000 10 12 -8.0
70000 10 13 1
70000 10 2 -8.0
70000 10 3 1
70000 11 12 -8.0
70000 11 13 1
70000 4 12 -8.0
70000 4 13 1
80000 10 8 3.0
80000 10 9 1
90000 10 0 -8.0
90000 10 1 1
90001 RETURN ParallelDown

waveform FauxLevel1:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.4
256 11 9 1
256 4 8 -0.4
256 4 9 1
256 11 12 0.4
256 11 13 1
256 4 12 0.4
256 4 13 1
512 RETURN FauxLevel1

waveform FauxLevel2:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.35
256 11 9 1
256 4 8 -0.35
256 4 9 1
256 11 12 0.35
256 11 13 1
256 4 12 0.35
256 4 13 1
512 RETURN FauxLevel2

waveform FauxLevel3:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.3
256 11 9 1
256 4 8 -0.3
256 4 9 1
256 11 12 0.3
256 11 13 1
256 4 12 0.3
256 4 13 1
512 RETURN FauxLevel3

waveform FauxLevel4:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.25
256 11 9 1
256 4 8 -0.25
256 4 9 1
256 11 12 0.25
256 11 13 1
256 4 12 0.25
256 4 13 1
512 RETURN FauxLevel4

waveform FauxLevel5:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.2
256 11 9 1
256 4 8 -0.2
256 4 9 1
256 11 12 0.2
256 11 13 1
256 4 12 0.2
256 4 13 1
512 RETURN FauxLevel5

waveform FauxLevel6:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.15
256 11 9 1
256 4 8 -0.15
256 4 9 1
256 11 12 0.15
256 11 13 1
256 4 12 0.15
256 4 13 1
512 RETURN FauxLevel6

waveform FauxLevel7:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.1
256 11 9 1
256 4 8 -0.1
256 4 9 1
256 11 12 0.1
256 11 13 1
256 4 12 0.1
256 4 13 1
512 RETURN FauxLevel7

waveform FauxLevel8:
2 0 3 1.0
3 0 3 0.0
3 0 1 0.0
3 0 2 0.0
0 11 8 0.1
0 11 9 1
0 4 8 0.1
0 4 9 1
0 11 12 -0.1
0 11 13 1
0 4 12 -0.1
0 4 13 1
256 11 8 -0.05
256 11 9 1
256 4 8 -0.05
256 4 9 1
256 11 12 0.05
256 11 13 1
256 4 12 0.05
256 4 13 1
512 RETURN FauxLevel8

waveform FauxToZero:
0 11 8 0.0
0 11 9 1
0 4 8 0.0
0 4 9 1
0 11 12 0.0
0 11 13 1
0 4 12 0.0
0 4 13 1
1 RETURN FauxToZero

waveform wOpenShutter:
0 0 0 1.0
1 RETURN wOpenShutter

waveform wCloseShutter:
0 0 0 0.0
1 RETURN wCloseShutter

waveform wFrame:
0 0 1 1.0
1 RETURN wFrame

waveform wLine:
0 0 2 1.0
1 RETURN wLine

waveform wLine_triggered:
0 0 0 1.0
2000 0 0 0.0
2000 0 2 1.0
2001 RETURN wLine_triggered

waveform wPixel:
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
2 RETURN wPixel

waveform ADClamp:
0 5 0 1.0
0 6 0 1.0
0 7 0 1.0
0 8 0 1.0
1 RETURN ADClamp

waveform ADClamp_:
0 5 0 0.0
0 6 0 0.0
0 7 0 0.0
0 8 0 0.0
1 RETURN ADClamp_

waveform wDumpGateOn:
0 9 23 12.0
1000000 9 21 12.0
2000000 RETURN wDumpGateOn

waveform wDumpGateOff:
0 9 23 0.0
1000000 9 21 0.0
2000000 RETURN wDumpGateOff

waveform wIdle:
1 RETURN wIdle

parameter exptime=0
parameter Expose=0
parameter Readout=0
parameter TrigLowThisLine=1
parameter ShutterEnable=1
parameter RoiReadout=0
parameter shutdelay=500
parameter SweepCount=0
parameter SerialPrescan=50
parameter SerialOverscan=150
parameter ParallelOverscan=100
parameter ImageCols=3072
parameter ImageRows=3080
parameter SplitLines=3180
parameter Lines=3180
parameter Pixels=3272
parameter IdleLines=3080
parameter FullPixels=6244
parameter ST=19
parameter RGH=30
parameter RGL=30
parameter SWH=30
parameter SWL=30
parameter SHP=30
parameter SHD=30
parameter FauxFlag=0
parameter FauxPixels=3272
parameter FauxLines=3180
parameter PartialLines=385
parameter MedLines=385
parameter LowLines=385
parameter ZeroLines=385
parameter rev=0
parameter RoiLineStart=0
parameter RoiLines=0
parameter RemainingLines=0
parameter PSplit=1
parameter PUp=0
parameter PDown=0
parameter SSplit=0
parameter SRight=0
parameter SLeft=0
parameter NotFast=0
parameter GoFast=1

