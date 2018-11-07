modulefile ztf_guide.mod
signalfile ztf_guide.signals

sequence Start:
CALL FGSerialReceiving
CALL GFParallelSplit
CALL ADClamp_
CALL OpenBLC

sequence StateZero:
Abort--
if Expose GOTO DoExpose
if Idle CALL Idling
GOTO StateZero

sequence DoExpose:
Expose--
if !Guiding CALL MilliSec(exptime)
if Guiding GOTO GuideSeq
GOTO WaitForReadOut

sequence WaitForReadOut:
if Readout GOTO DoSimultaneousReadOut
if Abort GOTO StateZero
GOTO WaitForReadOut

sequence Idling:
CALL OpenBLC
CALL ADClamp_
CALL GFParallelSplit
CALL GSerialReadRight_smooth(10)
CALL GroundBLC
CALL ADClamp
RETURN Idling

sequence OpenShutter:
if exptime CALL wOpenShutter
RETURN OpenShutter

sequence DoShutterDelay:
CALL Wait1ms
RETURN DoShutterDelay

sequence DoGuideReadout:
GReadout--
CALL FGSerialReceiving
CALL MilliSec(exptime)
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
CALL wFrame
CALL DoGuider(GLines)
GOTO StateZero

sequence DoGuider:
CALL GParallelTopOnly
CALL wLine
CALL GuideSerialReadRightTop(GPixels)
CALL GSerialReceiving
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
RETURN DoGuider

sequence DoFocusReadout:
Readout--
CALL wOpenShutter
CALL MilliSec(exptime)
CALL wCloseShutter
CALL wFrame
CALL DoFocus(GLines)
GOTO StateZero

sequence DoSimultaneousReadOut:
Readout--
CALL Wait10ns(Delay_FrameStart)
CALL FGSerialReceiving
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
CALL wFrame
CALL DoSimultaneousFocus(GLines)
GOTO StateZero

sequence DoSimultaneousFocus:
CALL GFParallelSplit
CALL Wait10ns(Delay_PixelStart)
CALL wLine
CALL GSerialReadRight_smooth(GPixels)
CALL FGSerialReceiving
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
CALL Wait10ns(Delay_LTStart)
RETURN DoSimultaneousFocus

sequence DoFocus:
CALL FParallelSplit
CALL OpenBLC
CALL ADClamp_
CALL wLine
CALL GSerialReadRight_smooth(GPixels)
CALL FGSerialReceiving
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
RETURN DoFocus

sequence GuideSeq:
Guiding--
CALL DoGuiding(GFrames)
GOTO WaitForReadOut

sequence DoGuiding:
CALL GSerialReceiving
CALL MilliSec(exptime)
CALL Wait1us
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
CALL GParallelTopOnly(G_PreFlush)
CALL GuideSerialReadRightTop(2040)
CALL wFrame
CALL GuideRowROI(G_ROI_Height)
CALL GParallelTopOnly(G_PostFlush)
CALL GuideSerialReadRightTop(2040)
RETURN DoGuiding

sequence GuideRowROI:
CALL GSerialReceiving
CALL GParallelTopOnly
CALL GSerial2to3
CALL wLine
CALL GuidePixelFlush(G_PixelPreFlush)
CALL GuideSerialReadRightTop_smooth(G_ROI_Width)
CALL GuidePixelFlush(G_PixelPostFlush)
CALL FGSerialReceiving
CALL Wait1us(10)
CALL GroundBLC
CALL ADClamp
CALL Wait1us
CALL OpenBLC
CALL ADClamp_
RETURN GuideRowROI

sequence MilliSec:
CALL Wait1ms
if Abort GOTO StateZero
RETURN MilliSec

