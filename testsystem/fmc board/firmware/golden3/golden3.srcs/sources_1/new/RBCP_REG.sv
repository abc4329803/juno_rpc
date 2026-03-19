/*******************************************************************************
*                                                                              *
* Module      : RBCP_REG                                                       *
* Version     : v 0.2.0 2010/03/31                                             *
*                                                                              *
* Description : Register file                                                  *
*                                                                              *
*                Copyright (c) 2010 Bee Beans Technologies Co.,Ltd.            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/
//`define FPGA_VER 32'h1005_1001
//`define FPGA_ID  32'h0209_0018

`define REG_INIT_X00 8'h00
`define REG_INIT_X01 8'h01
`define REG_INIT_X02 8'h02
`define REG_INIT_X03 8'h03
`define REG_INIT_X04 8'h04
`define REG_INIT_X05 8'h05
`define REG_INIT_X06 8'h06
`define REG_INIT_X07 8'h07
`define REG_INIT_X08 8'h08
`define REG_INIT_X09 8'h09
`define REG_INIT_X0A 8'h0A
`define REG_INIT_X0B 8'h0B
`define REG_INIT_X0C 8'h0C
`define REG_INIT_X0D 8'h0D
`define REG_INIT_X0E 8'h0E
`define REG_INIT_X0F 8'h0F

module RBCP_REG #(
    parameter TDC_NUM = 8'd64,
    parameter TDC_DELAY_NUM = 'd64,
    parameter DAC_NUM = 8'd4,
    parameter DAC_CHANNEL_NUM = 8'd8,
    parameter DAC_I2C_CONFIG = 1'b0
) (
    // System
    input  wire        CLK,        // in : System clock
    input  wire        RST,        // in : System reset
    input  wire [ 3:0] DIP_SW,     // in : DIP_SW[3:0]
    input  wire        i2c_clk,
    // RBCP I/F
    input  wire        RBCP_ACT,   // in : Active
    input  wire [31:0] RBCP_ADDR,  // in : Address[31:0]
    input              RBCP_WE,    // in : Write enable
    input  wire [ 7:0] RBCP_WD,    // in : Write data[7:0]
    input  wire        RBCP_RE,    // in : Read enable
    output wire [ 7:0] RBCP_RD,    // out  : Read data[7:0]
    output wire        RBCP_ACK,   // out  : Acknowledge
    //FPGA

    // DELAY
    output wire [ 4:0] DELAY_VALUE[ TDC_NUM/2-1:0],

    // LED ON

    output                    LED_ON,
    output                    EXTERNAL_CALIB_ENABLE,
    input  wire               MSB_abnormal,
    input  wire [TDC_NUM-1:0] MSB_check,

    // DAC
    input  wire [   DAC_NUM-1:0] DAC_RD,
    output wire [DAC_NUM*19-1:0] DAC_DATA,
    output wire [   DAC_NUM-1:0] DAC_EMPTY,
    output wire [   DAC_NUM-1:0] DAC_VALID,

    // FLASH
    output wire        FLASH_ERASE_DISABLE,
    input  wire        FLASH_WRITE_READY,
    output wire [ 7:0] FLASH_WRITE_DATA,
    output wire        FLASH_WRITE_VALID,
    output wire [ 7:0] FLASH_WRITE_CMD,
    output wire [31:0] FLASH_WRITE_ADDRESS,

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
    output reg         SP6_CONFIG_VALID,

    output wire                   TDC_RST_SELECT,
    output wire                   JTAG_SWITCH,
    output wire [    DAC_NUM-1:0] OFFSET_SWITCH,
    output wire                   SOFT_RST,
    output wire [TDC_NUM/2 - 1:0] RST_FIFO,
    input  wire [2:0]             state,
    input  wire [6:0]             fifo_level1_pointer,
    input  wire                   clk_locked_sitcp,
    input  wire                   clk_locked_tdc,
    output wire                   is_multiboot
);
    /*
//-------- Input/Output -------------
input           CLK;
input           RST;

input   [3:0]   DIP_SW;

input           RBCP_ACT;
input   [31:0]  RBCP_ADDR;
input           RBCP_WE;
input   [7:0]   RBCP_WD;
input           RBCP_RE;
output  [7:0]   RBCP_RD;
output          RBCP_ACK;

input   wire i2c_clk;
input   wire FPGADATA_REN;
output  wire FPGADATA_EMPTY;
output  wire [18:0] FPGA_DATA;
output  wire FPGADATA_VALID;
output  reg TDC_RST_SELECT;
output  reg [7:0]ila_select;
output  reg [31:0] RST_FIFO;

*/



    //------------------------------------------------------------------------------
    //  Control
    //------------------------------------------------------------------------------
    reg [31:0] irAddr;
    reg        irWe;
    reg [ 7:0] irWd;
    reg        irRe;
    reg [ 7:0] irRd;

    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            irAddr[31:0] <= 0;
            irWe <= 0;
            irWd[7:0] <= 0;
            irRe <= 0;
        end else begin
            irAddr[31:0] <= RBCP_ADDR[31:0];
            irWe <= RBCP_WE;
            irWd[7:0] <= RBCP_WD[7:0];
            irRe <= RBCP_RE;
            //RBCP_RD <= irRd;
        end
    end

    reg [15:0] regCs;
    reg [ 7:0] regAddr;
    reg [ 7:0] regWd;
    reg        regWe;
    reg [ 7:0] regRd;
    reg        regRe;
    reg        reg_ack;
    reg        readCs;

    always @(posedge CLK) begin
        //regCs <= (irAddr[31:8]==24'd0);
        regCs[0]    <= (irAddr[15:8]==8'h0)? 1: 0; // 0x0~0xF
        regCs[1]    <= (irAddr[15:8]==8'h1)? 1: 0; // 0x10~0x1F
        regCs[2]    <= (irAddr[15:8]==8'h2)? 1: 0; // 0x20~0x2F
        regCs[3]    <= (irAddr[15:8]==8'h3)? 1: 0; // 0x30~0x3F
        regCs[4]    <= (irAddr[15:8]==8'h4)? 1: 0; // 0x40~0x4F
        regCs[5]    <= (irAddr[15:8]==8'h5)? 1: 0; // 0x50~0x5F
        regCs[6]    <= (irAddr[15:8]==8'h6)? 1: 0; // 0x60~0x6F
        regCs[7]    <= (irAddr[15:8]==8'h7)? 1: 0; // 0x70~0x7F
        regCs[8]    <= (irAddr[15:8]==8'h8)? 1: 0; // 0x80~0x8F
        regCs[9]    <= (irAddr[15:8]==8'h9)? 1: 0; // 0x90~0x9F
        regCs[10]   <= (irAddr[15:8]==8'hA)? 1: 0; // 0xA0~0xAF
        regCs[11]   <= (irAddr[15:8]==8'hB)? 1: 0; // 0xB0~0xBF
        // DAC register
        regCs[12]   <= (irAddr[15:8]==8'hC)? 1: 0; // 0xC0~0xCF
        regCs[13]   <= (irAddr[15:8]==8'hD)? 1: 0; // 0xD0~0xDF
        regCs[14]   <= (irAddr[15:8]==8'hE)? 1: 0; // 0xE0~0xEF
        regCs[15]   <= (irAddr[15:8]==8'hF)? 1: 0; // 0xF0~0xFF

        regAddr <= (irWe | irRe? irAddr[7:0]: regAddr);
        regWd[7:0] <= (irWe? irWd[7:0]: regWd[7:0]);
        regWe <= irWe;
        regRe <= irRe;
        readCs <= regCs[0];
    end



    //------------------------------------------------------------------------------
    //  Registers
    //------------------------------------------------------------------------------
    reg [7:0] x00_Reg;
    reg [7:0] x01_Reg;
    reg [7:0] x02_Reg;
    reg [7:0] x03_Reg;
    reg [7:0] x04_Reg;
    reg [7:0] x05_Reg;
    reg [7:0] x06_Reg;
    reg [7:0] x07_Reg;
    reg [7:0] x08_Reg;
    reg [7:0] x09_Reg;
    reg [7:0] x0A_Reg;
    reg [7:0] x0B_Reg;
    reg [7:0] x0C_Reg;
    reg [7:0] x0D_Reg;
    reg [7:0] x0E_Reg;
    reg [7:0] x0F_Reg;
    reg [7:0] x10_Reg;
    reg [7:0] x11_Reg;
    reg [7:0] x12_Reg;
    reg [7:0] x13_Reg;
    reg [7:0] x14_Reg;
    reg [7:0] x15_Reg;
    reg [7:0] x16_Reg;
    reg [7:0] x17_Reg;
    reg [7:0] x18_Reg;
    reg [7:0] x19_Reg;
    reg [7:0] x1A_Reg;
    reg [7:0] x1B_Reg;
    reg [7:0] x1C_Reg;
    reg [7:0] x1D_Reg;
    reg [7:0] x1E_Reg;
    reg [7:0] x1F_Reg;

    reg [7:0] x20_Reg;
    reg x20_Reg_valid;
    reg [7:0] x21_Reg;
    reg [7:0] x22_Reg;
    reg [7:0] x23_Reg;
    reg [7:0] x24_Reg;
    reg [7:0] x25_Reg;

    reg [7:0] x27_Reg;

    reg [7:0] x28_Reg;
    reg x28_Reg_valid;
    reg [7:0] x29_Reg;
    reg [7:0] x2A_Reg;
    reg [7:0] x2B_Reg;
    reg [7:0] x2C_Reg;
    reg [7:0] x2D_Reg;
    reg [7:0] x2E_Reg;

    reg [7:0] x30_Reg;  // DAC_0[15:8]
    reg [7:0] x31_Reg;  // DAC_0[7:0]
    reg [7:0] x32_Reg;  // DAC_1[15:8]
    reg [7:0] x33_Reg;  // DAC_1[7:0]
    reg [7:0] x34_Reg;  // DAC_2[15:8]
    reg [7:0] x35_Reg;  // DAC_2[7:0]
    reg [7:0] x36_Reg;  // DAC_3[15:8]
    reg [7:0] x37_Reg;  // DAC_3[7:0]
    reg [7:0] x38_Reg;  // DAC_4[15:8]
    reg [7:0] x39_Reg;  // DAC_4[7:0]
    reg [7:0] x3A_Reg;  // DAC_5[15:8]
    reg [7:0] x3B_Reg;  // DAC_5[7:0]
    reg [7:0] x3C_Reg;  // DAC_6[15:8]
    reg [7:0] x3D_Reg;  // DAC_6[7:0]
    reg [7:0] x3E_Reg;  // DAC_7[15:8]
    reg [7:0] x3F_Reg;  // DAC_7[7:0]

    reg [7:0] x40_Reg;  // DELAY_0
    reg [7:0] x41_Reg;  // DELAY_1
    reg [7:0] x42_Reg;  // DELAY_2
    reg [7:0] x43_Reg;  // DELAY_3
    reg [7:0] x44_Reg;  // DELAY_4
    reg [7:0] x45_Reg;  // DELAY_5
    reg [7:0] x46_Reg;  // DELAY_6
    reg [7:0] x47_Reg;  // DELAY_7
    reg [7:0] x48_Reg;  // DELAY_8
    reg [7:0] x49_Reg;  // DELAY_9
    reg [7:0] x4A_Reg;  // DELAY_10
    reg [7:0] x4B_Reg;  // DELAY_11
    reg [7:0] x4C_Reg;  // DELAY_12
    reg [7:0] x4D_Reg;  // DELAY_13
    reg [7:0] x4E_Reg;  // DELAY_14
    reg [7:0] x4F_Reg;  // DELAY_15

    reg [7:0] x50_Reg;  // DELAY_16
    reg [7:0] x51_Reg;  // DELAY_17
    reg [7:0] x52_Reg;  // DELAY_18
    reg [7:0] x53_Reg;  // DELAY_19
    reg [7:0] x54_Reg;  // DELAY_20
    reg [7:0] x55_Reg;  // DELAY_21
    reg [7:0] x56_Reg;  // DELAY_22
    reg [7:0] x57_Reg;  // DELAY_23
    reg [7:0] x58_Reg;  // DELAY_24
    reg [7:0] x59_Reg;  // DELAY_25
    reg [7:0] x5A_Reg;  // DELAY_26
    reg [7:0] x5B_Reg;  // DELAY_27
    reg [7:0] x5C_Reg;  // DELAY_28
    reg [7:0] x5D_Reg;  // DELAY_29
    reg [7:0] x5E_Reg;  // DELAY_30
    reg [7:0] x5F_Reg;  // DELAY_31

    reg [7:0] x60_Reg;  // DELAY_32
    reg [7:0] x61_Reg;  // DELAY_33
    reg [7:0] x62_Reg;  // DELAY_34
    reg [7:0] x63_Reg;  // DELAY_35
    reg [7:0] x64_Reg;  // DELAY_36
    reg [7:0] x65_Reg;  // DELAY_37
    reg [7:0] x66_Reg;  // DELAY_38
    reg [7:0] x67_Reg;  // DELAY_39
    reg [7:0] x68_Reg;  // DELAY_40
    reg [7:0] x69_Reg;  // DELAY_41
    reg [7:0] x6A_Reg;  // DELAY_42
    reg [7:0] x6B_Reg;  // DELAY_43
    reg [7:0] x6C_Reg;  // DELAY_44
    reg [7:0] x6D_Reg;  // DELAY_45
    reg [7:0] x6E_Reg;  // DELAY_46
    reg [7:0] x6F_Reg;  // DELAY_47

    reg [7:0] x70_Reg;  // DELAY_48
    reg [7:0] x71_Reg;  // DELAY_49
    reg [7:0] x72_Reg;  // DELAY_50
    reg [7:0] x73_Reg;  // DELAY_51
    reg [7:0] x74_Reg;  // DELAY_52
    reg [7:0] x75_Reg;  // DELAY_53
    reg [7:0] x76_Reg;  // DELAY_54
    reg [7:0] x77_Reg;  // DELAY_55
    reg [7:0] x78_Reg;  // DELAY_56
    reg [7:0] x79_Reg;  // DELAY_57
    reg [7:0] x7A_Reg;  // DELAY_58
    reg [7:0] x7B_Reg;  // DELAY_59
    reg [7:0] x7C_Reg;  // DELAY_60
    reg [7:0] x7D_Reg;  // DELAY_61
    reg [7:0] x7E_Reg;  // DELAY_62
    reg [7:0] x7F_Reg;  // DELAY_63

    reg [7:0] x80_Reg;  // Length [7:0]
    reg [7:0] x81_Reg;  // Length [15:8]
    reg [7:0] x82_Reg;  // Length [23:16]
    reg [7:0] x83_Reg;  // Length [31:24]
    reg [7:0] x84_Reg;  // TMS_VECTOR [7:0]
    reg [7:0] x85_Reg;  // TMS_VECTOR [15:8]
    reg [7:0] x86_Reg;  // TMS_VECTOR [23:16]
    reg [7:0] x87_Reg;  // TMS_VECTOR [31:24]
    reg [7:0] x88_Reg;  // TDI_VECTOR [7:0]
    reg [7:0] x89_Reg;  // TDI_VECTOR [15:8]
    reg [7:0] x8A_Reg;  // TDI_VECTOR [23:16]
    reg [7:0] x8B_Reg;  // TDI_VECTOR [31:24]
    reg [7:0] x8C_Reg;  // TDO_VECTOR [7:0]
    reg [7:0] x8D_Reg;  // TDO_VECTOR [15:8]
    reg [7:0] x8E_Reg;  // TDO_VECTOR [23:16]
    reg [7:0] x8F_Reg;  // TDO_VECTOR [31:24]

    reg [7:0] x90_Reg;  // SP6 CONFIG ADDRESS [7:0]
    reg [7:0] x91_Reg;  // SP6 CONFIG ADDRESS [7:0]
    reg [7:0] x92_Reg;  // Length [23:16]
    reg [7:0] x93_Reg;  // Length [31:24]

    reg [7:0] xA0_Reg;  // TDO_VECTOR_LENGTH[7:0]
    reg [7:0] xA1_Reg;  // TDO_VECTOR_LENGTH[15:8]
    reg [7:0] xA2_Reg;  // TDO_VECTOR_LENGTH[23:16]
    reg [7:0] xA3_Reg;  // TDO_VECTOR_LENGTH[31:24]
    reg [7:0] xA4_Reg;  // TDO_VECTOR_READ_EN
    reg [7:0] xA5_Reg;  // 
    reg [7:0] xA6_Reg;  // 
    reg [7:0] xA7_Reg;  // 

    reg   [7:0]   x12x_Reg[(DAC_NUM - 1): 0][DAC_CHANNEL_NUM * 2 - 1:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] x4x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] x5x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] x6x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] x7x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    //reg   [7:0]   x12x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] x9x_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]
    reg [7:0] xAx_Reg[3:0];  // DAC0-7: DAC_0[15:8], DAC_0[7:0], DAC_1[15:8], DAC_1[7:0]

    //--------------------------------------
    // Reading for Temperature, VCCINT, VCCAUX, VCCBRAM by XADC
    //--------------------------------------

    wire [15:0] temp_raw;  // 鍘熷娓╁害鏁版嵁:  low 4 bit is unused
    wire [11:0] temp_c;  // 鎽勬皬娓╁害锛屼繚鐣� 12 浣嶇簿搴�
    wire [15:0] vccint_raw;  // 鍘熷VCCINT鏁版嵁
    wire [11:0] vccint_v;  // VCCINT鐢靛帇锛坢V锛夛紝淇濈暀 12 浣嶇簿搴�
    wire [15:0] vccaux_raw;  // 鍘熷VCCAUX鏁版嵁
    wire [11:0] vccaux_v;  // VCCAUX鐢靛帇锛坢V锛夛紝淇濈暀 12 浣嶇簿搴�
    wire [15:0] vccbram_raw;  // 鍘熷VCCBRAM鏁版嵁
    wire [11:0] vccbram_v;  // VCCBRAM鐢靛帇锛坢V锛夛紝淇濈暀 12 浣嶇簿搴�

    read_temperature_and_vccint read_internal_temperature (
        .clk(CLK),
        .rst(RST),
        .temp_raw(temp_raw),
        .temp_c(temp_c),
        .vccint_raw(vccint_raw),
        .vccint_v(vccint_v),
        .vccaux_raw(vccaux_raw),
        .vccaux_v(vccaux_v),
        .vccbram_raw(vccbram_raw),
        .vccbram_v(vccbram_v)
    );
    
/*     ila_4 ila_4(
     .clk(CLK),
     .probe0(temp_raw)
    ); */
    
    //--------------------------------------
    //  Sig. assignment for outputs
    //--------------------------------------


    //--------------------------------------
    //  Read data mux.
    //--------------------------------------
    reg     [7:0] muxRegDataA;
    reg           muxRegAck;

    reg     [7:0] rdDataI;
    reg           rdDataReady;
    reg           rdDataAck;

    integer       index_0;
    integer       index_1;

    always @(posedge CLK) begin
        if (regCs[0] == 1) begin
            case (regAddr[7:0])
                8'h0:
                if (TDC_NUM >= 8) muxRegDataA[7:0] <= MSB_check[7:0];
                else muxRegDataA[0+:TDC_NUM] <= MSB_check[0+:TDC_NUM];
                8'h1:
                if (TDC_NUM >= 16) muxRegDataA[7:0] <= MSB_check[15:8];
                else if (TDC_NUM > 8) muxRegDataA[0+:TDC_NUM-8] <= MSB_check[8+:TDC_NUM-8];
                else muxRegDataA[0+:8] = 0;
                8'h2:
                if (TDC_NUM >= 24) muxRegDataA[7:0] <= MSB_check[23:16];
                else if (TDC_NUM > 16) muxRegDataA[0+:TDC_NUM-16] <= MSB_check[16+:TDC_NUM-16];
                else muxRegDataA[0+:8] = 0;
                8'h3:
                if (TDC_NUM >= 32) muxRegDataA[7:0] <= MSB_check[31:24];
                else if (TDC_NUM > 24) muxRegDataA[0+:TDC_NUM-24] <= MSB_check[24+:TDC_NUM-24];
                else muxRegDataA[0+:8] = 0;
                8'h4:
                if (TDC_NUM >= 40) muxRegDataA[7:0] <= MSB_check[39:32];
                else if (TDC_NUM > 32) muxRegDataA[0+:TDC_NUM-32] <= MSB_check[32+:TDC_NUM-32];
                else muxRegDataA[0+:8] = 0;
                8'h5:
                if (TDC_NUM >= 48) muxRegDataA[7:0] <= MSB_check[47:40];
                else if (TDC_NUM > 40) muxRegDataA[0+:TDC_NUM-40] <= MSB_check[40+:TDC_NUM-40];
                else muxRegDataA[0+:8] = 0;
                8'h6:
                if (TDC_NUM >= 56) muxRegDataA[7:0] <= MSB_check[55:48];
                else if (TDC_NUM > 48) muxRegDataA[0+:TDC_NUM-48] <= MSB_check[48+:TDC_NUM-48];
                else muxRegDataA[0+:8] = 0;
                8'h7:
                if (TDC_NUM >= 64) muxRegDataA[7:0] <= MSB_check[63:56];
                else if (TDC_NUM > 56) muxRegDataA[0+:TDC_NUM-56] <= MSB_check[56+:TDC_NUM-56];
                else muxRegDataA[0+:8] = 0;
                8'h8:
                if (TDC_NUM >= 72) muxRegDataA[7:0] <= MSB_check[71:64];
                else if (TDC_NUM > 64) muxRegDataA[0+:TDC_NUM-64] <= MSB_check[64+:TDC_NUM-64];
                else muxRegDataA[0+:8] = 0;
                8'h9:
                if (TDC_NUM >= 80) muxRegDataA[7:0] <= MSB_check[79:72];
                else if (TDC_NUM > 72) muxRegDataA[0+:TDC_NUM-72] <= MSB_check[72+:TDC_NUM-72];
                else muxRegDataA[0+:8] = 0;
                8'hA:
                if (TDC_NUM >= 88) muxRegDataA[7:0] <= MSB_check[87:80];
                else if (TDC_NUM > 80) muxRegDataA[0+:TDC_NUM-80] <= MSB_check[80+:TDC_NUM-80];
                else muxRegDataA[0+:8] = 0;
                8'hB:
                if (TDC_NUM >= 96) muxRegDataA[7:0] <= MSB_check[95:88];
                else if (TDC_NUM > 88) muxRegDataA[0+:TDC_NUM-88] <= MSB_check[88+:TDC_NUM-88];
                else muxRegDataA[0+:8] = 0;
                8'hC:
                if (TDC_NUM >= 104) muxRegDataA[7:0] <= MSB_check[103:96];
                else if (TDC_NUM > 96) muxRegDataA[0+:TDC_NUM-96] <= MSB_check[96+:TDC_NUM-96];
                else muxRegDataA[0+:8] = 0;
                8'hD:
                if (TDC_NUM >= 112) muxRegDataA[7:0] <= MSB_check[111:104];
                else if (TDC_NUM > 104) muxRegDataA[0+:TDC_NUM-104] <= MSB_check[104+:TDC_NUM-104];
                else muxRegDataA[0+:8] = 0;
                8'hE:
                if (TDC_NUM >= 120) muxRegDataA[7:0] <= MSB_check[119:112];
                else if (TDC_NUM > 112) muxRegDataA[0+:TDC_NUM-112] <= MSB_check[112+:TDC_NUM-112];
                else muxRegDataA[0+:8] = 0;
                8'hF:
                if (TDC_NUM >= 128) muxRegDataA[7:0] <= MSB_check[127:120];
                else if (TDC_NUM > 120) muxRegDataA[0+:TDC_NUM-120] <= MSB_check[120+:TDC_NUM-120];
                else muxRegDataA[0+:8] = 0;
                default: muxRegDataA[7:0] <= x00_Reg[7:0];
            endcase
        end else if (regCs[1] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x10_Reg[7:0];
                8'h1: muxRegDataA[7:0] <= x11_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x12_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= {1'b0, state, 1'b0, MSB_abnormal, clk_locked_sitcp, clk_locked_tdc};
                8'h4: muxRegDataA[7:0] <= {1'b0, fifo_level1_pointer};//x14_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x15_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x16_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x17_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x18_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x19_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x1A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x1B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x1C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x1D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= x1E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= x1F_Reg[7:0];
                default: muxRegDataA[7:0] <= x10_Reg[7:0];
            endcase
        end else if (regCs[2] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x20_Reg[7:0];
                8'h1: muxRegDataA[7:0] <= x21_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x22_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x23_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x24_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x25_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= {6'h0, FLASH_WRITE_READY};
                8'h7: muxRegDataA[7:0] <= x27_Reg[7:0];

                8'h8: muxRegDataA[7:0] <= x28_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x29_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x2A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x2B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x2C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x2D_Reg[7:0];
                default: muxRegDataA[7:0] <= x20_Reg[7:0];
            endcase
        end else if (regCs[3] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= {temp_raw[11:4]};  
                8'h1: muxRegDataA[7:0] <= {vccint_raw[7:4], temp_raw[15:12]}; 
                8'h2: muxRegDataA[7:0] <= {vccint_raw[15:8]};  
                8'h3: muxRegDataA[7:0] <= x33_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= temp_c[7:0];
                8'h5: muxRegDataA[7:0] <= {4'b0, temp_c[11:8]};
                //8'h4: muxRegDataA[7:0] <= x34_Reg[7:0];
                //8'h5: muxRegDataA[7:0] <= x35_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= {6'h0, FLASH_WRITE_READY};
                8'h7: muxRegDataA[7:0] <= x37_Reg[7:0];

                8'h8: muxRegDataA[7:0] <= x38_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x39_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x3A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x3B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x3C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x3D_Reg[7:0];
                default: muxRegDataA[7:0] <= x30_Reg[7:0];
            endcase
        end else if (regCs[4] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x40_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x41_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x42_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x43_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x44_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x45_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x46_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x47_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x48_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x49_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x4A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x4B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x4C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x4D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= x4E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= x4F_Reg[7:0];
                default: muxRegDataA[7:0] <= x40_Reg[7:0];
            endcase
        end  else if (regCs[5] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x50_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x51_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x52_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x53_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x54_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x55_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x56_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x57_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x58_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x59_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x5A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x5B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x5C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x5D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= x5E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= x5F_Reg[7:0];
                default: muxRegDataA[7:0] <= x50_Reg[7:0];
            endcase
        end else if (regCs[6] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x60_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x61_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x62_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x63_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x64_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x65_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x66_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x67_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x68_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x69_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x6A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x6B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x6C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x6D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= x6E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= x6F_Reg[7:0];
                default: muxRegDataA[7:0] <= x60_Reg[7:0];
            endcase
        end else if (regCs[7] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x70_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x71_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x72_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x73_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x74_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x75_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x76_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x77_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x78_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x79_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x7A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x7B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= x7C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= x7D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= x7E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= x7F_Reg[7:0];
                default: muxRegDataA[7:0] <= x70_Reg[7:0];
            endcase
        end else if (regCs[8] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x80_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x81_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x82_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x83_Reg[7:0];
                8'h4: muxRegDataA[7:0] <= x84_Reg[7:0];
                8'h5: muxRegDataA[7:0] <= x85_Reg[7:0];
                8'h6: muxRegDataA[7:0] <= x86_Reg[7:0];
                8'h7: muxRegDataA[7:0] <= x87_Reg[7:0];
                8'h8: muxRegDataA[7:0] <= x88_Reg[7:0];
                8'h9: muxRegDataA[7:0] <= x89_Reg[7:0];
                8'hA: muxRegDataA[7:0] <= x8A_Reg[7:0];
                8'hB: muxRegDataA[7:0] <= x8B_Reg[7:0];
                8'hC: muxRegDataA[7:0] <= TDO_VECTOR[7:0]; // x8C_Reg[7:0];
                8'hD: muxRegDataA[7:0] <= TDO_VECTOR[15:8]; //x8D_Reg[7:0];
                8'hE: muxRegDataA[7:0] <= TDO_VECTOR[23:16]; //x8E_Reg[7:0];
                8'hF: muxRegDataA[7:0] <= TDO_VECTOR[31:24]; //x8F_Reg[7:0];
                default: muxRegDataA[7:0] <= x80_Reg[7:0];
            endcase
        end else if (regCs[9] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= x90_Reg[7:0];  
                8'h1: muxRegDataA[7:0] <= x91_Reg[7:0];
                8'h2: muxRegDataA[7:0] <= x92_Reg[7:0];
                8'h3: muxRegDataA[7:0] <= x93_Reg[7:0];
                default: muxRegDataA[7:0] <= x90_Reg[7:0];
            endcase
        end else if (regCs[10] == 1) begin
            case (regAddr[7:0])
                8'h0: muxRegDataA[7:0] <= TDO_VECTOR_LENGTH[7:0];  
                8'h1: muxRegDataA[7:0] <= TDO_VECTOR_LENGTH[15:8];
                8'h2: muxRegDataA[7:0] <= TDO_VECTOR_LENGTH[23:16];
                8'h3: muxRegDataA[7:0] <= TDO_VECTOR_LENGTH[31:24];
                8'h4: muxRegDataA[7:0] <= xA4_Reg[7:0];
                default: muxRegDataA[7:0] <= xA0_Reg[7:0];
            endcase
        end else if (|regCs[15:12] == 1) begin

            for (index_0 = 0; index_0 < DAC_NUM; index_0 = index_0 + 1) begin
                for (index_1 = 0; index_1 < DAC_CHANNEL_NUM * 2; index_1 = index_1 + 1) begin
                    if (regCs[(index_0+12)]) begin
                        if (regAddr[7:0] == index_1)
                            muxRegDataA[7:0] <= x12x_Reg[index_0][index_1][7:0];
                    end
                end
            end

        end


        if (FLASH_READ_VALID) rdDataI <= FLASH_READ_DATA;
        //else if(TDO_VECTOR_VALID) rdDataI <= FLASH_READ_DATA;
        //rdDataReady  <= FLASH_READ_VALID;
        rdDataAck <= FLASH_READ_VALID & readCs;
        //reg_ack   <= |regCs[15:0] & (regRe | regWe);  // read MSB_check
        reg_ack      <= |regCs[15:1] & (regRe | regWe);    // can not read MSB_check
    end


    //------------------------------------------------------------------------------
    //  Output
    //------------------------------------------------------------------------------
    reg       orAck;
    reg [7:0] orRd;
    always @(posedge CLK) begin
        orAck   <= reg_ack | rdDataAck;
        orRd[7:0] <=  (reg_ack    ? muxRegDataA[7:0]  : 8'd0) |
                (rdDataAck  ? rdDataI : 8'd0);
    end
    
/*     ila_1 ila1(
     .clk(CLK),
     .probe0(regAddr),
     .probe1(muxRegDataA),
     .probe2(regCs),
     .probe3(orAck),
     .probe4(regAddr),
     .probe5(regRd),
     .probe6(regWd),
     .probe7(reg_ack),
     .probe8(x12_Reg)
     //.probe9(dacDataReg)
     ); */

    assign RBCP_ACK     = orAck;
    assign RBCP_RD[7:0] = orRd[7:0];



    //------------------------------------------------------------------------------
    //  Input
    //------------------------------------------------------------------------------

    always @(posedge CLK) begin
        if (RST) begin
            x00_Reg[7:0]  <= 8'h0;
            x01_Reg[7:0]  <= 8'h0;
            x02_Reg[7:0]  <= 8'h0;
            x03_Reg[7:0]  <= 8'h0;
            x04_Reg[7:0]  <= 8'h0;
            x05_Reg[7:0]  <= 0;
            x06_Reg[7:0]  <= 0;
            x07_Reg[7:0]  <= 0;
            x08_Reg[7:0]  <= 0;  //  read flash data
            x09_Reg[7:0]  <= 0;
            x0A_Reg[7:0]  <= 0;
            x0B_Reg[7:0]  <= 0;
            x0C_Reg[7:0]  <= 0;
            x0D_Reg[7:0]  <= 0;
            x0E_Reg[7:0]  <= 0;
            x0F_Reg[7:0]  <= 0;

            x10_Reg[7:0]  <= 0;  // Calibration switch: 0 is reset, 1 is calibration
            x11_Reg[7:0]  <= 0;  // reset
            x12_Reg[7:0]  <= 8'h1;  // 1: golden; 2: multiboot
            x13_Reg[7:0]  <= 8'h0;  
            x14_Reg[7:0]  <= 8'b0;
            x15_Reg[7:0]  <= 8'b10100;  // TDC Version
            x16_Reg[7:0]  <= 8'h1;  // LED on/off: 1: on; 0: off
            //x17_Reg[7:0]    <= TDC_NUM;    // TDC channel NUM
            x17_Reg[7:0]  <= 8'h0;  // TDC channel NUM
            x18_Reg[7:0]  <= 0;  // mask PMT Ch7-0
            x19_Reg[7:0]  <= 0;  // mask PMT Ch15-8
            x1A_Reg[7:0]  <= 0;  // mask PMT Ch23-16
            x1B_Reg[7:0]  <= 0;  // mask PMT Ch31-24
            x1C_Reg[7:0]  <= 0;  // mask PMT Ch39-32
            x1D_Reg[7:0]  <= 0;  // mask PMT Ch47-40
            x1E_Reg[7:0]  <= 0;  // mask PMT Ch55-48
            x1F_Reg[7:0]  <= 0;  // mask PMT Ch63-56

            x20_Reg[7:0]  <= 0;  //  write flash data
            x20_Reg_valid <= 0;  //  write flash data valid
            //x20_Reg_valid_r <= 0;
            x21_Reg[7:0]  <= 0;  //  write flash data cmd
            x22_Reg[7:0]  <= 0;  //  [7:0] of the first address of write flash data
            x23_Reg[7:0]  <= 0;  //  [15:8] of the first address of write flash data
            x24_Reg[7:0]  <= 0;  //  [23:16] of the first address of write flash data
            x25_Reg[7:0]  <= 0;  //  [31:24] of the first address of write flash data
            
            x27_Reg[7:0]  <= 8'h1;  //  disable to erase flash data before writing

            x28_Reg[7:0]  <= 0;
            //x28_Reg_valid   <= 0; //  read flash data valid
            //x20_Reg_valid_r <= 0;
            x29_Reg[7:0]  <= 8'h13;  //  read flash data cmd software address is 0x49
            x2A_Reg[7:0]  <= 0;  //  [7:0] of the first address of read flash data
            x2B_Reg[7:0]  <= 0;  //  [15:8] of the first address of read flash data
            x2C_Reg[7:0]  <= 0;  //  [23:16] of the first address of read flash data
            x2D_Reg[7:0]  <= 0;  //  [31:24] of the first address of read flash data   
            x2E_Reg[7:0]  <= 8'h0;  //  read flash data enable 
            

            x30_Reg[7:0]  <= 0;
            x31_Reg[7:0]  <= 0;
            x32_Reg[7:0]  <= 0;
            x33_Reg[7:0]  <= 0;
            x34_Reg[7:0]  <= 0;
            x35_Reg[7:0]  <= 0;
            x36_Reg[7:0]  <= 0;
            x37_Reg[7:0]  <= 0;
            x38_Reg[7:0]  <= 0;
            x39_Reg[7:0]  <= 0;
            x3A_Reg[7:0]  <= 0;
            x3B_Reg[7:0]  <= 0;
            x3C_Reg[7:0]  <= 0;
            x3D_Reg[7:0]  <= 0;
            x3E_Reg[7:0]  <= 0;
            x3F_Reg[7:0]  <= 0;

            x40_Reg[7:0]  <= 0;
            x41_Reg[7:0]  <= 0;
            x42_Reg[7:0]  <= 0;
            x43_Reg[7:0]  <= 0;
            x44_Reg[7:0]  <= 0;
            x45_Reg[7:0]  <= 0;
            x46_Reg[7:0]  <= 0;
            x47_Reg[7:0]  <= 0;
            x48_Reg[7:0]  <= 0;
            x49_Reg[7:0]  <= 0;
            x4A_Reg[7:0]  <= 0;
            x4B_Reg[7:0]  <= 0;
            x4C_Reg[7:0]  <= 0;
            x4D_Reg[7:0]  <= 0;
            x4E_Reg[7:0]  <= 0;
            x4F_Reg[7:0]  <= 0;

            x50_Reg[7:0]  <= 0;
            x51_Reg[7:0]  <= 0;
            x52_Reg[7:0]  <= 0;
            x53_Reg[7:0]  <= 0;
            x54_Reg[7:0]  <= 0;
            x55_Reg[7:0]  <= 0;
            x56_Reg[7:0]  <= 0;
            x57_Reg[7:0]  <= 0;
            x58_Reg[7:0]  <= 0;
            x59_Reg[7:0]  <= 0;
            x5A_Reg[7:0]  <= 0;
            x5B_Reg[7:0]  <= 0;
            x5C_Reg[7:0]  <= 0;
            x5D_Reg[7:0]  <= 0;
            x5E_Reg[7:0]  <= 0;
            x5F_Reg[7:0]  <= 0;

            x60_Reg[7:0]  <= 0;
            x61_Reg[7:0]  <= 0;
            x62_Reg[7:0]  <= 0;
            x63_Reg[7:0]  <= 0;
            x64_Reg[7:0]  <= 0;
            x65_Reg[7:0]  <= 0;
            x66_Reg[7:0]  <= 0;
            x67_Reg[7:0]  <= 0;
            x68_Reg[7:0]  <= 0;
            x69_Reg[7:0]  <= 0;
            x6A_Reg[7:0]  <= 0;
            x6B_Reg[7:0]  <= 0;
            x6C_Reg[7:0]  <= 0;
            x6D_Reg[7:0]  <= 0;
            x6E_Reg[7:0]  <= 0;
            x6F_Reg[7:0]  <= 0;

            x70_Reg[7:0]  <= 0;
            x71_Reg[7:0]  <= 0;
            x72_Reg[7:0]  <= 0;
            x73_Reg[7:0]  <= 0;
            x74_Reg[7:0]  <= 0;
            x75_Reg[7:0]  <= 0;
            x76_Reg[7:0]  <= 0;
            x77_Reg[7:0]  <= 0;
            x78_Reg[7:0]  <= 0;
            x79_Reg[7:0]  <= 0;
            x7A_Reg[7:0]  <= 0;
            x7B_Reg[7:0]  <= 0;
            x7C_Reg[7:0]  <= 0;
            x7D_Reg[7:0]  <= 0;
            x7E_Reg[7:0]  <= 0;
            x7F_Reg[7:0]  <= 0;

            x80_Reg[7:0]  <= 0;
            x81_Reg[7:0]  <= 0;
            x82_Reg[7:0]  <= 0;
            x83_Reg[7:0]  <= 0;
            x84_Reg[7:0]  <= 0;
            x85_Reg[7:0]  <= 0;
            x86_Reg[7:0]  <= 0;
            x87_Reg[7:0]  <= 0;
            x88_Reg[7:0]  <= 0;
            x89_Reg[7:0]  <= 0;
            x8A_Reg[7:0]  <= 0;
            x8B_Reg[7:0]  <= 0;
            x8C_Reg[7:0]  <= 0;
            x8D_Reg[7:0]  <= 0;
            x8E_Reg[7:0]  <= 0;
            x8F_Reg[7:0]  <= 0;

            x90_Reg[7:0]  <= 0;
            x91_Reg[7:0]  <= 0;
            x92_Reg[7:0]  <= 0;
            x93_Reg[7:0]  <= 0;

            xA0_Reg[7:0]  <= 0;
            xA1_Reg[7:0]  <= 0;
            xA2_Reg[7:0]  <= 0;
            xA3_Reg[7:0]  <= 0;
            xA4_Reg[7:0]  <= 0;

            SP6_CONFIG_VALID   <= 1'b0;

            for (index_0 = 0; index_0 < DAC_NUM; index_0 = index_0 + 1) begin
                for (index_1 = 0; index_1 < DAC_CHANNEL_NUM * 2; index_1 = index_1 + 1) begin
                    if (index_1 % 2 == 0) begin
                        x12x_Reg[index_0][index_1][7:0] <= 8'h12;
                    end else begin
                        x12x_Reg[index_0][index_1][7:0] <= 8'h34;
                    end
                end
            end


        end else if (regWe) begin
            x05_Reg[7:0]  <= (regCs[0] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x05_Reg[7:0]);
            x06_Reg[7:0]  <= (regCs[0] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x06_Reg[7:0]);
            x07_Reg[7:0]  <= (regCs[0] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x07_Reg[7:0]);
            x08_Reg[7:0]  <= (regCs[0] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x08_Reg[7:0]);
            x09_Reg[7:0]  <= (regCs[0] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x09_Reg[7:0]);

            x10_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x10_Reg[7:0]);
            x11_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x11_Reg[7:0]);
            x12_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x12_Reg[7:0]);
            x13_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x13_Reg[7:0]);
            x14_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x14_Reg[7:0]);
            x15_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x15_Reg[7:0]);
            x16_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x16_Reg[7:0]);
            x17_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x17_Reg[7:0]);
            x18_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x18_Reg[7:0]);
            x19_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x19_Reg[7:0]);
            x1A_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x1A_Reg[7:0]);
            x1B_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x1B_Reg[7:0]);
            x1C_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x1C_Reg[7:0]);
            x1D_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x1D_Reg[7:0]);
            x1E_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x1E_Reg[7:0]);
            x1F_Reg[7:0]  <= (regCs[1] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x1F_Reg[7:0]);

            x20_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x20_Reg[7:0]);
            x20_Reg_valid <= (regCs[2] == 1) & (regAddr[7:0] == 8'h0) & regWe;

            x21_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x21_Reg[7:0]);
            x22_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x22_Reg[7:0]);
            x23_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x23_Reg[7:0]);
            x24_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x24_Reg[7:0]);
            x25_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x25_Reg[7:0]);
            x27_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x27_Reg[7:0]);

            x28_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x28_Reg[7:0]);
            x29_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x29_Reg[7:0]);
            x2A_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x2A_Reg[7:0]);
            x2B_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x2B_Reg[7:0]);
            x2C_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x2C_Reg[7:0]);
            x2D_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x2D_Reg[7:0]);
            x2E_Reg[7:0]  <= (regCs[2] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x2E_Reg[7:0]);
            //x20_Reg_valid_r <= x20_Reg_valid;

            /*
      if(regCs[3] || regCs[4] || regCs[5] || regCs[6]) begin
        x30_Reg[7:0]    <= ((regAddr[7:0]==8'h0) ? regWd[7:0] : x30_Reg[7:0]);
        x31_Reg[7:0]    <= ((regAddr[7:0]==8'h1) ? regWd[7:0] : x31_Reg[7:0]);
        x32_Reg[7:0]    <= ((regAddr[7:0]==8'h2) ? regWd[7:0] : x32_Reg[7:0]);
        x33_Reg[7:0]    <= ((regAddr[7:0]==8'h3) ? regWd[7:0] : x33_Reg[7:0]);
        x34_Reg[7:0]    <= ((regAddr[7:0]==8'h4) ? regWd[7:0] : x34_Reg[7:0]);
        x35_Reg[7:0]    <= ((regAddr[7:0]==8'h5) ? regWd[7:0] : x35_Reg[7:0]);
        x36_Reg[7:0]    <= ((regAddr[7:0]==8'h6) ? regWd[7:0] : x36_Reg[7:0]);
        x37_Reg[7:0]    <= ((regAddr[7:0]==8'h7) ? regWd[7:0] : x37_Reg[7:0]);
        x38_Reg[7:0]    <= ((regAddr[7:0]==8'h8) ? regWd[7:0] : x38_Reg[7:0]);
        x39_Reg[7:0]    <= ((regAddr[7:0]==8'h9) ? regWd[7:0] : x39_Reg[7:0]);
        x3A_Reg[7:0]    <= ((regAddr[7:0]==8'hA) ? regWd[7:0] : x3A_Reg[7:0]);
        x3B_Reg[7:0]    <= ((regAddr[7:0]==8'hB) ? regWd[7:0] : x3B_Reg[7:0]);
        x3C_Reg[7:0]    <= ((regAddr[7:0]==8'hC) ? regWd[7:0] : x3C_Reg[7:0]);
        x3D_Reg[7:0]    <= ((regAddr[7:0]==8'hD) ? regWd[7:0] : x3D_Reg[7:0]);
        x3E_Reg[7:0]    <= ((regAddr[7:0]==8'hE) ? regWd[7:0] : x3E_Reg[7:0]);
        x3F_Reg[7:0]    <= ((regAddr[7:0]==8'hF) ? regWd[7:0] : x3F_Reg[7:0]);
      end
 */


            for (index_0 = 0; index_0 < DAC_NUM; index_0 = index_0 + 1) begin
                for (index_1 = 0; index_1 < DAC_CHANNEL_NUM * 2; index_1 = index_1 + 1) begin
                    if (regCs[(index_0+12)]) begin
                        x12x_Reg[index_0][index_1][7:0] <= ((regAddr[7:0]==index_1) ? regWd[7:0] : x12x_Reg[index_0][index_1][7:0]);
                    end
                end
            end

            x40_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x40_Reg[7:0]);
            x41_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x41_Reg[7:0]);
            x42_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x42_Reg[7:0]);
            x43_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x43_Reg[7:0]);
            x44_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x44_Reg[7:0]);
            x45_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x45_Reg[7:0]);
            x46_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x46_Reg[7:0]);
            x47_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x47_Reg[7:0]);
            x48_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x48_Reg[7:0]);
            x49_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x49_Reg[7:0]);
            x4A_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x4A_Reg[7:0]);
            x4B_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x4B_Reg[7:0]);
            x4C_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x4C_Reg[7:0]);
            x4D_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x4D_Reg[7:0]);
            x4E_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x4E_Reg[7:0]);
            x4F_Reg[7:0]  <= (regCs[4] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x4F_Reg[7:0]);


            x50_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x50_Reg[7:0]);
            x51_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x51_Reg[7:0]);
            x52_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x52_Reg[7:0]);
            x53_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x53_Reg[7:0]);
            x54_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x54_Reg[7:0]);
            x55_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x55_Reg[7:0]);
            x56_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x56_Reg[7:0]);
            x57_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x57_Reg[7:0]);
            x58_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x58_Reg[7:0]);
            x59_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x59_Reg[7:0]);
            x5A_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x5A_Reg[7:0]);
            x5B_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x5B_Reg[7:0]);
            x5C_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x5C_Reg[7:0]);
            x5D_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x5D_Reg[7:0]);
            x5E_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x5E_Reg[7:0]);
            x5F_Reg[7:0]  <= (regCs[5] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x5F_Reg[7:0]);


            x60_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x60_Reg[7:0]);
            x61_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x61_Reg[7:0]);
            x62_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x62_Reg[7:0]);
            x63_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x63_Reg[7:0]);
            x64_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x64_Reg[7:0]);
            x65_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x65_Reg[7:0]);
            x66_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x66_Reg[7:0]);
            x67_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x67_Reg[7:0]);
            x68_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x68_Reg[7:0]);
            x69_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x69_Reg[7:0]);
            x6A_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x6A_Reg[7:0]);
            x6B_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x6B_Reg[7:0]);
            x6C_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x6C_Reg[7:0]);
            x6D_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x6D_Reg[7:0]);
            x6E_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x6E_Reg[7:0]);
            x6F_Reg[7:0]  <= (regCs[6] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x6F_Reg[7:0]);

            x70_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x70_Reg[7:0]);
            x71_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x71_Reg[7:0]);
            x72_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x72_Reg[7:0]);
            x73_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x73_Reg[7:0]);
            x74_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x74_Reg[7:0]);
            x75_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x75_Reg[7:0]);
            x76_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x76_Reg[7:0]);
            x77_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x77_Reg[7:0]);
            x78_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x78_Reg[7:0]);
            x79_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x79_Reg[7:0]);
            x7A_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x7A_Reg[7:0]);
            x7B_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x7B_Reg[7:0]);
            x7C_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x7C_Reg[7:0]);
            x7D_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x7D_Reg[7:0]);
            x7E_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x7E_Reg[7:0]);
            x7F_Reg[7:0]  <= (regCs[7] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x7F_Reg[7:0]);

            x80_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x80_Reg[7:0]);
            x81_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x81_Reg[7:0]);
            x82_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x82_Reg[7:0]);
            x83_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x83_Reg[7:0]);
            x84_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : x84_Reg[7:0]);
            x85_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h5) ? regWd[7:0] : x85_Reg[7:0]);
            x86_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h6) ? regWd[7:0] : x86_Reg[7:0]);
            x87_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h7) ? regWd[7:0] : x87_Reg[7:0]);
            x88_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h8) ? regWd[7:0] : x88_Reg[7:0]);
            x89_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'h9) ? regWd[7:0] : x89_Reg[7:0]);
            x8A_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hA) ? regWd[7:0] : x8A_Reg[7:0]);
            x8B_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hB) ? regWd[7:0] : x8B_Reg[7:0]);
            x8C_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hC) ? regWd[7:0] : x8C_Reg[7:0]);
            x8D_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hD) ? regWd[7:0] : x8D_Reg[7:0]);
            x8E_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hE) ? regWd[7:0] : x8E_Reg[7:0]);
            x8F_Reg[7:0]  <= (regCs[8] == 1 & (regAddr[7:0] == 8'hF) ? regWd[7:0] : x8F_Reg[7:0]);

            x90_Reg[7:0]  <= (regCs[9] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : x90_Reg[7:0]);
            x91_Reg[7:0]  <= (regCs[9] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : x91_Reg[7:0]);
            x92_Reg[7:0]  <= (regCs[9] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : x92_Reg[7:0]);
            x93_Reg[7:0]  <= (regCs[9] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : x93_Reg[7:0]);

            xA0_Reg[7:0]  <= (regCs[10] == 1 & (regAddr[7:0] == 8'h0) ? regWd[7:0] : xA0_Reg[7:0]);
            xA1_Reg[7:0]  <= (regCs[10] == 1 & (regAddr[7:0] == 8'h1) ? regWd[7:0] : xA1_Reg[7:0]);
            xA2_Reg[7:0]  <= (regCs[10] == 1 & (regAddr[7:0] == 8'h2) ? regWd[7:0] : xA2_Reg[7:0]);
            xA3_Reg[7:0]  <= (regCs[10] == 1 & (regAddr[7:0] == 8'h3) ? regWd[7:0] : xA3_Reg[7:0]);
            xA4_Reg[7:0]  <= (regCs[10] == 1 & (regAddr[7:0] == 8'h4) ? regWd[7:0] : xA4_Reg[7:0]);

            SP6_CONFIG_VALID   <= (regCs[9] == 1) & (regAddr[7:0] == 8'h1) & regWe;
        end else
        if (regRe) begin

        end else begin
            x20_Reg_valid <= 1'b0;
            SP6_CONFIG_VALID   <= 1'b0;
        end
    end

    assign FLASH_ERASE_DISABLE = x27_Reg[0];
    assign FLASH_WRITE_DATA    = x20_Reg;
    assign FLASH_WRITE_VALID   = x20_Reg_valid;
    assign TDC_RST_SELECT      = x10_Reg[0];
    assign SOFT_RST            = x11_Reg[0];

    assign OFFSET_SWITCH       = x17_Reg[1:0];

    generate
        if (TDC_NUM / 2 >= 8) assign RST_FIFO[7:0] = x18_Reg[7:0];
        else assign RST_FIFO[0+:TDC_NUM/2] = x18_Reg[0+:TDC_NUM/2];

        if (TDC_NUM / 2 >= 16) assign RST_FIFO[15:8] = x19_Reg[7:0];
        else if (TDC_NUM / 2 > 8) assign RST_FIFO[8+:(TDC_NUM/2-8)] = x19_Reg[0+:(TDC_NUM/2-8)];

        if (TDC_NUM / 2 >= 24) assign RST_FIFO[23:16] = x1A_Reg[7:0];
        else if (TDC_NUM / 2 > 16) assign RST_FIFO[16+:(TDC_NUM/2-16)] = x1A_Reg[0+:(TDC_NUM/2-16)];

        if (TDC_NUM / 2 >= 32) assign RST_FIFO[31:24] = x1B_Reg[7:0];
        else if (TDC_NUM / 2 > 24) assign RST_FIFO[24+:(TDC_NUM/2-24)] = x1A_Reg[0+:(TDC_NUM/2-24)];

        if (TDC_NUM / 2 >= 40) assign RST_FIFO[39:32] = x1C_Reg[7:0];
        else if (TDC_NUM / 2 > 32) assign RST_FIFO[32+:(TDC_NUM/2-32)] = x1C_Reg[0+:(TDC_NUM/2-32)];

        if (TDC_NUM / 2 >= 48) assign RST_FIFO[47:40] = x1D_Reg[7:0];
        else if (TDC_NUM / 2 > 40) assign RST_FIFO[40+:(TDC_NUM/2-40)] = x1D_Reg[0+:(TDC_NUM/2-40)];

        if (TDC_NUM / 2 >= 56) assign RST_FIFO[55:48] = x1E_Reg[7:0];
        else if (TDC_NUM / 2 > 48) assign RST_FIFO[48+:(TDC_NUM/2-48)] = x1E_Reg[0+:(TDC_NUM/2-48)];

        if (TDC_NUM / 2 >= 64) assign RST_FIFO[63:56] = x1F_Reg[7:0];
        else if (TDC_NUM / 2 > 56) assign RST_FIFO[56+:(TDC_NUM/2-56)] = x1F_Reg[0+:(TDC_NUM/2-56)];

    endgenerate

    assign LED_ON             = x16_Reg[0];
    assign EXTERNAL_CALIB_ENABLE     = x16_Reg[1];
    assign JTAG_SWITCH        = x16_Reg[2];
    assign XVC_ENABLE         = (regCs[8] == 1) & ((regAddr[7:0] == 8'h3) | (regAddr[7:0] == 8'h7) | (regAddr[7:0] == 8'hB)) & regWe;
    assign XVC_LENGTH_READY   = (regCs[8] == 1) & (regAddr[7:0] == 8'h3) & regWe;
    assign TMS_VECTOR_READY   = (regCs[8] == 1) & (regAddr[7:0] == 8'h7) & regWe;
    assign TDI_VECTOR_READY   = (regCs[8] == 1) & (regAddr[7:0] == 8'hB) & regWe;

    // assign XVC_LENGTH         = {x80_Reg, x81_Reg, x82_Reg, x83_Reg};
    // assign TMS_VECTOR         = {x84_Reg, x85_Reg, x86_Reg, x87_Reg};
    // assign TDI_VECTOR         = {x88_Reg, x89_Reg, x8A_Reg, x8B_Reg};
    assign XVC_LENGTH         = {x83_Reg, x82_Reg, x81_Reg, x80_Reg};
    assign TMS_VECTOR         = {x87_Reg, x86_Reg, x85_Reg, x84_Reg};
    assign TDI_VECTOR         = {x8B_Reg, x8A_Reg, x89_Reg, x88_Reg};
    //assign TDO_VECTOR         = {x8C_Reg, x8D_Reg, x8E_Reg, x8F_Reg};

    assign SP6_CONFIG_ADDR    = x90_Reg;
    assign SP6_CONFIG_VALUE   = x91_Reg;
    //assign SP6_CONFIG_VALID   = (regCs[9] == 1) & (regAddr[7:0] == 8'h1) & regWe;

    assign TDO_VECTOR_READ_EN = xA4_Reg;

    assign FLASH_READ_EN      = (regCs[0] == 1) & (regAddr[7:0] == 8'h8) & regRe;
    assign FLASH_READ_CMD     = x29_Reg;
    assign FLASH_READ_ADDRESS = {x2D_Reg, x2C_Reg, x2B_Reg, x2A_Reg};
    assign is_multiboot       = (x12_Reg == 8'h2) ? 1 : 0;

    generate
        
        if(TDC_NUM >= 2)  begin assign DELAY_VALUE[0]  = x40_Reg; assign DELAY_VALUE[1]  = x41_Reg; end
        if(TDC_NUM >= 4)  begin assign DELAY_VALUE[2]  = x42_Reg; assign DELAY_VALUE[3]  = x43_Reg; end
        if(TDC_NUM >= 6)  begin assign DELAY_VALUE[4]  = x44_Reg; assign DELAY_VALUE[5]  = x45_Reg; end
        if(TDC_NUM >= 8)  begin assign DELAY_VALUE[6]  = x46_Reg; assign DELAY_VALUE[7]  = x47_Reg; end
        if(TDC_NUM >= 10) begin assign DELAY_VALUE[8]  = x48_Reg; assign DELAY_VALUE[9]  = x49_Reg; end
        if(TDC_NUM >= 12) begin assign DELAY_VALUE[10] = x4A_Reg; assign DELAY_VALUE[11] = x4B_Reg; end
        if(TDC_NUM >= 14) begin assign DELAY_VALUE[12] = x4C_Reg; assign DELAY_VALUE[13] = x4D_Reg; end
        if(TDC_NUM >= 16) begin assign DELAY_VALUE[14] = x4E_Reg; assign DELAY_VALUE[15] = x4F_Reg; end
        
        if(TDC_NUM >= 18) begin assign DELAY_VALUE[16] = x50_Reg; assign DELAY_VALUE[17] = x51_Reg; end
        if(TDC_NUM >= 20) begin assign DELAY_VALUE[18] = x52_Reg; assign DELAY_VALUE[19] = x53_Reg; end
        if(TDC_NUM >= 22) begin assign DELAY_VALUE[20] = x54_Reg; assign DELAY_VALUE[21] = x55_Reg; end
        if(TDC_NUM >= 24) begin assign DELAY_VALUE[22] = x56_Reg; assign DELAY_VALUE[23] = x57_Reg; end
        if(TDC_NUM >= 26) begin assign DELAY_VALUE[24] = x58_Reg; assign DELAY_VALUE[25] = x59_Reg; end
        if(TDC_NUM >= 28) begin assign DELAY_VALUE[26] = x5A_Reg; assign DELAY_VALUE[27] = x5B_Reg; end
        if(TDC_NUM >= 30) begin assign DELAY_VALUE[28] = x5C_Reg; assign DELAY_VALUE[29] = x5D_Reg; end
        if(TDC_NUM >= 32) begin assign DELAY_VALUE[30] = x5E_Reg; assign DELAY_VALUE[31] = x5F_Reg; end
        
        if(TDC_NUM >= 34) begin assign DELAY_VALUE[32] = x60_Reg; assign DELAY_VALUE[33] = x61_Reg; end
        if(TDC_NUM >= 36) begin assign DELAY_VALUE[34] = x62_Reg; assign DELAY_VALUE[35] = x63_Reg; end
        if(TDC_NUM >= 38) begin assign DELAY_VALUE[36] = x64_Reg; assign DELAY_VALUE[37] = x65_Reg; end
        if(TDC_NUM >= 40) begin assign DELAY_VALUE[38] = x66_Reg; assign DELAY_VALUE[39] = x67_Reg; end
        if(TDC_NUM >= 42) begin assign DELAY_VALUE[40] = x68_Reg; assign DELAY_VALUE[41] = x69_Reg; end
        if(TDC_NUM >= 44) begin assign DELAY_VALUE[42] = x6A_Reg; assign DELAY_VALUE[43] = x6B_Reg; end
        if(TDC_NUM >= 46) begin assign DELAY_VALUE[44] = x6C_Reg; assign DELAY_VALUE[45] = x6D_Reg; end
        if(TDC_NUM >= 48) begin assign DELAY_VALUE[46] = x6E_Reg; assign DELAY_VALUE[47] = x6F_Reg; end  
        
        if(TDC_NUM >= 50) begin assign DELAY_VALUE[48] = x70_Reg; assign DELAY_VALUE[49] = x71_Reg; end
        if(TDC_NUM >= 52) begin assign DELAY_VALUE[50] = x72_Reg; assign DELAY_VALUE[51] = x73_Reg; end
        if(TDC_NUM >= 54) begin assign DELAY_VALUE[52] = x74_Reg; assign DELAY_VALUE[53] = x75_Reg; end
        if(TDC_NUM >= 56) begin assign DELAY_VALUE[54] = x76_Reg; assign DELAY_VALUE[55] = x77_Reg; end
        if(TDC_NUM >= 58) begin assign DELAY_VALUE[56] = x78_Reg; assign DELAY_VALUE[57] = x79_Reg; end
        if(TDC_NUM >= 60) begin assign DELAY_VALUE[58] = x7A_Reg; assign DELAY_VALUE[59] = x7B_Reg; end
        if(TDC_NUM >= 62) begin assign DELAY_VALUE[60] = x7C_Reg; assign DELAY_VALUE[61] = x7D_Reg; end
        if(TDC_NUM >= 64) begin assign DELAY_VALUE[62] = x7E_Reg; assign DELAY_VALUE[63] = x7F_Reg; end
        

    endgenerate
    

/*   ila_5 ila5(
     .clk(CLK), */
/*      .probe0(FLASH_READ_EN),
     .probe1(FLASH_READ_ADDRESS),
     .probe2(orRd),
     .probe3(rdDataI),
     .probe4(regCs),
     .probe5(orAck),
     .probe6(rdDataAck),
     .probe7(FLASH_READ_DATA),
     .probe8(FLASH_READ_VALID), */
/*      .probe0(muxRegDataA),
     .probe1(clk_locked_sitcp),
     .probe2(clk_locked_tdc),
     .probe3(MSB_abnormal),
     .probe4(state),
     .probe5(orAck)
    ); */
    
    /*
wire  [15:0] X00Data;
wire  [15:0] X01Data;
wire  [15:0] X02Data;
wire  [15:0] X03Data;
wire  [15:0] X04Data;
wire  [15:0] X05Data;
wire  [15:0] X06Data;
wire  [15:0] X07Data;
*/
    reg               dacLd;
    reg [       18:0] dacDataReg;
    reg [DAC_NUM-1:0] fifo_wen;
    reg [        7:0] DAC_ID;
    //assign       DAC_num = regCs[9:3] - 1;
/*
    ila_1 ila1(
     .clk(CLK),
     .probe0(XVC_LENGTH),
     .probe1(TMS_VECTOR),
     .probe2(TDI_VECTOR),
     .probe3(TDO_VECTOR),
     .probe4(regWe),
     .probe5(regCs[8]),
     .probe6(RBCP_ADDR),
     .probe7(regRe),
     .probe8(regAddr),
     .probe9(JTAG_SWITCH),
     .probe10(muxRegDataA),
     .probe11(TDO_VECTOR_LENGTH),
     .probe12(TDO_VECTOR_READ_EN),
     .probe13(EXTERNAL_CALIB_ENABLE)     
    ); 
*/
    always @(posedge CLK) begin
        if (RST) begin
            dacLd <= 1'b0;
        end else begin
            dacLd <= regWe & (regCs[15:12] > 0) & (regAddr[0] == 1'h1);  // | (dacInit[1:0]==2'b10);
        end
    end

    localparam [7:0] TOTAL_DAC_NUM = DAC_CHANNEL_NUM * DAC_NUM;
    reg [7:0] initial_dac;
    reg [7:0] test_value;

    always @(posedge CLK) begin
        //DAC_num <= regCs[9:3] - 1;
        test_value <= $clog2(DAC_CHANNEL_NUM);
        if (RST) begin
            initial_dac <= 0;
            DAC_ID <= 0;
        end else if (initial_dac <= DAC_CHANNEL_NUM * DAC_NUM) begin
            if (!DAC_I2C_CONFIG) begin
                // initial DAC
                dacDataReg <= {
                    initial_dac[$clog2(DAC_CHANNEL_NUM)-1:0],  // depend on DAC_CHANNEL_NUM
                    6'h1F,
                    8'hFF
                };
                DAC_ID <= initial_dac[7:$clog2(DAC_CHANNEL_NUM)];
                fifo_wen[DAC_NUM - 1: 0] <= (2'b1 << initial_dac[7:$clog2(DAC_CHANNEL_NUM)]);
                initial_dac <= initial_dac + 1;
            end
        end else begin
            case (regCs[15:12])
                7'd1: DAC_ID <= 0;
                7'd2: DAC_ID <= 1;
                7'd4: DAC_ID <= 2;
                7'd8: DAC_ID <= 3;
                // 7'd16: DAC_ID <= 4;
                // 7'd32: DAC_ID <= 5;
                // 7'd64: DAC_ID <= 6;
                //7'd128: DAC_ID <= 7;
                default: DAC_ID <= 0;
            endcase
            if (dacLd) begin
                /*
      case(regAddr[4:1])
        0: dacDataReg <= {3'b000, x30_Reg, x31_Reg};
        1: dacDataReg <= {3'b001, x32_Reg, x33_Reg};
        2: dacDataReg <= {3'b010, x34_Reg, x35_Reg};
        3: dacDataReg <= {3'b011, x36_Reg, x37_Reg};
        4: dacDataReg <= {3'b100, x38_Reg, x39_Reg};
        5: dacDataReg <= {3'b101, x3A_Reg, x3B_Reg};
        6: dacDataReg <= {3'b110, x3C_Reg, x3D_Reg};
        7: dacDataReg <= {3'b111, x3E_Reg, x3F_Reg};
        default:dacDataReg <= {3'b000, x30_Reg, x31_Reg};
      endcase
*/

                if (DAC_I2C_CONFIG) begin
                    dacDataReg <= {
                        regAddr[3:1],
                        x12x_Reg[DAC_ID][regAddr[3:1]*2][7:0],
                        x12x_Reg[DAC_ID][regAddr[3:1]*2+1][7:0]
                    };
                end else begin
                    dacDataReg <= {
                        regAddr[5:1],
                        x12x_Reg[DAC_ID][regAddr[5:1]*2][5:0],
                        x12x_Reg[DAC_ID][regAddr[5:1]*2+1][7:0]
                    };
                end

                fifo_wen[DAC_ID] <= 1'b1;
            end else begin
                dacDataReg <= 'b0;
                fifo_wen   <= 'b0;
            end
        end
    end




/*     generate
        if (DAC_I2C_CONFIG) begin
            genvar i;
            for (i = 0; i < DAC_NUM; i = i + 1) begin
                I2C_fifo I2C_fifo (
                    .wr_clk(CLK),
                    .rd_clk(i2c_clk),
                    .din(dacDataReg),
                    .wr_en(fifo_wen[i]),
                    .rd_en(DAC_RD[i]),
                    .dout(DAC_DATA[(i*19)+:19]),
                    .empty(DAC_EMPTY[i]),
                    .valid(DAC_VALID[i])
                );
            end
        end else begin
            genvar i;
            for (i = 0; i < DAC_NUM; i = i + 1) begin
                I2C_fifo I2C_fifo (
                    .wr_clk(CLK),
                    .rd_clk(i2c_clk),
                    .din(dacDataReg),
                    .wr_en(fifo_wen[i]),
                    .rd_en(DAC_RD[i]),
                    .dout(DAC_DATA[(i*19)+:19]),
                    .empty(DAC_EMPTY[i]),
                    .valid(DAC_VALID[i])
                );
            end
        end
    endgenerate */

/*     ila_2 ila2 (
        .clk(CLK),
        .probe0(RBCP_ACT),
        .probe1(RBCP_ADDR),
        .probe2(RBCP_WE),
        .probe3(RBCP_WD),
        .probe4(RBCP_RE),
        .probe5(RBCP_RD),
        .probe6(RBCP_ACK),
        .probe7(regCs),
        .probe8(x10_Reg),
        .probe9(regWd)
    );  */

    /* 
  ila_9 ila8(
     .clk(CLK),
     .probe0(x17_Reg),
     .probe1(TDC_NUM),
     .probe2(regRe),
     .probe3(regAddr),
     .probe4(regCs),
     .probe5(muxRegDataA)
    );
 

    ila_3 ila3 (
      .clk(CLK),
      .probe0(x16_Reg),
      .probe1(x31_Reg),
      .probe2(x09_Reg),
      .probe3(regCs),
      .probe4(regAddr),
      .probe5(irWe),
      .probe6(irRe),
      .probe7(irWd),
      .probe8(dacLd),
      .probe9(irAddr),
      .probe10(regWd),
      .probe11(fifo_wen),
      .probe12(DAC_RD),
      .probe13(DAC_EMPTY),
      .probe14(DAC_VALID),
      .probe15(DAC_DATA[18:0]),
      .probe16(dacDataReg),
      .probe17(DAC_num)
    );
  

wire  [7:0]  X08Data;
wire  [7:0]  X09Data;

wire  [31:0] X0AData;


assign  X00Data[15:0] = {regX00Data[7:0] , regX01Data[7:0]};
assign  X01Data[15:0] = {regX02Data[7:0] , regX03Data[7:0]};
assign  X02Data[15:0] = {regX04Data[7:0] , regX05Data[7:0]};
assign  X03Data[15:0] = {regX06Data[7:0] , regX07Data[7:0]};
assign  X04Data[15:0] = {regX08Data[7:0] , regX09Data[7:0]};
assign  X05Data[15:0] = {regX0AData[7:0] , regX0BData[7:0]};
assign  X06Data[15:0] = {regX0CData[7:0] , regX0DData[7:0]};
assign  X07Data[15:0] = {regX0EData[7:0] , regX0FData[7:0]};
assign  X08Data[7:0] =  regX10Data[7:0];
assign  X09Data[7:0] =  regX11Data[7:0];

assign  X0AData[31:0] = {regX15Data[7:0], regX14Data[7:0], regX13Data[7:0], regX12Data[7:0]};

//--------------------------------------
//  Sig. assignment for outputs
//--------------------------------------


//--------------------------------------
//  Read data mux.
//--------------------------------------
reg [7:0] muxRegDataA;
reg       muxRegAck;

always@ (posedge CLK) begin
  case(regAddr[7:0])
    8'h0: muxRegDataA[7:0] <= regX00Data [7:0];
    8'h1: muxRegDataA[7:0] <= regX01Data [7:0];
    8'h2: muxRegDataA[7:0] <= regX02Data [7:0];
    8'h3: muxRegDataA[7:0] <= regX03Data [7:0];
    8'h4: muxRegDataA[7:0] <= regX04Data [7:0];
    8'h5: muxRegDataA[7:0] <= regX05Data [7:0];
    8'h6: muxRegDataA[7:0] <= regX06Data [7:0];
    8'h7: muxRegDataA[7:0] <= regX07Data [7:0];
    8'h8: muxRegDataA[7:0] <= regX08Data [7:0];
    8'h9: muxRegDataA[7:0] <= regX09Data [7:0];
    8'hA: muxRegDataA[7:0] <= regX0AData [7:0];
    8'hB: muxRegDataA[7:0] <= regX0BData [7:0];
    8'hC: muxRegDataA[7:0] <= regX0CData [7:0];
    8'hD: muxRegDataA[7:0] <= regX0DData [7:0];
    8'hE: muxRegDataA[7:0] <= regX0EData [7:0];
    8'hF: muxRegDataA[7:0] <= regX0FData [7:0];
    8'h10: muxRegDataA[7:0] <= regX10Data [7:0];
    8'h11: muxRegDataA[7:0] <= regX11Data [7:0];

    8'h12: muxRegDataA[7:0] <= regX12Data [7:0];
    8'h13: muxRegDataA[7:0] <= regX13Data [7:0];
    8'h14: muxRegDataA[7:0] <= regX14Data [7:0];
    8'h15: muxRegDataA[7:0] <= regX15Data [7:0];
    
  endcase
  muxRegAck   <= regCs & (regRe | regWe);
end
*/

    //------------------------------------------------------------------------------
    //  Output
    //------------------------------------------------------------------------------
    /*
reg       orAck;
reg [7:0] orRd;
always@ (posedge CLK) begin
  orAck   <= muxRegAck;
  orRd[7:0] <=  (muxRegAck    ? muxRegDataA[7:0]  : 8'd0);
end

wire        RBCP_ACK;
wire [7:0]  RBCP_RD;

assign RBCP_ACK     = orAck;
assign RBCP_RD[7:0] = orRd[7:0];

reg [20:0] regBe_delay;
reg [18:0] fifo_in;
reg fifo_wen;

always@ (posedge CLK) begin
  regBe_delay <= regBe;
  if(!regBe_delay[1] & !regBe_delay[3] & !regBe_delay[5] & !regBe_delay[7] & !regBe_delay[9] & !regBe_delay[11] & !regBe_delay[13] & !regBe_delay[15])
    begin
      fifo_wen<=0;
    end
  if(regBe_delay[1])
    begin
      fifo_in <= {3'b000,X00Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[3])
    begin
      fifo_in <= {3'b001,X01Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[5])
    begin
      fifo_in <= {3'b010,X02Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[7])
    begin
      fifo_in <= {3'b011,X03Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[9])
    begin
      fifo_in <= {3'b100,X04Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[11])
    begin
      fifo_in <= {3'b101,X05Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[13])
    begin
      fifo_in <= {3'b110,X06Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[15])
    begin
      fifo_in <= {3'b111,X07Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[16])
    begin
      TDC_RST_SELECT <= X08Data[0];
    end
  if(regBe_delay[17])
    begin
      ila_select <= X09Data[7:0];
    end

  if(regBe_delay[18])
    begin
    RST_FIFO[7:0] <= X0AData[7:0];
  end
  if(regBe_delay[19])
    begin
    RST_FIFO[7:0] <= X0AData[15:8];
  end
  if(regBe_delay[20])
    begin
    RST_FIFO[7:0] <= X0AData[23:16];
  end
  if(regBe_delay[21])
    begin
    RST_FIFO[7:0] <= X0AData[31:24];
  end
end

I2C_fifo I2C_fifo(
  .wr_clk(CLK),
  .rd_clk(i2c_clk),
  .din(fifo_in),
  .wr_en(fifo_wen),
  .rd_en(FPGADATA_REN),
  .dout(FPGA_DATA),
  .empty(FPGADATA_EMPTY),
  .valid(FPGADATA_VALID)
);

*/



    //ila_0 ila0(
    //  .clk(CLK),
    //  .probe0(regBe_delay),
    //  .probe1(fifo_in),
    //  .probe2(fifo_wen),
    //  .probe3(FPGADATA_REN),
    //  .probe4(FPGA_DATA),
    //  .probe5(FPGADATA_VALID),
    //  .probe6(regX00Data),
    //  .probe7(regX01Data),
    //  .probe8(regX02Data),
    //  .probe9(regX03Data),
    //  .probe10(regX04Data),
    //  .probe11(regX05Data),
    //  .probe12(regX06Data),
    //  .probe13(regX07Data)
    //);
endmodule


module read_temperature_and_vccint (
    input  wire        clk,          // 涓绘椂閽熶俊鍙�
    input  wire        rst,          // 閲嶇疆淇″彿
    output reg  [15:0] temp_raw,     // 鍘熷娓╁害鏁版嵁
    output reg  [11:0] temp_c,       // 鎽勬皬娓╁害锛�12 浣嶇簿搴�
    output reg  [15:0] vccint_raw,   // 鍘熷 VCCINT 鏁版嵁
    output reg  [11:0] vccint_v,     // VCCINT 鐢靛帇鍊硷紝12 浣嶇簿搴�
    output reg  [15:0] vccaux_raw,   // 鍘熷 VCCAUX 鏁版嵁
    output reg  [11:0] vccaux_v,     // VCCAUX 鐢靛帇鍊硷紝12 浣嶇簿搴�
    output reg  [15:0] vccbram_raw,  // 鍘熷 VCCBRAM 鏁版嵁
    output reg  [11:0] vccbram_v     // VCCBRAM 鐢靛帇鍊硷紝12 浣嶇簿搴�
);

    // XADC 淇″彿
    wire [15:0] xadc_data;
    wire        drdy;  // 鏁版嵁灏辩华淇″彿
    wire        eoc;  // 杞崲瀹屾垚淇″彿
    wire        channel_vpvn;  // 妯℃嫙杈撳叆淇″彿锛堜笉浣跨敤锛�

    // 鍦板潃瀹氫箟
    localparam TEMP_CHANNEL = 7'h00;  // 鍐呴儴娓╁害浼犳劅鍣ㄥ湴鍧€
    localparam VCCINT_CHANNEL = 7'h01;  // VCCINT 鍦板潃
    localparam VCCAUX_CHANNEL = 7'h02;  // VCCAUX 鍦板潃
    localparam VCCBRAM_CHANNEL = 7'h06;  // VCCBRAM 鍦板潃

    // 鐘舵€佹満鐘舵€佸畾涔�

    localparam READ_TEMP = 2'b00;
    localparam READ_VCCINT = 2'b01;
    localparam READ_VCCAUX = 2'b10;
    localparam READ_VCCBRAM = 2'b11;


    reg [1:0] current_state;
    reg [1:0] next_state;

    // 褰撳墠璇诲彇鐨勯€氶亾鍦板潃
    reg [6:0] current_addr;

    // XADC IP 鏍稿疄渚嬪寲
    xadc_wiz_0 U_XADC (
        .daddr_in   (current_addr),  // 褰撳墠閫氶亾鍦板潃
        .dclk_in    (clk),           // XADC 鏃堕挓
        .den_in     (1'b1),          // 鍚敤鏁版嵁
        .di_in      (16'h0),         // 鏁版嵁杈撳叆锛堜笉浣跨敤锛�
        .dwe_in     (1'b0),          // 鍐欎娇鑳斤紙涓嶄娇鐢級
        .reset_in   (rst),           // 閲嶇疆淇″彿
        //.vauxp0(1'b0),             // 杈呭姪妯℃嫙杈撳叆锛堜笉浣跨敤锛�
        //.vauxn0(1'b0),
        // 鍏朵粬杈呭姪妯℃嫙杈撳叆寮曡剼鏍规嵁闇€瑕佽繛鎺�
        //.busy(),                 // 蹇欑淇″彿锛堜笉浣跨敤锛�
        .vp_in      (1'b0),          // input wire vp_in
        .vn_in      (1'b0),
        .channel_out(),              // 褰撳墠閫氶亾杈撳嚭锛堜笉浣跨敤锛�
        .eoc_out    (eoc),           // 杞崲瀹屾垚淇″彿
        .drdy_out   (drdy),          // 鏁版嵁灏辩华淇″彿
        .do_out     (xadc_data)      // 鏁版嵁杈撳嚭
    );
    


    

    // 鐘舵€佹満鍜屾暟鎹鍙栭€昏緫
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= READ_TEMP;
            current_addr <= TEMP_CHANNEL;
            temp_raw <= 16'h0000;
            temp_c <= 12'h000;
            vccint_raw <= 16'h0000;
            vccint_v <= 12'h000;
        end else begin


            case (current_state)
                READ_TEMP: begin
                    if (drdy && eoc) begin
                        temp_raw <= xadc_data;

                        // 娓╁害杞崲鍏紡锛�
                        // T(C) = (xadc_data[15锛�4] / 4096) * 503.975 - 273.15
                        // 绠€鍖栦负瀹氱偣杩愮畻锛� T 鈮� (xadc_data * 504) >> 16 - 273
                        temp_c <= ((xadc_data * 504) >> 16) - 12'd273;
                        current_addr <= VCCINT_CHANNEL;
                        current_state <= next_state;
                    end
                end

                READ_VCCINT: begin
                    if (drdy && eoc) begin
                        vccint_raw <= xadc_data;

                        // VCCINT 杞崲鍏紡锛堝亣璁惧弬鑰冪數鍘嬩负 1.0V锛屽叿浣撳弬鑰� Xilinx 鏂囨。锛�
                        // V = (xadc_data[15: 4] / 4096) * 1.0V * 3 (鐢变簬宸垎杈撳叆)
                        // 杩欓噷绠€鍖栦负瀹氱偣杩愮畻锛� V 鈮� (xadc_data * 3000) >> 16 锛堝崟浣嶄负 mV锛�


                        vccint_v <= (xadc_data * 3000) >> 16;  // VCCINT in mV
                        current_addr <= VCCAUX_CHANNEL;
                        current_state <= next_state;
                    end
                end
                READ_VCCAUX: begin
                    if (drdy && eoc) begin
                        vccaux_raw <= xadc_data;

                        // VCCAUX 杞崲鍏紡锛堝亣璁惧弬鑰冪數鍘嬩负 1.0V锛屽叿浣撳弬鑰� Xilinx 鏂囨。锛�
                        // V = (xadc_data[15: 4] / 4096) * 1.0V * 3 (鐢变簬宸垎杈撳叆)
                        // 杩欓噷绠€鍖栦负瀹氱偣杩愮畻锛� V 鈮� (xadc_data * 3000) >> 16 锛堝崟浣嶄负 mV锛�


                        vccaux_v <= (xadc_data * 3000) >> 16;  // VCCINT in mV
                        current_addr <= VCCBRAM_CHANNEL;
                        current_state <= next_state;
                    end
                end
                READ_VCCBRAM: begin
                    if (drdy && eoc) begin
                        vccbram_raw <= xadc_data;

                        // VCCBRAM 杞崲鍏紡锛堝亣璁惧弬鑰冪數鍘嬩负 1.0V锛屽叿浣撳弬鑰� Xilinx 鏂囨。锛�
                        // V = (xadc_data[15: 4] / 4096) * 1.0V * 3 (鐢变簬宸垎杈撳叆)
                        // 杩欓噷绠€鍖栦负瀹氱偣杩愮畻锛� V 鈮� (xadc_data * 3000) >> 16 锛堝崟浣嶄负 mV锛�


                        vccbram_v <= (xadc_data * 3000) >> 16;  // VCCINT in mV
                        current_addr <= TEMP_CHANNEL;
                        current_state <= next_state;
                    end
                end

                default: begin
                    current_state <= READ_TEMP;
                end
            endcase
        end
    end

    // 鐘舵€佽浆绉婚€昏緫
    always @(*) begin
        case (current_state)
            READ_TEMP: begin
                next_state = READ_VCCINT;
                //current_addr = TEMP_CHANNEL;
            end

            READ_VCCINT: begin
                next_state = READ_VCCAUX;
                //current_addr = VCCINT_CHANNEL;
            end
            READ_VCCAUX: begin
                next_state = READ_VCCBRAM;
                //current_addr = VCCINT_CHANNEL;
            end
            READ_VCCBRAM: begin
                next_state = READ_TEMP;
                //current_addr = VCCINT_CHANNEL;
            end
            default: begin
                next_state = READ_TEMP;
                //current_addr = TEMP_CHANNEL;
            end
        endcase
    end

endmodule
