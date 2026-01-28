// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Jan 14 09:09:08 2026
// Host        : TS-93724 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/demo/MultichannelFIRFilterForFPGAExample/Multichannel_FIR_Filter_fil/fpgaproj/Multichannel_FIR_Filter_fil.gen/sources_1/ip/simcycle_fifo/simcycle_fifo_sim_netlist.v
// Design      : simcycle_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "simcycle_fifo,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module simcycle_fifo
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
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
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
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
  (* C_HAS_ALMOST_FULL = "0" *) 
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
  (* C_HAS_RD_DATA_COUNT = "0" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "13" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "12" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  simcycle_fifo_fifo_generator_v13_2_10 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
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
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module simcycle_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
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
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
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
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
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
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module simcycle_fifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
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
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
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
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
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
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module simcycle_fifo_xpm_cdc_single
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
module simcycle_fifo_xpm_cdc_single__2
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
module simcycle_fifo_xpm_cdc_sync_rst
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
module simcycle_fifo_xpm_cdc_sync_rst__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 99792)
`pragma protect data_block
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
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