waveform FParallelUp:
0 4 12 -9.0
0 4 13 1
0 4 0 -9.0
0 4 1 1
0 4 14 3.0
0 4 15 1
0 4 4 3.0
0 4 5 1
0 4 10 -9.0
0 4 11 1
0 4 8 -9.0
0 4 9 1
1034 4 10 3.0
1034 4 11 1
1034 4 8 3.0
1034 4 9 1
2068 4 14 -9.0
2068 4 15 1
2068 4 4 -9.0
2068 4 5 1
3102 4 12 3.0
3102 4 13 1
3102 4 0 3.0
3102 4 1 1
4136 4 10 -9.0
4136 4 11 1
4136 4 8 -9.0
4136 4 9 1
5170 4 14 3.0
5170 4 15 1
5170 4 4 3.0
5170 4 5 1
6204 4 12 -9.0
6204 4 13 1
6204 4 0 -9.0
6204 4 1 1
6205 RETURN FParallelUp

waveform FParallelDown:
0 4 10 -9.0
0 4 11 1
0 4 8 -9.0
0 4 9 1
0 4 14 3.0
0 4 15 1
0 4 4 3.0
0 4 5 1
0 4 12 -9.0
0 4 13 1
0 4 0 -9.0
0 4 1 1
1034 4 12 3.0
1034 4 13 1
1034 4 0 3.0
1034 4 1 1
2068 4 14 -9.0
2068 4 15 1
2068 4 4 -9.0
2068 4 5 1
3102 4 10 3.0
3102 4 11 1
3102 4 8 3.0
3102 4 9 1
4136 4 12 -9.0
4136 4 13 1
4136 4 0 -9.0
4136 4 1 1
5170 4 14 3.0
5170 4 15 1
5170 4 4 3.0
5170 4 5 1
6204 4 10 -9.0
6204 4 11 1
6204 4 8 -9.0
6204 4 9 1
6205 RETURN FParallelDown

waveform FParallelSplit_Old:
0 4 12 3.0
0 4 13 1
0 4 4 3.0
0 4 5 1
0 4 14 3.0
0 4 15 1
0 4 0 3.0
0 4 1 1
0 4 10 -9.0
0 4 11 1
0 4 8 -9.0
0 4 9 1
1034 4 12 -9.0
1034 4 13 1
1034 4 4 -9.0
1034 4 5 1
2068 4 10 3.0
2068 4 11 1
2068 4 8 3.0
2068 4 9 1
3102 4 14 -9.0
3102 4 15 1
3102 4 0 -9.0
3102 4 1 1
4136 4 12 3.0
4136 4 13 1
4136 4 4 3.0
4136 4 5 1
5170 4 10 -9.0
5170 4 11 1
5170 4 8 -9.0
5170 4 9 1
6204 4 14 3.0
6204 4 15 1
6204 4 0 3.0
6204 4 1 1
6205 RETURN FParallelSplit_Old

waveform FParallelSplit:
0 4 14 -9.0
0 4 15 1
0 4 0 -9.0
0 4 1 1
0 4 10 3.0
0 4 11 1
0 4 8 3.0
0 4 9 1
16650 4 10 -9.0
16650 4 11 1
16650 4 8 -9.0
16650 4 9 1
16650 4 12 3.0
16650 4 13 1
16650 4 4 3.0
16650 4 5 1
33300 4 14 3.0
33300 4 15 1
33300 4 0 3.0
33300 4 1 1
33300 4 12 -9.0
33300 4 13 1
33300 4 4 -9.0
33300 4 5 1
49950 RETURN FParallelSplit

waveform GFParallelSplit:
0 4 12 3.0
0 4 13 1
0 4 4 3.0
0 4 5 1
0 4 14 3.0
0 4 15 1
0 4 0 3.0
0 4 1 1
0 4 10 -9.0
0 4 11 1
0 4 8 -9.0
0 4 9 1
1034 4 12 -9.0
1034 4 13 1
1034 4 4 -9.0
1034 4 5 1
2068 4 10 3.0
2068 4 11 1
2068 4 8 3.0
2068 4 9 1
3102 4 14 -9.0
3102 4 15 1
3102 4 0 -9.0
3102 4 1 1
4136 4 12 3.0
4136 4 13 1
4136 4 4 3.0
4136 4 5 1
5170 4 10 -9.0
5170 4 11 1
5170 4 8 -9.0
5170 4 9 1
6204 4 14 3.0
6204 4 15 1
6204 4 0 3.0
6204 4 1 1
0 11 10 3.0
0 11 11 1
0 11 6 3.0
0 11 7 1
0 11 2 -9.0
0 11 3 1
0 11 8 0.0
0 11 9 1
0 11 12 0.0
0 11 13 1
0 11 14 -9.0
0 11 15 1
1034 11 10 -9.0
1034 11 11 1
2068 11 2 3.0
2068 11 3 1
3102 11 6 -9.0
3102 11 7 1
4136 11 10 3.0
4136 11 11 1
5170 11 2 -9.0
5170 11 3 1
6204 11 6 3.0
6204 11 7 1
6205 RETURN GFParallelSplit

