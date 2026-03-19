// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Sep 30 15:26:55 2022
// Host        : LAPTOP-8T9G1ILJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top dfifo_32x32_16 -prefix
//               dfifo_32x32_16_ dfifo_32x32_16_sim_netlist.v
// Design      : dfifo_32x32_16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dfifo_32x32_16,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module dfifo_32x32_16
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [63:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [63:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [63:0]din;
  wire [63:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire valid;
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
  (* C_DIN_WIDTH = "64" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "64" *) 
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
  (* C_FAMILY = "kintex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
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
  (* C_HAS_VALID = "1" *) 
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
  (* C_PRIM_FIFO_TYPE = "512x72" *) 
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
  dfifo_32x32_16_fifo_generator_v13_2_7 U0
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
        .valid(valid),
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
module dfifo_32x32_16_xpm_cdc_gray
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
module dfifo_32x32_16_xpm_cdc_gray__2
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
module dfifo_32x32_16_xpm_cdc_single
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
module dfifo_32x32_16_xpm_cdc_single__2
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
module dfifo_32x32_16_xpm_cdc_sync_rst
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
module dfifo_32x32_16_xpm_cdc_sync_rst__2
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

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "3" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module dfifo_32x32_16_xpm_cdc_sync_rst__parameterized2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [2:0]syncstages_ff;

  assign dest_rst = syncstages_ff[2];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
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
    .INIT(1'b0)) 
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
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 99216)
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
