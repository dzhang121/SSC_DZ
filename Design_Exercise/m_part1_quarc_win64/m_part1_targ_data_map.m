  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 6;
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
    ;% Auto data (m_part1_P)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% m_part1_P.HILWriteAnalog_channels
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 64;
      section.data(64)  = dumData; %prealloc
      
	  ;% m_part1_P.HILInitialize_OOTerminate
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_P.HILInitialize_OOExit
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 1;
	
	  ;% m_part1_P.HILInitialize_OOStart
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 2;
	
	  ;% m_part1_P.HILInitialize_OOEnter
	  section.data(4).logicalSrcIdx = 4;
	  section.data(4).dtTransOffset = 3;
	
	  ;% m_part1_P.HILInitialize_AOFinal
	  section.data(5).logicalSrcIdx = 5;
	  section.data(5).dtTransOffset = 4;
	
	  ;% m_part1_P.HILInitialize_POFinal
	  section.data(6).logicalSrcIdx = 6;
	  section.data(6).dtTransOffset = 5;
	
	  ;% m_part1_P.HILInitialize_AIHigh
	  section.data(7).logicalSrcIdx = 7;
	  section.data(7).dtTransOffset = 6;
	
	  ;% m_part1_P.HILInitialize_AILow
	  section.data(8).logicalSrcIdx = 8;
	  section.data(8).dtTransOffset = 7;
	
	  ;% m_part1_P.HILInitialize_AOHigh
	  section.data(9).logicalSrcIdx = 9;
	  section.data(9).dtTransOffset = 8;
	
	  ;% m_part1_P.HILInitialize_AOLow
	  section.data(10).logicalSrcIdx = 10;
	  section.data(10).dtTransOffset = 9;
	
	  ;% m_part1_P.HILInitialize_AOInitial
	  section.data(11).logicalSrcIdx = 11;
	  section.data(11).dtTransOffset = 10;
	
	  ;% m_part1_P.HILInitialize_AOWatchdog
	  section.data(12).logicalSrcIdx = 12;
	  section.data(12).dtTransOffset = 11;
	
	  ;% m_part1_P.HILInitialize_POFrequency
	  section.data(13).logicalSrcIdx = 13;
	  section.data(13).dtTransOffset = 12;
	
	  ;% m_part1_P.HILInitialize_POLeading
	  section.data(14).logicalSrcIdx = 14;
	  section.data(14).dtTransOffset = 13;
	
	  ;% m_part1_P.HILInitialize_POTrailing
	  section.data(15).logicalSrcIdx = 15;
	  section.data(15).dtTransOffset = 14;
	
	  ;% m_part1_P.HILInitialize_POInitial
	  section.data(16).logicalSrcIdx = 16;
	  section.data(16).dtTransOffset = 15;
	
	  ;% m_part1_P.HILInitialize_POWatchdog
	  section.data(17).logicalSrcIdx = 17;
	  section.data(17).dtTransOffset = 16;
	
	  ;% m_part1_P.EncoderResolutionElevationradco
	  section.data(18).logicalSrcIdx = 18;
	  section.data(18).dtTransOffset = 17;
	
	  ;% m_part1_P.EncoderResolutionPitchradcount_
	  section.data(19).logicalSrcIdx = 19;
	  section.data(19).dtTransOffset = 18;
	
	  ;% m_part1_P.EncoderResolutionTravelradcount
	  section.data(20).logicalSrcIdx = 20;
	  section.data(20).dtTransOffset = 19;
	
	  ;% m_part1_P.Integrator_IC
	  section.data(21).logicalSrcIdx = 21;
	  section.data(21).dtTransOffset = 20;
	
	  ;% m_part1_P.Integrator_UpperSat
	  section.data(22).logicalSrcIdx = 22;
	  section.data(22).dtTransOffset = 21;
	
	  ;% m_part1_P.Integrator_LowerSat
	  section.data(23).logicalSrcIdx = 23;
	  section.data(23).dtTransOffset = 22;
	
	  ;% m_part1_P.Integrator_IC_c
	  section.data(24).logicalSrcIdx = 24;
	  section.data(24).dtTransOffset = 23;
	
	  ;% m_part1_P.Integrator_UpperSat_i
	  section.data(25).logicalSrcIdx = 25;
	  section.data(25).dtTransOffset = 24;
	
	  ;% m_part1_P.Integrator_LowerSat_o
	  section.data(26).logicalSrcIdx = 26;
	  section.data(26).dtTransOffset = 25;
	
	  ;% m_part1_P.TravelLowpass_A
	  section.data(27).logicalSrcIdx = 27;
	  section.data(27).dtTransOffset = 26;
	
	  ;% m_part1_P.TravelLowpass_C
	  section.data(28).logicalSrcIdx = 28;
	  section.data(28).dtTransOffset = 27;
	
	  ;% m_part1_P.YawDemandNEEDTOCHANGETHISVALUET
	  section.data(29).logicalSrcIdx = 29;
	  section.data(29).dtTransOffset = 28;
	
	  ;% m_part1_P.K_tp_Gain
	  section.data(30).logicalSrcIdx = 30;
	  section.data(30).dtTransOffset = 29;
	
	  ;% m_part1_P.Saturation_UpperSat
	  section.data(31).logicalSrcIdx = 31;
	  section.data(31).dtTransOffset = 30;
	
	  ;% m_part1_P.Saturation_LowerSat
	  section.data(32).logicalSrcIdx = 32;
	  section.data(32).dtTransOffset = 31;
	
	  ;% m_part1_P.Gain2_Gain
	  section.data(33).logicalSrcIdx = 33;
	  section.data(33).dtTransOffset = 32;
	
	  ;% m_part1_P.TravelDeriv2_A
	  section.data(34).logicalSrcIdx = 34;
	  section.data(34).dtTransOffset = 33;
	
	  ;% m_part1_P.TravelDeriv2_C
	  section.data(35).logicalSrcIdx = 35;
	  section.data(35).dtTransOffset = 34;
	
	  ;% m_part1_P.TravelDeriv2_D
	  section.data(36).logicalSrcIdx = 36;
	  section.data(36).dtTransOffset = 35;
	
	  ;% m_part1_P.K_td_Gain
	  section.data(37).logicalSrcIdx = 37;
	  section.data(37).dtTransOffset = 36;
	
	  ;% m_part1_P.Pcmd_UpperSat
	  section.data(38).logicalSrcIdx = 38;
	  section.data(38).dtTransOffset = 37;
	
	  ;% m_part1_P.Pcmd_LowerSat
	  section.data(39).logicalSrcIdx = 39;
	  section.data(39).dtTransOffset = 38;
	
	  ;% m_part1_P.Gain1_Gain
	  section.data(40).logicalSrcIdx = 40;
	  section.data(40).dtTransOffset = 39;
	
	  ;% m_part1_P.K_pp_Gain
	  section.data(41).logicalSrcIdx = 41;
	  section.data(41).dtTransOffset = 40;
	
	  ;% m_part1_P.TravelDeriv1_A
	  section.data(42).logicalSrcIdx = 42;
	  section.data(42).dtTransOffset = 41;
	
	  ;% m_part1_P.TravelDeriv1_C
	  section.data(43).logicalSrcIdx = 43;
	  section.data(43).dtTransOffset = 42;
	
	  ;% m_part1_P.TravelDeriv1_D
	  section.data(44).logicalSrcIdx = 44;
	  section.data(44).dtTransOffset = 43;
	
	  ;% m_part1_P.K_pd_Gain
	  section.data(45).logicalSrcIdx = 45;
	  section.data(45).dtTransOffset = 44;
	
	  ;% m_part1_P.Saturation1_UpperSat
	  section.data(46).logicalSrcIdx = 46;
	  section.data(46).dtTransOffset = 45;
	
	  ;% m_part1_P.Saturation1_LowerSat
	  section.data(47).logicalSrcIdx = 47;
	  section.data(47).dtTransOffset = 46;
	
	  ;% m_part1_P.ElevoffsetDONOTTOUCH_Value
	  section.data(48).logicalSrcIdx = 48;
	  section.data(48).dtTransOffset = 47;
	
	  ;% m_part1_P.ElevationInputTHISISTHEVALUEYOU
	  section.data(49).logicalSrcIdx = 49;
	  section.data(49).dtTransOffset = 48;
	
	  ;% m_part1_P.Saturation_UpperSat_n
	  section.data(50).logicalSrcIdx = 50;
	  section.data(50).dtTransOffset = 49;
	
	  ;% m_part1_P.Saturation_LowerSat_n
	  section.data(51).logicalSrcIdx = 51;
	  section.data(51).dtTransOffset = 50;
	
	  ;% m_part1_P.Front_Gain
	  section.data(52).logicalSrcIdx = 52;
	  section.data(52).dtTransOffset = 51;
	
	  ;% m_part1_P.Back_Gain
	  section.data(53).logicalSrcIdx = 53;
	  section.data(53).dtTransOffset = 52;
	
	  ;% m_part1_P.UPMVoltageLimitV_UpperSat
	  section.data(54).logicalSrcIdx = 54;
	  section.data(54).dtTransOffset = 53;
	
	  ;% m_part1_P.UPMVoltageLimitV_LowerSat
	  section.data(55).logicalSrcIdx = 55;
	  section.data(55).dtTransOffset = 54;
	
	  ;% m_part1_P.CableGainPreCompensation_Gain
	  section.data(56).logicalSrcIdx = 56;
	  section.data(56).dtTransOffset = 55;
	
	  ;% m_part1_P.DACBLimitV_UpperSat
	  section.data(57).logicalSrcIdx = 57;
	  section.data(57).dtTransOffset = 56;
	
	  ;% m_part1_P.DACBLimitV_LowerSat
	  section.data(58).logicalSrcIdx = 58;
	  section.data(58).dtTransOffset = 57;
	
	  ;% m_part1_P.Gain_Gain
	  section.data(59).logicalSrcIdx = 59;
	  section.data(59).dtTransOffset = 58;
	
	  ;% m_part1_P.TravelDeriv_A
	  section.data(60).logicalSrcIdx = 60;
	  section.data(60).dtTransOffset = 59;
	
	  ;% m_part1_P.TravelDeriv_C
	  section.data(61).logicalSrcIdx = 61;
	  section.data(61).dtTransOffset = 60;
	
	  ;% m_part1_P.TravelDeriv_D
	  section.data(62).logicalSrcIdx = 62;
	  section.data(62).dtTransOffset = 61;
	
	  ;% m_part1_P.K_pi_Gain
	  section.data(63).logicalSrcIdx = 63;
	  section.data(63).dtTransOffset = 62;
	
	  ;% m_part1_P.K_ti_Gain
	  section.data(64).logicalSrcIdx = 64;
	  section.data(64).dtTransOffset = 63;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% m_part1_P.HILInitialize_CKChannels
	  section.data(1).logicalSrcIdx = 65;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_P.HILInitialize_DOWatchdog
	  section.data(2).logicalSrcIdx = 66;
	  section.data(2).dtTransOffset = 3;
	
	  ;% m_part1_P.HILInitialize_EIInitial
	  section.data(3).logicalSrcIdx = 67;
	  section.data(3).dtTransOffset = 4;
	
	  ;% m_part1_P.HILInitialize_POModes
	  section.data(4).logicalSrcIdx = 68;
	  section.data(4).dtTransOffset = 5;
	
	  ;% m_part1_P.HILInitialize_POConfiguration
	  section.data(5).logicalSrcIdx = 69;
	  section.data(5).dtTransOffset = 6;
	
	  ;% m_part1_P.HILInitialize_POAlignment
	  section.data(6).logicalSrcIdx = 70;
	  section.data(6).dtTransOffset = 7;
	
	  ;% m_part1_P.HILInitialize_POPolarity
	  section.data(7).logicalSrcIdx = 71;
	  section.data(7).dtTransOffset = 8;
	
	  ;% m_part1_P.HILReadEncoderTimebase_Clock
	  section.data(8).logicalSrcIdx = 72;
	  section.data(8).dtTransOffset = 9;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% m_part1_P.HILInitialize_AIChannels
	  section.data(1).logicalSrcIdx = 73;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_P.HILInitialize_AOChannels
	  section.data(2).logicalSrcIdx = 74;
	  section.data(2).dtTransOffset = 8;
	
	  ;% m_part1_P.HILInitialize_EIChannels
	  section.data(3).logicalSrcIdx = 75;
	  section.data(3).dtTransOffset = 16;
	
	  ;% m_part1_P.HILInitialize_EIQuadrature
	  section.data(4).logicalSrcIdx = 76;
	  section.data(4).dtTransOffset = 24;
	
	  ;% m_part1_P.HILInitialize_POChannels
	  section.data(5).logicalSrcIdx = 77;
	  section.data(5).dtTransOffset = 25;
	
	  ;% m_part1_P.HILReadEncoderTimebase_Channels
	  section.data(6).logicalSrcIdx = 78;
	  section.data(6).dtTransOffset = 33;
	
	  ;% m_part1_P.HILReadEncoderTimebase_SamplesI
	  section.data(7).logicalSrcIdx = 79;
	  section.data(7).dtTransOffset = 36;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 37;
      section.data(37)  = dumData; %prealloc
      
	  ;% m_part1_P.HILInitialize_Active
	  section.data(1).logicalSrcIdx = 80;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_P.HILInitialize_AOTerminate
	  section.data(2).logicalSrcIdx = 81;
	  section.data(2).dtTransOffset = 1;
	
	  ;% m_part1_P.HILInitialize_AOExit
	  section.data(3).logicalSrcIdx = 82;
	  section.data(3).dtTransOffset = 2;
	
	  ;% m_part1_P.HILInitialize_DOTerminate
	  section.data(4).logicalSrcIdx = 83;
	  section.data(4).dtTransOffset = 3;
	
	  ;% m_part1_P.HILInitialize_DOExit
	  section.data(5).logicalSrcIdx = 84;
	  section.data(5).dtTransOffset = 4;
	
	  ;% m_part1_P.HILInitialize_POTerminate
	  section.data(6).logicalSrcIdx = 85;
	  section.data(6).dtTransOffset = 5;
	
	  ;% m_part1_P.HILInitialize_POExit
	  section.data(7).logicalSrcIdx = 86;
	  section.data(7).dtTransOffset = 6;
	
	  ;% m_part1_P.HILInitialize_CKPStart
	  section.data(8).logicalSrcIdx = 87;
	  section.data(8).dtTransOffset = 7;
	
	  ;% m_part1_P.HILInitialize_CKPEnter
	  section.data(9).logicalSrcIdx = 88;
	  section.data(9).dtTransOffset = 8;
	
	  ;% m_part1_P.HILInitialize_CKStart
	  section.data(10).logicalSrcIdx = 89;
	  section.data(10).dtTransOffset = 9;
	
	  ;% m_part1_P.HILInitialize_CKEnter
	  section.data(11).logicalSrcIdx = 90;
	  section.data(11).dtTransOffset = 10;
	
	  ;% m_part1_P.HILInitialize_AIPStart
	  section.data(12).logicalSrcIdx = 91;
	  section.data(12).dtTransOffset = 11;
	
	  ;% m_part1_P.HILInitialize_AIPEnter
	  section.data(13).logicalSrcIdx = 92;
	  section.data(13).dtTransOffset = 12;
	
	  ;% m_part1_P.HILInitialize_AOPStart
	  section.data(14).logicalSrcIdx = 93;
	  section.data(14).dtTransOffset = 13;
	
	  ;% m_part1_P.HILInitialize_AOPEnter
	  section.data(15).logicalSrcIdx = 94;
	  section.data(15).dtTransOffset = 14;
	
	  ;% m_part1_P.HILInitialize_AOStart
	  section.data(16).logicalSrcIdx = 95;
	  section.data(16).dtTransOffset = 15;
	
	  ;% m_part1_P.HILInitialize_AOEnter
	  section.data(17).logicalSrcIdx = 96;
	  section.data(17).dtTransOffset = 16;
	
	  ;% m_part1_P.HILInitialize_AOReset
	  section.data(18).logicalSrcIdx = 97;
	  section.data(18).dtTransOffset = 17;
	
	  ;% m_part1_P.HILInitialize_DOPStart
	  section.data(19).logicalSrcIdx = 98;
	  section.data(19).dtTransOffset = 18;
	
	  ;% m_part1_P.HILInitialize_DOPEnter
	  section.data(20).logicalSrcIdx = 99;
	  section.data(20).dtTransOffset = 19;
	
	  ;% m_part1_P.HILInitialize_DOStart
	  section.data(21).logicalSrcIdx = 100;
	  section.data(21).dtTransOffset = 20;
	
	  ;% m_part1_P.HILInitialize_DOEnter
	  section.data(22).logicalSrcIdx = 101;
	  section.data(22).dtTransOffset = 21;
	
	  ;% m_part1_P.HILInitialize_DOReset
	  section.data(23).logicalSrcIdx = 102;
	  section.data(23).dtTransOffset = 22;
	
	  ;% m_part1_P.HILInitialize_EIPStart
	  section.data(24).logicalSrcIdx = 103;
	  section.data(24).dtTransOffset = 23;
	
	  ;% m_part1_P.HILInitialize_EIPEnter
	  section.data(25).logicalSrcIdx = 104;
	  section.data(25).dtTransOffset = 24;
	
	  ;% m_part1_P.HILInitialize_EIStart
	  section.data(26).logicalSrcIdx = 105;
	  section.data(26).dtTransOffset = 25;
	
	  ;% m_part1_P.HILInitialize_EIEnter
	  section.data(27).logicalSrcIdx = 106;
	  section.data(27).dtTransOffset = 26;
	
	  ;% m_part1_P.HILInitialize_POPStart
	  section.data(28).logicalSrcIdx = 107;
	  section.data(28).dtTransOffset = 27;
	
	  ;% m_part1_P.HILInitialize_POPEnter
	  section.data(29).logicalSrcIdx = 108;
	  section.data(29).dtTransOffset = 28;
	
	  ;% m_part1_P.HILInitialize_POStart
	  section.data(30).logicalSrcIdx = 109;
	  section.data(30).dtTransOffset = 29;
	
	  ;% m_part1_P.HILInitialize_POEnter
	  section.data(31).logicalSrcIdx = 110;
	  section.data(31).dtTransOffset = 30;
	
	  ;% m_part1_P.HILInitialize_POReset
	  section.data(32).logicalSrcIdx = 111;
	  section.data(32).dtTransOffset = 31;
	
	  ;% m_part1_P.HILInitialize_OOReset
	  section.data(33).logicalSrcIdx = 112;
	  section.data(33).dtTransOffset = 32;
	
	  ;% m_part1_P.HILInitialize_DOFinal
	  section.data(34).logicalSrcIdx = 113;
	  section.data(34).dtTransOffset = 33;
	
	  ;% m_part1_P.HILInitialize_DOInitial
	  section.data(35).logicalSrcIdx = 114;
	  section.data(35).dtTransOffset = 34;
	
	  ;% m_part1_P.HILReadEncoderTimebase_Active
	  section.data(36).logicalSrcIdx = 115;
	  section.data(36).dtTransOffset = 35;
	
	  ;% m_part1_P.HILWriteAnalog_Active
	  section.data(37).logicalSrcIdx = 116;
	  section.data(37).dtTransOffset = 36;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% m_part1_P.HILReadEncoderTimebase_Overflow
	  section.data(1).logicalSrcIdx = 117;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
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
    ;% Auto data (m_part1_B)
    ;%
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% m_part1_B.TravelLowpass
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_B.Gain2
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% m_part1_B.Gain1
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% m_part1_B.ElevationInputTHISISTHEVALUEYOU
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% m_part1_B.Saturation
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% m_part1_B.DACBLimitV
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% m_part1_B.Gain
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
	  ;% m_part1_B.K_pi
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 10;
	
	  ;% m_part1_B.K_ti
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 11;
	
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
    nTotSects     = 6;
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
    ;% Auto data (m_part1_DW)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILInitialize_AIMinimums
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_DW.HILInitialize_AIMaximums
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 8;
	
	  ;% m_part1_DW.HILInitialize_AOMinimums
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 16;
	
	  ;% m_part1_DW.HILInitialize_AOMaximums
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 24;
	
	  ;% m_part1_DW.HILInitialize_AOVoltages
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 32;
	
	  ;% m_part1_DW.HILInitialize_FilterFrequency
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 40;
	
	  ;% m_part1_DW.HILInitialize_POSortedFreqs
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 48;
	
	  ;% m_part1_DW.HILInitialize_POValues
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 56;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILInitialize_Card
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILReadEncoderTimebase_Task
	  section.data(1).logicalSrcIdx = 9;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILWriteAnalog_PWORK
	  section.data(1).logicalSrcIdx = 10;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_DW.Elev_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 11;
	  section.data(2).dtTransOffset = 1;
	
	  ;% m_part1_DW.Input_PWORK.LoggedData
	  section.data(3).logicalSrcIdx = 12;
	  section.data(3).dtTransOffset = 2;
	
	  ;% m_part1_DW.Pitch_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 13;
	  section.data(4).dtTransOffset = 3;
	
	  ;% m_part1_DW.Travel_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 14;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 7;
      section.data(7)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILInitialize_ClockModes
	  section.data(1).logicalSrcIdx = 15;
	  section.data(1).dtTransOffset = 0;
	
	  ;% m_part1_DW.HILInitialize_QuadratureModes
	  section.data(2).logicalSrcIdx = 16;
	  section.data(2).dtTransOffset = 3;
	
	  ;% m_part1_DW.HILInitialize_InitialEICounts
	  section.data(3).logicalSrcIdx = 17;
	  section.data(3).dtTransOffset = 11;
	
	  ;% m_part1_DW.HILInitialize_POModeValues
	  section.data(4).logicalSrcIdx = 18;
	  section.data(4).dtTransOffset = 19;
	
	  ;% m_part1_DW.HILInitialize_POAlignValues
	  section.data(5).logicalSrcIdx = 19;
	  section.data(5).dtTransOffset = 27;
	
	  ;% m_part1_DW.HILInitialize_POPolarityVals
	  section.data(6).logicalSrcIdx = 20;
	  section.data(6).dtTransOffset = 35;
	
	  ;% m_part1_DW.HILReadEncoderTimebase_Buffer
	  section.data(7).logicalSrcIdx = 21;
	  section.data(7).dtTransOffset = 43;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% m_part1_DW.HILInitialize_POSortedChans
	  section.data(1).logicalSrcIdx = 22;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(6) = section;
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


  targMap.checksum0 = 2714981747;
  targMap.checksum1 = 1623036098;
  targMap.checksum2 = 1701346880;
  targMap.checksum3 = 3415083923;