waveform GParallelSplit:
0 11 10 3.0
0 11 11 1
0 11 12 3.0
0 11 13 1
0 11 6 3.0
0 11 7 1
0 11 8 3.0
0 11 9 1
0 11 2 -9.0
0 11 3 1
0 11 14 -9.0
0 11 15 1
1034 11 10 -9.0
1034 11 11 1
1034 11 12 -9.0
1034 11 13 1
2068 11 2 3.0
2068 11 3 1
2068 11 14 3.0
2068 11 15 1
3102 11 6 -9.0
3102 11 7 1
3102 11 8 -9.0
3102 11 9 1
4136 11 10 3.0
4136 11 11 1
4136 11 12 3.0
4136 11 13 1
5170 11 2 -9.0
5170 11 3 1
5170 11 14 -9.0
5170 11 15 1
6204 11 6 3.0
6204 11 7 1
6204 11 8 3.0
6204 11 9 1
6205 RETURN GParallelSplit

waveform GParallelUp:
0 11 10 3.0
0 11 11 1
0 11 8 3.0
0 11 9 1
0 11 6 3.0
0 11 7 1
0 11 12 3.0
0 11 13 1
0 11 2 -9.0
0 11 3 1
0 11 14 -9.0
0 11 15 1
1034 11 10 -9.0
1034 11 11 1
1034 11 8 -9.0
1034 11 9 1
2068 11 2 3.0
2068 11 3 1
2068 11 14 3.0
2068 11 15 1
3102 11 6 -9.0
3102 11 7 1
3102 11 12 -9.0
3102 11 13 1
4136 11 10 3.0
4136 11 11 1
4136 11 8 3.0
4136 11 9 1
5170 11 2 -9.0
5170 11 3 1
5170 11 14 -9.0
5170 11 15 1
6204 11 6 3.0
6204 11 7 1
6204 11 12 3.0
6204 11 13 1
6205 RETURN GParallelUp

waveform GParallelTopOnly:
0 11 10 3.0
0 11 11 1
0 11 6 3.0
0 11 7 1
0 11 2 -9.0
0 11 3 1
0 11 8 0.0
0 11 9 1
0 11 12 0.0
0 11 13 1
0 11 14 -9.0
0 11 15 1
1034 11 10 -9.0
1034 11 11 1
2068 11 2 3.0
2068 11 3 1
3102 11 6 -9.0
3102 11 7 1
4136 11 10 3.0
4136 11 11 1
5170 11 2 -9.0
5170 11 3 1
6204 11 6 3.0
6204 11 7 1
6205 RETURN GParallelTopOnly

waveform FGSerialReceiving:
0 10 12 -5.0
0 10 13 1
0 10 0 -5.0
0 10 1 1
0 10 14 5.5
0 10 15 1
0 10 4 5.5
0 10 5 1
0 10 10 -5.0
0 10 11 1
0 10 8 -5.0
0 10 9 1
15 10 2 8.0
15 10 3 1
16 RETURN FGSerialReceiving

waveform GSerialReceiving:
0 10 12 -5.0
0 10 13 0
0 10 14 5.5
0 10 15 0
0 10 10 -5.0
0 10 11 0
0 10 0 0.0
0 10 1 1
0 10 4 0.0
0 10 5 1
0 10 8 0.0
0 10 9 1
15 10 2 8.0
15 10 3 1
16 RETURN GSerialReceiving

