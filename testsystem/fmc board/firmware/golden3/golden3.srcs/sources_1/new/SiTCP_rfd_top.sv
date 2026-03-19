`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  HuJun
// 
// Create Date: 2022/07/15 20:11:28
// Design Name: 
// Module Name: SiTCP_rfd_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SiTCP_rfd_top #(
    parameter [31:0] FPGA_VER        = 32'h2207_1609,
    parameter [31:0] BASE_IP_ADDR    = 32'hC0A8_0A14,  // 192.168.10.20
    parameter        CHIPSCOPE_USED  = 1,
    parameter        TDC_NUM         = 'd64,
    parameter        TDC_DELAY_NUM   = 'd64,
    parameter        DAC_NUM         = 'd4,
    parameter        INTERFACE_WIDTH = 'd128,
    parameter        DAC_CHANNEL_NUM = 8
) (
    //SYS
    //input sys_clk_bufg,
    input clk125_sys,
    input clk200,
    input clk125_eth,
    //input GTREFCLK_P,
    //input GTREFCLK_N, 
    input gtpclkin,
    input [127:0] sys_din,
    input din_valid,
    // Status and control signals
    input locked,
    //  output CLK_EXT_P,
    //  output CLK_EXT_N,
    //input RESET_IN,
    // FMC


    output                       clk125_remote,
    // SFP
    output                       SFP_TXP,          // Tx signal line
    output                       SFP_TXN,          //
    output                       sitcp_fifo_full,
    input                        SFP_RXP,          // Rx signal line
    input                        SFP_RXN,          //
    //UDP
    output wire                  LED_ON,
    output wire                  EXTERNAL_CALIB_ENABLE,
    input  wire                  MSB_abnormal,
    input  wire [   TDC_NUM-1:0] MSB_check,
    input  wire [   DAC_NUM-1:0] FPGADATA_REN,
    output wire [   DAC_NUM-1:0] FPGADATA_EMPTY,
    output wire [DAC_NUM*19-1:0] FPGA_DATA,
    output wire [   DAC_NUM-1:0] FPGADATA_VALID,

    output wire        FLASH_ERASE_DISABLE,
    input  wire        FLASH_WRITE_READY,
    output wire [ 7:0] FLASH_WRITE_DATA,
    output wire        FLASH_WRITE_VALID,
    input  wire [ 7:0] FLASH_READ_DATA,
    input  wire        FLASH_READ_VALID,
    output wire        FLASH_READ_EN,
    output wire [ 7:0] FLASH_READ_CMD,
    output wire [31:0] FLASH_READ_ADDRESS,

    output wire [31:0] XVC_LENGTH,
    output wire [31:0] TMS_VECTOR,
    output wire [31:0] TDI_VECTOR,
    input  wire [31:0] TDO_VECTOR,
    input  wire        TDO_VECTOR_VALID,
    input  wire [31:0] TDO_VECTOR_LENGTH,
    output wire        TDO_VECTOR_READ_EN,

    output wire        XVC_ENABLE,
    output wire        XVC_LENGTH_READY,
    output wire        TMS_VECTOR_READY,
    output wire        TDI_VECTOR_READY,

    output wire [ 7:0] SP6_CONFIG_ADDR,
    output wire [ 7:0] SP6_CONFIG_VALUE,
    output wire        SP6_CONFIG_VALID,

    output wire TDC_RST_SELECT,
    output wire JTAG_SWITCH,
    output wire SOFT_RST,
    output wire [(TDC_NUM/2 -1):0] rst_fifo,
    input wire  [2:0] state,
    input wire  [6:0] fifo_level1_pointer,
    input wire clk_locked_tdc,
    output wire is_multiboot,
    input wire i2c_clk,

    //  input           GTREFCLK_N,
    //DEBUG
    input  wire                HARDWARE_RESET,
    output wire [DAC_NUM-1:0]  OFFSET_SWITCH,
    output wire [        4:0]  DELAY_VALUE[ TDC_NUM/2-1:0],
    output wire [5:0] LED,
    input  wire       CLK_IN,
    input  wire       TRIG_IN,
    output wire [3:0] GPIO,
    input  wire [3:0] SW
);

    ///////////////////////////////////////////
    // register space map
    localparam [31:0] SYS_CONFIG_BASE_ADDR = 32'h0000_FF00;
    localparam [31:0] ASSEMBLY_CONFIG_BASE_ADDR = 32'h0000_0000;
    localparam [31:0] PLL_CONFIG_BASE_ADDR = 32'h0000_0020;
    localparam [31:0] DAC_CONFIG_BASE_ADDR = 32'h0000_0010;
    localparam [31:0] ADC_CONFIG_BASE_ADDR = 32'h0000_0040;

    /////////////////////////////////////////////////////////////////////////////////////////////
    // clock & reset
    wire idelayctrl_ready;
    wire init_rst = ~locked;
    reg  manual_sys_rst;
    wire tcp_rst;


    //clean_clock_gen clean_clock_gen_i
    //   (// Clock in ports
    //    .clk_in1_p(SYS_CLK_P),    // IN
    //    .clk_in1_n(SYS_CLK_N),    // IN
    //    // Clock out ports
    //    .clk_out1(clk125_sys),    // OUT
    //    .clk_out2(clk200),        // OUT
    //    .clk_out3(clk125_eth),    // OUT
    //    .clk_out4(gtpclkin),
    //    // Status and control signals
    //    .reset(0),                // IN
    //    .locked(locked)           // OUT  
    //    );      

    //reg [47:0]  time_cnt;
    //always @ (posedge clk125_sys) begin
    //  if(init_rst) begin
    //    time_cnt <= 48'h0;
    //  end
    //  else begin
    //    time_cnt <= time_cnt + 1'b1;
    //  end
    //end    

    wire config_din_valid;
    wire [31:0] config_din_data, config_din_addr;
    reg config_dout_valid;
    reg [31:0] config_dout_data, config_dout_addr;


    //////////////////////////////////////////////////////////////////////////////////////////
    // SiTCP interface
    //wire          clk125_remote;
    wire        tcp_open;
    wire        tcp_error;
    //wire          tcp_rst;
    wire        tcp_close;

    wire        tcp_rx_wr;
    wire [ 7:0] tcp_rx_data;
    wire [15:0] tcp_rx_wc;

    wire        tcp_tx_wr;
    wire [ 7:0] tcp_tx_data;
    wire        tcp_tx_full;

    wire [31:0] rbcp_addr;
    wire        rbcp_we;
    wire [ 7:0] rbcp_wd;
    wire        rbcp_re;
    wire        rbcp_act;
    wire        rbcp_ack;
    wire [ 7:0] rbcp_rd;

    SiTCP #(
        .BASE_IP_ADDR(BASE_IP_ADDR)
    ) SiTCP_inst (
        .RST(init_rst),
        .CLK(clk125_eth),
        .CLK200(clk200),
        .CLKOUT(clk125_remote),
        .MAC_SELECT(SW),
        .IP_SELECT(SW),
        .TIM_1US(),
        .TIM_1MS(),
        .TIM_1S(),
        .TIM_1M(),
        .TCP_OPEN(tcp_open),
        .TCP_ERROR(tcp_error),
        .TCP_RST(tcp_rst),
        .TCP_CLOSE(tcp_close),
        .TCP_RX_WC(tcp_rx_wc),
        .TCP_RX_WR(tcp_rx_wr),
        .TCP_RX_DATA(tcp_rx_data),
        .TCP_TX_FULL(tcp_tx_full),
        .TCP_TX_WR(tcp_tx_wr),
        .TCP_TX_DATA(tcp_tx_data),
        .RBCP_ADDR(rbcp_addr),
        .RBCP_WE(rbcp_we),
        .RBCP_WD(rbcp_wd),
        .RBCP_RE(rbcp_re),
        .RBCP_ACT(rbcp_act),
        .RBCP_ACK(rbcp_ack),
        .RBCP_RD(rbcp_rd),
        //.gtrefclk_p(GTREFCLK_P),
        //.gtrefclk_n(GTREFCLK_N),
        .GTREFCLK(gtpclkin),
        .SFP_TXP(SFP_TXP),
        .SFP_TXN(SFP_TXN),
        .SFP_RXP(SFP_RXP),
        .SFP_RXN(SFP_RXN)
    );

    wire [31:0] cfg_32_data2fmc, cfg_32_addr2fmc;
    wire cfg_32_valid2fmc;
    wire cfg_32_valid2PC;
    wire [31:0] cfg_32_data2PC, cfg_32_addr2PC;

    reg config_sys_dout_valid;
    reg [31:0] config_sys_dout_data;

    //reg_config reg_config_i(
    //  // system
    //  .clk(clk125_eth),
    //  .rst(tcp_rst),
    //  // sitcp udp 
    //  .RBCP_ACT(rbcp_act),
    //  .RBCP_ADDR(rbcp_addr),
    //  .RBCP_WE(rbcp_we),
    //  .RBCP_WD(rbcp_wd),
    //  .RBCP_RE(rbcp_re),
    //  .RBCP_RD(rbcp_rd),
    //  .RBCP_ACK(rbcp_ack),
    //  
    //  // config fifo PC2B
    //  .cfg_32_data2gcu(cfg_32_data2fmc),
    //  .cfg_32_addr2gcu(cfg_32_addr2fmc),
    //  .cfg_32_valid2gcu(cfg_32_valid2fmc),
    //  // config fifo B2PC
    //  .cfg_32_data2PC(cfg_32_data2PC),
    //  .cfg_32_addr2PC(cfg_32_addr2PC),
    //  .cfg_32_valid2PC(cfg_32_valid2PC)
    //);

    always @(posedge clk125_sys) begin
        if (tcp_rst) begin
            config_dout_valid <= 0;
            config_dout_data  <= 0;
            config_dout_addr  <= 0;
        end else begin
            config_dout_valid <= config_sys_dout_valid;
            config_dout_data  <= config_dout_data;
            config_dout_addr  <= config_dout_addr;
        end
    end

    always @(posedge clk125_sys) begin
        if (init_rst) begin
            manual_sys_rst <= 1'b0;
            config_sys_dout_valid <= 1'b0;
            config_sys_dout_data <= 32'h0;
        end else begin
            config_sys_dout_valid <= 1'b0;
            if (config_din_valid & config_din_addr == SYS_CONFIG_BASE_ADDR) begin
                case (config_din_data[31:24])
                    8'hF0: begin
                        //adu_disable <= config_din_data[5];
                    end
                    8'hF1: begin
                        manual_sys_rst <= config_din_data[0];
                    end
                    8'hF3: begin
                        //man_ip <= config_din_data[15:0];
                    end
                    8'h75: begin
                        config_sys_dout_data  <= FPGA_VER;
                        config_sys_dout_valid <= 1'b1;
                    end
                    default: begin
                        config_sys_dout_valid <= 1'b0;
                    end
                endcase
            end
        end
    end

    /////////////////////////////////////////////////////
    // cfg fifo : forward cfg data to mb and db.

    //wire cfg0_fifo_empty,cfg0_fifo_full;
    //wire cfg1_fifo_empty,cfg1_fifo_full;
    //dfifo_32x32_16 cfg2gcu_fifo(
    //  .wr_clk(clk125_eth),
    //  .rd_clk(clk125_sys),
    //  .rst(tcp_rst),  // && !channel_up //if sfp disconnect , clear all config data
    //  .din({cfg_32_addr2fmc,cfg_32_data2fmc}),
    //  .wr_en(cfg_32_valid2fmc),
    //  .full(cfg0_fifo_full),
    //  .rd_en(~cfg0_fifo_empty),
    //  .dout({config_din_addr,config_din_data}),
    //  .valid(config_din_valid),
    //  .empty(cfg0_fifo_empty)
    //);

    //dfifo_32x32_16 cfg2pc_fifo(
    //  .wr_clk(clk125_sys),
    //  .rd_clk(clk125_eth),
    //  .rst(tcp_rst),  // && !channel_up //if sfp disconnect , clear all config data
    //  .din({config_dout_addr,config_dout_data}),
    //  .wr_en(config_dout_valid),
    //  .full(cfg1_fifo_full),
    //  .rd_en(~cfg1_fifo_empty),
    //  .dout({cfg_32_addr2PC,cfg_32_data2PC}),
    //  .valid(cfg_32_valid2PC),
    //  .empty(cfg1_fifo_empty)
    //);


    //////////////////////////////////////////////////////////////////////////////////
    // SiTCP fifo
    wire sitcp_fifo_empty, sitcp_fifo_rden, sitcp_fifo_error_full;
    wire [127:0] sitcp_fifo_din;
    wire sitcp_fifo_wren;
    wire reset_i = init_rst || SOFT_RST;

    /*
fifo_tcp SITCP_fifo (
  .rst(reset_i),// | ~tcp_open), // input rst
  .wr_clk(clk125_sys), // input wr_clk
  .rd_clk(clk125_eth), // input rd_clk
  //.clk(clk125_eth),
  .din(sitcp_fifo_din), // input [15 : 0] din
  .wr_en(sitcp_fifo_wren), // input wr_en
  .rd_en(sitcp_fifo_rden), // input rd_en
  .dout(tcp_tx_data), // output [7 : 0] dout
  .full(sitcp_fifo_error_full), // output full
  .prog_full(sitcp_fifo_full),
  .empty(sitcp_fifo_empty), // output empty
  .valid(tcp_tx_wr), // output valid
  .rd_data_count(tcp_rx_wc[12:0]) // output [13 : 0] rd_data_count
);

*/

    assign sitcp_fifo_din   = sys_din;
    assign sitcp_fifo_wren  = ~sitcp_fifo_error_full & din_valid;
    assign tcp_rx_wc[15:14] = 2'b11;
    assign sitcp_fifo_rden  = ~tcp_tx_full & ~sitcp_fifo_empty;

    wire        tcp_fifo_128to16_valid;
    wire        tcp_fifo_128to16_full;
    wire        tcp_fifo_128to16_empty;
    wire        tcp_fifo_128to16_rd_en;
    wire [15:0] tcp_fifo_128to16_dout;

    wire        sitcp_fifo_full_2;

    tcp_fifo_128to16 tcp_fifo_128to16 (
        .rst      (reset_i),                                       // input wire rst
        //.wr_clk(clk125_sys),  // input wire wr_clk
        //.rd_clk(clk125_sys),  // input wire rd_clk
        .clk      (clk125_sys),                                    // input wire rd_clk
        .din      (sitcp_fifo_din),                                // input wire [127 : 0] din
        .wr_en    (sitcp_fifo_wren),                               // input wire wr_en
        .rd_en    (!tcp_fifo_128to16_empty & !sitcp_fifo_full_2),  // input wire rd_en
        .dout     (tcp_fifo_128to16_dout),                         // output wire [15 : 0] dout
        .full     (tcp_fifo_128to16_full),                         // output wire full
        .prog_full(sitcp_fifo_full),
        .empty    (tcp_fifo_128to16_empty),                        // output wire empty
        .valid    (tcp_fifo_128to16_valid)                         // output wire valid
    );

    tcp_fifo_16to8 tcp_fifo_16to8 (
        .rst(reset_i),  // | ~tcp_open), // input rst
        //.wr_clk(clk125_sys), // input wr_clk
        //.rd_clk(clk125_eth), // input rd_clk
        .clk(clk125_eth),
        .din(tcp_fifo_128to16_dout),  // input [15 : 0] din
        .wr_en(tcp_fifo_128to16_valid),  // input wr_en
        .rd_en(sitcp_fifo_rden),  // input rd_en
        .dout(tcp_tx_data),  // output [7 : 0] dout
        .full(sitcp_fifo_error_full),  // output full
        .prog_full(sitcp_fifo_full_2),
        .empty(sitcp_fifo_empty),  // output empty
        .valid(tcp_tx_wr),  // output valid
        .rd_data_count(tcp_rx_wc[13:0])  // output [13 : 0] rd_data_count
    );

    /*
    ila_7 ila_7(
    .clk(clk125_eth),
    .probe0(din_valid),
    .probe1(sitcp_fifo_error_full),
    .probe2(tcp_fifo_128to16_full),
    .probe3(sitcp_fifo_full_2),
    .probe4(sitcp_fifo_full),
    .probe5(sitcp_fifo_empty),
    .probe6(tcp_fifo_128to16_empty),
    .probe7(tcp_fifo_128to16_valid),
    .probe8(sitcp_fifo_wren),
    .probe9(tcp_tx_wr),
    .probe10(sitcp_fifo_wren)
    );
*/
    RBCP_REG #(
        .TDC_NUM(TDC_NUM),
        .DAC_NUM(DAC_NUM),
        .DAC_CHANNEL_NUM(DAC_CHANNEL_NUM)
    ) RBCP_REG (
        // System
        .CLK                (clk125_eth),           // in : System clock
        .RST                (init_rst | HARDWARE_RESET),             // in : System reset
        .DIP_SW             (SW),                   // in : DIP_SW[3:0]
        .i2c_clk            (i2c_clk),
        // RBCP I/F
        .RBCP_ACT           (rbcp_act),             // in : Active
        .RBCP_ADDR          (rbcp_addr),            // in : Address[31:0]
        .RBCP_WE            (rbcp_we),              // in : Write enable
        .RBCP_WD            (rbcp_wd),              // in : Write data[7:0]
        .RBCP_RE            (rbcp_re),              // in : Read enable
        .RBCP_RD            (rbcp_rd),              // out  : Read data[7:0]
        .RBCP_ACK           (rbcp_ack),             // out  : Acknowledge
        .DELAY_VALUE        (DELAY_VALUE),
        .EXTERNAL_CALIB_ENABLE     (EXTERNAL_CALIB_ENABLE),
        .LED_ON             (LED_ON),
        .MSB_abnormal       (MSB_abnormal),
        .MSB_check          (MSB_check),
        .DAC_RD             (FPGADATA_REN),
        .DAC_EMPTY          (FPGADATA_EMPTY),
        .DAC_DATA           (FPGA_DATA),
        .DAC_VALID          (FPGADATA_VALID),
        .FLASH_ERASE_DISABLE(FLASH_ERASE_DISABLE),
        .FLASH_WRITE_READY  (FLASH_WRITE_READY),
        .FLASH_WRITE_DATA   (FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID  (FLASH_WRITE_VALID),
        .FLASH_READ_DATA    (FLASH_READ_DATA),
        .FLASH_READ_VALID   (FLASH_READ_VALID),
        .FLASH_READ_EN      (FLASH_READ_EN),
        .FLASH_READ_CMD     (FLASH_READ_CMD),
        .FLASH_READ_ADDRESS (FLASH_READ_ADDRESS),
        .XVC_LENGTH         (XVC_LENGTH),
        .TMS_VECTOR         (TMS_VECTOR),
        .TDI_VECTOR         (TDI_VECTOR),
        .TDO_VECTOR         (TDO_VECTOR),
        .TDO_VECTOR_VALID   (TDO_VECTOR_VALID),
        .TDO_VECTOR_LENGTH  (TDO_VECTOR_LENGTH),
        .TDO_VECTOR_READ_EN (TDO_VECTOR_READ_EN),
        .XVC_ENABLE         (XVC_ENABLE),
        .XVC_LENGTH_READY   (XVC_LENGTH_READY),
        .TMS_VECTOR_READY   (TMS_VECTOR_READY),
        .TDI_VECTOR_READY   (TDI_VECTOR_READY),
        .SP6_CONFIG_ADDR    (SP6_CONFIG_ADDR),
        .SP6_CONFIG_VALUE   (SP6_CONFIG_VALUE),
        .SP6_CONFIG_VALID   (SP6_CONFIG_VALID),
        .OFFSET_SWITCH      (OFFSET_SWITCH),
        .JTAG_SWITCH        (JTAG_SWITCH),
        .TDC_RST_SELECT     (TDC_RST_SELECT),
        .SOFT_RST           (SOFT_RST),
        .RST_FIFO           (rst_fifo),
        .state              (state),
        .fifo_level1_pointer(fifo_level1_pointer),
        .clk_locked_sitcp   (locked),
        .clk_locked_tdc     (clk_locked_tdc),
        .is_multiboot       (is_multiboot)
    );

    //////////////////////////////////////////////////////////////////////////////////////////
    // Debug   
    //reg [27:0] cnt0,cnt1,cnt2,cnt3,cnt4,cnt5;
    //always @(posedge clk125_sys) begin
    //  if(init_rst) cnt0 <= 0;
    //  else cnt0 <= cnt0 + 1'b1;
    //end
    //assign LED[0] = cnt0[26];

    //always @(posedge adca_clkdiv[0]) begin
    //  if(init_rst) cnt1 <= 0;
    //  else cnt1 <= cnt1 + 1'b1;
    //end
    //assign LED[1] = 1;
    //
    //always @(posedge adcb_clkdiv[0]) begin
    //  if(init_rst) cnt2 <= 0;
    //  else cnt2 <= cnt2 + 1'b1;
    //end
    //assign LED[2] = 1;
    //
    //always @(posedge clk125_eth) begin
    //  if(init_rst) cnt3 <= 0;
    //  else cnt3 <= cnt3 + 1'b1;
    //end
    //assign LED[3] = cnt3[26];
    //
    //always @(posedge clk125_remote) begin
    //  if(init_rst) cnt4 <= 0;
    //  else cnt4 <= cnt4 + 1'b1;
    //end
    //assign LED[4] = cnt4[26];
    ////
    //always @(posedge clk200) begin
    //  if(init_rst) cnt5 <= 0;
    //  else cnt5 <= cnt5 + 1'b1;
    //end
    //assign LED[5] = cnt5[26];   
    //
    //assign GPIO[0] = sys_clk_bufg;
    //assign GPIO[1] = clk125_sys;
endmodule
