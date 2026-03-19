`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:06 07/17/2013 
// Design Name: 
// Module Name:    TOP 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TDC_datapack #(
    parameter TDC_NUM = 80,
    parameter DATA_WIDTH = 88,
    parameter DEAD_TIME = 64
) (

    // input CLKP,
    // input CLKN,
    input CLK_IN,  //test bench
    //	input CLKM_P,
    //	input CLKM_N,
    input reset,

    input  [TDC_NUM - 1:0] SIGNAL,
    output                 DATA_OUT,
    output                 DATA_VALID
    //output 					 CLK_OUT

    //	input [4:0] CTRL,

    //    input GTPD3_P,
    //    input GTPD3_N,
    //	input	GTPD3,//test
    /* 	input RXP,
	input RXN,
	output TXP,
	output TXN, */

    //	input CABLE_CLK_P,
    //	input CABLE_CLK_N,
    //	input CABLE_TX1_P,
    //	input CABLE_TX1_N,
    //	input CABLE_TX2_P,
    //	input CABLE_TX2_N,
    //	input CABLE_RSV,
    //	input CABLE_SCL,//test
    //	input CABLE_SDA,
    //	output CABLE_RX1_P,
    //	output CABLE_RX1_N,
    //	output CABLE_RX2_P,
    //	output CABLE_RX2_N

);

    //wire CLK_IN;
    //wire reset;
    wire clk250_0_pll;
    wire clk250_90_pll;
    wire clk250_180_pll;
    wire clk250_270_pll;
    wire clk125_pll;
    wire clkm_pll;
    wire clk62M5_pll;
    wire clk31M25_pll;
    wire clk250_0;
    wire clk250_90;
    wire clk250_180;
    wire clk250_270;
    wire clk125;
    wire clkm;
    wire clk62M5;
    wire clk31M25;
    wire CLKFB;
    wire CLKFBIN;
    wire LOCKED;
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

    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(4),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(8.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(2),
        .CLKOUT1_DIVIDE(2),
        .CLKOUT2_DIVIDE(2),
        .CLKOUT3_DIVIDE(2),
        .CLKOUT4_DIVIDE(16),
        .CLKOUT5_DIVIDE(8),
        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT# clock output (0.01-0.99).
        .CLKOUT0_DUTY_CYCLE(0.5),
        .CLKOUT1_DUTY_CYCLE(0.5),
        .CLKOUT2_DUTY_CYCLE(0.5),
        .CLKOUT3_DUTY_CYCLE(0.5),
        .CLKOUT4_DUTY_CYCLE(0.5),
        .CLKOUT5_DUTY_CYCLE(0.5),
        // CLKOUT0_PHASE - CLKOUT5_PHASE: Output phase relationship for CLKOUT# clock output (-360.0-360.0).
        .CLKOUT0_PHASE(0.0),
        .CLKOUT1_PHASE(90.0),
        .CLKOUT2_PHASE(180.0),
        .CLKOUT3_PHASE(270.0),
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
        .CLKOUT0 (clk250_0_pll),
        .CLKOUT1 (clk250_90_pll),
        .CLKOUT2 (clk250_180_pll),
        .CLKOUT3 (clk250_270_pll),
        .CLKOUT4 (clk31M25_pll),
        .CLKOUT5 (clk62M5_pll),
        .LOCKED  (LOCKED),          // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFB),           // 1-bit input: Feedback clock input
        .CLKIN   (CLK_IN),          // 1-bit input: Clock input
        .RST     (reset)            // 1-bit input: Reset input
    );

    // End of PLL_BASE_inst instantiation

    BUFG BUFG_clk250_0 (
        .O(clk250_0),  // 1-bit output: Clock buffer output
        .I(clk250_0_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_90 (
        .O(clk250_90),  // 1-bit output: Clock buffer output
        .I(clk250_90_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_180 (
        .O(clk250_180),  // 1-bit output: Clock buffer output
        .I(clk250_180_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk250_270 (
        .O(clk250_270),  // 1-bit output: Clock buffer output
        .I(clk250_270_pll)  // 1-bit input: Clock buffer input
    );

    BUFG BUFG_clk125 (
        .O(clk31M25),  // 1-bit output: Clock buffer output
        .I(clk31M25_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk62M5 (
        .O(clk62M5),  // 1-bit output: Clock buffer output
        .I(clk62M5_pll)  // 1-bit input: Clock buffer input
    );

    //	BUFG BUFG_clkm (
    //      .O(clkm), // 1-bit output: Clock buffer output
    //      .I(clkm_pll)  // 1-bit input: Clock buffer input
    //   );

    wire clk_20M;
    wire clk_20M_pll;
    wire clk_5M;
    wire clk_5M_pll;
    wire clk_40M;
    wire clk_40M_pll;

    PLL_BASE #(
        .BANDWIDTH("OPTIMIZED"),  // "HIGH", "LOW" or "OPTIMIZED" 
        .CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT clock outputs (1-64)
        .CLKFBOUT_PHASE(0.0),  // Phase offset in degrees of the clock feedback output (0.0-360.0).
        .CLKIN_PERIOD(8.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30
                             // MHz).
        // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT# clock output (1-128)
        .CLKOUT0_DIVIDE(50),
        .CLKOUT1_DIVIDE(25),
        .CLKOUT2_DIVIDE(1),
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
        .CLKFBOUT(CLKFBIN),      // 1-bit output: PLL_BASE feedback output
        // CLKOUT0 - CLKOUT5: 1-bit (each) output: Clock outputs
        .CLKOUT0 (clk_20M_pll),
        .CLKOUT1 (clk_40M_pll),
        .CLKOUT2 (),
        .CLKOUT3 (),
        .CLKOUT4 (),
        .CLKOUT5 (),
        .LOCKED  (),             // 1-bit output: PLL_BASE lock status output
        .CLKFBIN (CLKFBIN),      // 1-bit input: Feedback clock input
        .CLKIN   (CLK_IN),       // 1-bit input: Clock input
        .RST     (reset)         // 1-bit input: Reset input
    );

    BUFG BUFG_clk_20M (
        .O(clk_20M),  // 1-bit output: Clock buffer output
        .I(clk_20M_pll)  // 1-bit input: Clock buffer input
    );
    BUFG BUFG_clk_40M (
        .O(clk_40M),  // 1-bit output: Clock buffer output
        .I(clk_40M_pll)  // 1-bit input: Clock buffer input
    );

    assign clkm   = CLK_IN;
    assign clk125 = CLK_IN;


    wire [47:0] coarse_time;

    Coarse_Time_Counter CTC (
        .clk(clk125),  // input clk
        .sclr(reset),  // input sclr
        .q(coarse_time[44:0])  // output [11 : 0] q
    );

    //wire	[63:0]	FULL_DATA_M_CH[ TDC_NUM - 1: 0];

    // wire	[31:0]	FULL_DATA_M_CH0;
    // wire	[31:0]	FULL_DATA_M_CH1;
    // wire	[31:0]	FULL_DATA_M_CH2;
    // wire	[31:0]	FULL_DATA_M_CH3;

    //reg	   [TDC_NUM - 1:0]		FULL_DATA_READY_M_CH;
    //wire		[TDC_NUM - 1:0]		FULL_DATA_VALID_M_CH;

    //genvar TDC_group_index;
    //generate
    //        
    //        for(TDC_group_index = 0;TDC_group_index < TDC_NUM;TDC_group_index = TDC_group_index + 1) begin
    //			PTDC_16CH #
    //			(
    //				.TDC_NUM(TDC_NUM)
    //			)
    //			PTDC_16CH_0(
    //				.HIT(SIGNAL[(TDC_group_index*TDC_NUM)+:TDC_NUM]),
    //				.reset(reset),
    //				.clk250_0(clk250_0),
    //				.clk250_90(clk250_90),
    //				.clk250_180(clk250_180),
    //				.clk250_270(clk250_270),
    //				.clk125(clk125),
    //				.clkm(clkm),
    //				.coarse_time(coarse_time),
    //
    //				.M_FULL_DATA_READY(FULL_DATA_READY_M_CH[TDC_group_index]),	
    //				.M_FULL_DATA(FULL_DATA_M_CH[TDC_group_index]),
    //				.M_FULL_DATA_VALID(FULL_DATA_VALID_M_CH[TDC_group_index])
    //			);
    //		end
    //endgenerate

    wire [63:0] FULL_DATA_M_CH[TDC_NUM - 1:0];
    wire [TDC_NUM - 1:0] FULL_DATA_VALID_M_CH;
    reg [TDC_NUM - 1:0] FULL_DATA_READY_M_CH;

    reg [TDC_NUM - 1:0] SIGNAL_1;
    reg [TDC_NUM - 1:0] SIGNAL_2;
    wire [TDC_NUM - 1:0] HIT;
    reg [15:0] deadtime_counter[TDC_NUM/8 - 1:0];
    reg [7:0] hitmap_r[TDC_NUM/8 - 1:0];
    reg [7:0] hitmap[TDC_NUM/8 - 1:0];
    reg [TDC_NUM/8 - 1:0] Effective_Signal;
    reg [6:0] Effective_Channel_NUM[TDC_NUM/8 - 1:0];
    wire TIM_1S_r;

    genvar i;
    genvar x;
    generate
        for (i = 0; i < TDC_NUM; i = i + 1) begin

            always @(posedge CLK_IN) begin
                SIGNAL_1[i] <= SIGNAL[i];
                SIGNAL_2[i] <= SIGNAL_1[i];
            end
            assign HIT[i] = SIGNAL_1[i] & (!SIGNAL_2[i]);

        end
        for (i = 0; i < TDC_NUM / 8; i = i + 1) begin
            always @(posedge clk125 or posedge reset) begin
                if (reset) begin
                    deadtime_counter[i] <= 0;
                    hitmap[i] <= 0;
						  Effective_Signal[i] <= 0;
                end else begin
                    //if(carrier_ready) begin
                    if (deadtime_counter[i] == 0) begin
                        if(SIGNAL[i*8] || SIGNAL[i*8+1] || SIGNAL[i*8+2] || SIGNAL[i*8+3] || SIGNAL[i*8+4] || SIGNAL[i*8+5] || SIGNAL[i*8+6] || SIGNAL[i*8+7]) begin
                            deadtime_counter[i] <= 1;
                            if (SIGNAL[i*8+7]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+7];
                                Effective_Channel_NUM[i] <= i * 8 + 7;
                                hitmap[i][7] <= 1'b1;
                            end
                            if (SIGNAL[i*8+6]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+6];
                                Effective_Channel_NUM[i] <= i * 8 + 6;
                                hitmap[i][6] <= 1'b1;
                            end
                            if (SIGNAL[i*8+5]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+5];
                                Effective_Channel_NUM[i] <= i * 8 + 5;
                                hitmap[i][5] <= 1'b1;
                            end
                            if (SIGNAL[i*8+4]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+4];
                                Effective_Channel_NUM[i] <= i * 8 + 4;
                                hitmap[i][4] <= 1'b1;
                            end
                            if (SIGNAL[i*8+3]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+3];
                                Effective_Channel_NUM[i] <= i * 8 + 3;
                                hitmap[i][3] <= 1'b1;
                            end
                            if (SIGNAL[i*8+2]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+2];
                                Effective_Channel_NUM[i] <= i * 8 + 2;
                                hitmap[i][2] <= 1'b1;
                            end
                            if (SIGNAL[i*8+1]) begin
                                Effective_Signal[i] <= SIGNAL[i*8+1];
                                Effective_Channel_NUM[i] <= i * 8 + 1;
                                hitmap[i][1] <= 1'b1;
                            end
                            if (SIGNAL[i*8]) begin
                                Effective_Signal[i] <= SIGNAL[i*8];
                                Effective_Channel_NUM[i] <= i * 8;
                                hitmap[i][0] <= 1'b1;
                            end
                        end else begin
                            deadtime_counter[i] <= 0;
                        end
                    end else if (deadtime_counter[i] < DEAD_TIME) begin
                        deadtime_counter[i] <= deadtime_counter[i] + 1;
                        Effective_Signal[i] <= 0;
									 if (SIGNAL[i*8+7]) begin
                                hitmap[i][7] <= 1'b1;
                            end
                            if (SIGNAL[i*8+6]) begin
                                hitmap[i][6] <= 1'b1;
                            end
                            if (SIGNAL[i*8+5]) begin
                                hitmap[i][5] <= 1'b1;
                            end
                            if (SIGNAL[i*8+4]) begin
                                hitmap[i][4] <= 1'b1;
                            end
                            if (SIGNAL[i*8+3]) begin
                                hitmap[i][3] <= 1'b1;
                            end
                            if (SIGNAL[i*8+2]) begin
                                hitmap[i][2] <= 1'b1;
                            end
                            if (SIGNAL[i*8+1]) begin
                                hitmap[i][1] <= 1'b1;
                            end
                            if (SIGNAL[i*8]) begin
                                hitmap[i][0] <= 1'b1;
                            end
                    end else if (deadtime_counter[i] == DEAD_TIME) begin
                        deadtime_counter[i] <= deadtime_counter[i] + 1;
                        hitmap_r[i] <= hitmap[i];
                        hitmap[i] <= 8'b0;
                    end else begin
                        deadtime_counter[i] <= 0;
                    end
                    //end
                end
            end
            Phase_TDC #(

                .chipscope(0)
            ) PTDC_0 (
                //.hit(SIGNAL[i]),
                .hit(Effective_Signal[i]),
                .CHANNEL_NUM(Effective_Channel_NUM[i]),
                .clk0(clk250_0),
                .clk90(clk250_90),
                .clk180(clk250_180),
                .clk270(clk250_270),
                .clksys(clk125),
                .reset(reset),
                .coarse_time(coarse_time[44:0]),
                //.time_1s(TIM_1S_r),

                .clkm(clkm),
                .FULL_DATA_READY_M(FULL_DATA_READY_M_CH[i]),
                .FULL_DATA_M(FULL_DATA_M_CH[i]),
                .FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[i])
            );
        end

    endgenerate

    //wire 			time_valid_f_test;
    //wire [2:0] 	FE_time;
    //wire [2:0]  FE_time_reg_reg;
    //
    //assign      time_valid_f_test = PTDC_0[0].time_valid_f;
    //assign		FE_time = PTDC_0[0].FE_time;
    //assign		FE_time_reg_reg = PTDC_0[0].FE_time_reg_reg;

    //ALL CHANNEL DATA TO ONE AXI4-FIFO

    reg [63:0] S_FULL_DATA;
    reg    S_FULL_DATA_VALID;
    wire    S_FULL_DATA_READY;
    wire  [63:0] M_FULL_DATA;
    wire    M_FULL_DATA_VALID;

    reg [3:0] CURRENT_STATE, NEXT_STATE;



    /* genvar x;
wire  [6:0] RD_FIFO[TDC_NUM - 1:0];
generate
	for(x = 0;x < TDC_NUM;x = x + 1) begin
		assign  RD_FIFO[x] = x;
	end
endgenerate */



    always @(posedge clkm or posedge reset) begin
        if (reset) CURRENT_STATE <= 0;
        else CURRENT_STATE <= NEXT_STATE;
    end

    always @(CURRENT_STATE) begin
        if (CURRENT_STATE == TDC_NUM/8 - 1) begin
            NEXT_STATE = 0;
        end else begin
            NEXT_STATE = CURRENT_STATE + 1;
        end
        /* 	case(CURRENT_STATE)
		RD_FIFO_0: NEXT_STATE = RD_FIFO_1;
		RD_FIFO_1: NEXT_STATE = RD_FIFO_2;
		RD_FIFO_2: NEXT_STATE = RD_FIFO_3;
		RD_FIFO_3: NEXT_STATE = RD_FIFO_4;
		RD_FIFO_4: NEXT_STATE = RD_FIFO_5;
		RD_FIFO_5: NEXT_STATE = RD_FIFO_6;
		RD_FIFO_6: NEXT_STATE = RD_FIFO_7;
		RD_FIFO_7: NEXT_STATE = RD_FIFO_8;
		RD_FIFO_8: NEXT_STATE = RD_FIFO_9;
		RD_FIFO_9: NEXT_STATE = RD_FIFO_0;
		default:	  NEXT_STATE = RD_FIFO_0;
	endcase */
    end

    always @(posedge clkm or posedge reset) begin
        if (reset) begin
            S_FULL_DATA <= 64'b0;
            FULL_DATA_READY_M_CH <= 'b0;
        end else begin
            if (NEXT_STATE == 0) begin
                FULL_DATA_READY_M_CH[TDC_NUM-1] <= 1'b0;
                if (FULL_DATA_VALID_M_CH[0] == 1 & S_FULL_DATA_READY) begin
                    S_FULL_DATA <= FULL_DATA_M_CH[0];
                    S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[0];
                    FULL_DATA_READY_M_CH[0] <= 1'b1;
                end else begin
                    S_FULL_DATA <= 64'b0;
                    FULL_DATA_READY_M_CH[0] <= 1'b0;
                    S_FULL_DATA_VALID <= 1'b0;
                end
            end else begin
                FULL_DATA_READY_M_CH[NEXT_STATE-1] <= 1'b0;
                if (FULL_DATA_VALID_M_CH[NEXT_STATE] == 1 & S_FULL_DATA_READY) begin
                    S_FULL_DATA <= FULL_DATA_M_CH[NEXT_STATE];
                    S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[NEXT_STATE];
                    FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b1;
                end else begin
                    S_FULL_DATA <= 64'b0;
                    FULL_DATA_READY_M_CH[NEXT_STATE] <= 1'b0;
                    S_FULL_DATA_VALID <= 1'b0;
                end
            end


        end
    end

    reg tx_tready_i;


    ALL_CHANNEL_DATA ALL_CHANNEL_DATA (
        .s_aclk(clkm),  // input s_aclk
        .s_aresetn(!reset),  // input s_aresetn
        .s_axis_tvalid(S_FULL_DATA_VALID),  // input s_axis_tvalid
        .s_axis_tready(S_FULL_DATA_READY),  // output s_axis_tready
        .s_axis_tdata(S_FULL_DATA),  // input [63 : 0] s_axis_tdata
        .m_aclk(clk_20M),
        .m_axis_tvalid(M_FULL_DATA_VALID),  // output m_axis_tvalid
        .m_axis_tready(tx_tready_i),  // input m_axis_tready
        .m_axis_tdata(M_FULL_DATA)  // output [63 : 0] m_axis_tdata
    );

    //assign M_FULL_DATA = 64'hFC180005AA367350;

    //wire	[31:0] rx_data_i;   //test
    //wire	rx_tvalid_i;  //test
    reg [6:0] manchester_encoding_lock_counter;

    always @(posedge clk_20M or posedge reset) begin
        if (reset) begin
            tx_tready_i <= 'b0;
            manchester_encoding_lock_counter <= 0;
        end else begin
            //if(carrier_ready) begin
            if (manchester_encoding_lock_counter == 0) begin
                tx_tready_i <= 1;
            end else begin
                manchester_encoding_lock_counter <= manchester_encoding_lock_counter + 1;
                tx_tready_i <= 0;
            end
            //end
        end
    end

    reg  [DATA_WIDTH + 1:0] TDC_data;
    reg  [             5:0] channel;
    reg                     M_FULL_DATA_VALID_r;
    reg  [            63:0] M_FULL_DATA_r;

    wire [            15:0] rates               [TDC_NUM - 1:0];
    reg  [            15:0] rates_r             [TDC_NUM - 1:0];


    generate
        for (i = 0; i < TDC_NUM; i = i + 1) begin
            always @(posedge CLK_IN) begin
                if (TIM_1S_r) begin
                    rates_r[i] <= rates[i];
                end

            end
        end
    endgenerate

    always @(posedge clk_20M) begin
        channel <= M_FULL_DATA[57:51];
        M_FULL_DATA_VALID_r <= M_FULL_DATA_VALID;
        M_FULL_DATA_r <= M_FULL_DATA;
        if (reset) begin
            TDC_data <= 0;
        end else if (M_FULL_DATA_VALID_r) begin
            TDC_data <= { rates_r[channel], M_FULL_DATA_r, 8'b11010110, 1'b1, 1'b1};
        end else begin
            TDC_data <= {1'b0, TDC_data[DATA_WIDTH+1:1]};  // right shift, LSB
        end
        //else if(error_vaild) TDC_data <= {M_FULL_DATA, 1'b0, 1'b1};

    end

    //assign CLK_OUT = clkm;

    ////////////////////////////////////////////////////////////////////////////////
    // TDC data

    wire mdo;
    manchester_encoder tdc_data_enc (
        .clk2x(clk_40M),
        .clk  (clk_20M),
        .rst  (reset),
        .din  (TDC_data[0]),
        .mdo  (mdo)
    );

    //assign DATA_VALID = reset? 1'b0: M_FULL_DATA_VALID;
    assign DATA_VALID = clk_20M; //M_FULL_DATA_VALID;
    //assign DATA_OUT   = reset? 1'b0: mdo;
    assign DATA_OUT   = mdo;

    //reg toggle;
    //assign DATA_VALID = toggle;
    //always @(posedge clk_20M) begin
    //  toggle <= ~toggle;
    //end
    
wire DATA_serial;
wire [DATA_WIDTH - 1:0] TDC_decode_data;
reg [6:0] count;
reg count_en;
always @(posedge clk_20M) begin
  if(count_en) count <= count + 1'b1;
  else count <= 0;
end
// State Machine
reg [0:0] state_reg, state_next;
localparam
  IDLE = 0,
  DATA = 1;

always @(posedge clk_20M)
  if (reset) state_reg <= IDLE;
  else state_reg <= state_next;

always @(*) begin
  state_next = IDLE;
  count_en = 0;
  case(state_reg)
    IDLE: begin
      if(DATA_serial) state_next = DATA;
      else state_next = IDLE;
    end
    DATA: begin
      count_en = 1'b1;
      if(count==DATA_WIDTH) state_next = IDLE;
      else state_next = DATA;
    end
  endcase
end

reg [DATA_WIDTH:0] DATA_parallel;
always @(posedge clk_20M) begin
  if(reset) DATA_parallel <= 0;
  else if(state_reg == DATA) DATA_parallel <= {DATA_serial, DATA_parallel[DATA_WIDTH:1]};
end
assign TDC_decode_data[DATA_WIDTH - 1:0] = DATA_parallel[DATA_WIDTH:1];

manchester_decoder pulse_dec (
  .CLK2X(clk_40M),
  .CLK(clk_20M),
  .RST(reset),
  .MDI(DATA_OUT),
  .LINKED(),
  .DOUT(DATA_serial)
);

    /* 
GTP_IO_exdes #
(
	.USE_CHIPSCOPE(1'b0),
	.SIM_GTPRESET_SPEEDUP(1'b1)
)
GTP_MODULE
(
    // User IO
	 .tx_tvalid_i(M_FULL_DATA_VALID),
	 .tx_data_i(M_FULL_DATA),
	 .tx_tready_i(tx_tready_i),
	 .rx_data_i(rx_data_i),
	 .rx_tvalid_i(rx_tvalid_i),
	 
    .RESET(1'b0),
    .HARD_ERR(),
    .SOFT_ERR(),
    .ERR_COUNT(),
	 .do_cc_i(do_cc_i),
 
    .LANE_UP(),
    .CHANNEL_UP(),

    .INIT_CLK(clk125),
    .GT_RESET_IN(1'b0),
    .GTPD3_P(GTPD3_P),
    .GTPD3_N(GTPD3_N),
//	 .GTPD3(GTPD3),
    // GT I/O
    .RXP(RXP),
    .RXN(RXN),
    .TXP(TXP),
    .TXN(TXN)
); */


    wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0)  // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(CLK_IN),  // IN
        .TRIG0({SIGNAL[7:0], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG1(TDC_decode_data)  // IN BUS [7:0]
        //.TRIG2(TDC_decode_data)  // IN BUS [7:0]
        //.TRIG3(Effective_Channel_NUM[0]),  // IN BUS [7:0]
        //.TRIG4(deadtime_counter[0]),  // IN BUS [7:0]
        //.TRIG5(hitmap[0]), // IN BUS [7:0]
        //.TRIG6(M_FULL_DATA) // IN BUS [7:0]
        //	 .TRIG7(rates[4]), // IN BUS [7:0]
        //	 .TRIG8(rates[5]), // IN BUS [7:0]
        //	 .TRIG9(rates[6]), // IN BUS [7:0]
        //	 .TRIG10(rates[7]) // IN BUS [7:0]
    );


    TIMER #(
        .CLK_FREQ(10'd125)
    ) TIMER_0 (
        // System
        .CLK    (CLK_IN),    // in: System clock
        .RST    (1'b0),      // in: System reset
        // Intrrupts
        .TIM_1US(),          // out: 1 us interval
        .TIM_1MS(),          // out: 1 ms interval
        .TIM_1S (TIM_1S_r),  // out: 1 s interval
        .TIM_1M ()           // out: 1 min interval
    );


    generate
        for (i = 0; i < TDC_NUM; i = i + 1) begin


            hit_rates hit_rates (
                .clk(CLK_IN),  // input clk
                .ce(HIT[i]),
                .sclr(TIM_1S_r),  // input sclr
                .q(rates[i])  // output [15 : 0] q
            );
        end
    endgenerate


endmodule