waveform GSerial2to3:
0 10 12 -5.0
0 10 13 0
0 10 14 5.5
0 10 15 0
0 10 10 -5.0
0 10 11 0
0 10 0 0.0
0 10 1 1
0 10 4 0.0
0 10 5 1
0 10 8 0.0
0 10 9 1
100 RETURN GSerial2to3

waveform GSerialReadRight_smooth:
8 0 3 1.0
9 0 3 0.0
9 0 2 0.0
9 0 1 0.0
0 10 2 8.0
0 10 3 1
8 10 2 -2.0
8 10 3 1
84 10 6 -1.0
84 10 7 1
104 10 6 5.5
104 10 7 1
0 10 14 5.5
0 10 15 0
0 10 4 5.5
0 10 5 0
0 10 10 -5.0
0 10 11 0
0 10 8 -5.0
0 10 9 0
84 10 12 5.5
84 10 13 1
84 10 0 5.5
84 10 1 1
104 10 14 -5.0
104 10 15 1
104 10 4 -5.0
104 10 5 1
124 10 10 5.5
124 10 11 0
124 10 8 5.5
124 10 9 0
124 10 12 -5.0
124 10 13 0
124 10 0 -5.0
124 10 1 0
252 RETURN GSerialReadRight_smooth

waveform GuideSerialReadRightTop_smooth:
8 0 3 1.0
9 0 3 0.0
9 0 2 0.0
9 0 1 0.0
0 10 0 0.0
0 10 1 1
0 10 4 0.0
0 10 5 1
0 10 8 0.0
0 10 9 1
0 10 2 8.0
0 10 3 1
8 10 2 -2.0
8 10 3 1
0 10 14 5.5
0 10 15 1
0 10 6 5.5
0 10 7 1
15 10 10 -5.0
15 10 11 1
30 10 12 5.5
30 10 13 1
180 10 14 -5.0
180 10 15 1
180 10 6 -1.0
180 10 7 1
195 10 10 5.5
195 10 11 1
210 10 12 -5.0
210 10 13 1
400 RETURN GuideSerialReadRightTop_smooth

waveform GuidePixelFlush:
0 10 0 0.0
0 10 1 1
0 10 4 0.0
0 10 5 1
0 10 8 0.0
0 10 9 1
0 10 2 8.0
0 10 3 1
16 10 14 5.5
16 10 15 1
16 10 6 5.5
16 10 7 1
32 10 10 -5.0
32 10 11 1
48 10 12 5.5
48 10 13 1
64 10 14 -5.0
64 10 15 1
64 10 6 -1.0
64 10 7 1
80 10 10 5.5
80 10 11 1
96 10 12 -5.0
96 10 13 1
100 RETURN GuidePixelFlush

waveform GuideSerialReadRightTop:
0 10 10 -5.0
0 10 11 1
0 10 14 5.5
0 10 15 1
0 10 12 -5.0
0 10 13 1
0 10 0 0.0
0 10 1 1
0 10 4 0.0
0 10 5 1
0 10 8 0.0
0 10 9 1
0 10 6 -1.0
0 10 7 1
0 10 2 8.0
0 10 3 1
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
41 10 2 -2.0
41 10 3 1
341 10 12 5.5
341 10 13 1
356 10 14 -5.0
356 10 15 1
371 10 10 5.5
371 10 11 1
371 10 6 5.5
371 10 7 1
386 10 12 -5.0
386 10 13 1
401 10 14 5.5
401 10 15 1
416 10 10 -5.0
416 10 11 1
416 10 6 -1.0
416 10 7 1
716 RETURN GuideSerialReadRightTop

