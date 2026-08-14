    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 33;
            section.data(33)  = dumData; %prealloc

                    ;% rtP.VAR_ESS
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.VAR_GEN
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.VAR_PROP_ARCH
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.VAR_SHORE
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.capEnergy_kWh
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.capPower_kW
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.designSpeed_kn
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.dpBase_kW
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtP.dpRippleAmp_kW
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtP.dt_s
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtP.essEnergy_kWh
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtP.essEtaRT
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtP.essPower_kW
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtP.essSocInit
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtP.etaDrive
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtP.etaGearbox
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtP.etaMotor
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

                    ;% rtP.etaShaftMach
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 17;

                    ;% rtP.genLoadMax
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 18;

                    ;% rtP.genSfocLoadOpt
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 19;

                    ;% rtP.genSfocMin
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 20;

                    ;% rtP.genUnitPower_kW
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 21;

                    ;% rtP.hotelTab_kW
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 22;

                    ;% rtP.mePower_kW
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 29;

                    ;% rtP.meSfocLoadOpt
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 30;

                    ;% rtP.meSfocMin
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 31;

                    ;% rtP.modeTab
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 32;

                    ;% rtP.propPower_kW
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 39;

                    ;% rtP.seaMargin
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 40;

                    ;% rtP.seaTab
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 41;

                    ;% rtP.shorePower_kW
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 48;

                    ;% rtP.tBreak_s
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 49;

                    ;% rtP.vTab_kn
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 56;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 18;
            section.data(18)  = dumData; %prealloc

                    ;% rtB.gl50hilnqp
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.hilqji5gdq
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.gz14omdwtw
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.mb1xtmltkg
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtB.lfpq1utjp4
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtB.p5wotw520i
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtB.fvv4zlotiq
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtB.cnrxqg2uvw
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtB.dfqk3bpfgn
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtB.m5uiaez0ba
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtB.kcrik4xstr
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtB.kdhagxpynr
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtB.onrcgyijti
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtB.d230kxrswf
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtB.pnskaoz2i1
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtB.f0ezfwtglf
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtB.cil41qsm0q
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

                    ;% rtB.ei0bd1hzho
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 17;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 1;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtDW.apgyxiu2m5
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ghghfedje2
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.g004hjplcr
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.ld1wedliu1
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 18;
            section.data(18)  = dumData; %prealloc

                    ;% rtDW.i3cbnclgmi.AQHandles
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.bzr5wpcu0u.AQHandles
                    section.data(2).logicalSrcIdx = 5;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.gcdtfu0izy.AQHandles
                    section.data(3).logicalSrcIdx = 6;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.hc0g1bqvax.AQHandles
                    section.data(4).logicalSrcIdx = 7;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.otwyczwnk0.AQHandles
                    section.data(5).logicalSrcIdx = 8;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.aolimedzpg.AQHandles
                    section.data(6).logicalSrcIdx = 9;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.akocgqojsa.AQHandles
                    section.data(7).logicalSrcIdx = 10;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.hsuwofnuzj.AQHandles
                    section.data(8).logicalSrcIdx = 11;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.mo4o1k35kz.AQHandles
                    section.data(9).logicalSrcIdx = 12;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.erpmxjhqfn.AQHandles
                    section.data(10).logicalSrcIdx = 13;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.aju3s5wvn5.AQHandles
                    section.data(11).logicalSrcIdx = 14;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.a5pbjf2bco.AQHandles
                    section.data(12).logicalSrcIdx = 15;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.gb43qecqrq.AQHandles
                    section.data(13).logicalSrcIdx = 16;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.bq1xwm5x5t.AQHandles
                    section.data(14).logicalSrcIdx = 17;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.p21fayabmj.AQHandles
                    section.data(15).logicalSrcIdx = 18;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.b3vtdgkjwj.AQHandles
                    section.data(16).logicalSrcIdx = 19;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.kyikgzluuk.AQHandles
                    section.data(17).logicalSrcIdx = 20;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.gjxcvl33ck.AQHandles
                    section.data(18).logicalSrcIdx = 21;
                    section.data(18).dtTransOffset = 17;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 31;
            section.data(31)  = dumData; %prealloc

                    ;% rtDW.gopcmvzwzo
                    section.data(1).logicalSrcIdx = 22;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.d4xn1qmcjz
                    section.data(2).logicalSrcIdx = 23;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.j5pupmqvzj
                    section.data(3).logicalSrcIdx = 24;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.kfsmy5nhrg
                    section.data(4).logicalSrcIdx = 25;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.bb4a2et044
                    section.data(5).logicalSrcIdx = 26;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.epkx35rzyu
                    section.data(6).logicalSrcIdx = 27;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.l2pdw0mk3h
                    section.data(7).logicalSrcIdx = 28;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.hh4ni0qlqp
                    section.data(8).logicalSrcIdx = 29;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.l0gphmoarx
                    section.data(9).logicalSrcIdx = 30;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.cqnkjxqv55
                    section.data(10).logicalSrcIdx = 31;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.bg1h5lko0y
                    section.data(11).logicalSrcIdx = 32;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.fjbkmfbslj
                    section.data(12).logicalSrcIdx = 33;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.dgkuxrxtje
                    section.data(13).logicalSrcIdx = 34;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.a31hhvnwsj
                    section.data(14).logicalSrcIdx = 35;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.ngajz25ekh
                    section.data(15).logicalSrcIdx = 36;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.kexgmrrezp
                    section.data(16).logicalSrcIdx = 37;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.iw3qrmz15r
                    section.data(17).logicalSrcIdx = 38;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.fulurhbitn
                    section.data(18).logicalSrcIdx = 39;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.jaftjltlef
                    section.data(19).logicalSrcIdx = 40;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.ikflqi0zlu
                    section.data(20).logicalSrcIdx = 41;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.g5mytuiu4o
                    section.data(21).logicalSrcIdx = 42;
                    section.data(21).dtTransOffset = 20;

                    ;% rtDW.duw1k53fc3
                    section.data(22).logicalSrcIdx = 43;
                    section.data(22).dtTransOffset = 21;

                    ;% rtDW.m2uc1isopw
                    section.data(23).logicalSrcIdx = 44;
                    section.data(23).dtTransOffset = 22;

                    ;% rtDW.gx02mobzma
                    section.data(24).logicalSrcIdx = 45;
                    section.data(24).dtTransOffset = 23;

                    ;% rtDW.h0g2x3id0c
                    section.data(25).logicalSrcIdx = 46;
                    section.data(25).dtTransOffset = 24;

                    ;% rtDW.bca10yuhrm
                    section.data(26).logicalSrcIdx = 47;
                    section.data(26).dtTransOffset = 25;

                    ;% rtDW.a3s43c33t1
                    section.data(27).logicalSrcIdx = 48;
                    section.data(27).dtTransOffset = 26;

                    ;% rtDW.glsziqwr0g
                    section.data(28).logicalSrcIdx = 49;
                    section.data(28).dtTransOffset = 27;

                    ;% rtDW.dfjcrbvan3
                    section.data(29).logicalSrcIdx = 50;
                    section.data(29).dtTransOffset = 28;

                    ;% rtDW.hxeiachyfn
                    section.data(30).logicalSrcIdx = 51;
                    section.data(30).dtTransOffset = 29;

                    ;% rtDW.hwko3b3qnq
                    section.data(31).logicalSrcIdx = 52;
                    section.data(31).dtTransOffset = 30;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 17;
            section.data(17)  = dumData; %prealloc

                    ;% rtDW.lpsgu5es3j
                    section.data(1).logicalSrcIdx = 53;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.c04c2c1uz5
                    section.data(2).logicalSrcIdx = 54;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.ow4ngcq1yw
                    section.data(3).logicalSrcIdx = 55;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.mtizrmosmh
                    section.data(4).logicalSrcIdx = 56;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.mha25ovryl
                    section.data(5).logicalSrcIdx = 57;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.eh2goxj3mp
                    section.data(6).logicalSrcIdx = 58;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.lkz5h5cj2b
                    section.data(7).logicalSrcIdx = 59;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.kagccggrko
                    section.data(8).logicalSrcIdx = 60;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.dvphm5yvsu
                    section.data(9).logicalSrcIdx = 61;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.de0zcndrz0
                    section.data(10).logicalSrcIdx = 62;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.nfuqnvdmny
                    section.data(11).logicalSrcIdx = 63;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.m105bjvj2y
                    section.data(12).logicalSrcIdx = 64;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.inpj01j1ka
                    section.data(13).logicalSrcIdx = 65;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.azz1zaskew
                    section.data(14).logicalSrcIdx = 66;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.nztbhmwd2k
                    section.data(15).logicalSrcIdx = 67;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.hwa2ccbpez
                    section.data(16).logicalSrcIdx = 68;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.ezajqet5fh
                    section.data(17).logicalSrcIdx = 69;
                    section.data(17).dtTransOffset = 16;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 6497841;
    targMap.checksum1 = 2502310611;
    targMap.checksum2 = 2646175706;
    targMap.checksum3 = 3966476244;

