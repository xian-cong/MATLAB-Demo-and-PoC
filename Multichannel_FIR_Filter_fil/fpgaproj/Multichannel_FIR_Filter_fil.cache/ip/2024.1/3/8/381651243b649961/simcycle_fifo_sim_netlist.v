// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Jan 14 09:09:07 2026
// Host        : TS-93724 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ simcycle_fifo_sim_netlist.v
// Design      : simcycle_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "simcycle_fifo,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_10 U0
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
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

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
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
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 100176)
`pragma protect data_block
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
QJEw4ronp7dzGYdRy08WfTIInb6uCTj/dqoH
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