waveform PulseTest:
8 0 3 1.0
9 0 3 0.0
9 0 2 0.0
9 0 1 0.0
10 10 12 -5.0
10 10 13 1
10 10 0 -5.0
10 10 1 1
10 10 14 -5.0
10 10 15 1
10 10 4 -5.0
10 10 5 1
10 10 10 -5.0
10 10 11 1
10 10 8 -5.0
10 10 9 1
10 10 2 -2.0
10 10 3 1
10 10 6 -1.0
10 10 7 1
10 11 10 -9.0
10 11 11 1
10 11 12 -9.0
10 11 13 1
10 11 6 -9.0
10 11 7 1
10 11 8 -9.0
10 11 9 1
10 11 2 -9.0
10 11 3 1
10 11 14 -9.0
10 11 15 1
10 4 12 -9.0
10 4 13 1
10 4 4 -9.0
10 4 5 1
10 4 14 -9.0
10 4 15 1
10 4 0 -9.0
10 4 1 1
10 4 10 -9.0
10 4 11 1
10 4 8 -9.0
10 4 9 1
510 10 12 5.5
510 10 13 1
510 10 0 5.5
510 10 1 1
530 10 12 -5.0
530 10 13 1
530 10 0 -5.0
530 10 1 1
1030 10 14 5.5
1030 10 15 1
1030 10 4 5.5
1030 10 5 1
1050 10 14 -5.0
1050 10 15 1
1050 10 4 -5.0
1050 10 5 1
1550 10 10 5.5
1550 10 11 1
1550 10 8 5.5
1550 10 9 1
1570 10 10 -5.0
1570 10 11 1
1570 10 8 -5.0
1570 10 9 1
2070 10 2 8.0
2070 10 3 1
2090 10 2 -2.0
2090 10 3 1
2590 10 6 5.5
2590 10 7 1
2610 10 6 -1.0
2610 10 7 1
3110 11 10 3.0
3110 11 11 1
3130 11 10 -9.0
3130 11 11 1
3630 11 6 3.0
3630 11 7 1
3650 11 6 -9.0
3650 11 7 1
4150 11 2 3.0
4150 11 3 1
4170 11 2 -9.0
4170 11 3 1
4670 11 8 3.0
4670 11 9 1
4690 11 8 -9.0
4690 11 9 1
5190 11 12 3.0
5190 11 13 1
5210 11 12 -9.0
5210 11 13 1
5710 11 14 3.0
5710 11 15 1
5730 11 14 -9.0
5730 11 15 1
6230 4 12 3.0
6230 4 13 1
6230 4 4 3.0
6230 4 5 1
6250 4 12 -9.0
6250 4 13 1
6250 4 4 -9.0
6250 4 5 1
6750 4 14 3.0
6750 4 15 1
6750 4 0 3.0
6750 4 1 1
6770 4 14 -9.0
6770 4 15 1
6770 4 0 -9.0
6770 4 1 1
7270 4 10 3.0
7270 4 11 1
7270 4 8 3.0
7270 4 9 1
7290 4 10 -9.0
7290 4 11 1
7290 4 8 -9.0
7290 4 9 1
7790 RETURN PulseTest

waveform GSerialReadRight:
0 10 10 -5.0
0 10 11 1
0 10 8 -5.0
0 10 9 1
0 10 14 5.5
0 10 15 1
0 10 4 5.5
0 10 5 1
0 10 12 -5.0
0 10 13 1
0 10 0 -5.0
0 10 1 1
0 10 6 -1.0
0 10 7 1
0 10 2 8.0
0 10 3 1
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
41 10 2 -2.0
41 10 3 1
341 10 12 5.5
341 10 13 1
341 10 0 5.5
341 10 1 1
356 10 14 -5.0
356 10 15 1
356 10 4 -5.0
356 10 5 1
371 10 10 5.5
371 10 11 1
371 10 8 5.5
371 10 9 1
371 10 6 5.5
371 10 7 1
386 10 12 -5.0
386 10 13 1
386 10 0 -5.0
386 10 1 1
401 10 14 5.5
401 10 15 1
401 10 4 5.5
401 10 5 1
416 10 10 -5.0
416 10 11 1
416 10 8 -5.0
416 10 9 1
416 10 6 -1.0
416 10 7 1
716 RETURN GSerialReadRight

