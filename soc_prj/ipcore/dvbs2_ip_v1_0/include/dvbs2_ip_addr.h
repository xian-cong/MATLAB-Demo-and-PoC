/*
 * File Name:         C:\demo\DVBS2ReceiverSoCExample\soc_prj\hdlcoder\DVBS2\ipcore\dvbs2_ip_v1_0\include\dvbs2_ip_addr.h
 * Description:       C Header File
 * Created:           2025-10-27 18:14:42
*/

#ifndef DVBS2_IP_H_
#define DVBS2_IP_H_

#define  IPCore_Reset_dvbs2_ip                             0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_dvbs2_ip                            0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_PacketSize_AXI4_Stream_0_Master_dvbs2_ip   0x8  //Packet size for AXI4-Stream 0 Master interface, the default value is 2048. The TLAST output signal of the AXI4-Stream 0 Master interface is generated based on the packet size.
#define  IPCore_Timestamp_dvbs2_ip                         0xC  //contains unique IP timestamp (yymmddHHMM): 2510271814
#define  nframesSync_Data_dvbs2_ip                         0x100  //data register for Outport nframesSync
#define  modcod_Data_dvbs2_ip                              0x104  //data register for Outport modcod
#define  fecframe_Data_dvbs2_ip                            0x108  //data register for Outport fecframe
#define  FreqEst_Data_dvbs2_ip                             0x10C  //data register for Outport FreqEst
#define  TSorGS_Data_dvbs2_ip                              0x110  //data register for Outport TSorGS
#define  UPL_Data_dvbs2_ip                                 0x114  //data register for Outport UPL
#define  DFL_Data_dvbs2_ip                                 0x118  //data register for Outport DFL
#define  SYNC_Data_dvbs2_ip                                0x11C  //data register for Outport SYNC
#define  bitsErrored_Data_dvbs2_ip                         0x120  //data register for Outport bitsErrored
#define  bitsReceived_Data_dvbs2_ip                        0x124  //data register for Outport bitsReceived
#define  adc_dac_loopback_Data_dvbs2_ip                    0x128  //data register for Inport adc_dac_loopback
#define  enbNoise_Data_dvbs2_ip                            0x12C  //data register for Inport enbNoise
#define  snrdB_Data_dvbs2_ip                               0x130  //data register for Inport snrdB
#define  CFO_Data_dvbs2_ip                                 0x134  //data register for Inport CFO
#define  CPO_Data_dvbs2_ip                                 0x138  //data register for Inport CPO
#define  modcodidx_Data_dvbs2_ip                           0x13C  //data register for Inport modcodidx
#define  resetFCPO_Data_dvbs2_ip                           0x140  //data register for Inport resetFCPO
#define  resetDisplay_Data_dvbs2_ip                        0x144  //data register for Inport resetDisplay

#endif /* DVBS2_IP_H_ */
