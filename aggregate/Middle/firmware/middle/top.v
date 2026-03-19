`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 04:28:52 PM
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
	parameter SPARTAN6_NUM = 'd6,
	parameter START_NUM = 4'd2,
	//parameter MANCHESTER_DATA_WIDTH = 'd112,
    parameter DAC_NUM = 'd2,
    parameter DAC_CHANNEL_NUM = 32,
	 parameter PAYLOAD_WIDTH = 112, // 用户数据
    parameter CRC_WIDTH     = 16,
    // 物理传输总宽 = 128
    //parameter TRANS_WIDTH   = PAYLOAD_WIDTH + CRC_WIDTH,
    // Header 必须扩展刄1717 128 佄1717
    parameter SYNC_HEADER = {112'h112233445566778899AABBCCDDEE, 16'hFFFF},
    parameter DEBUG = 0,
    parameter GOLDEN = 0,
    parameter BIT_SIZE = 32'd350000 << 3,  // size of bit file, not size on disk
    //parameter [31:0] main_firmware_flash_address = 32'h0080_0000,
    parameter [31:0] final_board_flash_address = 32'h0080_0000,
    parameter [31:0] middle_board_flash_address = 32'h0040_0000, //32'h0040_0000,
    parameter [31:0] sp6_board_flash_address = 32'h00E0_0000
)
(

	output  wire   [6:1]                    LED,

    // interface between TDC and Middle

    output 	wire   [SPARTAN6_NUM:START_NUM]    	  TCK_LVCMOS33,
    output 	wire   [SPARTAN6_NUM:START_NUM]    	  TMS_LVCMOS33,
    output 	wire   [SPARTAN6_NUM:START_NUM]    	  TDI_LVCMOS33,
    input 	wire   [SPARTAN6_NUM:START_NUM]    	  TDO_LVCMOS33,

	output 	wire   [SPARTAN6_NUM:START_NUM]       RESET_LVDS33_P,
  	output 	wire   [SPARTAN6_NUM:START_NUM]       RESET_LVDS33_N,
	output 	wire   [SPARTAN6_NUM:START_NUM]       CLK_LVDS33_P,
	output 	wire   [SPARTAN6_NUM:START_NUM]       CLK_LVDS33_N,
	input    wire   [SPARTAN6_NUM:START_NUM]       DATA_LVDS33_P,
   input    wire   [SPARTAN6_NUM:START_NUM]       DATA_LVDS33_N,
	input    wire   [SPARTAN6_NUM:START_NUM]       FB_LVDS33_P,
   output   wire   [SPARTAN6_NUM:START_NUM]       FB_LVDS33_N,

// interface between WR and Middle
/*     input 	wire 		                    JTAG_TCK,
    input 	wire 		                    JTAG_TMS,
    input 	wire 		                    JTAG_TDI,
    output 	wire 		                    JTAG_TDO, */

    input 	wire 		                    FTCK_LVDS33_P,
    input 	wire 		                    FTCK_LVDS33_N,
    input 	wire 		                    FTMS_LVDS33_P,
    input 	wire 		                    FTMS_LVDS33_N,
    input 	wire 		                    FTDI_LVDS33_P,
    input 	wire 		                    FTDI_LVDS33_N,
    output 	wire 		                    FTDO_LVDS33_P,
    output 	wire 		                    FTDO_LVDS33_N,

	input 	wire                            WR_RESET_IN_P,
  	input 	wire                            WR_RESET_IN_N,
	input 	wire                            WR_CLK_IN_P,
	input 	wire                            WR_CLK_IN_N,
	output   wire                            WR_DATA_OUT_P,
   output   wire                            WR_DATA_OUT_N,
	input    wire                            WR_FB_OUT_P,
   input    wire                            WR_FB_OUT_N,

    /// DAC  interface
    output 	wire                            DAC_SCLK,
    output 	wire                            DAC_nSYNC,
    output 	wire                            DAC_SDI,
    input 	wire                            DAC_SDO,
    output 	wire                            DAC_nRESET

    /// ADC  interface
    // output 	wire                            TADC_SCLK,
    // output 	wire                            TADC_nINT,
    // input 	wire                            TADC_SDA,
    // output 	wire                            TADC_nRESET

/*     input 	wire 		                    EXT_CLK,
    output 	wire                            TCP_CLK_OUT,
	//output 	wire 		                    EXT_CLK_N,

	input 	wire 		                    SYS_CLK_P,
	input 	wire 		                    SYS_CLK_N,

	//SITCP
 	// output 	wire 		                    SFP_TXP,
	// output 	wire 		                    SFP_TXN,
	// input 	wire 		                    SFP_RXP,
	// input 	wire 		                    SFP_RXN, 
	input 	wire 		                    GTREFCLK_P,
	input 	wire 		                    GTREFCLK_N,     */ 

	//input  wire                            RESET_IN,
	//input   wire   [3:0]                    SW,
	//output  wire   [3:0]                    GPIO
    );

	wire clk_125M;
	wire clk_125M_nobuffer;
   wire clk_10M;
   wire clk_62M5;
   wire clk_200M;
   wire clk_250M;
 	wire clk_locked_sitcp;
   wire clk_25M;

	wire   RESET_IN;
   assign RESET_IN = 1'b0;//WR_RESET_IN_N;

   wire EXTERNAL_CALIB_ENABLE;
   wire SYS_CLK;
   wire SYS_CLK_BUF;

    // /assign RESET_IN = clk125_remote;
    //assign EXT_CLK_P = clk_locked_sitcp;
    //assign EXT_CLK_N = ext_clk_locked;
    //assign LED[1] = clk_locked_sitcp;
    //assign LED[2] = ext_clk_locked;

    //assign CLK_OUT = clk_125M;
    wire hardware_reset;
    //assign RESET_IN = clk_10M;
    wire probe_out0;
	 wire WR_CLK_IN;
	 wire WR_CLK_IN_BUF;
	 wire WR_RESET_IN;
	 wire WR_DATA_OUT;
	 wire WR_FB_OUT;

	 wire                                FTCK_LVDS33;
	 wire                                FTMS_LVDS33;
	 wire                                FTDI_LVDS33;
    
	 wire   [SPARTAN6_NUM:START_NUM]    	  TCK_LVCMOS33_ODDR2;
    wire   [SPARTAN6_NUM:START_NUM]    	  TMS_LVCMOS33_ODDR2;
    wire   [SPARTAN6_NUM:START_NUM]    	  TDI_LVCMOS33_ODDR2;
    wire   [SPARTAN6_NUM:START_NUM]    	  TDO_LVCMOS33_ODDR2;
	 
    wire    [SPARTAN6_NUM:START_NUM]            s6_RxD;
    wire    [SPARTAN6_NUM:START_NUM]            s6_TxD;
	 wire    [SPARTAN6_NUM:START_NUM]            s6_TxD_ready;
    wire    [SPARTAN6_NUM:START_NUM]            rs232_fifo_empty;
    reg     [7:0]                       			s6_TxD_data[SPARTAN6_NUM:START_NUM];
    reg     [SPARTAN6_NUM:START_NUM]            s6_TxD_data_valid;
    reg     [7:0]                       			s6_RxD_data[SPARTAN6_NUM:START_NUM];
    reg     [SPARTAN6_NUM:START_NUM]            s6_RxD_data_ready;

    reg     [7:0]                       			s6_Config_TxD_data[SPARTAN6_NUM:START_NUM];
    reg     [SPARTAN6_NUM:START_NUM]            s6_Config_TxD_data_valid;
    wire    [7:0]                       			s6_Config_RxD_data[SPARTAN6_NUM:START_NUM];
    wire    [SPARTAN6_NUM:START_NUM]            s6_Config_RxD_data_ready;

	 reg     [SPARTAN6_NUM:START_NUM]            tdc_ila_use = 0;
	 wire 	[SPARTAN6_NUM:START_NUM]            tdc_ila_use_tms_tri_out;
	 wire 	[SPARTAN6_NUM:START_NUM]            tdc_ila_use_tdi_tri_out;
	 wire 	[SPARTAN6_NUM:START_NUM]            tdc_ila_use_tck_tri_out;
	 
	 wire    [SPARTAN6_NUM:START_NUM]            fwd_clk_oddr;
	 wire    [SPARTAN6_NUM:START_NUM]            fwd_data_oddr;

    wire 										 k7_RxD;
    wire                                k7_RxD_data_ready;
    wire   [7:0]                        k7_RxD_data;
    reg                                 k7_TxD_data_valid;
    reg    [7:0]                        k7_TxD_data;
    reg    [1:0]                        k7_TRAINNING_ENABLE = 2'b1;
    wire                                RS232_TX_ENABLE;
	 
	 wire TIM_1MS;
     wire TIM_1MS_r;
	 wire TIM_1S;
     wire TIM_1S_r;

    //wire clk_12M5_1;
    wire clk250_0_pll;
    wire clk250_90_pll;
    wire clk250_180_pll;
    wire clk250_270_pll;
    wire clkm_pll;
	 wire clk_12M5_pll;
	 wire clk50M_pll;
	 wire clk_100M_pll;
    wire clk_125M_pll;
    wire clk_250M_pll;
	 wire clk_250M_pll1;
	 wire clk_250M_pll2;
	 wire clk_250M_pll1_bufg;  // 添加 BUFG 输出信号
	 wire clk_250M_pll2_bufg;  // 添加 BUFG 输出信号

    wire clk_62M5_pll;
	 wire clk_62M5_bufg; 
    wire clk200M_pll;
    wire clk250_0;
    wire clk250_90;
    wire clk250_180;
    wire clk250_270;
    wire clkm;
	 wire clk_12M5;
	 wire clk50M;
	 wire clk_100M;
    wire clk200M;
    wire CLKFB;
    wire CLKFBIN;
    wire LOCKED;
	 wire PLL1_LOCKED;

    reg          SOFT_RST;
    wire         SOFT_RST_BUF;
    wire         sitcp_fifo_full;
    wire         TDC_RST_SELECT;

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
    wire [2:0]      is_multiboot;
	 
	 reg [SPARTAN6_NUM:START_NUM]         SOFT_RST_TDC;
     reg          SLAVE_TMS;
     reg          SLAVE_TDI;
     reg [SPARTAN6_NUM:START_NUM]         SLAVE_TDO;
     wire          SLAVE_TCK;

/* 		OBUFDS #(
			//.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33"), // Specify the input I/O standard
			.SLEW("SLOW")  
        ) OBUFDS_ftdo (
			.O(FTDO_LVDS33_P),     // Diff_p output (connect directly to top-level port)
			.OB(FTDO_LVDS33_N),   // Diff_n output (connect directly to top-level port)
			.I(clk_12M5_1) 
		); 
		ODDR2 #(
			  .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
			  .INIT(1'b0),
			  .SRTYPE("SYNC")
			  ) ODDR2_clk12M5 (
			  .Q (clk_12M5_1),
			  .C0(~clk_12M5),
			  .C1(clk_12M5),
			  .CE(1'b1),
			  .D0(1'b1),
			  .D1(1'b0),
			  .R (1'b0),
			  .S (1'b0)
		);	*/


		IBUFDS #(
			.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33") // Specify the input I/O standard
		) IBUFDS_wr (
			.O(WR_CLK_IN),  // Buffer output
			.I(WR_CLK_IN_P),  // Diff_p buffer input (connect directly to top-level port)
			.IB(WR_CLK_IN_N) // Diff_n buffer input (connect directly to top-level port)
		);
		
		BUFG BUFG_clk_62M5_gloabal (
			.O(clk_62M5_bufg),  // 1-bit output: Clock buffer output
			.I(WR_CLK_IN)  // 1-bit input: Clock buffer input
		);
/*		IBUFGDS #(
			.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33") // Specify the input I/O standard
		) IBUFDS_reset (
			.O(WR_RESET_IN),  // Buffer output
			.I(WR_RESET_IN_P),  // Diff_p buffer input (connect directly to top-level port)
			.IB(WR_RESET_IN_N) // Diff_n buffer input (connect directly to top-level port)
		);*/
		
		IBUFDS #(
			  .DIFF_TERM("TRUE"), 
			  .IOSTANDARD("LVDS_33")
		 ) u_ibufds (
			  .I (WR_RESET_IN_P),
			  .IB(WR_RESET_IN_N),
			  .O (rx_bit_raw)
		 );
		 
		 reg [SPARTAN6_NUM:START_NUM] data_sync_fwd;



	 wire clk_to_pll;
	 wire clk_bufio;
	// 使用 BUFIO2 驱动 IOB 寄存器（高精度低偏斜＄17
    BUFIO2 #(
        .DIVIDE_BYPASS("TRUE"), 
        .I_INVERT("FALSE")
    ) bufio2_inst (
        .I(WR_CLK_IN),
        .IOCLK(clk_bufio),      // 用于驱动 IDDR2/ODDR2
        .DIVCLK(clk_to_pll)   // 用于驱动普辑 (BUFG)
    );

    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(16.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(40),
        .CLKOUT1_DIVIDE(20),
        .CLKOUT2_DIVIDE(5),
        .CLKOUT3_DIVIDE(2),
        .CLKOUT4_DIVIDE(8),
        .CLKOUT5_DIVIDE(4),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(0.0),
        .CLKOUT2_PHASE(0.0),
        .CLKOUT3_PHASE(0.0),
        .CLKOUT4_PHASE(0.0),
        .CLKOUT5_PHASE(0.0),
        .CLK_FEEDBACK("CLKFBOUT"),  // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
        .COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
        .DIVCLK_DIVIDE(1),  // Division value for all output clocks (1-52)
        .REF_JITTER(0.1),  // Reference Clock Jitter in UI (0.000-0.999).
        .RESET_ON_LOSS_OF_LOCK("FALSE")  // Must be set to FALSE
    ) PLL_BASE_1 (
        .CLKFBOUT(CLKFB),           // 1-bit output: PLL_BASE feedback output
        // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
        .CLKOUT0 (clk_12M5_pll),
        .CLKOUT1 (clk_25M_pll),
        .CLKOUT2 (clk_100M_pll),
        .CLKOUT3 (clk_250M_pll),
        .CLKOUT4 (clk_62M5_pll),
        .CLKOUT5 (clk_125M_pll),
        .LOCKED  (PLL1_LOCKED),          // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFB),           // 1-bit input: Feedback clock input
        .CLKIN   (clk_to_pll),          // 1-bit input: Clock input
        .RST     (1'b0)            // 1-bit input: Reset input
    );

    BUFG BUFG_clk_12M5 (
        .O(clk_12M5),  // 1-bit output: Clock buffer output
        .I(clk_12M5_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_25M (
        .O(clk_25M),  // 1-bit output: Clock buffer output
        .I(clk_25M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_100M (
        .O(clk_100M),  // 1-bit output: Clock buffer output
        .I(clk_100M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_62M5 (
        .O(clk_62M5),  // 1-bit output: Clock buffer output
        .I(clk_62M5_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk125M (
        .O(clk_125M),  // 1-bit output: Clock buffer output
        .I(clk_125M_pll)  // 1-bit input: Clock buffer input
    );
/* 	 BUFG BUFG_clk250M (
        .O(clk_250M),  // 1-bit output: Clock buffer output
        .I(clk_250M_pll)  // 1-bit input: Clock buffer input
    ); */

		
		wire [67:0] timestamp_out;
		wire        PPS_OUT;
		wire [67:0] timestamp_out2;
		wire        PPS_OUT2;	
      wire        frame_ok;	
		  

		
  /*      ts_link_slave ts_link_slave1 (
            .clk125       (clk_62M5),
            .rst          (SOFT_RST),
            .rx_bit_raw   (rx_bit_raw),
            //.rx_n         (WR_RESET_IN_N),
            .timestamp_out(timestamp_out),
            .pps_out_pulse(PPS_OUT),
            .frame_ok     (frame_ok)
        );
*/
 		ts_link_slave ts_link_slave(
			  .clk125(clk_62M5_bufg),
			  .rst(1'b0),
			  .rx_bit_raw(rx_bit_raw),
			  //.rx_n(WR_RESET_IN_N),
			  .timestamp_out(timestamp_out),
			  .pps_out_pulse(PPS_OUT),   // 1 ???
			  .frame_ok()         // 1 ?,???
			  //.state_debug(state_debug)
		 );   
		 /*
		ts_link_slave ts_link_slave2(
			  .clk125(clk_125M),
			  .rst(SOFT_RST),
			  .rx_p(WR_RESET_IN_N),
			  .rx_n(WR_RESET_IN_P),
			  .timestamp_out(timestamp_out2),
			  .pps_out_pulse(PPS_OUT2),   // 1 ???
			  .frame_ok()         // 1 ?,???
		 );    */
/*		OBUFDS #(
			//.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33"), // Specify the input I/O standard
			.SLEW("SLOW")  
		) OBUFDS_data (
			.O(WR_DATA_OUT_P),     // Diff_p output (connect directly to top-level port)
			.OB(WR_DATA_OUT_N),   // Diff_n output (connect directly to top-level port)
			.I(WR_DATA_OUT) 
		);
  		OBUFDS #(
			//.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33"), // Specify the input I/O standard
			.SLEW("SLOW")  
		) OBUFDS_fb (
			.O(WR_FB_OUT_P),     // Diff_p output (connect directly to top-level port)
			.OB(WR_FB_OUT_N),   // Diff_n output (connect directly to top-level port)
			.I(k7_RxD) 
		);	  */
/*		IBUFGDS #(
			.DIFF_TERM("TRUE"),   // Differential Termination
			.IOSTANDARD("LVDS_33") // Specify the input I/O standard
		) IBUFDS_fb (
			.O(k7_RxD),  // Buffer output
			.I(WR_FB_OUT_P),  // Diff_p buffer input (connect directly to top-level port)
			.IB(WR_FB_OUT_N) // Diff_n buffer input (connect directly to top-level port)
		);*/
/*      IOBUFDS #(
            .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
            .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
            .IOSTANDARD("BLVDS_25"), // Specify the I/O standard
            .SLEW("SLOW")            // Specify the output slew rate
        ) IOBUFDS_inst (
            .O(k7_RxD),     // Buffer output
            .IO(WR_FB_OUT_P),   // Diff_p inout (connect directly to top-level port)
            .IOB(WR_FB_OUT_N), // Diff_n inout (connect directly to top-level port)
            .I(k7_TxD),     // Buffer input
            .T(~RS232_TX_ENABLE)      // 3-state enable input, high=input, low=output
        ); */

		//wire k7_RxD_1;
		IBUFDS #(
			 .DIFF_TERM("TRUE"), 
			 .IOSTANDARD("LVDS_33") // Specify the output I/O standard
			 //.SLEW("SLOW")           // Specify the output slew rate
		) IBUFDS_FB (
			 .I(WR_FB_OUT_P),     // Diff_p output (connect directly to top-level port)
			 .IB(WR_FB_OUT_N),   // Diff_n output (connect directly to top-level port)
			 .O(k7_RxD)      // Buffer input
		);
		//assign k7_RxD = ~k7_RxD_1;

/*         async_receiver k7_async_receiver(
            .clk(clk_25M),
            //.RxD(RS232_TX_ENABLE? 1'b0 : k7_RxD),//k7_RxD),
				.RxD(k7_RxD),
            .RxD_data_ready(k7_RxD_data_ready),
            .RxD_data(k7_RxD_data)
        );

        async_transmitter k7_async_transmitter(
            .clk(clk_25M), 
            .TxD(k7_TxD), 
            .TxD_busy(RS232_TX_ENABLE),
            .TxD_start(k7_TxD_data_valid), 
            .TxD_data(k7_TxD_data)
        ); */

		  wire 	[1:0] rx_st;
        wire   [7:0] temp_rx_data;
        UART_Packet_Ctrl #(
            .CLK_FREQ(62500000),
            .BAUD_RATE(115200)
        ) UART_Packet_Ctrl_k7 (
            .clk(clk_62M5),
            .rst_n(~SOFT_RST),
            .send_req(k7_TxD_data_valid),
            .user_tx_data(k7_TxD_data),
            .user_rx_data(k7_RxD_data),
            .user_rx_valid(k7_RxD_data_ready),
            .tx_ready(RS232_TX_ENABLE),
            .uart_tx_pin(k7_TxD),
            .uart_rx_pin(k7_RxD),
				.rx_st(rx_st),
				.temp_rx_data(temp_rx_data)
        );

	    reg   [5:0]    k7_register_addr = 0;
		 reg   [7:0]    k7_RxD_data_r;
		 //reg            tdc_ila_use = 0;
		 reg            TDC_ILA_USE = 1;
		 reg            TDC_TDO = 3;     
		 wire           FTDO_LVDS33;
		 reg   [2:0]    TDC_ILA_NO = 0;
		 always @(*) begin
			 if(TDC_ILA_USE) begin		 
//					 case(TDC_ILA_NO)
//						0: TDC_TDO <= 0;
//						1: TDC_TDO <= 0;
//						//1: TDC_TDO <= SLAVE_TDO[1];
//						2: TDC_TDO <= SLAVE_TDO[2];
//						3: TDC_TDO <= SLAVE_TDO[3];
//						4: TDC_TDO <= SLAVE_TDO[4];
//						5: TDC_TDO <= SLAVE_TDO[5];
//						6: TDC_TDO <= SLAVE_TDO[6];
//						7: TDC_TDO <= 0;
//					 endcase
					 if(TDC_ILA_NO >= START_NUM & TDC_ILA_NO <= SPARTAN6_NUM) begin
							TDC_TDO <= SLAVE_TDO[TDC_ILA_NO[2:0]];
					 end else begin 
							TDC_TDO <= 0;
					 end
			 end
		 end
		 //assign FTDO_LVDS33 = TDC_ILA_USE ? TDC_TDO : k7_TxD;
		 assign FTDO_LVDS33 = TDC_TDO;//SLAVE_TDO[6];

		 integer  y;
       always @(posedge clk_62M5) begin
            k7_TxD_data_valid <= 1'b0;
				SOFT_RST <= 1'b0;
				DAC_WVALID_UART <= 1'b0;
				/*for(y = START_NUM;y < SPARTAN6_NUM;y = y + 1) begin
					SOFT_RST_TDC[y] <= 1'b0;
					s6_RxD_data_ready[y] <= 1'b0;
				end */
				//SOFT_RST_TDC[1] <= 1'b0;
				SOFT_RST_TDC[2] <= 1'b0;
				SOFT_RST_TDC[3] <= 1'b0;
				SOFT_RST_TDC[4] <= 1'b0;
				SOFT_RST_TDC[5] <= 1'b0;
				SOFT_RST_TDC[6] <= 1'b0;
				
            //s6_RxD_data_ready[1] <= 1'b0;
            s6_RxD_data_ready[2] <= 1'b0;
            s6_RxD_data_ready[3] <= 1'b0;
            s6_RxD_data_ready[4] <= 1'b0;
            s6_RxD_data_ready[5] <= 1'b0;
            s6_RxD_data_ready[6] <= 1'b0;
				
				//s6_TxD_data_valid[1] <= 1'b0; 
				s6_TxD_data_valid[2] <= 1'b0; 
				s6_TxD_data_valid[3] <= 1'b0; 
				s6_TxD_data_valid[4] <= 1'b0; 
				s6_TxD_data_valid[5] <= 1'b0; 
				s6_TxD_data_valid[6] <= 1'b0; 
				//k7_RxD_data_r <= 0;
            if(k7_register_addr == 6'h0) begin
					 /*for(y = START_NUM;y < SPARTAN6_NUM;y = y + 1) begin
						 s6_TxD_data[y] <= 8'h0;
					 end */
                //s6_TxD_data[1] <= 8'h0;
                s6_TxD_data[2] <= 8'h0;
                s6_TxD_data[3] <= 8'h0;
                s6_TxD_data[4] <= 8'h0;
                s6_TxD_data[5] <= 8'h0;
                s6_TxD_data[6] <= 8'h0;
            end
            if (k7_RxD_data_ready) begin   
                if(k7_register_addr == 6'h0) begin
                    case(k7_RxD_data)
                        8'hF1: k7_register_addr <= 1;
                        8'hF2: k7_register_addr <= 2;
                        8'hF3: k7_register_addr <= 3;
								8'hF4: k7_register_addr <= 4;
								8'hF5: k7_register_addr <= 5;
								8'hFC: k7_register_addr <= 12;
								// TDC1
								/*
                        8'h18: k7_register_addr <= 16;
                        8'h19: begin k7_register_addr <= 17; s6_TxD_data[1] <= 8'hF9; s6_TxD_data_valid[1] <= 1'b1; end
                        8'h1A: begin k7_register_addr <= 18; s6_TxD_data[1] <= 8'hFA; s6_TxD_data_valid[1] <= 1'b1; end
                        8'h1B: begin k7_register_addr <= 19; s6_TxD_data[1] <= 8'hFB; s6_TxD_data_valid[1] <= 1'b1; end
								8'h1C: begin k7_register_addr <= 20; s6_TxD_data[1] <= 8'hFC; s6_TxD_data_valid[1] <= 1'b1; end
                        8'h1D: begin k7_register_addr <= 21; s6_TxD_data[1] <= 8'hFD; s6_TxD_data_valid[1] <= 1'b1; end
								8'h1E: begin k7_register_addr <= 22; end
								*/
								// TDC2
                        8'h38: k7_register_addr <= 24;
                        8'h39: begin k7_register_addr <= 25; s6_TxD_data[2] <= 8'hF9; s6_TxD_data_valid[2] <= 1'b1; end
                        8'h3A: begin k7_register_addr <= 26; s6_TxD_data[2] <= 8'hFA; s6_TxD_data_valid[2] <= 1'b1; end
                        8'h3B: begin k7_register_addr <= 27; s6_TxD_data[2] <= 8'hFB; s6_TxD_data_valid[2] <= 1'b1; end
								8'h3C: begin k7_register_addr <= 28; s6_TxD_data[2] <= 8'hFC; s6_TxD_data_valid[2] <= 1'b1; end
                        8'h3D: begin k7_register_addr <= 29; s6_TxD_data[2] <= 8'hFD; s6_TxD_data_valid[2] <= 1'b1; end
								8'h3E: begin k7_register_addr <= 30; end
								// TDC3
                        8'h58: k7_register_addr <= 32;
                        8'h59: begin k7_register_addr <= 33; s6_TxD_data[3] <= 8'hF9; s6_TxD_data_valid[3] <= 1'b1; end
                        8'h5A: begin k7_register_addr <= 34; s6_TxD_data[3] <= 8'hFA; s6_TxD_data_valid[3] <= 1'b1; end
                        8'h5B: begin k7_register_addr <= 35; s6_TxD_data[3] <= 8'hFB; s6_TxD_data_valid[3] <= 1'b1; end
								8'h5C: begin k7_register_addr <= 36; s6_TxD_data[3] <= 8'hFC; s6_TxD_data_valid[3] <= 1'b1; end
                        8'h5D: begin k7_register_addr <= 37; s6_TxD_data[3] <= 8'hFD; s6_TxD_data_valid[3] <= 1'b1; end
								8'h5E: begin k7_register_addr <= 38; end
								// TDC4
                        8'h78: k7_register_addr <= 40; 
                        8'h79: begin k7_register_addr <= 41; s6_TxD_data[4] <= 8'hF9; s6_TxD_data_valid[4] <= 1'b1; end
                        8'h7A: begin k7_register_addr <= 42; s6_TxD_data[4] <= 8'hFA; s6_TxD_data_valid[4] <= 1'b1; end
                        8'h7B: begin k7_register_addr <= 43; s6_TxD_data[4] <= 8'hFB; s6_TxD_data_valid[4] <= 1'b1; end
								8'h7C: begin k7_register_addr <= 44; s6_TxD_data[4] <= 8'hFC; s6_TxD_data_valid[4] <= 1'b1; end
                        8'h7D: begin k7_register_addr <= 45; s6_TxD_data[4] <= 8'hFD; s6_TxD_data_valid[4] <= 1'b1; end
								8'h7E: begin k7_register_addr <= 46; end
								// TDC5
                        8'h98: k7_register_addr <= 48;
                        8'h99: begin k7_register_addr <= 49; s6_TxD_data[5] <= 8'hF9; s6_TxD_data_valid[5] <= 1'b1; end
                        8'h9A: begin k7_register_addr <= 50; s6_TxD_data[5] <= 8'hFA; s6_TxD_data_valid[5] <= 1'b1; end
                        8'h9B: begin k7_register_addr <= 51; s6_TxD_data[5] <= 8'hFB; s6_TxD_data_valid[5] <= 1'b1; end
								8'h9C: begin k7_register_addr <= 52; s6_TxD_data[5] <= 8'hFC; s6_TxD_data_valid[5] <= 1'b1; end
                        8'h9D: begin k7_register_addr <= 53; s6_TxD_data[5] <= 8'hFD; s6_TxD_data_valid[5] <= 1'b1; end
								8'h9E: begin k7_register_addr <= 54; end
								// TDC6
                        8'hB8: k7_register_addr <= 56;
                        8'hB9: begin k7_register_addr <= 57; s6_TxD_data[6] <= 8'hF9; s6_TxD_data_valid[6] <= 1'b1; end
                        8'hBA: begin k7_register_addr <= 58; s6_TxD_data[6] <= 8'hFA; s6_TxD_data_valid[6] <= 1'b1; end
                        8'hBB: begin k7_register_addr <= 59; s6_TxD_data[6] <= 8'hFB; s6_TxD_data_valid[6] <= 1'b1; end
								8'hBC: begin k7_register_addr <= 60; s6_TxD_data[6] <= 8'hFC; s6_TxD_data_valid[6] <= 1'b1; end
                        8'hBD: begin k7_register_addr <= 61; s6_TxD_data[6] <= 8'hFD; s6_TxD_data_valid[6] <= 1'b1; end
								8'hBE: begin k7_register_addr <= 62; end
                        default:	k7_register_addr <= 0;
                    endcase
                end else begin
                    case (k7_register_addr)
                        8'd1: begin                           
										  if(k7_RxD_data[7:2] == 6'h0) begin
                                //k7_TxD_data <= 8'hF1;
                                //k7_TxD_data_valid <= 1'b1;
												k7_TRAINNING_ENABLE <= k7_RxD_data[1:0]; //2'b1;
										  end
                            //end else if(k7_RxD_data == 8'h2) begin
                                //k7_TxD_data <= 8'h0;
                                //k7_TxD_data_valid <= 1'b1;
                                if(k7_RxD_data == 8'b11) begin
										      k7_register_addr <= 0;
										  //k7_TRAINNING_ENABLE <= 2'b10;
                                end
                        end
                        8'd2: begin
                            //k7_RxD_data_r <= k7_RxD_data;
									 k7_register_addr <= 0;
                            /*if(k7_RxD_data[7]) begin
                                //k7_TxD_data <= 8'hF1;
                                SOFT_RST <= 1'b1;
                            end else begin
                                //k7_TxD_data <= 8'h00;
                                SOFT_RST <= 1'b0;                        
                            end*/
									 
									 SOFT_RST        <= k7_RxD_data[7];
									 
									 //SOFT_RST_TDC[1] <= k7_RxD_data[1];
									 SOFT_RST_TDC[2] <= k7_RxD_data[2];
									 SOFT_RST_TDC[3] <= k7_RxD_data[3];
									 SOFT_RST_TDC[4] <= k7_RxD_data[4];
									 SOFT_RST_TDC[5] <= k7_RxD_data[5];
									 SOFT_RST_TDC[6] <= k7_RxD_data[6];	
									
									/*for(y = START_NUM;y < SPARTAN6_NUM;y = y + 1) begin
											SOFT_RST_TDC[y] <= k7_RxD_data[y];
									end */									 
                        end
								
								8'd3: begin
									 DAC_WDATA_UART[7:0] <= k7_RxD_data;
									 k7_register_addr <= 0;
								end
								8'd4: begin
									 DAC_WDATA_UART[15:8] <= k7_RxD_data;
									 k7_register_addr <= 0;
								end
								8'd5: begin
									 DAC_COMMAND_UART <= k7_RxD_data[7:4];
									 DAC_ADDR_UART    <= k7_RxD_data[3:0];
									 k7_register_addr <= 0;
									 DAC_WVALID_UART  <= 1'b1;
								end
								8'd12: begin
									 k7_register_addr <= 0;
									 if(k7_RxD_data[2:0] == 0 | k7_RxD_data[2:0] == 7) begin
										TDC_ILA_USE <= 0;
										TDC_ILA_NO <= k7_RxD_data[2:0];
									 end else begin
										TDC_ILA_USE <= 1;
										TDC_ILA_NO <= k7_RxD_data[2:0];
									 end
								end
								/*
								8'd16: begin
									 tdc_ila_use[1] <= k7_RxD_data[0];
									 k7_register_addr <= 0;
                        end
                        8'd17: begin
                            k7_register_addr <= 6'h0;
                            s6_TxD_data[1] <= k7_RxD_data;                       
                            s6_TxD_data_valid[1] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd18: begin
                            k7_register_addr <= 6'h0;
                            s6_TxD_data[1] <= k7_RxD_data;                       
                            s6_TxD_data_valid[1] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd19: begin
                            k7_register_addr <= 6'h0;
                            s6_TxD_data[1] <= k7_RxD_data;                       
                            s6_TxD_data_valid[1] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd20: begin
                            k7_register_addr <= 6'h0;
                            s6_TxD_data[1] <= k7_RxD_data;                       
                            s6_TxD_data_valid[1] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd21: begin
                            k7_register_addr <= 6'h0;
                            s6_TxD_data[1] <= k7_RxD_data;                       
                            s6_TxD_data_valid[1] <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd22: begin
                            k7_TxD_data <= uart_ctrl[1];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
								*/
                        8'd24: begin
                            tdc_ila_use[2] <= k7_RxD_data[0];
                            k7_register_addr <= 0;
                        end
                        8'd25: begin
                            s6_TxD_data[2] <= k7_RxD_data;                       
                            s6_TxD_data_valid[2] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd26: begin
                            s6_TxD_data[2] <= k7_RxD_data;                       
                            s6_TxD_data_valid[2] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd27: begin
                            s6_TxD_data[2] <= k7_RxD_data;                       
                            s6_TxD_data_valid[2] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd28: begin
                            s6_TxD_data[2] <= k7_RxD_data;                       
                            s6_TxD_data_valid[2] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd29: begin
                            s6_TxD_data[2] <= k7_RxD_data;                       
                            s6_TxD_data_valid[2] <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd30: begin
                            k7_TxD_data <= uart_ctrl[2];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd32: begin
                            tdc_ila_use[3] <= k7_RxD_data[0];
                            k7_register_addr <= 0;
                        end
                        8'd33: begin
                            s6_TxD_data[3] <= k7_RxD_data;                       
                            s6_TxD_data_valid[3] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd34: begin
                            s6_TxD_data[3] <= k7_RxD_data;                       
                            s6_TxD_data_valid[3] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd35: begin
                            s6_TxD_data[3] <= k7_RxD_data;                       
                            s6_TxD_data_valid[3] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd36: begin
                            s6_TxD_data[3] <= k7_RxD_data;                       
                            s6_TxD_data_valid[3] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd37: begin
                            s6_TxD_data[3] <= k7_RxD_data;                       
                            s6_TxD_data_valid[3] <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd38: begin
                            k7_TxD_data <= uart_ctrl[3];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd40: begin
									 tdc_ila_use[4] <= k7_RxD_data[0];
									 k7_register_addr <= 0;
                        end
                        8'd41: begin
                            s6_TxD_data[4] <= k7_RxD_data;                       
                            s6_TxD_data_valid[4] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd42: begin
                            s6_TxD_data[4] <= k7_RxD_data;                       
                            s6_TxD_data_valid[4] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd43: begin
                            s6_TxD_data[4] <= k7_RxD_data;                       
                            s6_TxD_data_valid[4] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd44: begin
                            s6_TxD_data[4] <= k7_RxD_data;                       
                            s6_TxD_data_valid[4] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd45: begin
                            s6_TxD_data[4] <= k7_RxD_data;                       
                            s6_TxD_data_valid[4] <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd46: begin
                            k7_TxD_data <= uart_ctrl[4];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
								8'd48: begin
									 tdc_ila_use[5] <= k7_RxD_data[0];
									k7_register_addr <= 0;
										end
                        8'd49: begin
                            s6_TxD_data[5] <= k7_RxD_data;                       
                            s6_TxD_data_valid[5] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd50: begin
                            s6_TxD_data[5] <= k7_RxD_data;                       
                            s6_TxD_data_valid[5] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd51: begin
                            s6_TxD_data[5] <= k7_RxD_data;                       
                            s6_TxD_data_valid[5] <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd52: begin
                            s6_TxD_data[5] <= k7_RxD_data;                       
                            s6_TxD_data_valid[5] <= 1'b1;   
									 k7_register_addr <= 0;									 
                        end
                        8'd53: begin
                            s6_TxD_data[5] <= k7_RxD_data;                       
                            s6_TxD_data_valid[5] <= 1'b1;   
									 k7_register_addr <= 0;									 
                        end
								8'd54: begin
                            k7_TxD_data <= uart_ctrl[5];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
                        8'd56: begin
									 tdc_ila_use[6] <= k7_RxD_data[0];
									 k7_register_addr <= 0;
                        end
                        8'd57: begin
                            s6_TxD_data[6] <= k7_RxD_data;                       
                            s6_TxD_data_valid[6] <= 1'b1;    
									 k7_register_addr <= 0;									 
                        end
                        8'd58: begin
                            s6_TxD_data[6] <= k7_RxD_data;                       
                            s6_TxD_data_valid[6] <= 1'b1;                        
									 k7_register_addr <= 0;
                        end
                        8'd59: begin
                            s6_TxD_data[6] <= k7_RxD_data;                       
                            s6_TxD_data_valid[6] <= 1'b1;                        
									 k7_register_addr <= 0;
                        end
                        8'd60: begin
                            s6_TxD_data[6] <= k7_RxD_data;                       
                            s6_TxD_data_valid[6] <= 1'b1;   
									 k7_register_addr <= 0;
                        end
                        8'd61: begin
                            s6_TxD_data[6] <= k7_RxD_data;                       
                            s6_TxD_data_valid[6] <= 1'b1;   
									 k7_register_addr <= 0;
                        end
								8'd62: begin
                            k7_TxD_data <= uart_ctrl[6];                       
                            k7_TxD_data_valid <= 1'b1;
									 k7_register_addr <= 0;
                        end
								/*
								8'h78: begin
                            if(s6_TxD_data[4] == 8'hFC) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[4] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[4] <= 8'hFC;
                            end                            
                            s6_RxD_data_ready[4] <= 1'b1;
                        end
                        8'h79: begin
                            if(s6_TxD_data[4] == 8'hFD) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[4] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[4] <= 8'hFD;
                            end                            
                            s6_RxD_data_ready[4] <= 1'b1;
                        end
                        8'h7A: begin
                            if(s6_TxD_data[4] == 8'hFE) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[4] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[4] <= 8'hFE;
                            end                            
                            s6_RxD_data_ready[4] <= 1'b1;
                        end
                        8'h7B: begin
                            if(s6_TxD_data[4] == 8'hFF) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[4] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[4] <= 8'hFF;
                            end  
                            s6_RxD_data_ready[4] <= 1'b1;                          
                        end
                        8'h98: begin
                            if(s6_TxD_data[5] == 8'hFC) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[5] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[5] <= 8'hFC;
                            end                            
                            s6_RxD_data_ready[5] <= 1'b1;
                        end
                        8'h99: begin
                            if(s6_TxD_data[5] == 8'hFD) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[5] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[5] <= 8'hFD;
                            end                            
                            s6_RxD_data_ready[5] <= 1'b1;
                        end
                        8'h9A: begin
                            if(s6_TxD_data[5] == 8'hFE) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[5] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[5] <= 8'hFE;
                            end                            
                            s6_RxD_data_ready[5] <= 1'b1;
                        end
                        8'h9B: begin
                            if(s6_TxD_data[5] == 8'hFF) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[5] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[5] <= 8'hFF;
                            end  
                            s6_RxD_data_ready[5] <= 1'b1;                          
                        end
                        8'hB8: begin
                            if(s6_TxD_data[6] == 8'hFC) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[6] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[6] <= 8'hFC;
                            end                            
                            s6_RxD_data_ready[6] <= 1'b1;
                        end
                        8'hB9: begin
                            if(s6_TxD_data[6] == 8'hFD) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[6] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[6] <= 8'hFD;
                            end                            
                            s6_RxD_data_ready[6] <= 1'b1;
                        end
                        8'hBA: begin
                            if(s6_TxD_data[6] == 8'hFE) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[6] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[6] <= 8'hFE;
                            end                            
                            s6_RxD_data_ready[6] <= 1'b1;
                        end
                        8'hBB: begin
                            if(s6_TxD_data[6] == 8'hFF) begin
                                k7_register_addr <= 8'h0;
                                s6_TxD_data[6] <= k7_RxD_data;
                            end else begin
                                s6_TxD_data[6] <= 8'hFF;
                            end  
                            s6_RxD_data_ready[6] <= 1'b1;                          
                        end */
                        default: begin
						  //TxD_data_valid 
						    //TxD_data <= k7_TxD_data;
                            /*
									 k7_RxD_data_r <= k7_RxD_data[7];
                                if(k7_RxD_data[7] & ~k7_RxD_data_r) begin
                            //k7_TxD_data <= 8'hF1;
                            SOFT_RST <= 1'b1;
									 end else begin
										 //k7_TxD_data <= 8'h00;
										 SOFT_RST <= 1'b0;                        
									 end
									 */
						end
                    endcase
                end
                
                /*if(k7_register_addr == 4'h3) begin
                    k7_register_addr <= 0;
                end else if(k7_register_addr == 6'h4) begin
                    if(k7_RxD_data[7] == 1'b1) begin
                        //mask_channel[k7_RxD_data[6:0]+:1] = 1'b1 ;// << RxD_data[6:0];
                    end else begin
                        //mask_channel[k7_RxD_data[6:0]+:1] = 1'b0 ;
                        //mask_channel = 0 << RxD_data[6:0];
                    end
                    k7_register_addr <= 0;
                end else if(k7_register_addr == 6'h1) begin
                    k7_TRAINNING_ENABLE <= k7_RxD_data[7];
                    if(k7_RxD_data[7]) begin
                        k7_TxD_data <= 8'hF1;
                        k7_TxD_data_valid <= 1'b1;
                    end else begin
                        //k7_TxD_data <= 8'h00;
                        k7_TxD_data_valid <= 1'b1;                        
                    end
                end else if(k7_register_addr == 6'h2) begin
                    k7_RxD_data_r <= k7_RxD_data[7];
                    if(k7_RxD_data[7] & ~k7_RxD_data_r) begin
                        //k7_TxD_data <= 8'hF1;
                        SOFT_RST <= 1'b1;
                    end else begin
                        //k7_TxD_data <= 8'h00;
                        SOFT_RST <= 1'b0;                        
                    end
                end else if(k7_register_addr == 6'h0) begin
						  //TxD_data_valid 
						  TxD_data <= k7_TxD_data;
                    k7_RxD_data_r <= k7_RxD_data[7];
                    if(k7_RxD_data[7] & ~k7_RxD_data_r) begin
                        //k7_TxD_data <= 8'hF1;
                        SOFT_RST <= 1'b1;
                    end else begin
                        //k7_TxD_data <= 8'h00;
                        SOFT_RST <= 1'b0;                        
                    end
                end */
            end			
    end
	

//	 BUFG BUFG_inst (
//      .O(WR_CLK_IN_BUF), // 1-bit output: Clock buffer output
//      .I(WR_CLK_IN)  // 1-bit input: Clock buffer input
//   );



    //wire [63:0] signal;
    //wire [4:0] ctrl;

    //wire mgtm2d;
    //wire mgtd2m;

    // IBUFGDS: Differential Global Clock Buffer (sourced by an external pin)
    //          Spartan-6
    // Xilinx HDL Language Template, version 14.4

    //    IBUFGDS #(
    //       .DIFF_TERM("FALSE"), // Differential Termination
    //       .IOSTANDARD("DEFAULT") // Specifies the I/O standard for this buffer
    //    ) IBUFGDS_inst (
    //       .O(CLK_IN),  // Clock buffer output
    //       .I(CLKP),  // Diff_p clock buffer input
    //       .IB(CLKN) // Diff_n clock buffer input
    //    );

    // End of IBUFGDS_inst instantiation

    // PLL_BASE: Phase Locked Loop (PLL) Clock Management Component
    //           Spartan-6
    // Xilinx HDL Language Template, version 14.4
  
/*    BUFIO2 #(
        .DIVIDE_BYPASS("TRUE"), 
        .I_INVERT("FALSE")
    ) u_bufio_250 (
        .I(clk_250M_pll),
        .DIVCLK(),        
        .IOCLK(clk_250M), // ӵ master_rx_s6  clk_250m
        .SERDESSTROBE()
    );*/
	 //assign clk_125M = WR_CLK_IN;


/*    TCP_clk clk_wiz_tcp (
        .CLK_OUT1(clk_125M),
        // .clk_out2(clk_125M_nobuffer),
        // .clk_out3(clk_50M),
        // .clk_out4(clk_250M),
        .CLK_OUT2(clk_10M),
		  .CLK_OUT3(clk_20M),
        //.clk_out6(clk_62M5),
        //.clk_out7(clk_200M),
        //.clk_in1_p(SYS_CLK_P),
        //.clk_in1_n(SYS_CLK_N),
        .CLK_IN1(WR_RESET_IN),//SYS_CLK_BUF),
        .RESET(1'b0),
        //	.clk_in_sel(TDC_CLK_SELECT),
        .LOCKED(clk_locked_sitcp)
    ); */



//assign TCK_LVCMOS33[1] = 1'b1; //FTCK_LVDS33_P; //
//assign FTCK_LVDS33_N = 1'b1;
//assign TMS_LVCMOS33[1] = 1'b0; //FTMS_LVDS33_P; //1'b1;
//assign FTMS_LVDS33_N = 1'b0;    
//assign TDI_LVCMOS33[1] = 1'b0; //FTDI_LVDS33_P; //1'b1;
//assign FTDI_LVDS33_N = 1'b0; 
//assign FTDO_LVDS33_P = TDO_LVCMOS33[1]; //1'b1;
//assign FTDO_LVDS33_N = 1'b0; 

/*      vio_0 vio_0 (
      .clk(clk_125M),                // input wire clk
      .probe_out0(FLASH_READ_EN)
    );    */ 
    //wire [4:0]	 delay_value[SPARTAN6_NUM/2-1:0];

/*     ila_0 ila_0(
        .clk(clk_125M), // input wire clk
        .probe0(sitcp_fifo_full)
    ); 
    ila_0 ila_0(
        .clk(clk_125M), // input wire clk
        .probe0(clk_locked_sitcp)
    );*/


/*    BUFG bufg_tdc (
        .I(SOFT_RST_BUF),
        .O(SOFT_RST)
    );*/
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
    //assign TCP_CLK_OUT = clk125_remote;
   

 /*           
        
    reg reset_jtag;
    reg [28:0] counter_jtag = 0;
    reg sp6_program_start;

    wire            jtag_clk;
    wire            ila_clk;
    wire            FLASH_TDO_out;
    wire            flash_rd_en;
    wire            sys_rst_n;

    //assign RESET_IN = sp6_program_start;

    always @(posedge jtag_clk) begin
        if(clk_locked_sitcp) begin
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

    reg reset_sp6;
    reg [23:0] counter_sp6;

    always @(posedge jtag_clk) begin
        if(!reset_jtag) begin
            if (counter_sp6 >= 24'd10_000_000) begin
                reset_sp6 <= 0;
            end else begin
                reset_sp6 <= 1;
                counter_sp6 <= counter_sp6 + 1;
            end
        end else begin
            counter_sp6 <= 0;
            reset_sp6 <= 1;
        end
    end*/

    // used for Spartan-6 JTAG program

/*    reg             pi_key  ;
    reg             pi_key_r  ;
    wire            po_key_0;
    wire            po_key  ;   //İź*/
    wire            tx_flag ;   //봮ڷģݱ־ń1717
    wire    [7:0]   tx_data ;   //봮ڷĄ1717




    //wire            Flash_Read_tx_en;

    //parameter       BIT_SIZE = 32'd340884 << 3;  // size of bit file, not size on disk

/*     wire clk_100M_locked;
    wire clk_10M_coding;
    wire clk_20M_coding;
    clk_wiz_100M clk_wiz_100M
   (
    // Clock out ports
    //.clk_out1(clk_100M),     // output clk_out1
    .clk_out1(clk_10M_coding),     // output clk_out1
    .clk_out2(clk_20M_coding),     // output clk_out1
    .clk_out3(clk_80M_coding),     // output clk_out1
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(clk_100M_locked),       // output locked
   // Clock in ports
    .clk_in1(FB_OUT));  

    //assign po_key  = EXTERNAL_CALIB_ENABLE;
    assign ila_clk = clk_100M; */

/*     key_filter
    #(
        .CNT_MAX    (20'd999_999/5    )   //ֵ
    )
    key_filter_inst
    (
        .sys_clk    (jtag_clk    ),  //ϵͳʱӣƵ10MHz
        .sys_rst_n  (sys_rst_n  ),  //λź,͵ƽЧ
        .key_in     (pi_key     ),  //ź

        .key_flag   (po_key     )   //ź
    ); */
    wire rd_en;
    wire full;
    wire empty;
    wire Flash_Read_tx_en;
    wire Flash_cs;
    wire [7:0] Flash_DATA_OUT;
    wire [20:0] Flash_Current_State;
    wire [7:0] jtag_state;
    wire [31:0] jtag_countbit;
    wire [31:0] Flash_cnt;
    wire FLASH_WRITE_VALID_1;
    wire       uart_done_pos;
    wire       prog_full;
    wire [7:0] flash_dout;
   // wire [63:0] TDC_decode_data;
   // wire        TDC_decode_data_valid;

/*    always@(posedge clk_125M) begin
        pi_key <= EXTERNAL_CALIB_ENABLE;
        pi_key_r <= pi_key;
    end

    assign po_key_0 = ~pi_key_r & pi_key;

    Flag_CrossDomain FLASH_READ_EN_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(po_key_0),
      .clkB(jtag_clk),
      .FlagOut_clkB(po_key)
    );
*/


    // assign rd_en = ~empty & ~sitcp_fifo_full;
    // fifo_flash fifo_flash (
    //     .clk(clk_10M),      // input wire clk
    //     .srst(1'b0),    // input wire srst
    //     .din(TDC_decode_data),      // input wire [7 : 0] din
    //     .wr_en(TDC_decode_data_valid & ~full),  // input wire wr_en
    //     .rd_en(rd_en),  // input wire rd_en
    //     .valid(SiTCP_din_valid),
    //     .dout(SiTCP_din),    // output wire [127 : 0] dout
    //     .full(full),    // output wire full
    //     .empty(empty)  // output wire empty
    // );

/*     ila_0 ila_9(
        .clk(jtag_clk), // input wire clk
        .probe0(FLASH_TDO_out),
        .probe1(po_key),
        .probe2(flash_rd_en)
    );  */

/*    pll u_pll(
        .clk_in ( clk_10M ),            //10MHz
        .rst_n  ( 1'b1 ),
        .jtag_clk  ( jtag_clk  )        //2.5M
    );
     generate
        genvar x;
        for(x = 0;x < SPARTAN6_NUM;x = x + 1) begin
            jtag_pl#(
                .BIT_SIZE    (BIT_SIZE + 100 )   //BITļС
            )u_jtag_pl(
                .clk_in  ( jtag_clk  ),
                .ila_clk  ( ila_clk  ),
                .rst     ( ~sys_rst_n     ),
                .key_begin  (po_key),
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     ( LED[3]     ),
                .led1    ( LED[4]    ),
                .led2    ( LED[5]    ),
                .tck_out ( TCK[x] ),
                .tms_out ( TMS[x] ),
                .tdi_out ( TDI[x] ),
                .tdo_in  ( TDO[x] )
            );

        end
    endgenerate  */ 

/*     sp6_program #(
        .SPARTAN6_NUM(SPARTAN6_NUM),
        .BIT_SIZE(BIT_SIZE)
    )sp6_program(
        .CLK_IN(clk_10M),
        .jtag_clk(jtag_clk),
        .RESET(SOFT_RST),
        .MANUAL_PROGRAM(po_key),
        .JTAG_SWITCH(JTAG_SWITCH),

        .TCK(TCK),
        .TMS(TMS),
        .TDI(TDI),
        .TDO(TDO),

        .RESET_OUT(RESET_OUT),
	    .CLK_OUT(CLK_OUT),
	    .DATA_IN(DATA_IN),
	    .FB_OUT(FB_OUT),
        .SiTCP_din(SiTCP_din),
        .SiTCP_din_valid(SiTCP_din_valid)
    ); */

            wire [SPARTAN6_NUM:START_NUM]    	FLASH_TCK;
            wire [SPARTAN6_NUM:START_NUM]    	FLASH_TMS;
            wire [SPARTAN6_NUM:START_NUM]    	FLASH_TDI;
            wire [SPARTAN6_NUM:START_NUM]    	FLASH_TDO;

            wire [SPARTAN6_NUM:START_NUM]    	XVC_TCK;
            wire [SPARTAN6_NUM:START_NUM]    	XVC_TMS;
            wire [SPARTAN6_NUM:START_NUM]    	XVC_TDI;
            wire [SPARTAN6_NUM:START_NUM]    	XVC_TDO;
            
/*             jtag_pl#(
                .BIT_SIZE    ((BIT_SIZE) + 100 )   //BITļС
            )u_jtag_pl(
                .clk_in  ( jtag_clk  ),
                //.ila_clk  ( ila_clk  ),
                .rst     ( reset_jtag  ),
                .key_begin  (po_key | sp6_program_start), // 
                //.key_begin  (po_key ), // | sp6_program_start
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     ( LED[3]     ),
                .led1    ( LED[4]    ),
                .led2    ( LED[5]    ),
                .tck_out ( FLASH_TCK[0] ),
                .tms_out ( FLASH_TMS[0] ),
                .tdi_out ( FLASH_TDI[0] ),
                .tdo_in  ( FLASH_TDO[0] )
            );
            

            assign TCK[0] = JTAG_SWITCH ? XVC_TCK[0] : FLASH_TCK[0];
            assign TMS[0] = JTAG_SWITCH ? XVC_TMS[0] : FLASH_TMS[0];
            assign TDI[0] = JTAG_SWITCH ? XVC_TDI[0] : FLASH_TDI[0];
            //assign TDO[0] = JTAG_SWITCH ? XVC_TDO[0] : FLASH_TDO[0];
            assign XVC_TDO[0] = TDO[0];
            assign FLASH_TDO[0] = TDO[0];
 */


        //generate
        //if(DEBUG) begin
/*     AXI_LITE_JTAG AXI_LITE_JTAG(
        .CLK(clk_125M),
        .RESET_n(1'b1),
        // .WENABLE(WENABLE),
		// .WBUSY(WBUSY),
		// .WERR(WERR),
		// .RENABLE(RENABLE),
		// .RBUSY(RBUSY),
		// .RERR(RERR),
		// .REG_WADDR(REG_WADDR),
		// .REG_RADDR(REG_RADDR),
		// .REG_WDW(REG_WDW),
		// .REG_RDW(REG_RDW),
		// .REG_WVAL(REG_WVAL),
		// .REG_RVAL(REG_RVAL),
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
        .TCK( XVC_TCK[0] ),
        .TMS( XVC_TMS[0] ),
        .TDI( XVC_TDI[0] ),
        .TDO( XVC_TDO[0] )
    ); */





    

    wire clk2x;
    wire locked_x;
//   manchester_clk instance_name
//    (
//     // Clock out ports
//     .clk_out1(clk2x),     // output clk_out1
//     // Status and control signals
//     .reset(1'b0), // input reset
//     .locked(locked_x),       // output locked
//    // Clock in ports
//     .clk_in1(RESET_OUT));      // input clk_in1

    wire RESET_receive;
    //wire [127:0]    DATA_OUT;
    //wire            DATA_OUT_VALID;
    //wire   [SPARTAN6_NUM:START_NUM]                             RESET_LVDS33;
    wire   [SPARTAN6_NUM:START_NUM]                             DATA_LVDS33;
    wire   [SPARTAN6_NUM:START_NUM]                             FB_LVDS33;
    wire   [SPARTAN6_NUM:START_NUM]                             CLK_LVDS33;
    wire   [PAYLOAD_WIDTH - 1:0]                DATA_OUT[SPARTAN6_NUM:START_NUM];
    wire   [SPARTAN6_NUM:START_NUM]                             DATA_OUT_VALID;
	wire   [SPARTAN6_NUM:START_NUM]                             clk_100M_locked;
    wire   [SPARTAN6_NUM:START_NUM]                             clk_10M_coding;
    wire   [SPARTAN6_NUM:START_NUM]                             clk_20M_coding;
	wire   [SPARTAN6_NUM:START_NUM]                             clk_80M_coding;

	wire   [SPARTAN6_NUM:START_NUM]                             fwd_clk;
    wire   [SPARTAN6_NUM:START_NUM]                             RxD_data_ready;
    wire   [7:0]                                        RxD_data[SPARTAN6_NUM:START_NUM];
    wire   [SPARTAN6_NUM:START_NUM]                             TxD_data_valid;
    wire   [7:0]                                        TxD_data[SPARTAN6_NUM:START_NUM];
    //wire   [SPARTAN6_NUM:START_NUM]                             TxD_data_r_valid;
    //wire   [7:0]                                        TxD_data_r[SPARTAN6_NUM:START_NUM];
    wire   [1:0]                                        uart_ctrl[SPARTAN6_NUM:START_NUM];
    reg    [1:0]                                        uart_ctrl_r[SPARTAN6_NUM:START_NUM];
    wire   [SPARTAN6_NUM:START_NUM]                             m_crc_err;
	 wire   [SPARTAN6_NUM:START_NUM]                             rx_ibuf;
	 wire   [2:0] 																			 rx_state[SPARTAN6_NUM:START_NUM] ;
    wire   [SPARTAN6_NUM:START_NUM]                             RESET_LINK;

    reg    [SPARTAN6_NUM:START_NUM]                             DATA_LVDS33_PHSAE;
    reg    [SPARTAN6_NUM:START_NUM]                             TRAIN_END;
    wire   [SPARTAN6_NUM:START_NUM]                             DATA_IN;
	 
	 wire   [SPARTAN6_NUM:START_NUM]                             ioclk_b;
	 wire   [SPARTAN6_NUM:START_NUM]                             strobe_b;
	 wire   [SPARTAN6_NUM:START_NUM]                             pll_locked;
	 
	//wire   [SPARTAN6_NUM:START_NUM]       CLKFBIN;
    

	wire [PAYLOAD_WIDTH - 1:0] FULL_DATA_M_CH[SPARTAN6_NUM:START_NUM];
    wire [SPARTAN6_NUM:START_NUM] FULL_DATA_VALID_M_CH;
    reg  [SPARTAN6_NUM:START_NUM] FULL_DATA_READY_M_CH;

    reg  [PAYLOAD_WIDTH - 1:0] S_FULL_DATA;
    reg    S_FULL_DATA_VALID;
    wire   S_FULL_DATA_READY;
    wire [PAYLOAD_WIDTH - 1:0] M_FULL_DATA;
    wire    M_FULL_DATA_VALID;

    reg [2:0] CURRENT_STATE, NEXT_STATE;

	 
	 wire [111:0] DATA_OUT1;
	 wire         DATA_OUT_VALID1;
	 wire [111:0] DATA_OUT2;
	 wire         DATA_OUT_VALID2;
     reg  [SPARTAN6_NUM:START_NUM]          SP6_train_en;
     reg  [7:0]                     SP6_Register_addr[SPARTAN6_NUM:START_NUM];


                 // 1. TCK ȫʱ
    BUFG tck_bufg (.I(FTCK_LVDS33), .O(SLAVE_TCK));

    // 2. TMS  TDI ʹüĴת (ش)
//    always @(negedge SLAVE_TCK) begin
//        SLAVE_TMS <= FTMS_LVDS33;
//        SLAVE_TDI <= FTDI_LVDS33;
//    end

    // 3. TDO Ĵǳɰܹؼ
    //  Master 2 ڲ TCK ½ץһ Slave  TDO
    // Ե Master 2 -> Slave -> Master 2 Ĵӳ

/*
    TDC_data_receive #(
            .DATA_WIDTH(MANCHESTER_DATA_WIDTH)
    )TDC_data_receive1(
            .CLK(clk_12M5),
            .CLK2X(clk_25M),
            .CLK8X(clk_100M),
            .RESET(1'b0),
            .SW(4'b0),
            .DATA_IN(~DATA_LVDS33[1]),
            .DATA_OUT(DATA_OUT1),
            .DATA_OUT_VALID(DATA_OUT_VALID1)
    );
    TDC_data_receive #(
            .DATA_WIDTH(MANCHESTER_DATA_WIDTH)
    )TDC_data_receive2(
            .CLK(clk_12M5),
            .CLK2X(clk_25M),
            .CLK8X(clk_100M),
            .RESET(1'b0),
            .SW(4'b0),
            .DATA_IN(DATA_LVDS33[1]),
            .DATA_OUT(DATA_OUT2),
            .DATA_OUT_VALID(DATA_OUT_VALID2)
    );*/

	// Spartan-6 箢化架构：使用已存在的 BUFG 驱动的时钄17
	// clk_125M 已经通过 BUFG，可以用亄17 ISERDES
	// 使用 clk_62M5 作为 SERDES strobe

	// 使用已有的17 125MHz BUFG 时钟驱动 ISERDES
	// (clk_125M 已在其他地方通过 BUFG 实例匄17)

	// 使用 clk_62M5 作为 SERDES strobe（已通过 BUFG＄17
	// 添加约束允许 BUFG 驱动 IOCE
	wire serdesstrobe;
	//assign serdes_strobe = clk_62M5; 
	genvar x;
	wire ioclk;
	//wire [SPARTAN6_NUM:START_NUM] divclk;
	wire divclk;
	
					// 	BUFIO2 #(
					// 	 .DIVIDE(4), // 8位解串常使用4倍频
					// 	 .DIVIDE_BYPASS("FALSE")
					// ) BUFIO2_inst (
					// 	 .I(clk_250M_pll), 
					// 	 .IOCLK(ioclk), // 高时钟给ISERDES
					// 	 .DIVCLK(divclk), // 低时钟给逻辑
					// 	 .SERDESSTROBE(serdesstrobe) // 采样使能
					// );

					BUFPLL #(
						 .DIVIDE(4)
					) BUFPLL_inst (
						 .IOCLK(ioclk),
						 .LOCKED(PLL1_LOCKED),
						 .SERDESSTROBE(serdesstrobe),
						 .PLLIN(clk_250M_pll),
						 .GCLK(clk_62M5)
						 //.CE(1'b1),
						 //.IOCE(ioce)
					);
				
						  //if (x == 2 || x == 4) begin
								// 归属 Bank 0
								master_rx_s6 #(
									.PAYLOAD_WIDTH(PAYLOAD_WIDTH),
									.CRC_WIDTH(CRC_WIDTH)
							   ) master_rx_channel1 (
									.clk_250m(ioclk),            // 使用已有的17 125MHz BUFG
									.clk_62_5m(clk_62M5),
									.IOCE(serdesstrobe),           // 使用 clk_62M5
									.rst(RESET_LINK[2]),
									.rx_p(DATA_LVDS33_P[2]), 
									.rx_n(DATA_LVDS33_N[2]),
									.uart_cmd_out(uart_ctrl[2]),
									.data_out(DATA_OUT[2]), 
									.data_valid(DATA_OUT_VALID[2]), 
									.crc_error_pulse(m_crc_err[2]),
									.rx_ibuf(rx_ibuf[2]),
									.state(rx_state[2])
									//.align_done(align_done[1])
							   );
   generate
        
        for(x = START_NUM;x <= SPARTAN6_NUM;x = x + 1) begin: gen_rx
					if(x > 2)
					IBUFDS #(
						  .DIFF_TERM("TRUE"),     // Differential Termination ("TRUE"/"FALSE")
						  .IBUF_LOW_PWR("TRUE"),   // Low Power - "TRUE", High Performance = "FALSE" 
						  .IOSTANDARD("LVDS_33") // Specify the I/O standard
						  //.SLEW("SLOW")            // Specify the output slew rate
					 ) ibufds_inst (
						  .O(), 
						  .I(DATA_LVDS33_P[x]), 
						  .IB(DATA_LVDS33_N[x])
					 );
/*					BUFIO2 #(
						 .DIVIDE(4), // 8位解串常使用4倍频
						 .DIVIDE_BYPASS("FALSE")
					) BUFIO2_inst (
						 .I(clk_250M_pll), 
						 .IOCLK(ioclk), // 高时钟给ISERDES
						 .DIVCLK(divclk[x]), // 低时钟给逻辑
						 .SERDESSTROBE(serdesstrobe) // 采样使能
					);

					BUFPLL #(
						 .DIVIDE(4)
					) BUFPLL_inst (
						 .IOCLK(ioclk),
						 .LOCKED(PLL1_LOCKED),
						 .SERDESSTROBE(serdesstrobe),
						 .PLLIN(clk_250M_pll),
						 .GCLK(divclk[x])
						 //.CE(1'b1),
						 //.IOCE(ioce)
					);
				
						  //if (x == 2 || x == 4) begin
								// 归属 Bank 0
								master_rx_s6 #(
									.PAYLOAD_WIDTH(PAYLOAD_WIDTH),
									.CRC_WIDTH(CRC_WIDTH)
							   ) master_rx_channel1 (
									.clk_250m(clk_250M),            // 使用已有的17 125MHz BUFG
									.clk_62_5m(clk_62M5_bufg),
									.IOCE(),           // 使用 clk_62M5
									.rst(RESET_LINK[x]),
									.rx_p(DATA_LVDS33_P[x]), 
									.rx_n(DATA_LVDS33_N[x]),
									.uart_cmd_out(uart_ctrl[x]),
									.data_out(DATA_OUT[x]), 
									.data_valid(DATA_OUT_VALID[x]), 
									.crc_error_pulse(m_crc_err[x]),
									.rx_ibuf(rx_ibuf[x]),
									.state(rx_state[x])
									//.align_done(align_done[1])
							   );*/
/*						  end else begin
								// 归属 Bank 2 (3, 5, 6)
								master_rx_s6 #(
									.PAYLOAD_WIDTH(PAYLOAD_WIDTH),
									.CRC_WIDTH(CRC_WIDTH)
							  ) master_rx_channel1 (
									.clk_250m(clk_250M),            // 使用已有的17 125MHz BUFG
									.clk_62_5m(clk_62M5),
									.IOCE(),           // 使用 clk_62M5
									.rst(RESET_LINK[x]),
									.rx_p(DATA_LVDS33_P[x]), 
									.rx_n(DATA_LVDS33_N[x]),
									.uart_cmd_out(uart_ctrl[x]),
									.data_out(DATA_OUT[x]), 
									.data_valid(DATA_OUT_VALID[x]), 
									.crc_error_pulse(m_crc_err[x]),
									.rx_ibuf(rx_ibuf[x]),
									.state(rx_state[x])
									//.align_done(align_done[1])
							  );
						  end*/

                    /*master_rx_s6 #(
                        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
                        .CRC_WIDTH(CRC_WIDTH)
                        //.SYNC_HEADER(SYNC_HEADER)
                    ) master_rx_channel1 (
                        .clk_250m(ioclk_b[x]),
                        .clk_62_5m(clk_62M5),
								.IOCE(strobe_b[x]),
                        .rst(RESET_LINK[x]),
                        .rx_p(DATA_LVDS33_P[x]), 
                        .rx_n(DATA_LVDS33_N[x]),
                        .uart_cmd_out(uart_ctrl[x]),
                        .data_out(DATA_OUT[x]), 
                        .data_valid(DATA_OUT_VALID[x]), 
                        .crc_error_pulse(m_crc_err[x]),
								.rx_ibuf(rx_ibuf[x]),
								.state(rx_state[x])
                        //.align_done(align_done[1])
                    );*/	
				//end
				Data_FIFO Data_FIFO (
				  .m_aclk(clk_62M5), // input m_aclk
				  .s_aclk(clk_62M5), // input s_aclk
				  .s_aresetn(1'b1), // input s_aresetn
				  .s_axis_tvalid(DATA_OUT_VALID[x]), // input s_axis_tvalid
				  .s_axis_tready(), // output s_axis_tready
				  .s_axis_tdata(DATA_OUT[x]), // input [63 : 0] s_axis_tdata
				  .m_axis_tvalid(FULL_DATA_VALID_M_CH[x]), // output m_axis_tvalid
				  .m_axis_tready(FULL_DATA_READY_M_CH[x]), // input m_axis_tready
				  .m_axis_tdata(FULL_DATA_M_CH[x]) // output [63 : 0] m_axis_tdata
				);
				
/*				if(x >= 1)	begin		
					IBUFDS #(
						 .IOSTANDARD("LVDS_33") // Specify the output I/O standard
						 //.SLEW("SLOW")           // Specify the output slew rate
					) IBUFDS_DATA (
						 .I(DATA_LVDS33_P[x]),     // Diff_p output (connect directly to top-level port)
						 .IB(DATA_LVDS33_N[x]),   // Diff_n output (connect directly to top-level port)
						 .O(DATA_LVDS33[x])      // Buffer input
					); 
				end*/
/*            IBUFDS #(
                .IOSTANDARD("LVDS_25") // Specify the output I/O standard
                //.SLEW("SLOW")           // Specify the output slew rate
            ) IBUFDS_FB (
                .I(FB_LVDS33_P[x]),     // Diff_p output (connect directly to top-level port)
                .IB(FB_LVDS33_N[x]),   // Diff_n output (connect directly to top-level port)
                .O(FB_LVDS33[x])      // Buffer input
            );*/ 



				if(x == 1 || x == 4) begin
					ODDR2 #(
						  .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
						  .INIT(1'b0),
						  .SRTYPE("SYNC")
					) ODDR2_FWDCLK (
						  .Q (fwd_clk_oddr[x]),
						  .C0(clk_62M5_bufg),
						  .C1(~clk_62M5_bufg),
						  .CE(1'b1),
						  .D0(1'b1),
						  .D1(1'b0),
						  .R (1'b0),
						  .S (1'b0)
					);
				end else begin
					ODDR2 #(
						  .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
						  .INIT(1'b0),
						  .SRTYPE("SYNC")
					) ODDR2_FWDCLK (
						  .Q (fwd_clk_oddr[x]),
						  .C0(~clk_62M5_bufg),
						  .C1(clk_62M5_bufg),
						  .CE(1'b1),
						  .D0(1'b1),
						  .D1(1'b0),
						  .R (1'b0),
						  .S (1'b0)
					);
				end	
				
				OBUFDS #(
					 .IOSTANDARD("LVDS_33"), // Specify the output I/O standard
					 .SLEW("SLOW")           // Specify the output slew rate
				) OBUFDS_CLK (
					 .O(CLK_LVDS33_P[x]),     // Diff_p output (connect directly to top-level port)
					 .OB(CLK_LVDS33_N[x]),   // Diff_n output (connect directly to top-level port)
					 .I(fwd_clk_oddr[x])      // Buffer input
				);
/*				  OBUFDS #(
						 .IOSTANDARD("LVDS_33"), // Specify the output I/O standard
						 .SLEW("SLOW")           // Specify the output slew rate
					) OBUFDS_CLK (
						 .O(CLK_LVDS33_P[x]),     // Diff_p output (connect directly to top-level port)
						 .OB(CLK_LVDS33_N[x]),   // Diff_n output (connect directly to top-level port)
						 .I(~WR_CLK_IN)      // Buffer input
					);	*/				
				
				always @(posedge clk_62M5) begin
				  		data_sync_fwd[x] <= rx_bit_raw; // 圄17 IOB 附近采样数据，准备转叄17
				end

				if(x == 1 || x == 2) begin
					ODDR2 #(
						  .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
						  .INIT(1'b0),
						  .SRTYPE("SYNC")
					)oddr2_data_fwd (
						 .Q(fwd_data_oddr[x]),
						 .C0(clk_62M5_bufg), 
						 .C1(~clk_62M5_bufg),
						 .D0(data_sync_fwd[x]), 
						 .D1(data_sync_fwd[x]),   // 转发刚刚接收到的数据
						 .CE(1'b1), .R(1'b0), .S(1'b0)
					);			

					
				end else begin
					ODDR2 #(
						  .DDR_ALIGNMENT("NONE"), // "NONE", "C0", or "C1"; "C0" is fine for forwarded clock
						  .INIT(1'b0),
						  .SRTYPE("SYNC")
					)oddr2_data_fwd (
						 .Q(fwd_data_oddr[x]),
						 .C0(~clk_62M5_bufg), 
						 .C1(clk_62M5_bufg),
						 .D0(data_sync_fwd[x]), 
						 .D1(data_sync_fwd[x]),   // 转发刚刚接收到的数据
						 .CE(1'b1), .R(1'b0), .S(1'b0)
					);			

				
				end
				
				OBUFDS #(
					 .IOSTANDARD("LVDS_33"), // Specify the output I/O standard
					 .SLEW("SLOW")           // Specify the output slew rate
				) OBUFDS_RESET (
					 .O(RESET_LVDS33_P[x]),     // Diff_p output (connect directly to top-level port)
					 .OB(RESET_LVDS33_N[x]),   // Diff_n output (connect directly to top-level port)
					 .I(fwd_data_oddr[x])      // Buffer input
				); 

            // assign TxD_data_valid[x] = TRAIN_END[x]? s6_TxD_data_valid[x] : s6_Config_TxD_data_valid[x];
            // assign TxD_data[x]       = TRAIN_END[x]? s6_TxD_data[x] : s6_Config_TxD_data[x];
            //assign s6_Config_RxD_data[x] = TRAIN_END[x]? 0 : RxD_data[x];

            fifo_tdc_config fifo_tdc_config (
                .rst(1'b0),        // input wire rst
                .wr_clk(clk_62M5),  // input wire wr_clk
                .rd_clk(clk_62M5),  // input wire rd_clk
                .din(s6_Config_TxD_data[x]),        // input wire [7 : 0] din
                .wr_en(s6_Config_TxD_data_valid[x]),    // input wire wr_en
                .rd_en(~rs232_fifo_empty[x] & s6_TxD_ready[x] & ~TxD_data_valid[x] ),    // input wire rd_en
                .dout(TxD_data[x]),      // output wire [7 : 0] dout
                .full(),      // output wire full
                .empty(rs232_fifo_empty[x]),    // output wire empty
                .valid(TxD_data_valid[x])
            );

            UART_Packet_Ctrl #(
                .CLK_FREQ(62500000),
                .BAUD_RATE(115200)
            ) UART_Packet_Ctrl_s6 (
                .clk(clk_62M5),
                .rst_n(~SOFT_RST),
                .send_req(TxD_data_valid[x]),
                .user_tx_data(TxD_data[x]),
                .user_rx_data(RxD_data[x]),
                .user_rx_valid(RxD_data_ready[x]),
                .tx_ready(s6_TxD_ready[x]),
                .uart_tx_pin(s6_TxD[x]),
                .uart_rx_pin(s6_RxD[x])
            );

/*				
			async_receiver SP6_async_receiver(
				.clk(clk_25M),
				.RxD(s6_RxD[x]),
				.RxD_data_ready(RxD_data_ready[x]),
				.RxD_data(RxD_data[x])
			);

			async_transmitter SP6_async_transmitter(
				 .clk(clk_25M), 
				 .TxD(s6_TxD[x]), 
				 .TxD_start(TxD_data_valid[x]), 
				 .TxD_data(TxD_data[x]),
				 .TxD_busy(s6_TxD_ready[x])
			);

*/
/*			IOBUFDS #(
				.IOSTANDARD("BLVDS_25")    // Specify the I/O standard
			) IOBUFDS_inst (
				.O(s6_RxD[x]),     // Buffer output
				.IO(FB_LVDS33_P[x]),   // Diff_p inout (connect directly to top-level port)
				.IOB(FB_LVDS33_N[x]), // Diff_n inout (connect directly to top-level port)
				.I(s6_TxD[x]),     // Buffer input
				.T(~s6_TxD_ready[x])      // 3-state enable input, high=input, low=output
			);*/

			assign s6_RxD[x] = FB_LVDS33_P[x];
			assign FB_LVDS33_N[x] = s6_TxD[x];
			
				
/* 			clk_wiz_100M clk_wiz_100M (// Clock in ports
					.CLK_IN1_P(FB_LVDS33_P[x]),      // IN
					.CLK_IN1_N(FB_LVDS33_N[x]),  
					// Clock out ports
					.CLK_OUT1(clk_10M_coding[x]),     // OUT
					.CLK_OUT2(clk_20M_coding[x]),     // OUT
					.CLK_OUT3(clk_80M_coding[x]),     // OUT
					// Status and control signals
					.RESET(1'b0),// IN
					.LOCKED(clk_100M_locked[x])
			);   */
			/* 
			PLL_BASE #(
				.BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
				.CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT clock outputs (1-64)
				.CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
				.CLKIN_PERIOD(8.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
									// MHz).
				// CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
				.CLKOUT0_DIVIDE(80),
				.CLKOUT1_DIVIDE(40),
				.CLKOUT2_DIVIDE(10),
				.CLKOUT3_DIVIDE(1),
				.CLKOUT4_DIVIDE(1),
				.CLKOUT5_DIVIDE(1),
				// CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
				.CLKOUT0_DUTY_CYCLE(0.5),
				.CLKOUT1_DUTY_CYCLE(0.5),
				.CLKOUT2_DUTY_CYCLE(0.5),
				.CLKOUT3_DUTY_CYCLE(0.5),
				.CLKOUT4_DUTY_CYCLE(0.5),
				.CLKOUT5_DUTY_CYCLE(0.5),
				// CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
				.CLKOUT0_PHASE(0.0),
				.CLKOUT1_PHASE(0.0),
				.CLKOUT2_PHASE(0.0),
				.CLKOUT3_PHASE(0.0),
				.CLKOUT4_PHASE(0.0),
				.CLKOUT5_PHASE(0.0),
				.CLK_FEEDBACK("CLKFBOUT"),  // Clock source to drive CLKFBIN ("CLKFBOUT" or "CLKOUT0")
				.COMPENSATION("SYSTEM_SYNCHRONOUS"), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "EXTERNAL" 
				.DIVCLK_DIVIDE(1),  // Division value for all output clocks (1-52)
				.REF_JITTER(0.1),  // Reference Clock Jitter in UI (0.000-0.999).
				.RESET_ON_LOSS_OF_LOCK("FALSE")  // Must be set to FALSE
			) PLL_BASE_2 (
				.CLKFBOUT(CLKFBIN[x]),      // 1-bit output: PLL_BASE feedback output
				// CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
				.CLKOUT0 (clk_10M_coding[x]),
				.CLKOUT1 (clk_20M_coding[x]),
				.CLKOUT2 (clk_80M_coding[x]),
				.CLKOUT3 (),
				.CLKOUT4 (),
				.CLKOUT5 (),
				.LOCKED  (clk_100M_locked[x]),             // 1-bit output: PLL_BASE lock status output
				.CLKFBIN (CLKFBIN[x]),      // 1-bit input: Feedback clock input
				.CLKIN   (FB_LVDS33[x]),       // 1-bit input: Clock input
				.RST     (1'b0)         // 1-bit input: Reset input
			);
 */

/*			Data_FIFO Data_FIFO (
			  .m_aclk(clk_10M_coding[x]), // input m_aclk
			  .s_aclk(clk_125M), // input s_aclk
			  .s_aresetn(!RESET_IN), // input s_aresetn
			  .s_axis_tvalid(DATA_OUT_VALID[x]), // input s_axis_tvalid
			  .s_axis_tready(), // output s_axis_tready
			  .s_axis_tdata(DATA_OUT[x]), // input [31 : 0] s_axis_tdata
			  .m_axis_tvalid(FULL_DATA_VALID_M_CH[x]), // output m_axis_tvalid
			  .m_axis_tready(FULL_DATA_READY_M_CH[x]), // input m_axis_tready
			  .m_axis_tdata(FULL_DATA_M_CH[x]) // output [31 : 0] m_axis_tdata
			);*/
/*             jtag_pl#(
                .BIT_SIZE    (BIT_SIZE + 100 )   //BITļС
            )u_jtag_pl(
                .clk_in  ( jtag_clk  ),
                .ila_clk  ( ila_clk  ),
                .rst     ( ~sys_rst_n     ),
                .key_begin  (po_key),
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     ( LED[3]     ),
                .led1    ( LED[4]    ),
                .led2    ( LED[5]    ),
                .tck_out ( TCK[x] ),
                .tms_out ( TMS[x] ),
                .tdi_out ( TDI[x] ),
                .tdo_in  ( TDO[x] )
            ); */
			//assign TCK_LVCMOS33[x] = tdc_ila_use[x] ? 1'bz : SLAVE_TCK;
			//assign TMS_LVCMOS33[x] = tdc_ila_use[x] ? 1'bz : SLAVE_TMS;
			//assign TDI_LVCMOS33[x] = tdc_ila_use[x] ? 1'bz : SLAVE_TDI;
			
						

			
			ODDR2 #(
				.DDR_ALIGNMENT("NONE"),    // "NONE", "C0", "C1"
				.INIT(1'b0),
				.SRTYPE("SYNC")
			) u_oddr2_tck (
				.Q   (TCK_LVCMOS33_ODDR2[x]),  //  OBUFٵܽ
				.C0  (SLAVE_TCK),       // ʱ
				.C1  (~SLAVE_TCK),      // ½ʱ
				.CE  (1'b1),
				.D0  (1'b1),      //  '1' 
				.D1  (1'b0),      //  '0' ½
				.R   (1'b0),
				.S   (1'b0)
			);

			ODDR2 #(
				.DDR_ALIGNMENT("NONE"), 
				.SRTYPE("SYNC")       
			) ODDR2_tck_tri (
				.Q(tdc_ila_use_tck_tri_out[x]),    
				.C0(SLAVE_TCK), .C1(~SLAVE_TCK),
				.CE(1'b1),
				.D0(tdc_ila_use[x]), .D1(tdc_ila_use[x]), // ????????
				.R(1'b0),      .S(1'b0)
			);

			OBUFT OBUFT_tck (
				.O(TCK_LVCMOS33[x]),          // ???????
				.I(TCK_LVCMOS33_ODDR2[x]),    // ?? ODDR2 ?????
				.T(tdc_ila_use_tck_tri_out[x])   // ??????
			);
/*
			reg [SPARTAN6_NUM:1] tck_iob;
			always @(posedge clk) begin
				 TCK_LVCMOS33_ODDR2[x] <= SLAVE_TCK; // ?????? tck ?? [cite: 2, 51]
				 end
				 
				 // 2. ????????????????????? IOB?
				 reg [SPARTAN6_NUM:1] tck_tri_reg;
				 always @(posedge clk) begin
					  // ? ila_use ? 1 ??????? (High-Z)
							// ? FPGA ????? 1 ?????0 ??????
								 tck_tri_reg <= {SPARTAN6_NUM{ila_use}};
								 end
								 
								 // 3. ?????????
								 // ??????? tck_iob ??? O-FF?? tck_tri_reg ??? T-FF
			assign TCK = tck_tri_reg ? {SPARTAN6_NUM{1'bz}} : tck_iob;
*/

			ODDR2 #(
				.DDR_ALIGNMENT("NONE"),    // "NONE", "C0", "C1"
				.INIT(1'b0),
				.SRTYPE("SYNC")
			) u_oddr2_tms (
				.Q   (TMS_LVCMOS33_ODDR2[x]),  //  OBUFٵܽ
				.C0  (SLAVE_TCK),       // ʱ
				.C1  (~SLAVE_TCK),      // ½ʱ
				.CE  (1'b1),
				.D0  (FTMS_LVDS33),      //  '1' 
				.D1  (FTMS_LVDS33),      //  '0' ½
				.R   (1'b0),
				.S   (1'b0)
			);
			
			ODDR2 #(
				.DDR_ALIGNMENT("NONE"), 
				.SRTYPE("SYNC")       
			) ODDR2_tms_tri (
				.Q(tdc_ila_use_tms_tri_out[x]),    
				.C0(SLAVE_TCK), .C1(~SLAVE_TCK),
				.CE(1'b1),
				.D0(tdc_ila_use[x]), .D1(tdc_ila_use[x]), // ????????
				.R(1'b0),      .S(1'b0)
			);

				 
			OBUFT OBUFT_tms (
				.O(TMS_LVCMOS33[x]),          // ???????
				.I(TMS_LVCMOS33_ODDR2[x]),    // ?? ODDR2 ?????
				.T(tdc_ila_use_tms_tri_out[x])   // ??????
			);

			ODDR2 #(
				.DDR_ALIGNMENT("NONE"),    // "NONE", "C0", "C1"
				.INIT(1'b0),
				.SRTYPE("SYNC")
			) u_oddr2_tdi (
				.Q   (TDI_LVCMOS33_ODDR2[x]),  //  OBUFٵܽ
				.C0  (SLAVE_TCK),       // ʱ
				.C1  (~SLAVE_TCK),      // ½ʱ
				.CE  (1'b1),
				.D0  (FTDI_LVDS33),      //  '1' 
				.D1  (FTDI_LVDS33),      //  '0' ½
				.R   (1'b0),
				.S   (1'b0)
			);

			ODDR2 #(
				.DDR_ALIGNMENT("NONE"), 
				.SRTYPE("SYNC")       
			) ODDR2_tdi_tri (
				.Q(tdc_ila_use_tdi_tri_out[x]),    
				.C0(SLAVE_TCK), .C1(~SLAVE_TCK),
				.CE(1'b1),
				.D0(tdc_ila_use[x]), .D1(tdc_ila_use[x]), // ????????
				.R(1'b0),      .S(1'b0)
			);

			OBUFT OBUFT_tdi (
				.O(TDI_LVCMOS33[x]),          // ???????
				.I(TDI_LVCMOS33_ODDR2[x]),    // ?? ODDR2 ?????
				.T(tdc_ila_use_tdi_tri_out[x])   // ??????
			);

            always @(*) begin
                SLAVE_TDO[x] <= TDO_LVCMOS33[x];
            end



//			assign TDO_LVCMOS33[x] = 1'bz;//FTDI_LVDS33_P;
/*
            always @(posedge clk_25M) begin
                if (SOFT_RST) begin 
                    s6_Config_TxD_data[x] <= 8'h0;
                    s6_Config_TxD_data_valid[x] <= 1'b0;
                    SP6_train_en[x] <= 1'b1;
                    SP6_Register_addr[x] <= 8'h0;
                end else begin
                    if(SP6_train_en[x]) begin
                        SP6_Register_addr[x] <= 8'hFE;
                        SP6_train_en[x] <= 1'b0;
                    end else if(SP6_Register_addr[x] == 8'hFE)begin
                        s6_Config_TxD_data[x] <= 8'hFE;
                        s6_Config_TxD_data_valid[x] <= 1'b1;
                        SP6_Register_addr[x] <= 0;
                    end else if(TxD_data[x] == 8'hFE)begin
                        s6_Config_TxD_data[x] <= 8'h80;
                        s6_Config_TxD_data_valid[x] <= 1'b1;
                    end
                end
                // make sure that SP6 comes into a trainning state
                
                if (SOFT_RST) begin 
                    DATA_LVDS33_PHSAE[x] <= 1'b0;
                    TRAIN_END[x] <= 1'b0;
                end else //if(RxD_data_ready[x]) begin
                    if(s6_Config_RxD_data[x] == 8'hFE) begin
                        if(TIM_1MS_r) begin
                            if(~TRAIN_END[x]) begin
                                DATA_LVDS33_PHSAE[x] <= ~DATA_LVDS33_PHSAE[x];
                            end
                        end
                    end
                //end
                if( DATA_OUT_VALID[x] ) begin                     
                    TRAIN_END[x] <= 1'b1;
                end

            end
*/
				//reg [1:0] uart_ctrl;

            
            assign RESET_LINK[x] = SOFT_RST_TDC[x] | (uart_ctrl[x] == 2'b10 & TIM_1S_r);

            always @(posedge clk_62M5) begin
                uart_ctrl_r[x] <= uart_ctrl[x];
                if (RESET_LINK[x]) begin 
                    s6_Config_TxD_data[x] <= 8'h0;
                    s6_Config_TxD_data_valid[x] <= 1'b0;
                    SP6_train_en[x] <= 1'b1;
                    SP6_Register_addr[x] <= 8'h0;
                    //DATA_LVDS33_PHSAE[x] <= 1'b0;
                    TRAIN_END[x] <= 1'b0;
                end else begin
                    //TxD_data[x] <= RD_SP6_CONFIG_VALUE[x];
                    s6_Config_TxD_data_valid[x] <= 1'b0;
                    begin
                        // if(TIM_1MS_r) begin
                        //     if(~TRAIN_END[x]) begin
                        //         DATA_LVDS33_PHSAE[x] <= ~DATA_LVDS33_PHSAE[x];
                        //     end
                        // end
                    end
                    
                    if(s6_TxD_data_valid[x]) begin
                        s6_Config_TxD_data[x] <= s6_TxD_data[x];
                        s6_Config_TxD_data_valid[x] <= 1'b1;
                    end else if(k7_TRAINNING_ENABLE == 3'b11) begin					  
							  if(SP6_train_en[x]) begin
									SP6_Register_addr[x] <= 8'hFB;
									SP6_train_en[x] <= 1'b0;
							  end else if(SP6_Register_addr[x] == 8'hFB)begin
									s6_Config_TxD_data[x] <= 8'hFB;
									s6_Config_TxD_data_valid[x] <= 1'b1;
									SP6_Register_addr[x] <= 0;
							  end else if(s6_Config_TxD_data[x] == 8'hFB )begin
									s6_Config_TxD_data[x] <= 8'b01;
									s6_Config_TxD_data_valid[x] <= 1'b1;
							  end else if(uart_ctrl[x] == 2'b10) begin 
									s6_Config_TxD_data[x] <= 8'b10;
									s6_Config_TxD_data_valid[x] <= ~uart_ctrl_r[x][1] & uart_ctrl[x][1];
							  end else if(uart_ctrl[x] == 2'b11) begin
									s6_Config_TxD_data[x] <= 8'b11;
									s6_Config_TxD_data_valid[x] <= ~uart_ctrl_r[x][0] & uart_ctrl[x][0];
									TRAIN_END[x] <= 1'b1;
							  end
						  end
                end
            end

        end

/*                     if(RD_SP6_CONFIG_VALID[x]) begin
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
                    end */

// 		for(x = 2;x <= SPARTAN6_NUM;x = x + 1) begin
// 			assign clk_10M_coding[x] = clk_10M_coding[1];
// 			assign clk_20M_coding[x] = clk_20M_coding[1];
// 			assign clk_80M_coding[x] = clk_80M_coding[1];
			

 			//assign TDO_LVCMOS33[x] = 1'bz;//FTDI_LVDS33_P;
// 		end
    endgenerate

    IBUFDS #(
        .DIFF_TERM("TRUE"),   // Differential Termination
        .IOSTANDARD("LVDS_33") // Specify the output I/O standard
        //.SLEW("SLOW")           // Specify the output slew rate
    ) IBUFDS_FTMS (
        .I(FTMS_LVDS33_P),     // Diff_p output (connect directly to top-level port)
        .IB(FTMS_LVDS33_N),   // Diff_n output (connect directly to top-level port)
        .O(FTMS_LVDS33)      // Buffer input
    );
    IBUFDS #(
        .DIFF_TERM("TRUE"),   // Differential Termination
        .IOSTANDARD("LVDS_33") // Specify the output I/O standard
        //.SLEW("SLOW")           // Specify the output slew rate
    ) IBUFDS_FTCK (
        .I(FTCK_LVDS33_P),     // Diff_p output (connect directly to top-level port)
        .IB(FTCK_LVDS33_N),   // Diff_n output (connect directly to top-level port)
        .O(FTCK_LVDS33)      // Buffer input
    );
    IBUFDS #(
        .DIFF_TERM("TRUE"),   // Differential Termination
        .IOSTANDARD("LVDS_33") // Specify the output I/O standard
        //.SLEW("SLOW")           // Specify the output slew rate
    ) IBUFDS_FTDI (
        .I(FTDI_LVDS33_P),     // Diff_p output (connect directly to top-level port)
        .IB(FTDI_LVDS33_N),   // Diff_n output (connect directly to top-level port)
        .O(FTDI_LVDS33)      // Buffer input
    );
/*    IBUFDS #(
        .DIFF_TERM("TRUE"),   // Differential Termination
        .IOSTANDARD("LVDS_33") // Specify the output I/O standard
        //.SLEW("SLOW")           // Specify the output slew rate
    ) IBUFDS_FTDO (
        .I(FTDO_LVDS33_P),     // Diff_p output (connect directly to top-level port)
        .IB(FTDO_LVDS33_N),   // Diff_n output (connect directly to top-level port)
        .O(FTDO_LVDS33)      // Buffer input
    );*/
/*	 reg toggle;
    //assign DATA_VALID = toggle;
    always @(posedge clk_25M) begin
      toggle <= ~toggle;
    end
	OBUFDS #(
		//.DIFF_TERM("TRUE"),   // Differential Termination
		.IOSTANDARD("LVDS_33"), // Specify the input I/O standard
		.SLEW("SLOW")  
	  ) OBUFDS_ftms (
		.O(FTMS_LVDS33_P),     // Diff_p output (connect directly to top-level port)
		.OB(FTMS_LVDS33_N),   // Diff_n output (connect directly to top-level port)
		.I(toggle) 
	);*/
	OBUFDS #(
		//.DIFF_TERM("TRUE"),   // Differential Termination
		.IOSTANDARD("LVDS_33"), // Specify the input I/O standard
		.SLEW("SLOW")  
	  ) OBUFDS_ftdo (
		.O(FTDO_LVDS33_P),     // Diff_p output (connect directly to top-level port)
		.OB(FTDO_LVDS33_N),   // Diff_n output (connect directly to top-level port)
		.I(FTDO_LVDS33) 
	);

    Flag_CrossDomain TIM_1MS_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(TIM_1S),
      .clkB(clk_62M5),
      .FlagOut_clkB(TIM_1S_r)
    );

/* 	clk_wiz_100M clk_wiz_100M (// Clock in ports
//			.CLK_IN1_P(FB_LVDS33_P[1]),      // IN
//			.CLK_IN1_N(FB_LVDS33_N[1]),  
			.CLK_IN1(FB_LVDS33[1]),  
			// Clock out ports
			.CLK_OUT1(clk_10M_coding[1]),     // OUT
			.CLK_OUT2(clk_20M_coding[1]),     // OUT
			.CLK_OUT3(clk_80M_coding[1]),     // OUT
			// Status and control signals
			.RESET(1'b0),// IN
			.LOCKED(clk_100M_locked[1])
	);      // OUT */







/*     always @(posedge clk_125M) begin
        if (RESET_IN) CURRENT_STATE <= 1;
        else CURRENT_STATE <= NEXT_STATE;
    end */

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
	 
reg [15:0] TDC2[9:0];
reg [15:0] TDC3[9:0];
reg [15:0] TDC4[9:0];
reg [15:0] TDC5[9:0];
reg [15:0] TDC6[9:0];
reg [2:0]  TDC_NO;
wire [3:0]  PAD_NO2;
wire [3:0]  PAD_NO3;
wire [3:0]  PAD_NO4;
wire [3:0]  PAD_NO5;
wire [3:0]  PAD_NO6;

    always @(posedge clk_62M5) begin
        if (SOFT_RST) begin
            S_FULL_DATA <= 'b0;
            FULL_DATA_READY_M_CH <= 'b0;
        end else begin
				S_FULL_DATA_VALID <= 1'b0;
				FULL_DATA_READY_M_CH <= 0;
				if(S_FULL_DATA_VALID == 0) begin
					if (NEXT_STATE == START_NUM) begin
						 FULL_DATA_READY_M_CH[SPARTAN6_NUM] <= 1'b0;
						 if (FULL_DATA_VALID_M_CH[START_NUM] == 1 & S_FULL_DATA_READY) begin
							  S_FULL_DATA <= {4'hA, START_NUM, FULL_DATA_M_CH[START_NUM][103:0]};
							  S_FULL_DATA_VALID <= 1'b1;//FULL_DATA_VALID_M_CH[0];
							  //TDC_NO <= START_NUM;
							  //PAD_NO <= FULL_DATA_M_CH[START_NUM][78:75];
							  FULL_DATA_READY_M_CH[START_NUM] <= 1'b1;
						 end else begin
							  S_FULL_DATA <= 'b0;
							  FULL_DATA_READY_M_CH[START_NUM] <= 1'b0;
							  S_FULL_DATA_VALID <= 1'b0;
						 end
					end else begin
						 FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
						 if (FULL_DATA_VALID_M_CH[NEXT_STATE] == 1 & S_FULL_DATA_READY) begin
							  S_FULL_DATA <= {4'hA, 1'b0, NEXT_STATE, FULL_DATA_M_CH[NEXT_STATE][103:0]};
							  //TDC_NO <= NEXT_STATE;
							  //PAD_NO <= FULL_DATA_M_CH[NEXT_STATE][78:75];
							  S_FULL_DATA_VALID <= 1'b1; //FULL_DATA_VALID_M_CH[NEXT_STATE];
							  FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b1;
							  //if(FULL_DATA_M_CH[NEXT_STATE][79:72] == 8'h8)
						 end else begin
							  S_FULL_DATA <= 'b0;
							  FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
							  S_FULL_DATA_VALID <= 1'b0;
						 end
					end
				end

        end
    end


reg [111:0] data0;
wire TIM_1M;
reg [9:0] TDC_error[6:2];
reg [15:0] TDC_old;

assign PAD_NO2 = DATA_OUT[2][78:75];
assign PAD_NO3 = DATA_OUT[3][78:75];
assign PAD_NO4 = DATA_OUT[4][78:75];
assign PAD_NO5 = DATA_OUT[5][78:75];
assign PAD_NO6 = DATA_OUT[6][78:75];

always @(posedge clk_62M5) begin
	//if(S_FULL_DATA_VALID) 
	begin
		if(DATA_OUT_VALID[2] == 1) begin 
			TDC2[PAD_NO2] <= DATA_OUT[2][95:80];
			if((TDC2[PAD_NO2] + 1) != DATA_OUT[2][95:80]) begin
				TDC_error[2][PAD_NO2] <= 1'b1; 
				TDC_old <= TDC2[PAD_NO2];
			end else begin
				TDC_error[2][PAD_NO2] <= 1'b0; 
			end 
		end
		if(DATA_OUT_VALID[3] == 1) begin 
			TDC3[PAD_NO3] <= DATA_OUT[3][95:80];
			if((TDC3[PAD_NO3] + 1) != DATA_OUT[3][95:80]) begin
				TDC_error[3][PAD_NO3] <= 1'b1; 
				TDC_old <= TDC3[PAD_NO3];
			end else begin
				TDC_error[3][PAD_NO3] <= 1'b0; 
			end 
		end
		if(DATA_OUT_VALID[4] == 1) begin 
			TDC4[PAD_NO4] <= DATA_OUT[4][95:80];
			if((TDC4[PAD_NO4] + 1) != DATA_OUT[4][95:80]) begin
				TDC_error[4][PAD_NO4] <= 1'b1; 
				TDC_old <= TDC4[PAD_NO4];
			end else begin
				TDC_error[4][PAD_NO4] <= 1'b0; 
			end 
		end
		if(DATA_OUT_VALID[5] == 1) begin 
			TDC5[PAD_NO5] <= DATA_OUT[5][95:80];
			if((TDC5[PAD_NO5] + 1) != DATA_OUT[5][95:80]) begin
				TDC_error[5][PAD_NO5] <= 1'b1; 
				TDC_old <= TDC5[PAD_NO5];
			end else begin
				TDC_error[5][PAD_NO5] <= 1'b0; 
			end 
		end
		if(DATA_OUT_VALID[6] == 1) begin 
			TDC6[PAD_NO6] <= DATA_OUT[6][95:80];
			if((TDC6[PAD_NO6] + 1) != DATA_OUT[6][95:80]) begin
				TDC_error[6][PAD_NO6] <= 1'b1; 
				TDC_old <= TDC6[PAD_NO6];			
			end else begin
				TDC_error[6][PAD_NO6] <= 1'b0; 
			end 
		end
		/*
		if(TDC_NO == 3) begin 
			TDC3[PAD_NO] <= S_FULL_DATA[95:80];
			if((TDC3[PAD_NO] + 1) != S_FULL_DATA[95:80]) begin
				TDC_error[3][PAD_NO] <= 1'b1; 
				TDC_old <= TDC3[PAD_NO];
			end else begin
				TDC_error[3][PAD_NO] <= 1'b0; 
			end 
		end
		if(TDC_NO == 4) begin 
			TDC4[PAD_NO] <= S_FULL_DATA[95:80];
			if((TDC4[PAD_NO] + 1) != S_FULL_DATA[95:80]) begin
				TDC_error[4][PAD_NO] <= 1'b1; 
				TDC_old <= TDC4[PAD_NO];
			end else begin
				TDC_error[4][PAD_NO] <= 1'b0; 
			end 
		end
		if(TDC_NO == 5) begin 
			TDC5[PAD_NO] <= S_FULL_DATA[95:80];
			if((TDC5[PAD_NO] + 1) != S_FULL_DATA[95:80]) begin
				TDC_error[5][PAD_NO] <= 1'b1; 
				TDC_old <= TDC5[PAD_NO];
			end else begin
				TDC_error[5][PAD_NO] <= 1'b0; 
			end 
		end
		if(TDC_NO == 6) begin 
			TDC6[PAD_NO] <= S_FULL_DATA[95:80];
			if((TDC6[PAD_NO] + 1) != S_FULL_DATA[95:80]) begin
				TDC_error[6][PAD_NO] <= 1'b1; 
				TDC_old <= TDC6[PAD_NO];
			end else begin
				TDC_error[6][PAD_NO] <= 1'b0; 
			end
		end
		*/
/*		case(TDC_NO)
		3'd2: TDC2[PAD_NO] <= S_FULL_DATA[95:80];
		3'd3: TDC3[PAD_NO] <= S_FULL_DATA[95:80];
		3'd4: TDC4[PAD_NO] <= S_FULL_DATA[95:80];
		3'd5: TDC5[PAD_NO] <= S_FULL_DATA[95:80];
		3'd6: TDC6[PAD_NO] <= S_FULL_DATA[95:80];
		default: begin  end
		endcase*/
	end

end

    wire tx_tready_i;


    ALL_CHANNEL_DATA ALL_CHANNEL_DATA (
        .s_aclk(clk_62M5),  // input s_aclk
        .s_aresetn(1'b1),  // input s_aresetn
        .s_axis_tvalid(S_FULL_DATA_VALID),  // input s_axis_tvalid
        .s_axis_tready(S_FULL_DATA_READY),  // output s_axis_tready
        .s_axis_tdata(S_FULL_DATA),  // input [63 : 0] s_axis_tdata
        .m_aclk(clk_62M5),
        .m_axis_tvalid(M_FULL_DATA_VALID),  // output m_axis_tvalid
        .m_axis_tready(tx_tready_i),  // input m_axis_tready
        .m_axis_tdata(M_FULL_DATA)  // output [63 : 0] m_axis_tdata
    );

    //assign M_FULL_DATA = 64'hFC180005AA367350;

    //wire	[31:0] rx_data_i;   //test
    //wire	rx_tvalid_i;  //test
    reg [6:0] manchester_encoding_lock_counter;

/*    always @(posedge clk_10M or posedge reset) begin
        if (reset) begin
            //tx_tready_i <= 'b0;
            manchester_encoding_lock_counter <= 0;
        end else begin
            //if(carrier_ready) begin
            if (tx_tready_i) begin
                //tx_tready_i <= 1;
					 manchester_encoding_lock_counter <= 1;
            end else begin
                manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
                tx_tready_i <= 0;
            end
            //end
        end
    end*/

    reg  [PAYLOAD_WIDTH - 1:0] TDC_data;
    reg  [             6:0] channel;
    reg                     M_FULL_DATA_VALID_r;
	reg                     M_FULL_DATA_VALID_rr;
    reg                     M_FULL_DATA_READY;
    reg  [PAYLOAD_WIDTH - 1:0] M_FULL_DATA_r;

/*
	reg [15:0] rate_1;
    assign FB_OUT_EN = 1'b1;
	wire train_en;
	assign train_en = 1'b1;
    //assign FB_OUT = clk_10M;
    always @(posedge clk_12M5) begin
        channel <= M_FULL_DATA[54:48];
        M_FULL_DATA_VALID_r <= M_FULL_DATA_VALID;
		M_FULL_DATA_VALID_rr <= M_FULL_DATA_VALID_r;
        M_FULL_DATA_r <= M_FULL_DATA;
		tx_tready_i <= 'b0;
        if (SOFT_RST) begin
            TDC_data <= 0;		
        end else if ((manchester_encoding_lock_counter == 0)) begin
				if(k7_TRAINNING_ENABLE) begin
					//TDC_data <= { rates[channel[6:3]], hitmap_r[channel[6:3]], M_FULL_DATA_r, 8'b11010111, 1'b1, 1'b1};
					//TDC_data <= { 6'h0, M_FULL_DATA_r[63:55], rates[channel[6:3]], hitmap_r[channel[6:3]], 8'hFC, 1'b0, M_FULL_DATA_r[54:0], 8'b11010111, 1'b1, 1'b1};
					TDC_data <= { 16'h5A5B, 16'h5C5D, 8'h5E, 8'hFC, 56'hA5A6_A7A8_A9AA_AB, 8'hD7, 1'b1, 1'b1};
					tx_tready_i <= 'b1;
					manchester_encoding_lock_counter <= 1;
				end else if(M_FULL_DATA_VALID_r) begin
					//TDC_data <= { rates[channel[6:3]], hitmap_r[channel[6:3]], M_FULL_DATA_r, 8'b11010111, 1'b1, 1'b1};
					//TDC_data <= { 6'h0, M_FULL_DATA_r[63:55], rates[channel[6:3]], hitmap_r[channel[6:3]], 8'hFC, 1'b0, M_FULL_DATA_r[54:0], 8'b11010111, 1'b1, 1'b1};
					//TDC_data <= { 7'h0, M_FULL_DATA_r[63:55], rates[channel[6:3]], hitmap_r[channel[6:3]], 8'hFC, 1'b0, M_FULL_DATA_r[54:0], 8'hD7, 1'b1, 1'b1};
					tx_tready_i <= 'b1;
					manchester_encoding_lock_counter <= 1;
				end
        end else if(manchester_encoding_lock_counter <= MANCHESTER_DATA_WIDTH + 8)begin
            	TDC_data <= {1'b0, TDC_data[MANCHESTER_DATA_WIDTH+1:1]};  // right shift, LSB
					manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
        end else begin
					//TDC_data <= 0;
					//manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
					manchester_encoding_lock_counter <= 0;
		end
        //else if(error_vaild) TDC_data <= {M_FULL_DATA, 1'b0, 1'b1};

    end
*/
/*
    always @(posedge clk_62M5) begin
        channel <= M_FULL_DATA[54:48];
        M_FULL_DATA_VALID_r <= M_FULL_DATA_VALID;
		M_FULL_DATA_VALID_rr <= M_FULL_DATA_VALID_r;
        M_FULL_DATA_r <= M_FULL_DATA;
		M_FULL_DATA_READY <= 'b0;
        if (SOFT_RST) begin
            TDC_data <= 0;			
        end else if(k7_TRAINNING_ENABLE == 3'b11 & tx_tready_i & M_FULL_DATA_VALID_r) begin
					//TDC_data <= { rates[channel[6:3]], hitmap_r[channel[6:3]], M_FULL_DATA_r, 8'b11010111, 1'b1, 1'b1};
					TDC_data <= { 8'h5B, 12'b0, M_FULL_DATA_r[107:0]};
					//TDC_data <= { 16'h5A5B, 16'h5C5D, 8'h5E, 8'hFC, 56'hA5A6_A7A8_A9AA_AB, 8'hD7, 1'b1, 1'b1};
					M_FULL_DATA_READY <= 'b1;
					//manchester_encoding_lock_counter <= 1;
		  end
        //end
		  //end
        //else if(error_vaild) TDC_data <= {M_FULL_DATA, 1'b0, 1'b1};

    end
*/
    ////////////////////////////////////////////////////////////////////////////////
    // TDC data
    wire [7:0] bit_cnt;
	 wire [2:0] tx_state;
	 slave_tx_axi #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH)
        //.SYNC_HEADER(SYNC_HEADER)
     ) u_slave_k7 (
        .clk(clk_62M5), 
        .rst(SOFT_RST), 
        .uart_cmd(k7_TRAINNING_ENABLE), 
        .s_axis_tready(tx_tready_i),
        .s_axis_tvalid(M_FULL_DATA_VALID), 
        .s_axis_tdata(M_FULL_DATA),
        .tx_p(WR_DATA_OUT_P), 
        .tx_n(WR_DATA_OUT_N),
		  .state(tx_state)
		  //.bit_cnt(bit_cnt)
    );

    wire mdo;
/*    manchester_encoder tdc_data_enc (
        .clk2x(clk_25M),
        .clk  (clk_12M5),
        .rst  (1'b0),
        .din  (TDC_data[0]),
        .mdo  (WR_DATA_OUT)
    );*/
/*	assign WR_DATA_OUT_N = 1'b0;
	assign WR_FB_OUT_P = 1'b0;
	assign WR_FB_OUT_N = 1'b0;*/
//	assign FTDO_LVDS33_P = 1'b0;
//	assign FTDO_LVDS33_N = 1'b0;

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

// DAC

    wire [3:0]   DAC_ADDR;
    wire [15:0]  DAC_WDATA;
    wire         DAC_WVALID;
	 wire [3:0]   DAC_COMMAND;
	 
	 
	 reg  [3:0]   DAC_ADDR_UART;
    reg  [15:0]  DAC_WDATA_UART;
    reg          DAC_WVALID_UART;
	 reg  [3:0]   DAC_COMMAND_UART;
	  
    reg  [1:0]   DAC_INIT;
    reg  [4:0]   DAC_INDEX;
    reg          DAC_nSYNC_r;
	 wire         DAC_WVALID_r;
    
    wire         init_done;

    wire [3:0]   DAC_ADDR_INIT;
    wire [15:0]  DAC_WDATA_INIT;
    wire         DAC_WVALID_INIT;
    wire [3:0]   DAC_COMMAND_INIT;   
	 
	 assign DAC_ADDR = init_done ? DAC_ADDR_UART : DAC_ADDR_INIT;
	 assign DAC_WDATA = init_done ? DAC_WDATA_UART : DAC_WDATA_INIT;
	 assign DAC_WVALID = init_done ? DAC_WVALID_UART : DAC_WVALID_INIT;
	 assign DAC_COMMAND = init_done ? DAC_COMMAND_UART : DAC_COMMAND_INIT;
	 
	 // keep high level for 2 cycles 
/*	 Flag_CrossDomain DAC_WVALID_CrossDomain (
      .clkA(clk_62M5),
      .FlagIn_clkA(DAC_WVALID_r),
      .clkB(clk_25M),
      .FlagOut_clkB(DAC_WVALID)
    );*/

/* localparam rpc_threshold = ;

    always @(posedge clk_25M) begin
        DAC_nSYNC_r <= DAC_nSYNC;
        if (SOFT_RST) begin
            DAC_ADDR <= 0;
            DAC_WDATA <= 0;
            DAC_WVALID <= 1'b0;
            DAC_INIT <= 2'b0;
            DAC_INDEX <= 0;
        end else if(DAC_INIT == 0 || (DAC_INIT == 1 & ~DAC_nSYNC_r & DAC_nSYNC))begin
            DAC_ADDR <= DAC_INDEX[3:0];
            DAC_WDATA <= 0;
            DAC_WVALID <= 1'b1;
            DAC_INDEX <= DAC_INDEX + 1;
            if(DAC_INDEX == 16) begin
                DAC_INIT <= 2;
            end else begin
                DAC_INIT <= 1;
            end
        end else begin
            DAC_WVALID <= 1'b0;
        end
    end */



    wire [2:0] state;
	 

    ad5766_spi_init ad5766_spi_init
    (
        .clk(clk_62M5),
        .rst(SOFT_RST | ~PLL1_LOCKED),     
        .DAC_COMMAND(DAC_COMMAND_INIT),
        .DAC_ADDR(DAC_ADDR_INIT),
        .DAC_WDATA(DAC_WDATA_INIT),
        .DAC_WVALID(DAC_WVALID_INIT),
        .init_done(init_done),
        .state(state)
    );



    wire [35:0] CONTROL0;
	 wire [35:0] CONTROL1;
	 
	 wire [2:0] state1;
	 wire DAC_WVALID_rr;

	AD5766 AD5766 (
		.clk(clk_62M5),
		.reset(~PLL1_LOCKED),
		.SCLK(DAC_SCLK),
		.SYNC(DAC_nSYNC),
		.DIN(DAC_SDI),
		.DOUT(DAC_SDO),
		.AD5766_reset(DAC_nRESET),
		.DAC_RD(),
		.DAC_EMPTY(1'b0),
		.DAC_COMMAND(DAC_COMMAND),
		.DAC_ADDR(DAC_ADDR),
		.DAC_WDATA(DAC_WDATA),
		.DAC_WVALID(DAC_WVALID),
		.DAC_RDATA(),
		.DAC_RVALID(),
		.CONTROL0(CONTROL1),
		.state1(state1),
		.DAC_WVALID_r(DAC_WVALID_rr)
	);


/*                    master_rx_s6 #(
                        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
                        .CRC_WIDTH(CRC_WIDTH)
                        //.SYNC_HEADER(SYNC_HEADER)
                    ) master_rx_channel1 (
                        .clk_250m(clk_250M),
                        .clk_62_5m(clk_62M5),
                        .rst(RESET_LINK[6]),
                        .rx_p(DATA_LVDS33_P[6]), 
                        .rx_n(DATA_LVDS33_N[6]),
                        .uart_cmd_out(uart_ctrl[6]),
                        .data_out(DATA_OUT[6]), 
                        .data_valid(DATA_OUT_VALID[6]), 
                        .crc_error_pulse(m_crc_err[6]),
                        .tim_1s(TIM_1S_r),
								.rx_ibuf(rx_ibuf[6]),
                        .state(rx_state)
                    );	*/
/*
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0) // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk_125M),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
		  .TRIG0(PPS_OUT),  // IN BUS [7:0]
        .TRIG1(k7_TRAINNING_ENABLE),  // IN BUS [7:0]
        //.TRIG2(S_FULL_DATA),
		  .TRIG2(k7_RxD_data),
		  .TRIG3({s6_Config_TxD_data_valid[4], k7_RxD, FTCK_LVDS33}),
		  .TRIG4(s6_TxD_data[2]),
		  .TRIG5(s6_TxD_data[3]),
		  .TRIG6(s6_Config_TxD_data[4]),
		  .TRIG7(TDC_ILA_NO),
		  .TRIG8(uart_ctrl[3]),
		  .TRIG9(k7_RxD_data_ready),
		  .TRIG10(uart_ctrl[2]),
		  .TRIG11(uart_ctrl[4]),
		  .TRIG12(uart_ctrl[5]),
		  .TRIG13(uart_ctrl[6]),
		  .TRIG14(state_debug),
		  .TRIG15({SOFT_RST, rx_bit_raw_1, k7_register_addr})
    );


, // IN BUS [7:0]
        .TRIG4(s6_Config_TxD_data[6]),  // IN BUS [7:0]
        .TRIG5(TxD_data_valid[6]),  // IN BUS [7:0]
        .TRIG6(tx_state), // IN BUS [7:0]
        .TRIG7(tdc_ila_use[6]), // IN BUS [7:0]
        .TRIG8(tdc_ila_use[6]), // IN BUS [7:0]
		  .TRIG9(TxD_data_r_valid[6]), // IN BUS [7:0]
		  .TRIG10(TRAIN_END[6]), // IN BUS [7:0]
        .TRIG11(s6_Config_TxD_data_valid[6]), // IN BUS [7:0]
		  .TRIG12(SP6_train_en[6]), // IN BUS [7:0]
		  .TRIG13(SOFT_RST_TDC[6]), // IN BUS [7:0]
		  .TRIG14(SP6_Register_addr[6]),
		  .TRIG15(uart_ctrl[6])*/ // IN BUS [7:0]
//assign WR_CLK_IN_N = 1'b1;




endmodule