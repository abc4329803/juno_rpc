`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:24 10/23/2013 
// Design Name: 
// Module Name:    PTDC_16CH 
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
module PTDC_16CH	#
(  
	parameter   TDC_group_channel_num = 8
/* 	parameter	CHN0	=	6'b0,
	parameter	CHN1	=	6'b0,
	parameter	CHN2	=	6'b0,
	parameter	CHN3	=	6'b0,
	parameter	CHN4	=	6'b0,
	parameter	CHN5	=	6'b0,
	parameter	CHN6	=	6'b0,
	parameter	CHN7	=	6'b0,
	parameter	CHN8	=	6'b0,
	parameter	CHN9	=	6'b0,
	parameter	CHN10	=	6'b0,
	parameter	CHN11	=	6'b0,
	parameter	CHN12	=	6'b0,
	parameter	CHN13	=	6'b0,
	parameter	CHN14	=	6'b0,
	parameter	CHN15	=	6'b0 */
)
(
	input	wire [TDC_group_channel_num - 1:0]	HIT,
	input	wire				reset,
	input	wire				clk250_0,
	input	wire				clk250_90,
	input	wire				clk250_180,
	input	wire				clk250_270,
	input	wire				clk125,
	input	wire 				clkm,
	input	wire 	[47:0]	coarse_time,

	input						M_FULL_DATA_READY,	
	output wire	[63:0] 	M_FULL_DATA,
	output					M_FULL_DATA_VALID

    );

/* wire	[15:0]	HIT;
wire				reset;
wire				clk250_0;
wire				clk250_90;
wire				clk250_180;
wire				clk250_270;
wire				clk125;
wire				clkm;
wire	[11:0]	coarse_time; */

wire [63:0] FULL_DATA_M_CH[TDC_group_channel_num - 1: 0];



// wire [31:0] FULL_DATA_M_CH0;
// wire [31:0] FULL_DATA_M_CH1;
// wire [31:0] FULL_DATA_M_CH2;
// wire [31:0] FULL_DATA_M_CH3;
// wire [31:0] FULL_DATA_M_CH4;
// wire [31:0] FULL_DATA_M_CH5;
// wire [31:0] FULL_DATA_M_CH6;
// wire [31:0] FULL_DATA_M_CH7;
// wire [31:0] FULL_DATA_M_CH8;
// wire [31:0] FULL_DATA_M_CH9;
// wire [31:0] FULL_DATA_M_CH10;
// wire [31:0] FULL_DATA_M_CH11;
// wire [31:0] FULL_DATA_M_CH12;
// wire [31:0] FULL_DATA_M_CH13;
// wire [31:0] FULL_DATA_M_CH14;
// wire [31:0] FULL_DATA_M_CH15;

wire [TDC_group_channel_num - 1:0]	FULL_DATA_VALID_M_CH;
reg  [TDC_group_channel_num - 1:0]	FULL_DATA_READY_M_CH;

generate
    genvar i;
    for (i=0;i<TDC_group_channel_num;i=i+1) begin 
		Phase_TDC #
		(
			.CHANNEL_NUM(i)
		)
		PTDC_0 (
			.hit(HIT[i]),
			.clk0(clk250_0),
			.clk90(clk250_90),
			.clk180(clk250_180),
			.clk270(clk250_270),
			.clksys(clk125),
			.reset(reset),
			.coarse_time(coarse_time),
			
			.clkm(clkm),
			.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[i]),
			.FULL_DATA_M(FULL_DATA_M_CH[i]),
			.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[i])
		);
	end

endgenerate 
/*
Phase_TDC #
(
	.CHANNEL_NUM(CHN0)
)
PTDC_0 (
	.hit(HIT[0]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[0]),
	.FULL_DATA_M(FULL_DATA_M_CH0),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[0])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN0)
)
PTDC_0 (
	.hit(HIT[0]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[0]),
	.FULL_DATA_M(FULL_DATA_M_CH0),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[0])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN1)
)
PTDC_1 (
	.hit(HIT[1]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[1]),
	.FULL_DATA_M(FULL_DATA_M_CH1),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[1])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN2)
)
PTDC_2 (
	.hit(HIT[2]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[2]),
	.FULL_DATA_M(FULL_DATA_M_CH2),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[2])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN3)
)
PTDC_3 (
	.hit(HIT[3]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[3]),
	.FULL_DATA_M(FULL_DATA_M_CH3),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[3])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN4)
)
PTDC_4 (
	.hit(HIT[4]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[4]),
	.FULL_DATA_M(FULL_DATA_M_CH4),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[4])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN5)
)
PTDC_5 (
	.hit(HIT[5]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[5]),
	.FULL_DATA_M(FULL_DATA_M_CH5),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[5])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN6)
)
PTDC_6 (
	.hit(HIT[6]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[6]),
	.FULL_DATA_M(FULL_DATA_M_CH6),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[6])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN7)
)
PTDC_7 (
	.hit(HIT[7]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[7]),
	.FULL_DATA_M(FULL_DATA_M_CH7),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[7])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN8)
)
PTDC_8 (
	.hit(HIT[8]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[8]),
	.FULL_DATA_M(FULL_DATA_M_CH8),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[8])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN9)
)
PTDC_9 (
	.hit(HIT[9]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[9]),
	.FULL_DATA_M(FULL_DATA_M_CH9),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[9])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN10)
)
PTDC_10 (
	.hit(HIT[10]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[10]),
	.FULL_DATA_M(FULL_DATA_M_CH10),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[10])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN11)
)
PTDC_11 (
	.hit(HIT[11]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[11]),
	.FULL_DATA_M(FULL_DATA_M_CH11),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[11])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN12)
)
PTDC_12 (
	.hit(HIT[12]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[12]),
	.FULL_DATA_M(FULL_DATA_M_CH12),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[12])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN13)
)
PTDC_13 (
	.hit(HIT[13]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[13]),
	.FULL_DATA_M(FULL_DATA_M_CH13),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[13])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN14)
)
PTDC_14 (
	.hit(HIT[14]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[14]),
	.FULL_DATA_M(FULL_DATA_M_CH14),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[14])
);

Phase_TDC #
(
	.CHANNEL_NUM(CHN15)
)
PTDC_15 (
	.hit(HIT[15]),
	.clk0(clk250_0),
	.clk90(clk250_90),
	.clk180(clk250_180),
	.clk270(clk250_270),
	.clksys(clk125),
	.reset(reset),
	.coarse_time(coarse_time),
	
	.clkm(clkm),
	.FULL_DATA_READY_M(FULL_DATA_READY_M_CH[15]),
	.FULL_DATA_M(FULL_DATA_M_CH15),
	.FULL_DATA_VALID_M(FULL_DATA_VALID_M_CH[15])
);
*/
reg	[63:0]	S_FULL_DATA;
reg				S_FULL_DATA_VALID;
wire				S_FULL_DATA_READY;
// wire	[31:0]	M_FULL_DATA;
// wire				M_FULL_DATA_VALID;
// wire				M_FULL_DATA_READY;

reg	[15:0]	CURRENT_STATE,NEXT_STATE;

parameter
	RD_FIFO_0	=	16'h0001,
	RD_FIFO_1	=	16'h0002,
	RD_FIFO_2	=	16'h0004,
	RD_FIFO_3	=	16'h0008,
	RD_FIFO_4	=	16'h0010,
	RD_FIFO_5	=	16'h0020,
	RD_FIFO_6	=	16'h0040,
	RD_FIFO_7	=	16'h0080,
	RD_FIFO_8	=	16'h0100,
	RD_FIFO_9	=	16'h0200,
	RD_FIFO_10	=	16'h0400,
	RD_FIFO_11	=	16'h0800,
	RD_FIFO_12	=	16'h1000,
	RD_FIFO_13	=	16'h2000,
	RD_FIFO_14	=	16'h4000,
	RD_FIFO_15	=	16'h8000;

always@(posedge clkm or posedge reset) begin
	if(reset)
		CURRENT_STATE	<=	RD_FIFO_0;
	else
		CURRENT_STATE	<=	NEXT_STATE;
end

always@(CURRENT_STATE) begin
	case(CURRENT_STATE)
		RD_FIFO_0: NEXT_STATE = RD_FIFO_1;
		RD_FIFO_1: NEXT_STATE = RD_FIFO_2;
		RD_FIFO_2: NEXT_STATE = RD_FIFO_3;
		RD_FIFO_3: NEXT_STATE = RD_FIFO_4;
		RD_FIFO_4: NEXT_STATE = RD_FIFO_5;
		RD_FIFO_5: NEXT_STATE = RD_FIFO_6;
		RD_FIFO_6: NEXT_STATE = RD_FIFO_7;
		RD_FIFO_7: NEXT_STATE = RD_FIFO_0;
/* 		RD_FIFO_7: NEXT_STATE = RD_FIFO_8;
		RD_FIFO_8: NEXT_STATE = RD_FIFO_9;
		RD_FIFO_9: NEXT_STATE = RD_FIFO_10;
		RD_FIFO_10: NEXT_STATE = RD_FIFO_11;
		RD_FIFO_11: NEXT_STATE = RD_FIFO_12;
		RD_FIFO_12: NEXT_STATE = RD_FIFO_13;
		RD_FIFO_13: NEXT_STATE = RD_FIFO_14;
		RD_FIFO_14: NEXT_STATE = RD_FIFO_15;
		RD_FIFO_15: NEXT_STATE = RD_FIFO_0; */
		default:		NEXT_STATE = RD_FIFO_0;
	endcase
end

always@(posedge clkm or posedge reset) begin
	if(reset) begin
		S_FULL_DATA <= 64'b0;
		FULL_DATA_READY_M_CH <=	'b0;
	end
	else
		case(NEXT_STATE)
		RD_FIFO_0: begin
			//FULL_DATA_READY_M_CH[15] <= 1'b0;
			FULL_DATA_READY_M_CH[TDC_group_channel_num - 1] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[0] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[0];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[0];
				FULL_DATA_READY_M_CH[0] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[0] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_1: begin
			FULL_DATA_READY_M_CH[0] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[1] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[1];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[1];
				FULL_DATA_READY_M_CH[1] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[1] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_2: begin
			FULL_DATA_READY_M_CH[1] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[2] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[2];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[2];
				FULL_DATA_READY_M_CH[2] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[2] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_3: begin
			FULL_DATA_READY_M_CH[2] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[3] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[3];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[3];
				FULL_DATA_READY_M_CH[3] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[3] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_4: begin
			FULL_DATA_READY_M_CH[3] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[4] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[4];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[4];
				FULL_DATA_READY_M_CH[4] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[4] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_5: begin
			FULL_DATA_READY_M_CH[4] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[5] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[5];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[5];
				FULL_DATA_READY_M_CH[5] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[5] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_6: begin
			FULL_DATA_READY_M_CH[5] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[6] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[6];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[6];
				FULL_DATA_READY_M_CH[6] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[6] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_7: begin
			FULL_DATA_READY_M_CH[6] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[7] == 1 & S_FULL_DATA_READY) begin
				S_FULL_DATA <= FULL_DATA_M_CH[7];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[7];
				FULL_DATA_READY_M_CH[7] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[7] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		/*
		RD_FIFO_8: begin
			FULL_DATA_READY_M_CH[7] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[8] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH[8];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[8];
				FULL_DATA_READY_M_CH[8] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[8] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_9: begin
			FULL_DATA_READY_M_CH[8] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[9] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH[9];
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[9];
				FULL_DATA_READY_M_CH[9] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[9] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_10: begin
			FULL_DATA_READY_M_CH[9] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[10] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH10;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[10];
				FULL_DATA_READY_M_CH[10] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[10] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_11: begin
			FULL_DATA_READY_M_CH[10] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[11] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH11;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[11];
				FULL_DATA_READY_M_CH[11] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[11] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_12: begin
			FULL_DATA_READY_M_CH[11] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[12] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH12;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[12];
				FULL_DATA_READY_M_CH[12] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[12] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_13: begin
			FULL_DATA_READY_M_CH[12] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[13] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH13;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[13];
				FULL_DATA_READY_M_CH[13] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[13] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_14: begin
			FULL_DATA_READY_M_CH[13] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[14] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH14;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[14];
				FULL_DATA_READY_M_CH[14] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[14] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		RD_FIFO_15: begin
			FULL_DATA_READY_M_CH[14] <= 1'b0;
			if(FULL_DATA_VALID_M_CH[15] == 1) begin
				S_FULL_DATA <= FULL_DATA_M_CH15;
				S_FULL_DATA_VALID <= FULL_DATA_VALID_M_CH[15];
				FULL_DATA_READY_M_CH[15] <= 1'b1;
			end
			else begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH[15] <= 1'b0;
				S_FULL_DATA_VALID <= 1'b0;
			end
		end
		*/
		default: begin
				S_FULL_DATA <= 64'b0;
				FULL_DATA_READY_M_CH <= 'b0;
				S_FULL_DATA_VALID <= 1'b0;
		end
		endcase
end

DATA_16CH_IN_1 DATA_16CH_IN_1 (
  .s_aclk(clk125), // input s_aclk
  .s_aresetn(1'b1), // input s_aresetn
  .s_axis_tvalid(S_FULL_DATA_VALID), // input s_axis_tvalid
  .s_axis_tready(S_FULL_DATA_READY), // output s_axis_tready
  .s_axis_tdata(S_FULL_DATA), // input [63 : 0] s_axis_tdata
  .m_axis_tvalid(M_FULL_DATA_VALID), // output m_axis_tvalid
  .m_axis_tready(M_FULL_DATA_READY), // input m_axis_tready
  .m_axis_tdata(M_FULL_DATA) // output [63 : 0] m_axis_tdata
);
//
//wire [35:0] CONTROL0;
//icon_0 icon_0_inst (
//	 .CONTROL0(CONTROL0) // INOUT BUS [35:0]
//	 //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
//);
//
//ila_0 ila_0_inst (
//	 .CONTROL(CONTROL0), // INOUT BUS [35:0]
//	 .CLK(clkm), // IN
//	 .TRIG0({reset, S_FULL_DATA_READY,S_FULL_DATA_VALID,M_FULL_DATA_VALID,M_FULL_DATA_READY}), // IN BUS [7:0]
//	 .TRIG1(S_FULL_DATA), // IN BUS [7:0]
//	 .TRIG2(M_FULL_DATA) // IN BUS [7:0]
//	 .TRIG3(P4S), // IN BUS [7:0]
//	 .TRIG4(P5S), // IN BUS [7:0]
//	 .TRIG5(P6S), // IN BUS [7:0]
//	 .TRIG6(P7S), // IN BUS [7:0]
//	 .TRIG7(P8S), // IN BUS [7:0]
//	 .TRIG8(P9S), // IN BUS [7:0]
//	 .TRIG9(P10S) // IN BUS [7:0]
//);

endmodule
