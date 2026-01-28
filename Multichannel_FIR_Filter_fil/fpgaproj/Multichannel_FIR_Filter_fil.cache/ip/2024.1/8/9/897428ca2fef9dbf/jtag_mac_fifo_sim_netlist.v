// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Jan 14 09:09:08 2026
// Host        : TS-93724 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ jtag_mac_fifo_sim_netlist.v
// Design      : jtag_mac_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "jtag_mac_fifo,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_10 U0
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 139152)
`pragma protect data_block
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
O/0jbcVmePlIGjtAvZ9u
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