waveform GSerialReadRightReversed:
0 10 10 -5.0
0 10 11 1
0 10 8 -5.0
0 10 9 1
0 10 14 -5.0
0 10 15 1
0 10 4 -5.0
0 10 5 1
0 10 12 5.5
0 10 13 1
0 10 0 5.5
0 10 1 1
0 10 6 5.5
0 10 7 1
0 10 2 8.0
0 10 3 1
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
41 10 2 -2.0
41 10 3 1
341 10 10 5.5
341 10 11 1
341 10 8 5.5
341 10 9 1
356 10 12 -5.0
356 10 13 1
356 10 0 -5.0
356 10 1 1
371 10 14 5.5
371 10 15 1
371 10 4 5.5
371 10 5 1
371 10 6 5.5
371 10 7 1
386 10 10 -5.0
386 10 11 1
386 10 8 -5.0
386 10 9 1
401 10 12 5.5
401 10 13 1
401 10 0 5.5
401 10 1 1
401 10 6 -1.0
401 10 7 1
416 10 6 -1.0
416 10 7 1
716 RETURN GSerialReadRightReversed

waveform GSerialReadLeft:
0 10 12 -5.0
0 10 13 1
0 10 0 -5.0
0 10 1 1
0 10 14 5.5
0 10 15 1
0 10 4 5.5
0 10 5 1
0 10 10 -5.0
0 10 11 1
0 10 8 -5.0
0 10 9 1
0 10 6 -1.0
0 10 7 1
0 10 2 8.0
0 10 3 1
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
41 10 2 -2.0
41 10 3 1
341 10 10 5.5
341 10 11 1
341 10 8 5.5
341 10 9 1
356 10 14 -5.0
356 10 15 1
356 10 4 -5.0
356 10 5 1
371 10 12 5.5
371 10 13 1
371 10 0 5.5
371 10 1 1
371 10 6 5.5
371 10 7 1
386 10 10 -5.0
386 10 11 1
386 10 8 -5.0
386 10 9 1
401 10 14 5.5
401 10 15 1
401 10 4 5.5
401 10 5 1
416 10 12 -5.0
416 10 13 1
416 10 0 -5.0
416 10 1 1
416 10 6 -1.0
416 10 7 1
716 RETURN GSerialReadLeft

waveform Wait1ms:
99999 RETURN Wait1ms

waveform Wait1us:
100 RETURN Wait1us

waveform Wait10ns:
1 RETURN Wait10ns

waveform OpenBLC:
0 3 2 0.0
0 3 10 0.0
0 3 0 0.0
0 3 1 0.0
1 RETURN OpenBLC

waveform GroundBLC:
0 3 2 1.0
0 3 10 1.0
0 3 0 1.0
0 3 1 1.0
1 RETURN GroundBLC

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

waveform wPixel:
0 0 3 1.0
1 0 3 0.0
1 0 1 0.0
1 0 2 0.0
2 0 0 0.0
3 RETURN wPixel

waveform ADClamp:
0 5 0 1.0
0 6 0 1.0
1 RETURN ADClamp

waveform ADClamp_:
0 5 0 0.0
0 6 0 0.0
1 RETURN ADClamp_

parameter Expose=0
parameter Readout=0
parameter ShutterEnable=1
parameter shutterdelay=0
parameter exptime=0
parameter GReadout=0
parameter FReadout=0
parameter SReadout=0
parameter Idle=1
parameter GLines=1540
parameter GPixels=2093
parameter Abort=0
parameter Delay_FrameStart=264013
parameter Delay_PixelStart=5
parameter Delay_LTStart=156
parameter Guiding=0
parameter GFrames=1
parameter G_ROI_Height=100
parameter G_ROI_Width=2093
parameter G_PreFlush=512
parameter G_PostFlush=1625
parameter G_PixelPreFlush=0
parameter G_PixelPostFlush=0
parameter SerialPrescan=8
parameter SerialOverscan=21
parameter ParallelOverscan=0
parameter ImageCols=2064
parameter ImageRows=1540

