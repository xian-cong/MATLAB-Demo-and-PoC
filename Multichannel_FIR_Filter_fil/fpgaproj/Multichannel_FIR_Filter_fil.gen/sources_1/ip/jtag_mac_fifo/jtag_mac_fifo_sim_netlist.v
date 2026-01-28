// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Jan 14 09:09:09 2026
// Host        : TS-93724 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/demo/MultichannelFIRFilterForFPGAExample/Multichannel_FIR_Filter_fil/fpgaproj/Multichannel_FIR_Filter_fil.gen/sources_1/ip/jtag_mac_fifo/jtag_mac_fifo_sim_netlist.v
// Design      : jtag_mac_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "jtag_mac_fifo,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module jtag_mac_fifo
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    empty,
    rd_data_count,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output [11:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;

  wire almost_full;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire [11:0]rd_data_count;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "1" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "4093" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "4092" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "12" *) 
  (* C_RD_DEPTH = "4096" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "12" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  jtag_mac_fifo_fifo_generator_v13_2_10 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(almost_full),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(rd_data_count),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module jtag_mac_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module jtag_mac_fifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module jtag_mac_fifo_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module jtag_mac_fifo_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module jtag_mac_fifo_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module jtag_mac_fifo_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 138512)
`pragma protect data_block
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
8Co=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
