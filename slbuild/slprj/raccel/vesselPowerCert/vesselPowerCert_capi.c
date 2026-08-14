#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "vesselPowerCert_capi_host.h"
#define sizeof(...) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "vesselPowerCert.h"
#include "vesselPowerCert_capi.h"
#include "vesselPowerCert_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage" ) , TARGET_STRING ( "P_afterEss_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage" ) , TARGET_STRING ( "P_ess_kW" ) , 1 , 0 , 0 , 0 , 0 } , { 2 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage" ) , TARGET_STRING ( "SOC" ) , 2 , 0 , 0 , 0 , 0 } , { 3 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets" ) , TARGET_STRING ( "nRun" ) , 0 , 0 , 0 , 0 , 0 } , { 4 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets" ) , TARGET_STRING ( "loadFrac" ) , 1 , 0 , 0 , 0 , 0 } , { 5 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets" ) , TARGET_STRING ( "fuelGen_kgs" ) , 2 , 0 , 0 , 0 , 0 } , { 6 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets" ) , TARGET_STRING ( "capOnline_kW" ) , 3 , 0 , 0 , 0 , 0 } , { 7 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch" ) , TARGET_STRING ( "P_elec_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 8 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch" ) , TARGET_STRING ( "P_ME_kW" ) , 1 , 0 , 0 , 0 , 0 } , { 9 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch" ) , TARGET_STRING ( "fuelME_kgs" ) , 2 , 0 , 0 , 0 , 0 } , { 10 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower" ) , TARGET_STRING ( "P_gen_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 11 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower" ) , TARGET_STRING ( "P_shore_kW" ) , 1 , 0 , 0 , 0 , 0 } , { 12 , 0 , TARGET_STRING ( "vesselPowerCert/LoadSum" ) , TARGET_STRING ( "P_load_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 13 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 14 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 15 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 16 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 17 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 18 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 19 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 20 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 21 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 22 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/VariantMerge For Outport: P_afterEss_kW" ) , TARGET_STRING ( "P_afterEss_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 23 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/VariantMerge For Outport: P_ess_kW" ) , TARGET_STRING ( "P_ess_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 24 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/VariantMerge For Outport: SOC" ) , TARGET_STRING ( "SOC" ) , 0 , 0 , 0 , 0 , 0 } , { 25 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 26 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 27 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 28 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 29 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 30 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 31 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 32 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 33 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 34 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 35 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 36 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 37 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/VariantMerge For Outport: capOnline_kW" ) , TARGET_STRING ( "capOnline_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 38 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/VariantMerge For Outport: fuelGen_kgs" ) , TARGET_STRING ( "fuelGen_kgs" ) , 0 , 0 , 0 , 0 , 0 } , { 39 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/VariantMerge For Outport: loadFrac" ) , TARGET_STRING ( "loadFrac" ) , 0 , 0 , 0 , 0 , 0 } , { 40 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/VariantMerge For Outport: nRun" ) , TARGET_STRING ( "nRun" ) , 0 , 0 , 0 , 0 , 0 } , { 41 , 15 , TARGET_STRING ( "vesselPowerCert/OperatingProfile/dpThrusters" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 42 , 0 , TARGET_STRING ( "vesselPowerCert/OperatingProfile/lut_V_kn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 43 , 0 , TARGET_STRING ( "vesselPowerCert/OperatingProfile/lut_hotel_kW" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 44 , 0 , TARGET_STRING ( "vesselPowerCert/OperatingProfile/lut_mode" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 45 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 46 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 47 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 48 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 49 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 50 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 51 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 52 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 53 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 54 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/VariantMerge For Outport: P_ME_kW" ) , TARGET_STRING ( "P_ME_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 55 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/VariantMerge For Outport: P_elec_kW" ) , TARGET_STRING ( "P_elec_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 56 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/VariantMerge For Outport: fuelME_kgs" ) , TARGET_STRING ( "fuelME_kgs" ) , 0 , 0 , 0 , 0 , 0 } , { 57 , 23 , TARGET_STRING ( "vesselPowerCert/PropulsionDemand/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 58 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/ColdIroning" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 59 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/ColdIroning" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 60 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/NoConnection" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 61 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/NoConnection" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 62 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/VariantMerge For Outport: P_gen_kW" ) , TARGET_STRING ( "P_gen_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 63 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/VariantMerge For Outport: P_shore_kW" ) , TARGET_STRING ( "P_shore_kW" ) , 0 , 0 , 0 , 0 , 0 } , { 64 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 65 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 66 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/LiIonBattery/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 67 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 68 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 69 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/NoStorage/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 70 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 71 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 72 , 7 , TARGET_STRING ( "vesselPowerCert/EnergyStorage/Supercapacitor/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 73 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 74 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 75 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 76 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/FourUnits/fcn" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 77 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 78 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 79 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 80 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/ThreeUnits/fcn" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 81 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 82 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 83 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 84 , 14 , TARGET_STRING ( "vesselPowerCert/GenSets/TwoUnits/fcn" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 85 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 86 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 87 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/DieselElectric/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 88 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 89 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 90 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/HybridPTIPTO/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 91 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 92 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 93 , 22 , TARGET_STRING ( "vesselPowerCert/PropulsionArch/Mechanical/fcn" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 0 } , { 94 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/ColdIroning/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 95 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/ColdIroning/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 96 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/NoConnection/fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 97 , 28 , TARGET_STRING ( "vesselPowerCert/ShorePower/NoConnection/fcn" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 98 , 0 , TARGET_STRING ( "vesselPowerCert/V_kn" ) , TARGET_STRING ( "V_kn" ) , 1 , 0 , 0 , 0 , 0 } , { 99 , 0 , TARGET_STRING ( "vesselPowerCert/hotel_kW" ) , TARGET_STRING ( "hotel_kW" ) , 2 , 0 , 0 , 0 , 0 } , { 100 , 0 , TARGET_STRING ( "vesselPowerCert/mode" ) , TARGET_STRING ( "mode" ) , 3 , 0 , 0 , 0 , 0 } , { 101 , 0 , TARGET_STRING ( "vesselPowerCert/dpLoad_kW" ) , TARGET_STRING ( "dpLoad_kW" ) , 4 , 0 , 0 , 0 , 0 } , { 102 , 0 , TARGET_STRING ( "vesselPowerCert/P_prop_kW" ) , TARGET_STRING ( "P_prop_kW" ) , 5 , 0 , 0 , 0 , 0 } , { 103 , 0 , TARGET_STRING ( "vesselPowerCert/P_elec_kW" ) , TARGET_STRING ( "P_elec_kW" ) , 6 , 0 , 0 , 0 , 0 } , { 104 , 0 , TARGET_STRING ( "vesselPowerCert/P_ME_kW" ) , TARGET_STRING ( "P_ME_kW" ) , 7 , 0 , 0 , 0 , 0 } , { 105 , 0 , TARGET_STRING ( "vesselPowerCert/fuelME_kgs" ) , TARGET_STRING ( "fuelME_kgs" ) , 8 , 0 , 0 , 0 , 0 } , { 106 , 0 , TARGET_STRING ( "vesselPowerCert/P_load_kW" ) , TARGET_STRING ( "P_load_kW" ) , 9 , 0 , 0 , 0 , 0 } , { 107 , 0 , TARGET_STRING ( "vesselPowerCert/P_afterEss_kW" ) , TARGET_STRING ( "P_afterEss_kW" ) , 10 , 0 , 0 , 0 , 0 } , { 108 , 0 , TARGET_STRING ( "vesselPowerCert/P_ess_kW" ) , TARGET_STRING ( "P_ess_kW" ) , 11 , 0 , 0 , 0 , 0 } , { 109 , 0 , TARGET_STRING ( "vesselPowerCert/SOC" ) , TARGET_STRING ( "SOC" ) , 12 , 0 , 0 , 0 , 0 } , { 110 , 0 , TARGET_STRING ( "vesselPowerCert/P_gen_kW" ) , TARGET_STRING ( "P_gen_kW" ) , 13 , 0 , 0 , 0 , 0 } , { 111 , 0 , TARGET_STRING ( "vesselPowerCert/P_shore_kW" ) , TARGET_STRING ( "P_shore_kW" ) , 14 , 0 , 0 , 0 , 0 } , { 112 , 0 , TARGET_STRING ( "vesselPowerCert/nRun" ) , TARGET_STRING ( "nRun" ) , 15 , 0 , 0 , 0 , 0 } , { 113 , 0 , TARGET_STRING ( "vesselPowerCert/loadFrac" ) , TARGET_STRING ( "loadFrac" ) , 16 , 0 , 0 , 0 , 0 } , { 114 , 0 , TARGET_STRING ( "vesselPowerCert/fuelGen_kgs" ) , TARGET_STRING ( "fuelGen_kgs" ) , 17 , 0 , 0 , 0 , 0 } , { 115 , 0 , TARGET_STRING ( "vesselPowerCert/capOnline_kW" ) , TARGET_STRING ( "capOnline_kW" ) , 18 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 116 , TARGET_STRING ( "VAR_ESS" ) , 0 , 0 , 0 } , { 117 , TARGET_STRING ( "VAR_GEN" ) , 0 , 0 , 0 } , { 118 , TARGET_STRING ( "VAR_PROP_ARCH" ) , 0 , 0 , 0 } , { 119 , TARGET_STRING ( "VAR_SHORE" ) , 0 , 0 , 0 } , { 120 , TARGET_STRING ( "capEnergy_kWh" ) , 0 , 0 , 0 } , { 121 , TARGET_STRING ( "capPower_kW" ) , 0 , 0 , 0 } , { 122 , TARGET_STRING ( "designSpeed_kn" ) , 0 , 0 , 0 } , { 123 , TARGET_STRING ( "dpBase_kW" ) , 0 , 0 , 0 } , { 124 , TARGET_STRING ( "dpRippleAmp_kW" ) , 0 , 0 , 0 } , { 125 , TARGET_STRING ( "dt_s" ) , 0 , 0 , 0 } , { 126 , TARGET_STRING ( "essEnergy_kWh" ) , 0 , 0 , 0 } , { 127 , TARGET_STRING ( "essEtaRT" ) , 0 , 0 , 0 } , { 128 , TARGET_STRING ( "essPower_kW" ) , 0 , 0 , 0 } , { 129 , TARGET_STRING ( "essSocInit" ) , 0 , 0 , 0 } , { 130 , TARGET_STRING ( "etaDrive" ) , 0 , 0 , 0 } , { 131 , TARGET_STRING ( "etaGearbox" ) , 0 , 0 , 0 } , { 132 , TARGET_STRING ( "etaMotor" ) , 0 , 0 , 0 } , { 133 , TARGET_STRING ( "etaShaftMach" ) , 0 , 0 , 0 } , { 134 , TARGET_STRING ( "genLoadMax" ) , 0 , 0 , 0 } , { 135 , TARGET_STRING ( "genSfocLoadOpt" ) , 0 , 0 , 0 } , { 136 , TARGET_STRING ( "genSfocMin" ) , 0 , 0 , 0 } , { 137 , TARGET_STRING ( "genUnitPower_kW" ) , 0 , 0 , 0 } , { 138 , TARGET_STRING ( "hotelTab_kW" ) , 0 , 1 , 0 } , { 139 , TARGET_STRING ( "mePower_kW" ) , 0 , 0 , 0 } , { 140 , TARGET_STRING ( "meSfocLoadOpt" ) , 0 , 0 , 0 } , { 141 , TARGET_STRING ( "meSfocMin" ) , 0 , 0 , 0 } , { 142 , TARGET_STRING ( "modeTab" ) , 0 , 1 , 0 } , { 143 , TARGET_STRING ( "propPower_kW" ) , 0 , 0 , 0 } , { 144 , TARGET_STRING ( "seaMargin" ) , 0 , 0 , 0 } , { 145 , TARGET_STRING ( "seaTab" ) , 0 , 1 , 0 } , { 146 , TARGET_STRING ( "shorePower_kW" ) , 0 , 0 , 0 } , { 147 , TARGET_STRING ( "tBreak_s" ) , 0 , 1 , 0 } , { 148 , TARGET_STRING ( "vTab_kn" ) , 0 , 1 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . f0ezfwtglf , & rtB . cil41qsm0q ,
& rtB . ei0bd1hzho , & rtB . pnskaoz2i1 , & rtB . d230kxrswf , & rtB .
onrcgyijti , & rtB . kdhagxpynr , & rtB . dfqk3bpfgn , & rtB . cnrxqg2uvw , &
rtB . m5uiaez0ba , & rtB . lfpq1utjp4 , & rtB . p5wotw520i , & rtB .
mb1xtmltkg , & rtB . f0ezfwtglf , & rtB . cil41qsm0q , & rtB . ei0bd1hzho , &
rtB . f0ezfwtglf , & rtB . cil41qsm0q , & rtB . ei0bd1hzho , & rtB .
f0ezfwtglf , & rtB . cil41qsm0q , & rtB . ei0bd1hzho , & rtB . f0ezfwtglf , &
rtB . cil41qsm0q , & rtB . ei0bd1hzho , & rtB . pnskaoz2i1 , & rtB .
d230kxrswf , & rtB . onrcgyijti , & rtB . kdhagxpynr , & rtB . pnskaoz2i1 , &
rtB . d230kxrswf , & rtB . onrcgyijti , & rtB . kdhagxpynr , & rtB .
pnskaoz2i1 , & rtB . d230kxrswf , & rtB . onrcgyijti , & rtB . kdhagxpynr , &
rtB . kdhagxpynr , & rtB . onrcgyijti , & rtB . d230kxrswf , & rtB .
pnskaoz2i1 , & rtB . kcrik4xstr , & rtB . gl50hilnqp , & rtB . hilqji5gdq , &
rtB . gz14omdwtw , & rtB . dfqk3bpfgn , & rtB . cnrxqg2uvw , & rtB .
m5uiaez0ba , & rtB . dfqk3bpfgn , & rtB . cnrxqg2uvw , & rtB . m5uiaez0ba , &
rtB . dfqk3bpfgn , & rtB . cnrxqg2uvw , & rtB . m5uiaez0ba , & rtB .
cnrxqg2uvw , & rtB . dfqk3bpfgn , & rtB . m5uiaez0ba , & rtB . fvv4zlotiq , &
rtB . lfpq1utjp4 , & rtB . p5wotw520i , & rtB . lfpq1utjp4 , & rtB .
p5wotw520i , & rtB . lfpq1utjp4 , & rtB . p5wotw520i , & rtB . f0ezfwtglf , &
rtB . cil41qsm0q , & rtB . ei0bd1hzho , & rtB . f0ezfwtglf , & rtB .
cil41qsm0q , & rtB . ei0bd1hzho , & rtB . f0ezfwtglf , & rtB . cil41qsm0q , &
rtB . ei0bd1hzho , & rtB . pnskaoz2i1 , & rtB . d230kxrswf , & rtB .
onrcgyijti , & rtB . kdhagxpynr , & rtB . pnskaoz2i1 , & rtB . d230kxrswf , &
rtB . onrcgyijti , & rtB . kdhagxpynr , & rtB . pnskaoz2i1 , & rtB .
d230kxrswf , & rtB . onrcgyijti , & rtB . kdhagxpynr , & rtB . dfqk3bpfgn , &
rtB . cnrxqg2uvw , & rtB . m5uiaez0ba , & rtB . dfqk3bpfgn , & rtB .
cnrxqg2uvw , & rtB . m5uiaez0ba , & rtB . dfqk3bpfgn , & rtB . cnrxqg2uvw , &
rtB . m5uiaez0ba , & rtB . lfpq1utjp4 , & rtB . p5wotw520i , & rtB .
lfpq1utjp4 , & rtB . p5wotw520i , & rtY . kxcmswz2ru , & rtY . dq0rxsgzf2 , &
rtY . a5ypr5w2ck , & rtY . kt0sc0sk5g , & rtY . bfzz1ji0iw , & rtY .
nberaf5pgx , & rtY . brijnedqd0 , & rtY . n4lkgzzabc , & rtY . ensip1ktkl , &
rtY . hxpzovnkso , & rtY . ivbwctlinr , & rtY . bj4mnj2eh2 , & rtY .
d4eidzsse1 , & rtY . lqlaifpnxv , & rtY . juflmuhinu , & rtY . nmuhoalc0y , &
rtY . lf2j4yaror , & rtY . n5eryqsam1 , & rtP . VAR_ESS , & rtP . VAR_GEN , &
rtP . VAR_PROP_ARCH , & rtP . VAR_SHORE , & rtP . capEnergy_kWh , & rtP .
capPower_kW , & rtP . designSpeed_kn , & rtP . dpBase_kW , & rtP .
dpRippleAmp_kW , & rtP . dt_s , & rtP . essEnergy_kWh , & rtP . essEtaRT , &
rtP . essPower_kW , & rtP . essSocInit , & rtP . etaDrive , & rtP .
etaGearbox , & rtP . etaMotor , & rtP . etaShaftMach , & rtP . genLoadMax , &
rtP . genSfocLoadOpt , & rtP . genSfocMin , & rtP . genUnitPower_kW , & rtP .
hotelTab_kW [ 0 ] , & rtP . mePower_kW , & rtP . meSfocLoadOpt , & rtP .
meSfocMin , & rtP . modeTab [ 0 ] , & rtP . propPower_kW , & rtP . seaMargin
, & rtP . seaTab [ 0 ] , & rtP . shorePower_kW , & rtP . tBreak_s [ 0 ] , &
rtP . vTab_kn [ 0 ] , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL )
} ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 1 , 7 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.0 } ; static const rtwCAPI_FixPtMap rtFixPtMap [
] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0
} , } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const
void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [
0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } } ; static
rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 98 ,
rtRootInputs , 0 , rtRootOutputs , 18 } , { rtBlockParameters , 0 ,
rtModelParameters , 33 } , { ( NULL ) , 0 } , { rtDataTypeMap ,
rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap ,
rtDimensionArray } , "float" , { 6497841U , 2502310611U , 2646175706U ,
3966476244U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ;
const rtwCAPI_ModelMappingStaticInfo * vesselPowerCert_GetCAPIStaticMap ( void
) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void vesselPowerCert_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void vesselPowerCert_host_InitializeDataMapInfo ( vesselPowerCert_host_DataMapInfo_T * dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath ( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
