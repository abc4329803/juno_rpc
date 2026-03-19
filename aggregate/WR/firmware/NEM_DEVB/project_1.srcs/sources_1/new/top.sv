`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 09:14:17 PM
// Design Name: 
// Module Name: top
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


module top#(
	parameter SPARTAN6_NUM = 'd12,
    parameter START_NUM = 'd1,
    //parameter TDC_DELAY_NUM = 'd64,
    parameter DAC_NUM = 'd2,
    //parameter DAC_CHANNEL_NUM = 32,
    parameter DEBUG = 0,
    parameter GOLDEN = 0,
    parameter BIT_SIZE = 32'd350000 << 3,  // size of bit file, not size on disk
    //parameter [31:0] main_firmware_flash_address = 32'h0080_0000,
    parameter [31:0] final_board_flash_address = 32'h00AF_0000, //0080_0000,
    parameter [31:0] middle_board_flash_address = 32'h0166_0000, //32'h0040_0000,
    parameter [31:0] tdc_board_flash_address = 32'h0186_0000,
    parameter FPGA_FAMILY = "7SERIES", 
    parameter PAYLOAD_WIDTH = 112, // 用户数据
    parameter CRC_WIDTH     = 16,
    // 物理传输总宽 = 128
    parameter TRANS_WIDTH   = PAYLOAD_WIDTH + CRC_WIDTH,
    
    parameter CLK_PERIOD  = 16.0,
    // Header 必须扩展到 128 位
    parameter SYNC_HEADER = {112'h112233445566778899AABBCCDDEE, 16'hFFFF},
    parameter POLARITY_SWAP = 1
)(



  //------------------------------------------
  // WR-NEM 
  
    input  [2:0] WRNEM_VER,
    inout        ONE_WIRE,
    input        CLK_62M5_DMTD,

    output       DAC_LDAC_N,
    output       DAC_SCLK,
    output       DAC_SYNC_N,
    output       DAC_SDI,
    input        DAC_SDO,

    output       DAC_DMTD_LDAC_N,
    output       DAC_DMTD_SCLK,
    output       DAC_DMTD_SYNC_N,
    output       DAC_DMTD_SDI,
    input        DAC_DMTD_SDO,

    output       DELAY_EN,
    output       DELAY_SCLK,
    output       DELAY_SLOAD,
    output       DELAY_SDIN,
    // AD9516 SPI
    output       PLL_CS,
    output       PLL_REFSEL,
    output       PLL_RESET,
    output       PLL_SCLK,
    output       PLL_SDO,
    output       PLL_SYNC,
    input        PLL_LOCK,
    input        PLL_SDI,
    input        PLL_STAT,
    //-----------------------------------------
    // SFP
    //output [0:0] SFP_DISABLE_O,
    output [0:0] SFP_O_N,
    output [0:0] SFP_O_P,
    input  [0:0] SFP_I_N,
    input  [0:0] SFP_I_P,
    //input  [0:0] SFP_FAULT_I,
    //input  [0:0] SFP_LOS_I,
    //input  [0:0] SFP_MOD_DEF0_I,
    //inout  [0:0] SFP_MOD_DEF1_IO,
    //inout  [0:0] SFP_MOD_DEF2_IO,

    input        MGTREFCLK0_P,
    input        MGTREFCLK0_N,
    // input        MGTREFCLK1_P,
    // input        MGTREFCLK1_N,

    // input        FPGA_CLK_P,
    // input        FPGA_CLK_N,
    input        BAK_CLK_P,
    input        BAK_CLK_N,
    input        BAK2_CLK_P,
    input        BAK2_CLK_N,

/*   output       AUX0_P,
  output       AUX0_N, */
    output       testaux0,     // synctrigger
    output       testsysclk,   // synclock
    output       testgtrefclk, 
    output       testfpgaclk,

    //output       synclock,

    input        EXT_CLK,

/*     output       QSPI_CS,
    output       QSPI_DQ0,
    input        QSPI_DQ1, */
    // input     QSPI_DQ2
    // input     QSPI_DQ3

    output       UART_TX,
    input        UART_RX,

    output [6:1] LED,

    output  wire                          FLASH_CS_n,  // W8   JB4
    input   wire                          MISO,
    output  wire                          MOSI,
    output  wire                          WRITE_PROTECT_n,
    output  wire                          HOLD_n,


    // 
    input   wire                          RST,
    // Middle
    inout 	wire    [SPARTAN6_NUM:1]      RESET_LVDS25_P,
  	inout 	wire    [SPARTAN6_NUM:1]      RESET_LVDS25_N,
	output 	wire    [SPARTAN6_NUM:1]      CLK_LVDS25_P,
	output 	wire    [SPARTAN6_NUM:1]      CLK_LVDS25_N,
	inout   wire    [SPARTAN6_NUM:1]      DATA_LVDS25_P,
    inout   wire    [SPARTAN6_NUM:1]      DATA_LVDS25_N,
	output   wire    [SPARTAN6_NUM:1]     FB_LVDS25_P,
    output   wire    [SPARTAN6_NUM:1]     FB_LVDS25_N,

    output 	wire    [SPARTAN6_NUM:1]      TCK,
    output 	wire    [SPARTAN6_NUM:1]      TMS,
    //input 	wire    [SPARTAN6_NUM:1]      TDI,
    inout 	wire    [SPARTAN6_NUM:1]      TDI,
    inout 	wire    [SPARTAN6_NUM:1]      TDO,

    output 	wire    [SPARTAN6_NUM:1]      FTMS_LVDS25_P,
    output 	wire    [SPARTAN6_NUM:1]      FTMS_LVDS25_N,
    inout 	wire    [SPARTAN6_NUM:1]      FTCK_LVDS25_P,
    inout 	wire    [SPARTAN6_NUM:1]      FTCK_LVDS25_N,
    output 	wire    [SPARTAN6_NUM:1]      FTDI_LVDS25_P,
    output 	wire    [SPARTAN6_NUM:1] 	  FTDI_LVDS25_N,
    inout 	wire    [SPARTAN6_NUM:1]      FTDO_LVDS25_P,
    inout 	wire    [SPARTAN6_NUM:1] 	  FTDO_LVDS25_N
/*     input 	wire    [SPARTAN6_NUM:1]      RESET_LVDS25_P,
  	input 	wire    [SPARTAN6_NUM:1]      RESET_LVDS25_N,
	inout 	wire    [SPARTAN6_NUM:1]      CLK_LVDS25_P,
	inout 	wire    [SPARTAN6_NUM:1]      CLK_LVDS25_N,
	output   wire    [SPARTAN6_NUM:1]     DATA_LVDS25_P,
    output   wire    [SPARTAN6_NUM:1]     DATA_LVDS25_N,
	output   wire    [SPARTAN6_NUM:1]     FB_LVDS25_P,
    output   wire    [SPARTAN6_NUM:1]     FB_LVDS25_N,

    output 	wire    [SPARTAN6_NUM:1]      TCK,
    output 	wire    [SPARTAN6_NUM:1]      TMS,
    output 	wire    [SPARTAN6_NUM:1]      TDI,
    output 	wire    [SPARTAN6_NUM:1]      TDO,

    output 	wire    [SPARTAN6_NUM:1]      FTMS_LVDS25_P,
    output 	wire    [SPARTAN6_NUM:1]      FTMS_LVDS25_N,
    output 	wire    [SPARTAN6_NUM:1]      FTCK_LVDS25_P,
    output 	wire    [SPARTAN6_NUM:1]      FTCK_LVDS25_N,
    output 	wire    [SPARTAN6_NUM:1]      FTDI_LVDS25_P,
    output 	wire    [SPARTAN6_NUM:1] 	  FTDI_LVDS25_N,
    input 	wire    [SPARTAN6_NUM:1]      FTDO_LVDS25_P,
    input 	wire    [SPARTAN6_NUM:1] 	  FTDO_LVDS25_N */

    // output 	wire    B13,
    // output 	wire    B14


  
    );

wire clk_125M;
wire clk_125M_nobuffer;
wire clk_62M5;
wire clk_62M5_90;
wire clk_12M5;
wire clk_6M25;
wire clk_3M125;
wire clk_25M;
wire clk_50M;
wire clk_200M;
wire clk_250M;
wire clk_100M;
wire clk125_remote;

assign testsysclk = clk_62M5_90;//clk_62M5;

assign testaux0 = PPS;

wire                         MIDDLE_RESET;
wire    [SPARTAN6_NUM:1] 	 DATA_LVDS25;
wire    [SPARTAN6_NUM:1] 	 FB_LVDS25;

wire    [SPARTAN6_NUM:1] 	 FTMS_LVDS25;
wire    [SPARTAN6_NUM:1] 	 FTCK_LVDS25;
wire    [SPARTAN6_NUM:1] 	 FTDI_LVDS25;
wire    [SPARTAN6_NUM:1] 	 FTDO_LVDS25;

wire    [SPARTAN6_NUM:1] 	 FTMS_LVDS25_1;
wire    [SPARTAN6_NUM:1] 	 FTCK_LVDS25_1;
wire    [SPARTAN6_NUM:1] 	 FTDI_LVDS25_1;
wire    [SPARTAN6_NUM:1] 	 FTDO_LVDS25_1;


wire    [SPARTAN6_NUM:1] 	 tx_bit;

wire   [SPARTAN6_NUM:1]                             RxD_data_ready;
wire   [7:0]                                        RxD_data[SPARTAN6_NUM:1];
reg    [SPARTAN6_NUM:1]                             TxD_data_valid;
reg    [7:0]                                        TxD_data[SPARTAN6_NUM:1];
reg    [SPARTAN6_NUM:1]                             TxD_data_r_valid;
reg    [SPARTAN6_NUM:1]                             rs232_fifo_empty;
reg    [7:0]                                        TxD_data_r[SPARTAN6_NUM:1];
reg    [SPARTAN6_NUM:1]                             SP6_train_en;
reg    [7:0]                                        Register_addr[SPARTAN6_NUM:1];
reg    [SPARTAN6_NUM:1]                             DATA_LVDS33_PHSAE;
reg    [SPARTAN6_NUM:1]                             TRAIN_END;
wire   [SPARTAN6_NUM:1]                             DATA_IN;
wire   [PAYLOAD_WIDTH - 1:0]                        DATA_OUT[SPARTAN6_NUM:1];
wire   [SPARTAN6_NUM:1]                             DATA_OUT_VALID;
wire   [1:0]                                        uart_ctrl[SPARTAN6_NUM:1];
reg    [1:0]                                        uart_ctrl_r[SPARTAN6_NUM:1];
//wire   [SPARTAN6_NUM:1]                             align_done;
wire   [SPARTAN6_NUM:1]                             polarity_inv;
wire   [3:0]                                        debug_state[SPARTAN6_NUM:1];
wire   [7:0]                                        debug_good_cnt[SPARTAN6_NUM:1];


wire [127:0] FULL_DATA_M_CH[SPARTAN6_NUM:START_NUM];
wire [SPARTAN6_NUM:START_NUM] FULL_DATA_VALID_M_CH;
reg  [SPARTAN6_NUM:START_NUM] FULL_DATA_READY_M_CH;

reg  [127:0]    S_FULL_DATA;
reg             S_FULL_DATA_VALID;
wire            S_FULL_DATA_READY;
wire [127:0]    M_FULL_DATA;
wire            M_FULL_DATA_VALID;

wire TIM_1MS;
wire TIM_1S_r;
wire TIM_1S;

wire            PPS;
wire  [39:0]    TM_TAI;
wire  [27:0]    TM_CYCLES;
wire            TM_TIME_VALID;

//wire            tdc_clk;
wire            locked_125M;
wire            jtag_clk;
wire            ila_clk;
wire            FLASH_TDO_out;
wire            flash_rd_en;
reg             reset_jtag;
wire            JTAG_BUSY;
reg   [28:0]    counter_jtag = 0;
reg             sp6_program_start;
wire            JTAG_SWITCH;
wire  [7:0]     board_id;

wire  [67:0]    timestamp_out[SPARTAN6_NUM:1];
wire  [SPARTAN6_NUM:1] PPS_OUT;

//assign MIDDLE_RESET = probe_out0;
assign testfpgaclk = clk_25M;
assign synclock = clk_125M;
assign testgtrefclk = clk_25M_W;


wire probe_out0;
wire probe_out1;
wire probe_out2;
wire probe_out3;
wire probe_out4;
wire probe_out5;
wire probe_out6;
wire probe_out7;
wire probe_out8;
wire probe_out9;
wire [3:0] probe_out10;

wire [ 7:0]           SP6_CONFIG_VALUE[SPARTAN6_NUM:1];
wire [SPARTAN6_NUM:1] SP6_CONFIG_VALID;
wire [ 7:0]           RD_SP6_CONFIG_VALUE[SPARTAN6_NUM:1];
wire [SPARTAN6_NUM:1] RD_SP6_CONFIG_VALID;
wire [SPARTAN6_NUM:1] SP6_CONFIG_FIFO_EMPTY;
wire [SPARTAN6_NUM:1] RESET_LINK;
wire                  SOFT_RST;
wire                  RESET_LINK_K7;
wire                  RELOAD_FIRMWARE;
wire [SPARTAN6_NUM:1] middle_ILA_use;
wire [SPARTAN6_NUM:1] TDC_ILA_use;
wire [7:0]            ila_NO;
wire [SPARTAN6_NUM:1] RS232_RX;
wire [SPARTAN6_NUM:1] RS232_TX_1;
wire [SPARTAN6_NUM:1] RS232_TX;
wire [SPARTAN6_NUM:1] RS232_TX_2;
wire [SPARTAN6_NUM:1] RS232_TX_ENABLE;

wire [SPARTAN6_NUM:1] TDC_CLK;


/* wire [SPARTAN6_NUM-1:0]    	FLASH_TCK;
wire [SPARTAN6_NUM-1:0]    	FLASH_TMS;
wire [SPARTAN6_NUM-1:0]    	FLASH_TDI;
wire [SPARTAN6_NUM-1:0]    	FLASH_TDO; */

wire    	FLASH_TCK;
wire    	FLASH_TMS;
wire    	FLASH_TDI;
wire     	FLASH_TDO;

// wire [SPARTAN6_NUM-1:0]    	XVC_TCK;
// wire [SPARTAN6_NUM-1:0]    	XVC_TMS;
// wire [SPARTAN6_NUM-1:0]    	XVC_TDI;
// wire [SPARTAN6_NUM-1:0]    	XVC_TDO;

wire [2:0]  TDO_DELAY_CYCLE;
wire    	XVC_TCK;
wire    	XVC_TMS;
wire    	XVC_TDI;
reg     	XVC_TDO;
reg         XVC_TDO1;
reg  [9:0]  XVC_TDO2;

wire                  SPI_CS_N;
wire                  SPI_MOSI;

wire                  QSPI_CS;
wire                  QSPI_DQ0;
wire                  QSPI_DQ1;

// assign FLASH_CS_n = SPI_CS_N;
// assign MOSI       = SPI_MOSI;
// assign QSPI_DQ1   = MISO;

wire EXTERNAL_CALIB_ENABLE;

//assign FLASH_CS_n = QSPI_CS;
//assign MOSI       = QSPI_DQ0;

wire first_erase;
reg FLASH_UPDATE_INIT;
reg loading_done;
reg loading_done_1;

always @(posedge clk_125M) begin
    loading_done_1 <= loading_done;
    if(loading_done & ~loading_done_1) begin
        FLASH_UPDATE_INIT <= 1;
    end else if(~first_erase) begin
        FLASH_UPDATE_INIT <= 0;
    end

end

assign FLASH_CS_n = TM_TIME_VALID ? (loading_done ? (FLASH_UPDATE_EN | FLASH_UPDATE_INIT ? SPI_CS_N : QSPI_CS)  : SPI_CS_N) : QSPI_CS;
assign MOSI       = TM_TIME_VALID ? (loading_done ? (FLASH_UPDATE_EN | FLASH_UPDATE_INIT ? SPI_MOSI : QSPI_DQ0) : SPI_MOSI) : QSPI_DQ0;
assign QSPI_DQ1   = MISO;

pll u_pll(
    .clk_in ( clk_12M5 ),            //10MHz
    .rst_n  ( 1'b1 ),
    .jtag_clk  ( jtag_clk  )        //2.5M
);

always @(posedge jtag_clk) begin
    if( SOFT_RST  | ~TM_TIME_VALID ) begin
        reset_jtag <= 1;
        sp6_program_start <= 0;
        counter_jtag <= 0;
    end else 
    if(locked_125M) begin
        if (counter_jtag >= 29'd60_000_000) begin
            reset_jtag <= 0;
            sp6_program_start <= 0;
            //counter_jtag <= counter_jtag + 1;
            if(counter_jtag == 29'd70_000_000) begin
                //reset_jtag <= 0;
                sp6_program_start <= 1;
                counter_jtag <= counter_jtag + 1;
            end else if(counter_jtag > 29'd70_000_000) begin
                //reset_jtag <= 0;
                sp6_program_start <= 0;
                
            end else begin
                counter_jtag <= counter_jtag + 1;
            end
        end else begin
            reset_jtag <= 1;
            counter_jtag <= counter_jtag + 1;
        end
        
    end else begin
        reset_jtag <= 1;
        sp6_program_start <= 0;
        counter_jtag <= 0;
    end
end

vio_1 vio_1 (
  .clk(clk_125M),                // input wire clk
  .probe_out0(probe_out0),  // output wire [0 : 0] probe_out0
  .probe_out1(probe_out1),  // output wire [0 : 0] probe_out1
  .probe_out2(probe_out2),  // output wire [0 : 0] probe_out2
  .probe_out3(probe_out3),  // output wire [0 : 0] probe_out3
  .probe_out4(probe_out4),  // output wire [0 : 0] probe_out4
  .probe_out5(probe_out5),  // output wire [0 : 0] probe_out5
  .probe_out6(probe_out6),  // output wire [0 : 0] probe_out4
  .probe_out7(probe_out7),  // output wire [0 : 0] probe_out4
  .probe_out8(probe_out8),  // output wire [0 : 0] probe_out4
  .probe_out9(probe_out9),  // output wire [0 : 0] probe_out4
  .probe_out10(probe_out10)  // output wire [0 : 0] probe_out4
);

wire   [PAYLOAD_WIDTH - 1:0]                DATA_OUT1;
wire                                                DATA_OUT_VALID1;
wire   [PAYLOAD_WIDTH - 1:0]                DATA_OUT2;
wire                                                DATA_OUT_VALID2;

wire            FLASH_UPDATE_EN;
wire            FLASH_ERASE_EN;
wire            FLASH_WRITE_READY;
wire            FLASH_WRITE_VALID;
wire [7:0]      FLASH_WRITE_DATA;
wire            FLASH_WRITE_FIFO_READEN;
wire [7:0]      FLASH_READ_DATA;
wire            FLASH_READ_VALID;
wire            FLASH_READ_EN;
wire [7:0]      FLASH_READ_CMD;
wire [31:0]     FLASH_READ_ADDRESS;
wire            FLASH_SCK;
wire [2:0]      is_multiboot;

   wire EXT_CLK_BUF;

   BUFG BUFG_inst (
      .O( EXT_CLK_BUF), // 1-bit output: Clock output
      .I( EXT_CLK )  // 1-bit input: Clock input
   );

// key_begin2 is used for TDC firmware loading
    wire            key_begin;
    reg             key_begin2;
    reg             pi_key  ;
    reg             pi_key_r  ;
    wire            po_key_0;
    wire            po_key  ;   //消抖处理后的按键信号
    reg   [9:0]     loading_cnt;
    reg             loading_tdc;
    
    reg             JTAG_BUSY_2;  
    wire            qspi_arb;
    assign qspi_arb =  TM_TIME_VALID ? (~loading_done ? 1'b1 : (FLASH_UPDATE_EN | FLASH_UPDATE_INIT ? 1'b1 : 1'b0))  : 1'b0 ;
    assign key_begin = po_key | sp6_program_start;
    always@(posedge jtag_clk) begin
        JTAG_BUSY_2 <= JTAG_BUSY;
        key_begin2 <= 1'b0;
        
        if(SOFT_RST | key_begin | ~TM_TIME_VALID) begin
            loading_cnt <= 0;
            loading_tdc <= 0;
            loading_done <= 1'b0;
            //key_begin2 <= 1'b0;
        end else if(JTAG_BUSY_2 & ~JTAG_BUSY) begin
            loading_cnt <= 1;
            if(loading_tdc) begin
                loading_done <= 1;
            end
        end else if(loading_cnt == 10'd1023 & loading_tdc == 0) begin
            key_begin2 <= 1'b1;
            loading_tdc <= 1;
        end else if(loading_cnt != 10'd0)begin
            loading_cnt <= loading_cnt + 1;
        end
    end
    always@(posedge clk_125M) begin
        pi_key <= probe_out3 | RELOAD_FIRMWARE;
        pi_key_r <= pi_key;
    end

    //wire access_flash_enable = Delay_access_flash_cnt == 3 ? 1'b1 : 1'b0;

    assign po_key_0 = ~pi_key_r & pi_key;

    Flag_CrossDomain FLASH_READ_EN_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(po_key_0),
      .clkB(jtag_clk),
      .FlagOut_clkB(po_key)
    );

genvar x;

// for the direct connecting cat6e, it is reverse for another end
generate

        for(x = 1;x <= SPARTAN6_NUM;x = x + 1) begin
            if(x == 1 || x == 2 || x == 5 || x == 6 || x == 9 || x == 10) begin
                IOBUFDS #(
                    .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                    .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                    .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                    .SLEW("SLOW")            // Specify the output slew rate
                ) IOBUFDS_ftdo (
                    .O(),     // Buffer output
                    .IO(FTDO_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                    .IOB(FTDO_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                    .I(FTCK_LVDS25_1[x]),     // Buffer input
                    .T(1'b0)      // 3-state enable input, high=input, low=output
                );
                // if(x == 5) begin
                //     ODDR2 #(
                //             .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                //             .INIT(1'b0),
                //             .SRTYPE("SYNC")
                //     ) ODDR2_FTCK (
                //             .Q (FTCK_LVDS25_1[x]),
                //             .C0(~clk_25M),
                //             .C1(clk_25M),
                //             .CE(1'b1),
                //             .D0(~FTCK_LVDS25[x]),
                //             .D1(~FTCK_LVDS25[x]),
                //             .R (1'b0),
                //             .S (1'b0)
                //     );
                // end else begin
                    ODDR2 #(
                            .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                            .INIT(1'b0),
                            .SRTYPE("SYNC")
                    ) ODDR2_FTCK (
                            .Q (FTCK_LVDS25_1[x]),
                            .C0(clk_25M),
                            .C1(~clk_25M),
                            .CE(1'b1),
                            .D0(FTCK_LVDS25[x]),
                            .D1(FTCK_LVDS25[x]),
                            .R (1'b0),
                            .S (1'b0)
                    );
                //end
                OBUFDS #(
                    .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                    .SLEW("SLOW")           // Specify the output slew rate
                ) OBUFDS_ftdi (
                    .O(FTDI_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                    .OB(FTDI_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                    .I(FTMS_LVDS25_1[x])      // Buffer input clk_62M5
                );  
                ODDR2 #(
                        .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                        .INIT(1'b0),
                        .SRTYPE("SYNC")
                ) ODDR2_FTMS (
                        .Q (FTMS_LVDS25_1[x]),
                        .C0(clk_25M),
                        .C1(~clk_25M),
                        .CE(1'b1),
                        .D0(FTMS_LVDS25[x]),
                        .D1(FTMS_LVDS25[x]),
                        .R (1'b0),
                        .S (1'b0)
                );
                IOBUFDS #(
                    .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                    .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                    .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                    .SLEW("SLOW")            // Specify the output slew rate
                ) IOBUFDS_ftck (
                    .O(FTDO_LVDS25[x]),     // Buffer output
                    .IO(FTCK_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                    .IOB(FTCK_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                    .I(1'b0),     // Buffer input
                    .T(1'b1)      // 3-state enable input, high=input, low=output
                ); 
                //if(x == 5) begin
                    IDDR2 #(
                        .DDR_ALIGNMENT("NONE"), 
                        .INIT_Q0(1'b0),
                        .INIT_Q1(1'b0),
                        .SRTYPE("SYNC")
                    ) IDDR2_inst (
                        .Q0(RS232_RX[x]), // 上升沿捕获的数据
                        .Q1(),             // 下降沿数据（JTAG 通常不需要）
                        .C0(clk_125M),   // 内部逻辑主时钟
                        .C1(~clk_125M),  // 反相时钟
                        .CE(1'b1),
                        .D(FTDO_LVDS25[x]),       // FPGA 物理引脚
                        .R(1'b0),
                        .S(1'b0)
                    );
/*                 end else begin
                    IDDR2 #(
                        .DDR_ALIGNMENT("NONE"), 
                        .INIT_Q0(1'b0),
                        .INIT_Q1(1'b0),
                        .SRTYPE("SYNC")
                    ) IDDR2_inst (
                        .Q0(RS232_RX[x]), // 上升沿捕获的数据
                        .Q1(),             // 下降沿数据（JTAG 通常不需要）
                        .C0(clk_25M),   // 内部逻辑主时钟
                        .C1(~clk_25M),  // 反相时钟
                        .CE(1'b1),
                        .D(FTDO_LVDS25[x]),       // FPGA 物理引脚
                        .R(1'b0),
                        .S(1'b0)
                    );
                end */

                OBUFDS #(
                    .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                    .SLEW("SLOW")           // Specify the output slew rate
                ) OBUFDS_tms (
                    .O(FTMS_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                    .OB(FTMS_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                    .I(FTDI_LVDS25_1[x])      // Buffer input
                ); 
                ODDR2 #(
                        .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                        .INIT(1'b0),
                        .SRTYPE("SYNC")
                ) ODDR2_FTDI (
                        .Q (FTDI_LVDS25_1[x]),
                        .C0(clk_25M),
                        .C1(~clk_25M),
                        .CE(1'b1),
                        .D0(FTDI_LVDS25[x]),
                        .D1(FTDI_LVDS25[x]),
                        .R (1'b0),
                        .S (1'b0)
                );
            end else begin
            OBUFDS #(
                .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                .SLEW("SLOW")           // Specify the output slew rate
            ) OBUFDS_ftms (
                .O(FTMS_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                .OB(FTMS_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                .I(FTMS_LVDS25_1[x])      // Buffer input
            ); 
            ODDR2 #(
                    .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                    .INIT(1'b0),
                    .SRTYPE("SYNC")
            ) ODDR2_FTMS (
                    .Q (FTMS_LVDS25_1[x]),
                    .C0(clk_25M),
                    .C1(~clk_25M),
                    .CE(1'b1),
                    .D0(FTMS_LVDS25[x]),
                    .D1(FTMS_LVDS25[x]),
                    .R (1'b0),
                    .S (1'b0)
            );
            IOBUFDS #(
                .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                .SLEW("SLOW")            // Specify the output slew rate
            ) IOBUFDS_ftdo (
                .O(FTDO_LVDS25[x]),     // Buffer output
                .IO(FTDO_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                .IOB(FTDO_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                .I(1'b0),     // Buffer input
                .T(1'b1)      // 3-state enable input, high=input, low=output
            );
            IDDR2 #(
                .DDR_ALIGNMENT("NONE"), 
                .INIT_Q0(1'b0),
                .INIT_Q1(1'b0),
                .SRTYPE("SYNC")
            ) IDDR2_inst (
                .Q0(RS232_RX[x]), // 上升沿捕获的数据
                .Q1(),             // 下降沿数据（JTAG 通常不需要）
                .C0(clk_125M),   // 内部逻辑主时钟
                .C1(~clk_125M),  // 反相时钟
                .CE(1'b1),
                .D(FTDO_LVDS25[x]),       // FPGA 物理引脚
                .R(1'b0),
                .S(1'b0)
            );
            OBUFDS #(
                .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                .SLEW("SLOW")           // Specify the output slew rate
             ) OBUFDS_ftdi (
                .O(FTDI_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                .OB(FTDI_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                .I(FTDI_LVDS25_1[x])      // Buffer input
            ); 
            ODDR2 #(
                    .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                    .INIT(1'b0),
                    .SRTYPE("SYNC")
            ) ODDR2_FTDI (
                    .Q (FTDI_LVDS25_1[x]),
                    .C0(clk_25M),
                    .C1(~clk_25M),
                    .CE(1'b1),
                    .D0(FTDI_LVDS25[x]),
                    .D1(FTDI_LVDS25[x]),
                    .R (1'b0),
                    .S (1'b0)
            );
            IOBUFDS #(
                .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                .SLEW("SLOW")            // Specify the output slew rate
            ) IOBUFDS_ftck (
                .O(),     // Buffer output
                .IO(FTCK_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                .IOB(FTCK_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                .I(FTCK_LVDS25_1[x]),     // Buffer input
                .T(1'b0)      // 3-state enable input, high=input, low=output
            );
            ODDR2 #(
                .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
                .INIT(1'b0),
                .SRTYPE("SYNC")
            ) ODDR2_FTCK (
                .Q (FTCK_LVDS25_1[x]),
                .C0(clk_25M),
                .C1(~clk_25M),
                .CE(1'b1),
                .D0(FTCK_LVDS25[x]),
                .D1(FTCK_LVDS25[x]),
                .R (1'b0),
                .S (1'b0)
            );
            end
            //if(x == 1 || x == 2 || x == 5 || x == 6 || x == 9 || x == 10) begin
                assign TMS[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] == 0) & (ila_NO[7:0] != 0)) ? XVC_TCK : (loading_tdc ? 1'b0 : FLASH_TCK);
                assign TCK[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] == 0) & (ila_NO[7:0] != 0)) ? XVC_TMS : (loading_tdc ? 1'b0 : FLASH_TMS);
                assign TDO[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] == 0) & (ila_NO[7:0] != 0)) ? XVC_TDI : (loading_tdc ? 1'b0 : FLASH_TDI); 
            // end else begin
            //     //assign TCK[x] = middle_ILA_use[x] ? (probe_out8 ? probe_out9 : XVC_TCK) : (loading_tdc ? 1'b0 : FLASH_TCK);
            //     //assign TMS[x] = middle_ILA_use[x] ? (probe_out8 ? probe_out1 : XVC_TMS) : (loading_tdc ? 1'b0 : FLASH_TMS);
            //     //assign TDI[x] = middle_ILA_use[x] ? (probe_out8 ? probe_out7 : XVC_TDI) : (loading_tdc ? 1'b0 : FLASH_TDI);   

            //     assign TMS[x] = middle_ILA_use[x] ?  XVC_TCK : (loading_tdc ? 1'b0 : FLASH_TCK);
            //     assign TCK[x] = middle_ILA_use[x] ?  XVC_TMS : (loading_tdc ? 1'b0 : FLASH_TMS);
            //     assign TDO[x] = middle_ILA_use[x] ?  XVC_TDI : (loading_tdc ? 1'b0 : FLASH_TDI);                     
            // end
            // assign TDI[x] = 1'bz ;
            // if(x == 1 || x == 2 || x == 5 || x == 6 || x == 9 || x == 10) begin
            //     assign TMS[x] = probe_out8 ? probe_out2 : ( middle_ILA_use[x] ? XVC_TCK : (loading_tdc ? 1'b0 : FLASH_TCK));
            //     assign TCK[x] = probe_out8 ? probe_out6 : ( middle_ILA_use[x] ? XVC_TMS : (loading_tdc ? 1'b0 : FLASH_TMS));
            //     assign TDO[x] = probe_out8 ? probe_out7 : ( middle_ILA_use[x] ? XVC_TDI : (loading_tdc ? 1'b0 : FLASH_TDI)); 
            // end
            //assign TDI[x] = probe_out8 ? probe_out9 : ( middle_ILA_use[x] ? XVC_TDI : (loading_tdc ? 1'b0 : FLASH_TDO)); 

            // assign TCK[x] =  (ila_NO[7:3] == x) ? XVC_TCK : (loading_tdc ? 1'b0 : FLASH_TCK);
            // assign TMS[x] =  (ila_NO[7:3] == x) ? XVC_TMS : (loading_tdc ? 1'b0 : FLASH_TMS);
            // assign TDO[x] =  (ila_NO[7:3] == x) ? XVC_TDI : (loading_tdc ? 1'b0 : FLASH_TDI); 
            //assign TDI[x] = 1'bz ;

            // assign TCK[x] = probe_out2;
            // assign TMS[x] = probe_out6;
            // assign TDO[x] = probe_out7;
            // assign TDI[x] = probe_out8;



            // assign TCK[x] = FLASH_TCK[x];
            // assign TMS[x] = FLASH_TMS[x];
            // assign TDO[x] = FLASH_TDI[x]; 
            //if(x == 1 || x == 2 || x == 4 || x == 5 || x == 6 ||x == 7 || x == 11) begin
            if(x == 1 || x == 4 || x == 6 ||x == 7 || x == 11) begin
                assign  FTCK_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? ~XVC_TCK : (loading_tdc ? ~FLASH_TCK : 1'b0);
                //assign  FTCK_LVDS25[x] = ~XVC_TCK;
            end else begin
                assign  FTCK_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? XVC_TCK : (loading_tdc ? FLASH_TCK : 1'b0);
                //assign  FTCK_LVDS25[x] = XVC_TCK;
            end
            if(x == 2 || x == 3 || x == 4 || x == 7 || x == 8 || x == 5 || x == 9 || x == 10 || x == 12) begin
                assign  FTMS_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? ~XVC_TMS : (loading_tdc ? ~FLASH_TMS : 1'b0);
                //assign  FTMS_LVDS25[x] = ~XVC_TMS;
            end else begin
                assign  FTMS_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? XVC_TMS : (loading_tdc ? FLASH_TMS : 1'b0);
                //assign  FTMS_LVDS25[x] = XVC_TMS;
            end
            if(x == 3 || x == 4 || x == 7 || x == 8 || x == 9 || x == 10 || x == 12) begin
                assign  FTDI_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? ~XVC_TDI : (loading_tdc ? ~FLASH_TDI : 1'b0);
                //assign  FTDI_LVDS25[x] =  ~XVC_TDI;
            end else begin
                assign  FTDI_LVDS25[x] = ((ila_NO[7:3] == x) & (ila_NO[2:0] != 0) & (ila_NO[7:0] != 0)) ? XVC_TDI : (loading_tdc ? FLASH_TDI : 1'b0);
                //assign  FTDI_LVDS25[x] =  XVC_TDI;
            end
            // assign TMS[x] = clk_25M;
            // assign TDI[x] = clk_125M;
            // assign TCK[x] = clk_50M;
            // assign TDO[x] = clk_62M5;
            //assign XVC_TDO[x] = TDI[x];

            ts_link_master ts_link_master (
                .clk125      (clk_62M5),
                .rst         (SOFT_RST),
                .frame_start (TM_TIME_VALID),
                .timestamp_in({TM_TAI, TM_CYCLES}),
                .pps_in      (PPS),
                .tx_bit      (tx_bit[x]),
                .busy        ()
            );
            //if(x == 4 || x == 6 || x == 7 || x == 8 || x == 9 || x == 10 || x == 12) begin
            if(x == 1 || x == 2 || x == 5 || x == 6 || x == 9 || x == 10) begin
                if(x == 1 || x == 2 || x == 5) begin
                    IOBUFDS #(
                        .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_data (
                        .O(),     // Buffer output
                        .IO(DATA_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .IOB(DATA_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(tx_bit[x]),     // Buffer input
                        .T(1'b0)      // 3-state enable input, high=input, low=output
                    ); 
                end else begin
                    IOBUFDS #(
                        .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_data (
                        .O(),     // Buffer output
                        .IO(DATA_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .IOB(DATA_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(~tx_bit[x]),     // Buffer input
                        .T(1'b0)      // 3-state enable input, high=input, low=output
                    ); 
                end
                master_rx_k7 #(
                    .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
                    .CRC_WIDTH(CRC_WIDTH)
                    //.SYNC_HEADER(SYNC_HEADER)
                ) master_rx_channel1 (
                    .clk_250m(clk_250M),
                    .clk_62_5m(clk_62M5),
                    .rst(SOFT_RST | RESET_LINK[x]),
                    .rx_ibuf(DATA_IN[x]),
                    //.rx_p(RESET_LVDS25_P[x]), 
                    //.rx_n(RESET_LVDS25_N[x]),
                    .uart_cmd_out(uart_ctrl[x]),
                    .data_out(DATA_OUT[x]), 
                    .data_valid(DATA_OUT_VALID[x]), 
                    .crc_error_pulse()
                    //.align_done(align_done[1])
                );
                IOBUFDS #(
                    .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                    .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                    .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                    .SLEW("SLOW")            // Specify the output slew rate
                ) IOBUFDS_reset (
                    .O(DATA_IN[x]),     // Buffer output
                    .IO(RESET_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                    .IOB(RESET_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                    .I(),     // Buffer input
                    .T(1'b1)      // 3-state enable input, high=input, low=output
                ); 
            end else begin
                

                if(x == 11) begin
                    IOBUFDS #(
                        .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_data (
                        .O(),     // Buffer output
                        .IO(RESET_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .IOB(RESET_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(~tx_bit[x]),     // Buffer input
                        .T(1'b0)      // 3-state enable input, high=input, low=output
                    );  
                end else begin
                    IOBUFDS #(
                        .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_data (
                        .O(),     // Buffer output
                        .IO(RESET_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .IOB(RESET_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(tx_bit[x]),     // Buffer input
                        .T(1'b0)      // 3-state enable input, high=input, low=output
                    );  
                end       

                master_rx_k7 #(
                    .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
                    .CRC_WIDTH(CRC_WIDTH)
                    //.SYNC_HEADER(SYNC_HEADER)
                ) master_rx_channel1 (
                    .clk_250m(clk_250M),
                    .clk_62_5m(clk_62M5),
                    .rst(SOFT_RST | RESET_LINK[x]),
                    .rx_ibuf(DATA_IN[x]),
                    //.rx_p(DATA_LVDS25_P[x]), 
                    //.rx_n(DATA_LVDS25_N[x]),
                    .uart_cmd_out(uart_ctrl[x]),
                    .data_out(DATA_OUT[x]), 
                    .data_valid(DATA_OUT_VALID[x]), 
                    .crc_error_pulse()
                    //.align_done(align_done[1])
                );
                IOBUFDS #(
                    .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                    .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                    .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
                    .SLEW("SLOW")            // Specify the output slew rate
                ) IOBUFDS_reset (
                    .O(DATA_IN[x]),     // Buffer output
                    .IO(DATA_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                    .IOB(DATA_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                    .I(),     // Buffer input
                    .T(1'b1)      // 3-state enable input, high=input, low=output
                ); 
            end

            if(x == 1 || x == 2 || x == 5 || x == 6 || x == 9 || x == 10) begin
                OBUFDS #(
                    .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                    .SLEW("SLOW")           // Specify the output slew rate
                ) OBUFDS_clk (
                    .O(FB_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                    .OB(FB_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                    .I(TDC_CLK[x])      // Buffer input
                );  
                if(x == 1 || x == 6 || x == 9 || x == 10) begin
                    OBUFDS #(
                        //.DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        //.IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("LVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_fb (
                        .O(CLK_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .OB(CLK_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(RS232_TX_1[x])     // Buffer input
                        //.T(1'b0)      // 3-state enable input, high=input, low=output
                    );  
                    ODDR #(
                        .DDR_CLK_EDGE("SAME_EDGE")
                    ) data_oddr_inst (
                        .Q(RS232_TX_1[x]),      // ODDR 输出单端信号
                        .C(clk_62M5),               // 0度时钟
                        .CE(1'b1),
                        .D1(~RS232_TX[x]),    // 你的运算数据
                        .D2(~RS232_TX[x]), 
                        .R(1'b0), .S(1'b0)
                    );
                end else begin
                    OBUFDS #(
                        //.DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        //.IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("LVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_fb (
                        .O(CLK_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .OB(CLK_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(RS232_TX_1[x])     // Buffer input
                        //.T(1'b0)      // 3-state enable input, high=input, low=output
                    );  
                    ODDR #(
                        .DDR_CLK_EDGE("SAME_EDGE")
                    ) data_oddr_inst (
                        .Q(RS232_TX_1[x]),      // ODDR 输出单端信号
                        .C(clk_62M5),               // 0度时钟
                        .CE(1'b1),
                        .D1(RS232_TX[x]),    // 你的运算数据
                        .D2(RS232_TX[x]), 
                        .R(1'b0), .S(1'b0)
                    );                   
                end         
            end else begin
                OBUFDS #(
                    .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
                    .SLEW("SLOW")           // Specify the output slew rate
                ) OBUFDS_clk (
                    .O(CLK_LVDS25_P[x]),     // Diff_p output (connect directly to top-level port)
                    .OB(CLK_LVDS25_N[x]),   // Diff_n output (connect directly to top-level port)
                    .I(TDC_CLK[x])      // Buffer input
                );
                if(x == 3 || x == 7 || x == 11 || x == 12) begin
                    OBUFDS #(
                        //.DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        //.IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("LVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_fb (
                        .O(FB_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .OB(FB_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(RS232_TX_1[x])     // Buffer input
                        //.T(1'b0)      // 3-state enable input, high=input, low=output
                    ); 
                    ODDR #(
                        .DDR_CLK_EDGE("SAME_EDGE")
                    ) data_oddr_inst (
                        .Q(RS232_TX_1[x]),      // ODDR 输出单端信号
                        .C(clk_62M5),               // 0度时钟
                        .CE(1'b1),
                        .D1(~RS232_TX[x]),    // 你的运算数据
                        .D2(~RS232_TX[x]), 
                        .R(1'b0), .S(1'b0)
                    );
                end else begin
                    OBUFDS #(
                        //.DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
                        //.IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
                        .IOSTANDARD("LVDS_25"), // Specify the I/O standard
                        .SLEW("SLOW")            // Specify the output slew rate
                    ) IOBUFDS_fb (
                        .O(FB_LVDS25_P[x]),   // Diff_p inout (connect directly to top-level port)
                        .OB(FB_LVDS25_N[x]), // Diff_n inout (connect directly to top-level port)
                        .I(RS232_TX_1[x])     // Buffer input
                        //.T(1'b0)      // 3-state enable input, high=input, low=output
                    ); 
                    ODDR #(
                        .DDR_CLK_EDGE("SAME_EDGE")
                    ) data_oddr_inst (
                        .Q(RS232_TX_1[x]),      // ODDR 输出单端信号
                        .C(clk_62M5),               // 0度时钟
                        .CE(1'b1),
                        .D1(RS232_TX[x]),    // 你的运算数据
                        .D2(RS232_TX[x]), 
                        .R(1'b0), .S(1'b0)
                    ); 
                end
            end

/*             if(x == 1 || x == 2 || x == 3 || x == 6 || x == 7 || x == 9 || x == 11 || x == 12) begin
                assign TDC_CLK[x] = ~clk_62M5;
            end else begin
                assign TDC_CLK[x] = clk_62M5;
            end */
            if(x == 1 || x == 2 || x == 3 || x == 6 || x == 7 || x == 9 || x == 11 || x == 12) begin
                //assign TDC_CLK[x] = ~clk_62M5;
                ODDR #(
                    .DDR_CLK_EDGE("SAME_EDGE")
                ) clk_out_inst (
                    .Q(TDC_CLK[x]),  // 物理引脚
                    .C(~clk_62M5_90),          // 90 度时钟
                    .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0)
                );
            end else begin
                //assign TDC_CLK[x] = clk_62M5;
                ODDR #(
                    .DDR_CLK_EDGE("SAME_EDGE")
                ) clk_out_inst (
                    .Q(TDC_CLK[x]),  // 物理引脚
                    .C(clk_62M5_90),          // 90 度时钟
                    .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0)
                );
            end

            fifo_tdc_config fifo_tdc_config (
                .rst(1'b0),        // input wire rst
                .wr_clk(clk_62M5),  // input wire wr_clk
                .rd_clk(clk_62M5),  // input wire rd_clk
                .din(TxD_data[x]),        // input wire [7 : 0] din
                .wr_en(TxD_data_valid[x]),    // input wire wr_en
                .rd_en(~rs232_fifo_empty[x] & RS232_TX_ENABLE[x] & ~TxD_data_r_valid[x] ),    // input wire rd_en
                .dout(TxD_data_r[x]),      // output wire [7 : 0] dout
                .full(),      // output wire full
                .empty(rs232_fifo_empty[x]),    // output wire empty
                .valid(TxD_data_r_valid[x])
            );

            UART_Packet_Ctrl #(
                .CLK_FREQ(62500000),
                .BAUD_RATE(115200)
            ) UART_Packet_Ctrl (
                .clk(clk_62M5),
                .rst_n(~SOFT_RST),
                .send_req(TxD_data_r_valid[x]),
                .user_tx_data(TxD_data_r[x]),
                .user_rx_data(RxD_data[x]),
                .user_rx_valid(RxD_data_ready[x]),
                .tx_ready(RS232_TX_ENABLE[x]),
                .uart_tx_pin(RS232_TX_2[x]),
                .uart_rx_pin(RS232_RX[x])
            );

            assign RS232_TX[x] = probe_out8 ? probe_out9 : RS232_TX_2[x];

            DATA_FIFO Data_FIFO (
                //.m_aclk(clk_12M5), // input m_aclk
                .s_axis_aclk(clk_62M5), // input s_aclk
                .s_axis_aresetn(1'b1), // input s_aresetn
                .s_axis_tvalid(DATA_OUT_VALID[x]), // input s_axis_tvalid
                .s_axis_tready(), // output s_axis_tready
                .s_axis_tdata(DATA_OUT[x]), // input [63 : 0] s_axis_tdata
                .m_axis_tvalid(FULL_DATA_VALID_M_CH[x]), // output m_axis_tvalid
                .m_axis_tready(FULL_DATA_READY_M_CH[x]), // input m_axis_tready
                .m_axis_tdata(FULL_DATA_M_CH[x]) // output [63 : 0] m_axis_tdata
            );


            // RS232
            fifo_tdc_config fifo_tdc_rs232 (
                .rst(1'b0),        // input wire rst
                .wr_clk(clk_125M),  // input wire wr_clk
                .rd_clk(clk_62M5),  // input wire rd_clk
                .din(SP6_CONFIG_VALUE[x]),        // input wire [7 : 0] din
                .wr_en(SP6_CONFIG_VALID[x]),    // input wire wr_en
                .rd_en(~SP6_CONFIG_FIFO_EMPTY[x]),    // input wire rd_en
                .dout(RD_SP6_CONFIG_VALUE[x]),      // output wire [7 : 0] dout
                .full(),      // output wire full
                .empty(SP6_CONFIG_FIFO_EMPTY[x]),    // output wire empty
                .valid(RD_SP6_CONFIG_VALID[x])
            ); 

            assign RESET_LINK[x] = RESET_LINK_K7_r | (uart_ctrl[x] == 2'b10 & TIM_1S_r);

            always @(posedge clk_62M5) begin
                uart_ctrl_r[x] <= uart_ctrl[x];
                if (RESET_LINK[x] | ~loading_done | RESET_LINK_K7_r) begin 
                    TxD_data[x] <= 8'h0;
                    TxD_data_valid[x] <= 1'b0;
                    SP6_train_en[x] <= 1'b1;
                    Register_addr[x] <= 8'h0;
                    //DATA_LVDS33_PHSAE[x] <= 1'b0;
                    TRAIN_END[x] <= 1'b0;
                end else begin
                    //TxD_data[x] <= RD_SP6_CONFIG_VALUE[x];
                    TxD_data_valid[x] <= 1'b0;
                    if(RD_SP6_CONFIG_VALID[x]) begin
                        TxD_data[x] <= RD_SP6_CONFIG_VALUE[x];
                        TxD_data_valid[x] <= 1'b1;
                    end else if(SP6_train_en[x]) begin
                        Register_addr[x] <= 8'hF1;
                        SP6_train_en[x] <= 1'b0;
                    end else if(Register_addr[x] == 8'hF1)begin
                        TxD_data[x] <= 8'hF1;
                        TxD_data_valid[x] <= 1'b1;
                        Register_addr[x] <= 0;
                    end else if(TxD_data[x] == 8'hF1)begin
                        TxD_data[x] <= uart_ctrl[x]; //8'h80;
                        TxD_data_valid[x] <= 1'b1;
                    end else if( uart_ctrl[x] == 2'b10) begin                     
                        //TRAIN_END[x] <= 1'b1;
                        TxD_data[x] <= 8'b10;
                        TxD_data_valid[x] <= ~uart_ctrl_r[x][1] & uart_ctrl[x][1];
                    end else if( uart_ctrl[x] == 2'b11) begin                     
                        TRAIN_END[x] <= 1'b1;
                        TxD_data[x] <= 8'b11;
                        TxD_data_valid[x] <= ~uart_ctrl_r[x][0] & uart_ctrl[x][0];
                    end
                end
                // make sure that SP6 comes into a trainning state

            end
           
        end
endgenerate

    //assign XVC_TDO = probe_out4 ? RS232_RX[ila_NO[7:3]] : TDI[ila_NO[7:3]];
    //assign XVC_TDO1 = probe_out7 ? XVC_TDO : (probe_out6 ? RS232_RX[6] : (probe_out4 ? ~RS232_RX[3] : TDI[3]));
    //assign XVC_TDO1 = ~RS232_RX[3];
    //assign XVC_TDO = probe_out4 ? RS232_RX[2] : ~RS232_RX[2];

    always @(posedge clk_125M) begin
        //XVC_TDO2 <= {XVC_TDO2[8:0], XVC_TDO};
        XVC_TDO2[0] <= XVC_TDO;
        XVC_TDO2[1] <= XVC_TDO2[0];
        XVC_TDO2[2] <= XVC_TDO2[1];
        XVC_TDO2[3] <= XVC_TDO2[2];
        XVC_TDO2[4] <= XVC_TDO2[3];
        XVC_TDO2[5] <= XVC_TDO2[4];
        XVC_TDO2[6] <= XVC_TDO2[5];
        XVC_TDO2[7] <= XVC_TDO2[6];
        XVC_TDO2[8] <= XVC_TDO2[7];
        XVC_TDO2[9] <= XVC_TDO2[8];
        case(probe_out10)
            0: XVC_TDO1 <=  XVC_TDO2[0];
            1: XVC_TDO1 <=  XVC_TDO2[1];
            2: XVC_TDO1 <=  XVC_TDO2[2];
            3: XVC_TDO1 <=  XVC_TDO2[3];
            4: XVC_TDO1 <=  XVC_TDO2[4];
            5: XVC_TDO1 <=  XVC_TDO2[5];
            6: XVC_TDO1 <=  XVC_TDO2[6];
            7: XVC_TDO1 <=  XVC_TDO2[7];
            8: XVC_TDO1 <=  XVC_TDO2[8];
            9: XVC_TDO1 <=  XVC_TDO2[9];
            default: XVC_TDO1 <=  XVC_TDO2[0];
        endcase
    end

    always @(posedge clk_125M) begin
        if(ila_NO < (SPARTAN6_NUM + 1) * 8) begin
            if(ila_NO[2:0] == 0) begin
                //XVC_TDO = TDI[ila_NO[7:3]]; 
                case(ila_NO[7:3])
                //0: XVC_TDO <= 1'b0; 
                1: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                2: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                3: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                4: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                5: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                6: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                7: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                8: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                9: XVC_TDO  <= TDI[ila_NO[7:3]]; 
                10: XVC_TDO <= TDI[ila_NO[7:3]]; 
                11: XVC_TDO <= TDI[ila_NO[7:3]]; 
                12: XVC_TDO <= TDI[ila_NO[7:3]]; 
                default: XVC_TDO <= 0; 
                endcase
            end else begin
                //XVC_TDO = RS232_RX[ila_NO[7:3]]; 
                case(ila_NO[7:3])
                //0: XVC_TDO <= RS232_RX[1]; 
                1: XVC_TDO  <= RS232_RX[ila_NO[7:3]]; 
                2: XVC_TDO  <= RS232_RX[ila_NO[7:3]]; 
                3: XVC_TDO  <= ~RS232_RX[ila_NO[7:3]]; 
                4: XVC_TDO  <= ~RS232_RX[ila_NO[7:3]]; 
                5: XVC_TDO  <= ~RS232_RX[ila_NO[7:3]]; 
                6: XVC_TDO  <= RS232_RX[ila_NO[7:3]]; 
                7: XVC_TDO  <= RS232_RX[ila_NO[7:3]]; 
                8: XVC_TDO  <= RS232_RX[ila_NO[7:3]]; 
                9: XVC_TDO  <= ~RS232_RX[ila_NO[7:3]]; 
                10: XVC_TDO <= ~RS232_RX[ila_NO[7:3]]; 
                11: XVC_TDO <= RS232_RX[ila_NO[7:3]]; 
                12: XVC_TDO <= ~RS232_RX[ila_NO[7:3]]; 
                default: XVC_TDO <= 0; 
                endcase
            end
        end
        
    end

    jtag_pl#(
        .BIT_SIZE    (BIT_SIZE + 100 )   //BIT文件大小
    )u_jtag_pl(
        .clk_in  ( jtag_clk  ),
        //.ila_clk  ( ila_clk  ),
        .rst     ( reset_jtag ),
        .key_begin  (po_key | sp6_program_start  | key_begin2),
        .flash_tdo    ( FLASH_TDO_out   ),
        .flash_rd_en   ( flash_rd_en   ),
        .busy    ( JTAG_BUSY ),
        .led     (           ),
        .led1    (           ),
        .led2    (           ),
        .tck_out ( FLASH_TCK ),
        .tms_out ( FLASH_TMS ),
        .tdi_out ( FLASH_TDI ),
        .tdo_in  ( FLASH_TDO )
    );

    assign FLASH_TDO_out = MISO; 

    assign FLASH_READ_CMD[7:0]  = 8'h13; 
    assign FLASH_READ_ADDRESS = loading_tdc ? tdc_board_flash_address : middle_board_flash_address;
    //assign FLASH_READ_ADDRESS = middle_board_flash_address;
    assign FLASH_READ_EN = flash_rd_en;

    wire [31:0] main_firmware_flash_address;
    assign main_firmware_flash_address = (is_multiboot == 2 | is_multiboot == 1)? final_board_flash_address : (is_multiboot == 3? middle_board_flash_address : tdc_board_flash_address );
    //assign main_firmware_flash_address =  tdc_board_flash_address;

    flash_update #(       
        .bit_to_read(BIT_SIZE)
    )flash_update(
        .user_clk(clk_125M),
        .sys_clk(clk_12M5),
        .reset(reset_jtag),
        .CS(SPI_CS_N),
        .MISO(MISO),
        .MOSI(SPI_MOSI),
        .WRITE_PROTECT_n(WRITE_PROTECT_n),
        .HOLD_n(HOLD_n),
        .icap_done(icap_done),
        .FLASH_SCK(FLASH_SCK),

        .loading_done(FLASH_UPDATE_EN | FLASH_UPDATE_INIT),
        .first_erase(first_erase),
        .main_firmware_flash_address(main_firmware_flash_address),
        .FLASH_ERASE_EN(FLASH_ERASE_EN), //FLASH_ERASE_EN),
        .FLASH_WRITE_READY(FLASH_WRITE_READY),
        .FLASH_WRITE_DATA(FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID(FLASH_WRITE_VALID),
        .FLASH_WRITE_FIFO_READEN(FLASH_WRITE_FIFO_READEN),

        .FLASH_READ_DATA(FLASH_READ_DATA),
        .FLASH_READ_VALID(FLASH_READ_VALID),
        .FLASH_READ_EN(FLASH_READ_EN),
        .FLASH_READ_CMD(FLASH_READ_CMD),
        .FLASH_READ_ADDRESS(FLASH_READ_ADDRESS)
    );   

    wire icap_trig_auto;
    wire icap_flag;
    reg  flash_update_en_d1;

    always @(posedge clk_125M) begin
        flash_update_en_d1 <= FLASH_UPDATE_EN;
    end

    // 当 FLASH_UPDATE_EN 从 1 变为 0 时，说明更新进程结束，触发跳转
    assign icap_trig_auto = flash_update_en_d1 & (~FLASH_UPDATE_EN);

    // 实例化修改后的 icap_start
    icap_start icap_start_u(
        .sclk(clk_62M5), // 注意：ICAP 使用 sys_clk 域，需确保时钟稳定 
        .rst_n(~reset_jtag),
        .icap_flag(icap_flag), // 自动触发
        .jump_addr(final_board_flash_address), // 传入 top.sv 计算出的地址 
        .icap_done(icap_done)
    ); 
    Flag_CrossDomain icap_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(icap_trig_auto),
      .clkB(clk_62M5),
      .FlagOut_clkB(icap_flag)
    );

    Flag_CrossDomain TIM_1MS_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(TIM_1S),
      .clkB(clk_62M5),
      .FlagOut_clkB(TIM_1S_r)
    );
    wire RESET_LINK_K7_r;
    Flag_CrossDomain RESET_LINK_K7_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(RESET_LINK_K7),
      .clkB(clk_62M5),
      .FlagOut_clkB(RESET_LINK_K7_r)
    );    
    TIMER #(
        .CLK_FREQ(10'd125)
    ) TIMER_0 (
        // System
        .CLK    (clk_125M),    // in: System clock
        .RST    (1'b0),      // in: System reset
        // Intrrupts
        .TIM_1US(),          // out: 1 us interval
        .TIM_1MS(TIM_1MS),          // out: 1 ms interval
        .TIM_1S (TIM_1S),  // out: 1 s interval
        .TIM_1M ()           // out: 1 min interval
    ); 

//=========================================================
//  MD10_top Instance Template (comment after bracket)
//=========================================================
MD10_top #(
    .SPARTAN6_NUM(SPARTAN6_NUM),
    .GOLDEN(GOLDEN)
) u_MD10_top (
    //------------------------------------------
    .RST(RST),
    .SYS_DIN         (S_FULL_DATA),
    .DIN_VALID       (S_FULL_DATA_VALID),
    .DIN_READY       (S_FULL_DATA_READY),
    // WR-NEM
    .WRNEM_VER       (WRNEM_VER   ), // wire [2:0]
    .ONE_WIRE        (ONE_WIRE    ), // inout
    .CLK_62M5_DMTD   (CLK_62M5_DMTD), // input

    //------------------------------------------
    // DAC
    .DAC_LDAC_N      (DAC_LDAC_N ), // output
    .DAC_SCLK        (DAC_SCLK   ), // output
    .DAC_SYNC_N      (DAC_SYNC_N ), // output
    .DAC_SDI         (DAC_SDI    ), // output
    .DAC_SDO         (DAC_SDO    ), // input

    // DAC DMTD
    .DAC_DMTD_LDAC_N (DAC_DMTD_LDAC_N ), // output
    .DAC_DMTD_SCLK   (DAC_DMTD_SCLK   ), // output
    .DAC_DMTD_SYNC_N (DAC_DMTD_SYNC_N ), // output
    .DAC_DMTD_SDI    (DAC_DMTD_SDI    ), // output
    .DAC_DMTD_SDO    (DAC_DMTD_SDO    ), // input

    //------------------------------------------
    // Delay Line
    .DELAY_EN        (DELAY_EN   ), // output
    .DELAY_SCLK      (DELAY_SCLK ), // output
    .DELAY_SLOAD     (DELAY_SLOAD), // output
    .DELAY_SDIN      (DELAY_SDIN ), // output

    //------------------------------------------
    // AD9516 PLL SPI
    .PLL_CS          (PLL_CS    ), // output
    .PLL_REFSEL      (PLL_REFSEL), // output
    .PLL_RESET       (PLL_RESET ), // output
    .PLL_SCLK        (PLL_SCLK  ), // output
    .PLL_SDO         (PLL_SDO   ), // output
    .PLL_SYNC        (PLL_SYNC  ), // output
    .PLL_LOCK        (PLL_LOCK  ), // input
    .PLL_SDI         (PLL_SDI   ), // input
    .PLL_STAT        (PLL_STAT  ), // input

    //------------------------------------------
    // SFP
    //.SFP_DISABLE_O   (SFP_DISABLE_O ), // output [0:0]
    .SFP_O_N         (SFP_O_N       ), // output [0:0]
    .SFP_O_P         (SFP_O_P       ), // output [0:0]
    .SFP_I_N         (SFP_I_N       ), // input  [0:0]
    .SFP_I_P         (SFP_I_P       ), // input  [0:0]
    .SFP_FAULT_I     (1'b0          ), // input  [0:0]
    .SFP_LOS_I       (1'b0     ), // input  [0:0]
    .SFP_MOD_DEF0_I  (1'b0          ), // input  [0:0]
    // .SFP_MOD_DEF1_IO (SFP_MOD_DEF1_IO), // inout [0:0]
    // .SFP_MOD_DEF2_IO (SFP_MOD_DEF2_IO), // inout [0:0]
 
    //------------------------------------------
    // Clocks
    .MGTREFCLK0_P    (MGTREFCLK0_P), // input
    .MGTREFCLK0_N    (MGTREFCLK0_N), // input
    //.MGTREFCLK1_P  (          ), // input (unused)
    //.MGTREFCLK1_N  (          ), // input (unused)
    .FPGA_CLK_P      (FPGA_CLK_P  ), // input
    .FPGA_CLK_N      (FPGA_CLK_N  ), // input
    .BAK_CLK_P       (BAK_CLK_P   ), // input
    .BAK_CLK_N       (BAK_CLK_N   ), // input
    .BAK2_CLK_P      (BAK2_CLK_P  ), // input
    .BAK2_CLK_N      (BAK2_CLK_N  ), // input

    //------------------------------------------
    // Test Signals
    .testaux0        (           ), // output
    .testsysclk      (clk_62M5   ), // output
    .testgtrefclk    (clk_125M   ), // output clk_125M
    .testfpgaclk     (clk_125M_nobuffer), // output
    .board_id        (board_id),

    //------------------------------------------
    // QSPI
    .QSPI_CS         (QSPI_CS    ), // output
    .QSPI_DQ0        (QSPI_DQ0   ), // output
    .QSPI_DQ1        (QSPI_DQ1   ), // input
    //.QSPI_DQ2      (          ), // (unused)
    //.QSPI_DQ3      (          ), // (unused)

    .qspi_sck        (FLASH_SCK  ),
    //.qspi_arb        (TM_TIME_VALID ? ~loading_done  : 1'b0  ), FLASH_UPDATE_EN
    .qspi_arb        ( qspi_arb  ), 


    //------------------------------------------
    // UART
    .UART_TX         (UART_TX    ), // output
    .UART_RX         (UART_RX    ), // input

    //------------------------------------------
    // LEDs
    .LED             (LED        ),  // output [1:0]

    .pps             (PPS),
    .tm_tai          (TM_TAI),
    .tm_cycles       (TM_CYCLES),
    .tm_time_valid   (TM_TIME_VALID),

    //.EXT_CLK         (EXT_CLK),
    .JTAG_CLK        (clk_25M),

    .SP6_CONFIG_VALUE(SP6_CONFIG_VALUE),
    .SP6_CONFIG_VALID(SP6_CONFIG_VALID),
    .SOFT_RST        (SOFT_RST),
    .RESET_LINK_K7   (RESET_LINK_K7),
    .RELOAD_FIRMWARE (RELOAD_FIRMWARE),
    .JTAG_SWITCH     (JTAG_SWITCH),
    .is_multiboot    (is_multiboot),
    .middle_ILA_use  (middle_ILA_use),
    .rs232_rx        (RxD_data),
    .ila_NO          (ila_NO),
    .uart_ctrl       (uart_ctrl),
    
    .FLASH_UPDATE_EN (FLASH_UPDATE_EN),
    .FLASH_ERASE_EN  (FLASH_ERASE_EN),
    .FLASH_WRITE_READY(FLASH_WRITE_READY),
    .FLASH_WRITE_DATA(FLASH_WRITE_DATA),
    .FLASH_WRITE_VALID(FLASH_WRITE_VALID),
    .FLASH_WRITE_FIFO_READEN(FLASH_WRITE_FIFO_READEN),

    .FLASH_READ_DATA (FLASH_READ_DATA),
    .FLASH_READ_VALID(FLASH_READ_VALID),

    //.TDO_DELAY_CYCLE(TDO_DELAY_CYCLE),

    .XVC_TCK(XVC_TCK),
    .XVC_TMS(XVC_TMS),
    .XVC_TDI(XVC_TDI),
    .XVC_TDO(XVC_TDO1)
);

// assign TCK[x] = JTAG_SWITCH ? XVC_TCK : FLASH_TCK[x];
//             assign TMS[x] = JTAG_SWITCH ? XVC_TMS[x] : FLASH_TMS[x];
//             assign TDO[x] = JTAG_SWITCH ? XVC_TDI[x] : FLASH_TDI[x];

  clk_wiz_tcp clk_wiz_tcp
   (
    // Clock out ports
    .clk_out1(clk_25M),     // output clk_out1
    .clk_out2(clk_12M5),     // output clk_out2
    .clk_out3(clk_250M),     // output clk_out3
    .clk_out4(clk_62M5_90),    // output clk_out4
    //.clk_out5(clk_62M5),
    //.clk_out6(clk_3M125),
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(locked_125M),       // output locked
   // Clock in ports
    .clk_in1(clk_62M5)      // input clk_in1 clk_125M
);

//assign clk_125M = EXT_CLK_BUF;

wire clk_25M_W;
wire locked_125M_W;


// assign TMS[7] = clk_25M;
// assign TDI[7] = clk_12M5;
// assign TCK[7] = clk_6M25;

wire manchester_locked;
wire [4:0] tap_mid;
/* manchester_top_auto_align manchester_top_auto_align
(
  .clk_125(clk_125M),      // 125 MHz 本地参考（BUFG）
  .rst(1'b0),          // 同步复位，高有效
  .refclk200(clk_200M),    // 给 IDELAYCTRL 的 200 MHz
  .rx_p(DATA_LVDS25_P),         // 单线 LVDS 正端
  //.rx_n(),         // 单线 LVDS 负端
  .train_en(1'b1),     // 上电训练期=1（Slave 发已知训练序列）

  .data_valid(),   // 位有效（125 Mb/s，一位一脉冲）
  .data_out(),     // 解码后的串行数据位
  .tap_mid(tap_mid), // 当前工作 tap
  .locked(manchester_locked)    // 粗扫完成 + 跟踪中
);
*/

    wire tx_bit1;
    wire [67:0] timestamp_out1;
    wire        PPS_OUT1;

/*                 ts_link_master ts_link_master1(
                    .clk125(clk_62M5),     // 125 MHz master clock (shared to slave)
                    .rst(SOFT_RST),        // sync reset, active high
                    .timestamp_in({TM_TAI ,TM_CYCLES}),      // current timestamp (sampled at send)
                    .pps_in(PPS),     // 1-PPS (asynchronous to clk125 OK, will be sampled)
                    //.tx_p(),       // LVDS data out +
                    //.tx_n(),        // LVDS data out -
                    .tx_bit(tx_bit1)
                );
                ts_link_slave ts_link_slave1(
                    .clk125(clk_62M5),
                    .rst(SOFT_RST),
                    .rx_bit_raw(tx_bit[5]),
                    //.rx_n(~tx_bit1),
                    .timestamp_out(timestamp_out1),
                    .pps_out_pulse(PPS_OUT1),   // 1 拍脉冲
                    .frame_ok()         // 1 拍，调试用
                );  */
    wire RS232_TX_ENABLE1;
    wire align_done1;
    wire m_valid1;
    wire [111:0] m_data1;
    wire polarity_inv1;
    wire [7:0]RxD_data1;
    wire RxD_data_ready2;
    wire [7:0]RxD_data2;
    wire [1:0]uart_ctrl1;
    wire rx_ibuf;
    wire [2:0] master_rx_channel1_state;
    wire m_crc_err;



    reg [3:0] CURRENT_STATE, NEXT_STATE;
    
    always @(posedge clk_62M5) begin
        if (SOFT_RST) begin 
				CURRENT_STATE <= 0;
        end else if(S_FULL_DATA_READY) begin 
				if(~S_FULL_DATA_VALID) begin
					CURRENT_STATE <= NEXT_STATE;					
				end 
		end 
    end
    always @(CURRENT_STATE) begin
        if (CURRENT_STATE == SPARTAN6_NUM) begin
            NEXT_STATE = START_NUM;
        end else begin
            NEXT_STATE = CURRENT_STATE + 1;
        end
    end
	 
    reg [6:0] channel;

    always @(posedge clk_62M5) begin
        if (SOFT_RST) begin
            S_FULL_DATA <= 'b0;
            FULL_DATA_READY_M_CH <= 'b0;
        end else begin
				S_FULL_DATA_VALID <= 1'b0;
                if(S_FULL_DATA_VALID == 0) begin
                    if (NEXT_STATE == START_NUM) begin
                        FULL_DATA_READY_M_CH[SPARTAN6_NUM] <= 1'b0;
                        if (FULL_DATA_VALID_M_CH[START_NUM] == 1 & S_FULL_DATA_READY) begin
                            S_FULL_DATA <= {8'h5A, board_id, NEXT_STATE, FULL_DATA_M_CH[START_NUM][107:0]};
                            //channel <= FULL_DATA_M_CH[1][78:72];
                            S_FULL_DATA_VALID <= 1'b1;//FULL_DATA_VALID_M_CH[0];
                            FULL_DATA_READY_M_CH[START_NUM] <= 1'b1;
                        end else begin
                            S_FULL_DATA <= 'b0;
                            FULL_DATA_READY_M_CH[START_NUM] <= 1'b0;
                            S_FULL_DATA_VALID <= 1'b0;
                        end
                    end else begin
                        FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
                        if (FULL_DATA_VALID_M_CH[NEXT_STATE] == 1 & S_FULL_DATA_READY) begin
                            S_FULL_DATA <= {8'h5A, board_id, NEXT_STATE, FULL_DATA_M_CH[NEXT_STATE][107:0]};
                            S_FULL_DATA_VALID <= 1'b1; //FULL_DATA_VALID_M_CH[NEXT_STATE];
                            FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b1;
                        end else begin
                            S_FULL_DATA <= 'b0;
                            FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
                            S_FULL_DATA_VALID <= 1'b0;
                        end
                    end
                end


        end
    end

reg [15:0] pps_counter[2:0];
reg   [PAYLOAD_WIDTH - 1:0]                        DATA_OUT0;
always @(posedge clk_62M5) begin
	if(TIM_1S_r) begin 
        pps_counter[0] <= 0;
        pps_counter[1] <= 0;
        pps_counter[2] <= 0;
    end else begin 
        if(S_FULL_DATA_VALID) pps_counter[2] <= pps_counter[2] + 1;
        if(DATA_OUT_VALID[2]) begin 
            if(DATA_OUT[2][79:72] == 8'd40)
                pps_counter[0] <= pps_counter[0] + 1;
        end
        if(DATA_OUT_VALID[6]) begin 
            if(DATA_OUT[6][79:72] == 8'd40)
                pps_counter[1] <= pps_counter[1] + 1;
        end
    end
    
end

/* 
reg [31:0] data0;
reg [31:0] data1;
reg [9:0]  diff;
reg flag;

always @(posedge clk_62M5) begin
	if(channel == 0 & S_FULL_DATA_VALID) data0 <= S_FULL_DATA[31:0];
	if(channel == 8 & S_FULL_DATA_VALID) data1 <= S_FULL_DATA[31:0];
	if(data0 >= data1) begin
		diff <= data0 - data1;
		flag <= 0;
	end else if(data0 < data1) begin
		diff <= data1 - data0;
		flag <= 1;
	end 
end 
*/
    // master_rx_k7 #(
    //     .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
    //     .CRC_WIDTH(CRC_WIDTH)
    //     //.SYNC_HEADER(SYNC_HEADER)
    // ) master_rx_channel1 (
    //     .clk_250m(clk_250M),
    //     .clk_62_5m(clk_62M5),
    //     .rst(SOFT_RST | probe_out1),
    //     .rx_p(RESET_LVDS25_P[11]), 
    //     .rx_n(RESET_LVDS25_N[11]),
    //     .uart_cmd_out(uart_ctrl[11]),
    //     .data_out(DATA_OUT[1]), 
    //     .data_valid(DATA_OUT_VALID[1]), 
    //     .crc_error_pulse(m_crc_err)
    //     //.align_done(align_done[1])
    // ); 

    //wire tx_bit;
/*     wire [7:0]  match_cnt0;
    wire [7:0]  match_cnt1;
    wire [7:0]  match_cnt2;
    wire [7:0]  match_cnt3;

    wire [23:0]  shreg_stream0;
    wire [23:0]  shreg_stream1;
    wire [23:0]  shreg_stream2;
    wire [23:0]  shreg_stream3;
    wire [15:0] timer;
    wire [3:0]  oversample_data;
    wire [127:0] payload_shift;

    assign master_rx_channel1_state = master_rx_channel1.state;
    assign rx_ibuf = master_rx_channel1.selected_bit;
    assign match_cnt0 = master_rx_channel1.match_cnt[0];
    assign match_cnt1 = master_rx_channel1.match_cnt[1];
    assign match_cnt2 = master_rx_channel1.match_cnt[2];
    assign match_cnt3 = master_rx_channel1.match_cnt[3];
    assign payload_shift = master_rx_channel1.payload_shift; */

    // assign shreg_stream0 = master_rx_channel1.shreg_stream[0];
    // assign shreg_stream1 = master_rx_channel1.shreg_stream[1];
    // assign shreg_stream2 = master_rx_channel1.shreg_stream[2];
    // assign shreg_stream3 = master_rx_channel1.shreg_stream[3];
    // assign timer = master_rx_channel1.timer;
    //assign oversample_data = master_rx_channel1.oversample_data;

    wire [7:0]    jtag_state;
/*     assign key_begin = u_jtag_pl.key_begin;
    assign jtag_state = u_jtag_pl.state;

        jtag_pl#(
            .BIT_SIZE    (BIT_SIZE + 100 )   //BIT文件大小
        )u_jtag_pl(
            .clk_in  ( jtag_clk  ),
            //.ila_clk  ( ila_clk  ),
            .rst     ( reset_jtag    ),
            .key_begin  (po_key | sp6_program_start),
            .flash_tdo    ( FLASH_TDO_out   ),
            .flash_rd_en   ( flash_rd_en   ),
            .busy    ( JTAG_BUSY ),
            .led     (           ),
            .led1    (           ),
            .led2    (           ),
            .tck_out ( FLASH_TCK[1] ),
            .tms_out ( FLASH_TMS[1] ),
            .tdi_out ( FLASH_TDI[1] ),
            .tdo_in  ( FLASH_TDO[1] )
        ); */

       // assign TDI[1]  = clk_25M;



  
  wire [1:0]  st;
  wire [1:0]  st_r;
  wire [15:0] sh_pre;
  
  wire [7:0]  crc_recv;
  wire [7:0]  crc_reg;
  wire [7:0]  next_crc;
  wire [6:0]  bit_cnt; 

  wire [3:0] RxD_state;
  wire       sampleNow;
  wire       RxD_bit;
/*   assign sampleNow = sp6_async_receiver1.sampleNow;
  assign RxD_bit = sp6_async_receiver1.RxD_bit;
  assign RxD_state = sp6_async_receiver1.RxD_state; */
 // assign frame_start = ts_link_master1.frame_start;
  //assign st = ts_link_master1.st;
//   assign st_r = ts_link_slave1.st;
//   assign sh_pre = ts_link_slave1.sh_pre;
//   assign crc_recv = ts_link_slave1.crc_recv;
//   assign crc_reg = ts_link_slave1.crc_reg;
//   assign pps_flag_r = ts_link_slave1.pps_flag_r;
//   assign next_crc = ts_link_slave1.crc_next;
//   assign master_crc1 = ts_link_master1.crc_next;
//   assign bit_cnt = ts_link_master1.bit_cnt;

wire tx_en_pos_dly;
wire [20:0] Current_State;
wire [7:0]  sr1_status;
wire Erase_en_pos_dly;
//wire first_erase;
wire FLASH_ERASE_EN_2;
wire Erase_en;
wire Erase_Ok;
wire [7:0] combine_state; 
//assign tx_en_pos_dly =  flash_update.read_write_flash_u.tx_en_pos_dly;
assign Current_State =  flash_update.read_write_flash_u.Current_State;
assign sr1_status =  flash_update.read_write_flash_u.sr1_status;
assign Erase_en_pos_dly =  flash_update.read_write_flash_u.Erase_en_pos_dly;
//assign first_erase =  flash_update.first_erase;
assign FLASH_ERASE_EN_2 =  flash_update.FLASH_ERASE_EN_2;
assign Erase_en =  flash_update.Erase_en;
assign Erase_Ok = flash_update.Erase_Ok;
assign combine_state =  flash_update.combine_state;

  wire [7:0]  gmii_txd;
  wire [7:0]  gmii_rxd;
  wire        gmii_tx_en;
  wire        gmii_rx_dv;
  wire        RBCP_WE;
  wire [7:0]  RBCP_WD;
  wire [31:0] RBCP_ADDR;

  assign gmii_txd = u_MD10_top.gmii_txd;
  assign gmii_rxd = u_MD10_top.gmii_rxd;
  assign gmii_tx_en = u_MD10_top.gmii_tx_en;
  assign gmii_rx_dv = u_MD10_top.gmii_rx_dv;
  assign RBCP_WE = u_MD10_top.RBCP_WE;  
  assign RBCP_WD = u_MD10_top.RBCP_WD;  
  assign RBCP_ADDR = u_MD10_top.RBCP_ADDR;  
  

reg [31:0] counter_62M5 = 0;
reg [3:0] counter_1s = 0;
reg [3:0] counter_pps = 0;

reg [3:0] rates_1s;

reg [3:0] rates_pps;
reg PPS_r;


always @(posedge clk_62M5_90) begin
	PPS_r <= PPS;
	if(counter_62M5 == 0) begin
		counter_62M5 <= 0;
		counter_1s <= 0;
        counter_pps <= 0;
		rates_1s <= counter_1s;
		rates_pps <= counter_pps;
		counter_62M5 <= counter_62M5 + 1;
	end else if(counter_62M5 >= 32'd62500000) begin
		counter_62M5 <= 0;
		if(TIM_1S_r) begin
			counter_1s <= counter_1s + 1;
		end
		if(PPS & ~PPS_r) begin
			counter_pps <= counter_pps + 1;
		end
	end else begin
		counter_62M5 <= counter_62M5 + 1;
		if(TIM_1S_r) begin
			counter_1s <= counter_1s + 1;
		end
		if(PPS & ~PPS_r) begin
			counter_pps <= counter_pps + 1;
		end
	end
end




   ila_1 ila_1 (
    .clk(clk_12M5), // input wire clk
    .probe0(probe_out10),
 // input wire [0:0]  probe0  
    .probe1({FLASH_UPDATE_EN, PPS}), // input wire [0:0]  probe1 
    .probe2(uart_ctrl[1]),
    .probe3(uart_ctrl[2]) ,
    .probe4(uart_ctrl[3]),
    .probe5(uart_ctrl[4]),
    .probe6(uart_ctrl[5]),
    .probe7(uart_ctrl[6]),
    .probe8(uart_ctrl[7]),
    .probe9(uart_ctrl[8]),
    .probe10(uart_ctrl[9]),
    .probe11(uart_ctrl[10]),
    .probe12(uart_ctrl[11]),
    .probe13(uart_ctrl[12]),
    .probe14(XVC_TDO),
    .probe15(XVC_TCK),
    .probe16(XVC_TDO2),
    .probe17(counter_62M5),
    .probe18(counter_1s),
    .probe19(icap_flag),
    .probe20(rates_1s),
    .probe21(rates_pps)    
 );  

    ila_3 ila_3 (
    .clk(EXT_CLK_BUF), // input wire clk
    .probe0(TIM_1S_r),
 // input wire [0:0]  probe0  
    .probe1(PPS) // input wire [0:0]  probe1 
    ); 
/*
    //wire sitcp_fifo_full;
    //reg [15:0] SiTCP_din;
    wire [127:0] SiTCP_din;
    wire SiTCP_din_valid;
    wire JTAG_SWITCH;
    wire [31:0] XVC_LENGTH;
    wire [31:0] TMS_VECTOR;
    wire [31:0] TDI_VECTOR;
    wire [31:0] TDO_VECTOR;
    wire        XVC_ENABLE;

    wire [ 7:0] SP6_CONFIG_ADDR;
    wire [ 7:0] SP6_CONFIG_VALUE;
    wire        SP6_CONFIG_VALID;

    wire [31:0] TDO_VECTOR_LENGTH;
    wire        TDO_VECTOR_READ_EN;
    assign TCP_CLK_OUT = clk125_remote;


    
    SiTCP_XC7K_32K_BBT_V110 SiTCP_XC7K_32K_BBT_V110(
        .CLK(CLK),                                      // in: System clock
        .RST(RST),                                      // in: System reset
        .TIM_1US(TIM_1US),                              // in: 1 us interval
        .TIM_1MS(TIM_1MS),                              // in: 1 ms interval
        .TIM_1S(TIM_1S),                                // in: 1 s interval
        .TIM_1M(TIM_1M),                                // in: 1 min interval
        // Configuration parameters
        //  .FORCE_DEFAULTn(1'b0),                          // in: Load default values
        .MODE_GMII(1'b1),                               // in: PHY I/F mode (0:MII, 1:GMII)
        .MIN_RX_IPG(4'd4),                              // in: Min. IPG byte[3:0] range of 3 to 15
        .IP_ADDR_IN(real_ip), // in: My IP address[31:0]
        .IP_ADDR_DEFAULT(),                             // out: Default value for my IP address[31:0]
        .TCP_MAIN_PORT_IN(16'd24),                      // in: My TCP main-port #[15:0]
        .TCP_MAIN_PORT_DEFAULT(),                       // out: Default value for my TCP main-port #[15:0]
        .TCP_SUB_PORT_IN(16'b0),                        // in: My TCP sub-port #[15:0]
        .TCP_SUB_PORT_DEFAULT(),                        // out: Default value for my TCP sub-port #[15:0]
        .TCP_SERVER_MAC_IN(tcp_server_mac[47:0]),       // in: Client mode, Server MAC address[47:0]
        .TCP_SERVER_MAC_DEFAULT(tcp_server_mac[47:0]),  // out: Default value for the server's MAC address
        .TCP_SERVER_ADDR_IN(tcp_server_addr[31:0]),     // in: Client mode, Server IP address[31:0]
        .TCP_SERVER_ADDR_DEFAULT(tcp_server_addr[31:0]),// out: Default value for the server's IP address
        .TCP_SERVER_PORT_IN(tcp_server_port[15:0]),     // in: Client mode, Server wating port#[15:0]
        .TCP_SERVER_PORT_DEFAULT(tcp_server_port[15:0]),// out: Default value for the server port #[15:0] RBCP_PORT_IN    , // in: My UDP RBCP-port #[15:0]
        .RBCP_PORT_IN(16'd4660),                        // in: My UDP RBCP-port #[15:0]
        .RBCP_PORT_DEFAULT(),                           // out: Default value for my UDP RBCP-port #[15:0]
        .PHY_ADDR(PHY_ADDRESS[4:0]),                    // in: PHY-device MIF address[4:0]
        // EEPROM
        //  .EEPROM_CS(),
        //  .EEPROM_SK(),
        //  .EEPROM_DI(),
        //  .EEPROM_DO(1'b0),
        // User data
        //  .USR_REG_X3C(),
        //  .USR_REG_X3D(),
        //  .USR_REG_X3E(),
        //  .USR_REG_X3F(),
        // MII interface
        .GMII_1000M(1'b1),                              // in: GMII mode (0:MII, 1:GMII)
        .GMII_RSTn(eth_rstn),                           // out:PHY reset
        // TX
        .GMII_TX_CLK(eth_tx_clk),                       // in: Tx clock(2.5 or 25MHz or 125MHz)
        .GMII_TX_EN(eth_tx_en),                         // out: Tx enable
        .GMII_TXD(eth_tx_d[7:0]),                       // out: Tx data[7:0]
        .GMII_TX_ER(eth_tx_er),                         // out: TX error
        // RX
        .GMII_RX_CLK(eth_rx_clk),                       // in: Rx clock(2.5 or 25MHz or 125MHz)
        .GMII_RX_DV(eth_rx_dv),                         // in: Rx data valid
        .GMII_RXD(eth_rx_d[7:0]),                       // in: Rx data[7:0]
        .GMII_RX_ER(eth_rx_er),                         // in: Rx error
        .GMII_CRS(1'b0),                             // in: Carrier sense
        .GMII_COL(1'b0),                             // in: Collision detected
        // Management IF
        .GMII_MDC(),                             // out: Clock for MDIO
        .GMII_MDIO_IN(1'b1),                      // in: Data
        .GMII_MDIO_OUT(),                     // out: Data, when GMII_MDIO_OE = 0, GMII_MDIO_OUT = 0. must be pullup
        .GMII_MDIO_OE(),                   // out: MDIO output enable
        // User I/F
        .SiTCP_RST(TCP_RST),                            // out: Reset for SiTCP and related circuits
        // TCP connection control
        .OPEN_REQ(1'b0),                                // in: Request to connect connection
        .MAIN_OPEN_ACK(TCP_OPEN),                       // out: Acknowledge for open (=Socket busy)
        .SUB_OPEN_ACK(),                                // out: Acknowledge for the alternative port    .TCP_OPEN_ERROR     (TCP_OPEN_ERROR   ),  // out: TCP client mode / TCP connection error ---- V2.4 -----
        .TCP_OPEN_ERROR(tcp_open_error),                // out: TCP client mode / TCP connection error ---- V2.4 -----
        .TCP_TX_OW_ERROR(tcp_tx_ow_error),              // out: TCP TX buffer, over write error ---- V2.4 -----
        .CLOSE_REQ(TCP_CLOSE),                          // out: Connection close
        .CLOSE_ACK(TCP_CLOSE),                          // in: Acknowledge for close
        // FIFO I/F
        .RX_FILL(TCP_RX_WC[15:0]),                      // in: Fill level[15:0]
        .RX_WR(TCP_RX_WR),                              // out: Write enable
        .RX_DATA(TCP_RX_DATA[7:0]),                     // out: Write data[7:0]
        .TX_FULL(TCP_TX_FULL),                          // out: Almost full flag
        .TX_FILL(),                                     // out: Fill level[15:0]
        .TX_WR(TCP_TX_WR),                              // in: Write enable
        .TX_DATA(TCP_TX_DATA[7:0]),                     // in: Write data[7:0]
        // RBCP
        .LOC_ACT(RBCP_ACT),                             // out: RBCP active
        .LOC_ADDR(RBCP_ADDR[31:0]),                     // out: Address[31:0]
        .LOC_WD(RBCP_WD[7:0]),                          // out: Data[7:0]
        .LOC_WE(RBCP_WE),                               // out: Write enable
        .LOC_RE(RBCP_RE),                               // out: Read enable
        .LOC_ACK(RBCP_ACK),                             // in: Access acknowledge
        .LOC_RD(RBCP_RD[7:0]),                          // in: Read data[7:0]
        .MAC_SELECT(MAC_SELECT[3:0])                    // in: User can select MAC Adrress
    );

    SiTCP_rfd_top #(
        .TDC_NUM(2),
        .DAC_NUM(DAC_NUM),
        .DAC_CHANNEL_NUM(DAC_CHANNEL_NUM),
        .GOLDEN(GOLDEN)
    ) SiTCP_rfd_top (
        //sys
        //.sys_clk_bufg(clk_100),
        .clk125_sys(clk_125M),
        .clk200(clk_125M),
        .clk125_eth(clk_125M),
        //.GTREFCLK_P(GTREFCLK_P),
        //.GTREFCLK_N(GTREFCLK_N),
        .gtpclkin(clk_125M_nobuffer),
        .locked( clk_locked_sitcp ),
        //tcp
        .sys_din(SiTCP_din),
        .clk125_remote(clk125_remote),
        .SFP_TXP(SFP_TXP),
        .SFP_TXN(SFP_TXN),
        .SFP_RXP(SFP_RXP),
        .SFP_RXN(SFP_RXN),
        .din_valid(SiTCP_din_valid),
        .sitcp_fifo_full(sitcp_fifo_full),
        //盲赂聧莽鸥楼茅聛鈥溍ヂ孤裁ニ�???莽拧???
        .HARDWARE_RESET(1'b0),
        .OFFSET_SWITCH(OFFSET_SWITCH),
        .CLK_IN(CLK_IN),
        .TRIG_IN(),
        .GPIO(GPIO),
        .SW(SW),
        //UDP
        //.DELAY_VALUE(DELAY_VALUE),
        .LED_ON(LED_ON),
        .EXTERNAL_CALIB_ENABLE(EXTERNAL_CALIB_ENABLE),
        .MSB_abnormal(MSB_abnormal),
        .MSB_check(MSB_check),
        .FPGADATA_REN(FPGADATA_REN),
        .FPGADATA_EMPTY(FPGADATA_EMPTY),
        .FPGA_DATA(FPGA_DATA),
        .FPGADATA_VALID(FPGADATA_VALID),
        .FLASH_ERASE_EN(FLASH_ERASE_EN),
        .FLASH_WRITE_READY(FLASH_WRITE_READY),
        .FLASH_WRITE_DATA(FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID(FLASH_WRITE_VALID),
        .FLASH_WRITE_FIFO_READEN(FLASH_WRITE_FIFO_READEN),

        .FLASH_READ_DATA(FLASH_READ_DATA),
        .FLASH_READ_VALID(FLASH_READ_VALID),

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
        // .FLASH_READ_EN(FLASH_READ_EN),
        // .FLASH_READ_CMD(FLASH_READ_CMD),
        // .FLASH_READ_ADDRESS(FLASH_READ_ADDRESS),
        .TDC_RST_SELECT(TDC_RST_SELECT),
        .JTAG_SWITCH(JTAG_SWITCH),
        .SOFT_RST(SOFT_RST_BUF),
        .clk_locked_tdc(clk_locked_tdc),
        .state(state),
        .fifo_level1_pointer(fifo_level1_pointer),
        .is_multiboot(is_multiboot),
        .i2c_clk(i2c_clk),
        .rst_fifo(rst_fifo)
    );

*/

endmodule
