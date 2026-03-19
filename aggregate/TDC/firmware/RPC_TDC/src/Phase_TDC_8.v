`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:12 09/03/2013 
// Design Name: 
// Module Name:    Phase_TDC 
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
module Phase_TDC #
(
	//parameter [6:0] CHANNEL_NUM = 7'b0,
	parameter PILELINE_NUM = 4'd2,
	parameter chipscope = 0
)
(
	input	hit,
	input   [6:0] CHANNEL_NUM,
	input	clk0,
    input	clk45,
	input	clk90,
    input	clk135,
	input	clk180,
    input	clk225,
	input	clk270,
    input	clk315,
	input	clksys,
	input   clksys_180,
	input	reset,
	input	[44:0] coarse_time,
	//input time_1s,
	
	input	clkm,
	input	FULL_DATA_READY_M,
	output [63:0] FULL_DATA_M,
	output FULL_DATA_VALID_M,
	
	output reg [2:0] FE_time,
	output [PILELINE_NUM:0] data270,
	output	[PILELINE_NUM:0] data0,
	output	[PILELINE_NUM:0] data90,
	output	[PILELINE_NUM:0] data180,
	output     time_valid_f,
	output reg data270_r

    );

wire	clr;
// wire	clk0;
// wire	clk90;
// wire	clk180;
// wire	clk270;
// wire 	clksys;
// wire	hit;

wire	hit0_0;
wire	hit0_1;
wire	hit90_0;
wire	hit90_1;
wire	hit180_0;
wire	hit180_1;
wire	hit270_0;
wire	hit270_1;
wire	[PILELINE_NUM:0] pipeline0;
wire	[PILELINE_NUM:0] pipeline90;
wire	[PILELINE_NUM:0] pipeline180;
wire	[PILELINE_NUM:0] pipeline270;
//wire	[PILELINE_NUM:0] data0;
//wire	[PILELINE_NUM:0] data90;
//wire	[PILELINE_NUM:0] data180;
//wire	[PILELINE_NUM:0] data270;

//wire	[11:0] coarse_time;

//wire	time_valid_f;
//wire	time_valid_b;
wire	time_valid_temp_f;
//wire	time_valid_temp_b;

//Hitin
    FDCE Hitin0_0		(.D(hit),.C(clk0),.CE(1'b1),.CLR(clr),.Q(hit0_0));
    FDCE Hitin0_1		(.D(hit0_0),.C(clk0),.CE(1'b1),.CLR(clr),.Q(hit0_1));
	FDCE Hitin0_2		(.D(hit0_1),.C(clk0),.CE(1'b1),.CLR(clr),.Q(hit0_2));
	FDCE Hitin90_0		(.D(hit),.C(clk90),.CE(1'b1),.CLR(clr),.Q(hit90_0));
	FDCE Hitin90_1		(.D(hit90_0),.C(clk90),.CE(1'b1),.CLR(clr),.Q(hit90_1));
	FDCE Hitin90_2		(.D(hit90_1),.C(clk0),.CE(1'b1),.CLR(clr),.Q(hit90_2));
	FDCE Hitin180_0	(.D(hit),.C(clk180),.CE(1'b1),.CLR(clr),.Q(hit180_0));
	FDCE Hitin180_1	(.D(hit180_0),.C(clk180),.CE(1'b1),.CLR(clr),.Q(hit180_1));
	FDCE Hitin180_2	(.D(hit180_1),.C(clk0),.CE(1'b1),.CLR(clr),.Q(hit180_2));
	FDCE Hitin270_0	(.D(hit),.C(clk270),.CE(1'b1),.CLR(clr),.Q(hit270_0));
	FDCE Hitin270_1	(.D(hit270_0),.C(clk270),.CE(1'b1),.CLR(clr),.Q(hit270_1));
	FDCE Hitin270_2	(.D(hit270_1),.C(clk90),.CE(1'b1),.CLR(clr),.Q(hit270_2));
//Hitin end

//Pipeline
	FDCE Pipeline0_0		(.D(hit0_2),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[0]));
	FDCE Pipeline0_1		(.D(pipeline0[0]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[1]));
	FDCE Pipeline0_2		(.D(pipeline0[1]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[2]));
//	FDCE Pipeline0_3		(.D(pipeline0[2]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[3]));
//	FDCE Pipeline0_4		(.D(pipeline0[3]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[4]));
//	FDCE Pipeline0_5		(.D(pipeline0[4]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[5]));
//	FDCE Pipeline0_6		(.D(pipeline0[5]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[6]));
//	FDCE Pipeline0_7		(.D(pipeline0[6]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[7]));
//	FDCE Pipeline0_8		(.D(pipeline0[7]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline0[8]));
	
	FDCE Pipeline90_0		(.D(hit90_2),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[0]));
	FDCE Pipeline90_1		(.D(pipeline90[0]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[1]));
	FDCE Pipeline90_2		(.D(pipeline90[1]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[2]));
//	FDCE Pipeline90_3		(.D(pipeline90[2]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[3]));
//	FDCE Pipeline90_4		(.D(pipeline90[3]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[4]));
//	FDCE Pipeline90_5		(.D(pipeline90[4]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[5]));
//	FDCE Pipeline90_6		(.D(pipeline90[5]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[6]));
//	FDCE Pipeline90_7		(.D(pipeline90[6]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[7]));
//	FDCE Pipeline90_8		(.D(pipeline90[7]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline90[8]));

	FDCE Pipeline180_0	(.D(hit180_2),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[0]));
	FDCE Pipeline180_1	(.D(pipeline180[0]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[1]));
	FDCE Pipeline180_2	(.D(pipeline180[1]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[2]));
//	FDCE Pipeline180_3	(.D(pipeline180[2]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[3]));
//	FDCE Pipeline180_4	(.D(pipeline180[3]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[4]));
//	FDCE Pipeline180_5	(.D(pipeline180[4]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[5]));
//	FDCE Pipeline180_6	(.D(pipeline180[5]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[6]));
//	FDCE Pipeline180_7	(.D(pipeline180[6]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[7]));
//	FDCE Pipeline180_8	(.D(pipeline180[7]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[8]));
	
	FDCE Pipeline270_0	(.D(hit270_2),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[0]));
	FDCE Pipeline270_1	(.D(pipeline270[0]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[1]));
	FDCE Pipeline270_2	(.D(pipeline270[1]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[2]));
//	FDCE Pipeline270_3	(.D(pipeline270[2]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[3]));
//	FDCE Pipeline270_4	(.D(pipeline270[3]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[4]));
//	FDCE Pipeline270_5	(.D(pipeline270[4]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[5]));
//	FDCE Pipeline270_6	(.D(pipeline270[5]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[6]));
//	FDCE Pipeline270_7	(.D(pipeline270[6]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[7]));
//	FDCE Pipeline270_8	(.D(pipeline270[7]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline270[8]));
//Pipeline end

//Get Fine Time
	FDCE Data0_0		(.D(pipeline0[0]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[0]));
	FDCE Data0_1		(.D(pipeline0[1]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[1]));
	FDCE Data0_2		(.D(pipeline0[2]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[2]));
//	FDCE Data0_3		(.D(pipeline0[3]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[3]));
//	FDCE Data0_4		(.D(pipeline0[4]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[4]));
//	FDCE Data0_5		(.D(pipeline0[5]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[5]));
//	FDCE Data0_6		(.D(pipeline0[6]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[6]));
//	FDCE Data0_7		(.D(pipeline0[7]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[7]));
//	FDCE Data0_8		(.D(pipeline0[8]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data0[8]));
	
	FDCE Data90_0		(.D(pipeline90[0]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[0]));
	FDCE Data90_1		(.D(pipeline90[1]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[1]));
	FDCE Data90_2		(.D(pipeline90[2]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[2]));
//	FDCE Data90_3		(.D(pipeline90[3]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[3]));
//	FDCE Data90_4		(.D(pipeline90[4]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[4]));
//	FDCE Data90_5		(.D(pipeline90[5]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[5]));
//	FDCE Data90_6		(.D(pipeline90[6]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[6]));
//	FDCE Data90_7		(.D(pipeline90[7]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[7]));
//	FDCE Data90_8		(.D(pipeline90[8]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data90[8]));
	
	FDCE Data180_0		(.D(pipeline180[0]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[0]));
	FDCE Data180_1		(.D(pipeline180[1]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[1]));
	FDCE Data180_2		(.D(pipeline180[2]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[2]));
//	FDCE Data180_3		(.D(pipeline180[3]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[3]));
//	FDCE Data180_4		(.D(pipeline180[4]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[4]));
//	FDCE Data180_5		(.D(pipeline180[5]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[5]));
//	FDCE Data180_6		(.D(pipeline180[6]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[6]));
//	FDCE Data180_7		(.D(pipeline180[7]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[7]));
//	FDCE Data180_8		(.D(pipeline180[8]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data180[8]));
	
	FDCE Data270_0		(.D(pipeline270[0]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[0]));
	FDCE Data270_1		(.D(pipeline270[1]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[1]));
	FDCE Data270_2		(.D(pipeline270[2]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[2]));
//	FDCE Data270_3		(.D(pipeline270[3]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[3]));
//	FDCE Data270_4		(.D(pipeline270[4]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[4]));
//	FDCE Data270_5		(.D(pipeline270[5]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[5]));
//	FDCE Data270_6		(.D(pipeline270[6]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[6]));
//	FDCE Data270_7		(.D(pipeline270[7]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[7]));
//	FDCE Data270_8		(.D(pipeline270[8]),.C(clksys),.CE(1'b1),.CLR(clr),.Q(data270[8]));
//Get Fine Time end

//data_valid begin
//assign time_valid_temp_f = data270[0] && data270[0];
//assign time_valid_temp_f =!(data270[0] && data270[0]);

//assign time_valid_temp_f = (data0[0] && data0[0]);
/* Pulser Pulserf (
		.CIN(time_valid_temp_f),
		.CK(clksys),
		.POUT(time_valid_f)
); */
always@(posedge clksys) begin
	data270_r <= data270[0];
	
end

/*
reg hit_r1;
reg hit_r2;

 wire time_valid_r1;
wire time_valid_r2;
reg  time_valid_f1;

always@(posedge clksys) begin
	hit_r1 <= hit;
	if() begin
		time_valid_f1 <= 1;
	end else begin
		time_valid_f1 <= 0;
	end
end

assign time_valid_r1 = ~hit_r1 & hit;

always@(posedge clksys_180) begin
	hit_r2 <= hit;
end

assign time_valid_r2 = ~hit_r2 & hit;

FDCE Hitin0_0		(.D(hit),.C(clksys),.CE(1'b1),.CLR(clr),.Q(hit0_0));
FDCE Hitin0_0		(.D(hit),.C(clksys),.CE(1'b1),.CLR(clr),.Q(hit0_0));
FDCE Pipeline180_1	(.D(pipeline180[0]),.C(clk0),.CE(1'b1),.CLR(clr),.Q(pipeline180[1])); */


assign time_valid_f = ~data270_r & data270[0];


//FDCE	time_valid_f_0	(.D(1'b1),.C(time_valid_temp_f[0]),.CE(1'b1),.CLR(time_valid_f),.Q(time_valid_temp_f[1]));
//FDCE	time_valid_f_1	(.D(time_valid_temp_f[1]),.C(clksys),.CE(1'b1),.CLR(time_valid_f),.Q(time_valid_temp_f[2]));
//FDCE	time_valid_f_2	(.D(time_valid_temp_f[2]),.C(clksys),.CE(1'b1),.CLR(1'b0),.Q(time_valid_f));
//(*keep = 1*)
//assign time_valid_temp_b = !(data270[0] && data270[0]);
//
//Pulser Pulserb (
//		.CIN(time_valid_temp_b),
//		.CK(clksys),
//		.POUT(time_valid_b)
//);

//FDCE	time_valid_b_0	(.D(1'b1),.C(time_valid_temp_b[0]),.CE(1'b1),.CLR(time_valid_b),.Q(time_valid_temp_b[1]));
//FDCE	time_valid_b_1	(.D(time_valid_temp_b[1]),.C(clksys),.CE(1'b1),.CLR(time_valid_b),.Q(time_valid_temp_b[2]));
//FDCE	time_valid_b_2	(.D(time_valid_temp_b[2]),.C(clksys),.CE(1'b1),.CLR(1'b0),.Q(time_valid_b));
//data_valid end

//Encode Module
//reg [2:0] FE_time; //Front Edge Time
//(*keep = 1*)
//reg [4:0] BE_time; //Back Edge Time

always@(posedge clksys or negedge reset) begin
	if(reset) begin
		FE_time <= 'b0;
		//BE_time <= 5'b0;
	end
	else begin
//Front Edge
case(data270[PILELINE_NUM:0])
//Front Edge for positive pulse
3'b001:begin
	if(data0 == 3'b001)        //Q0~Q270:1111
		FE_time <= 3'b000;
	else if(data90 == 3'b001)  //Q0~Q270:0111
		FE_time <= 3'b001;
	else if(data180 == 3'b001) //Q0~Q270:0011
		FE_time <= 3'b010;
	else                                //Q0~Q270:0001
		FE_time <= 3'b011; 
end
3'b011:begin
	if(data0 == 3'b011)
		FE_time <= 3'b100;
	else if(data90 == 3'b011)
		FE_time <= 3'b101;
	else if(data180 == 3'b011)
		FE_time <= 3'b110;
	else
		FE_time <= 3'b111;
end

//Front Edge for negative pulse
/* 3'b110:begin
	if(data180 == 3'b111) 	  //Q0~Q270:1110
		FE_time <= 3'b011;
	else if(data90 == 3'b111) //Q0~Q270:1100
		FE_time <= 3'b010;
	else if(data0 == 3'b111)  //Q0~Q270:1000
		FE_time <= 3'b001;
	else 									  //Q0~Q270:0000
		FE_time <= 3'b000;
end
3'b100:begin
	if(data180 == 3'b110)
		FE_time <= 3'b111;
	else if(data90 == 3'b110)
		FE_time <= 3'b110;
	else if(data0 == 3'b110)
		FE_time <= 3'b101;
	else
		FE_time <= 3'b100;
end */
/*
3'b001:begin
	if(data0[PILELINE_NUM:0]=='b001)        //Q0~Q270:1111
		FE_time <= 'b000;
	else if(data90[PILELINE_NUM:0]=='b001)  //Q0~Q270:0111
		FE_time <= 'b001;
	else if(data180[PILELINE_NUM:0]=='b001) //Q0~Q270:0011
		FE_time <= 'b010;
	else                                //Q0~Q270:0001
		FE_time <= 'b011; 
end
3'b011:begin
	if(data0[PILELINE_NUM:0]=='b011)
		FE_time <= 'b100;
	else if(data90[PILELINE_NUM:0]=='b011)
		FE_time <= 'b101;
	else if(data180[PILELINE_NUM:0]=='b011)
		FE_time <= 'b110;
	else
		FE_time <= 'b111;
end

9'b000000111:begin
	if(data0[8:0]==9'b000000111)
		FE_time <= 5'b01000;
	else if(data90[8:0]==9'b000000111)
		FE_time <= 5'b01001;
	else if(data180[8:0]==9'b000000111)
		FE_time <= 5'b01010;
	else
		FE_time <= 5'b01011;
end
9'b000001111:begin
	if(data0[8:0]==9'b000001111)
		FE_time <= 5'b01100;
	else if(data90[8:0]==9'b000001111)
		FE_time <= 5'b01101;
	else if(data180[8:0]==9'b000001111)
		FE_time <= 5'b01110;
	else
		FE_time <= 5'b01111;
end
9'b000011111:begin
	if(data0[8:0]==9'b000011111)
		FE_time <= 5'b10000;
	else if(data90[8:0]==9'b000011111)
		FE_time <= 5'b10001;
	else if(data180[8:0]==9'b000011111)
		FE_time <= 5'b10010;
	else
		FE_time <= 5'b10011;
end
9'b000111111:begin
	if(data0[8:0]==9'b000111111)
		FE_time <= 5'b10100;
	else if(data90[8:0]==9'b000111111)
		FE_time <= 5'b10101;
	else if(data180[8:0]==9'b000111111)
		FE_time <= 5'b10110;
	else
		FE_time <= 5'b10111;
end
9'b001111111:begin
	if(data0[8:0]==9'b001111111)
		FE_time <= 5'b11000;
	else if(data90[8:0]==9'b001111111)
		FE_time <= 5'b11001;
	else if(data180[8:0]==9'b001111111)
		FE_time <= 5'b11010;
	else
		FE_time <= 5'b11011;
end
9'b011111111:begin
	if(data0[8:0]==9'b011111111)
		FE_time <= 5'b11100;
	else if(data90[8:0]==9'b011111111)
		FE_time <= 5'b11101;
	else if(data180[8:0]==9'b011111111)
		FE_time <= 5'b11110;
	else
		FE_time <= 5'b11111;
end
//Back Edge
9'b111111110:begin
	if(data180 == 9'b111111111) 	  //Q0~Q270:1110
		BE_time <= 5'b00010;
	else if(data90 == 9'b111111111) //Q0~Q270:1100
		BE_time <= 5'b00001;
	else if(data0 == 9'b111111111)  //Q0~Q270:1000
		BE_time <= 5'b00000;
	else 									  //Q0~Q270:0000
		BE_time <= 5'b00011;
end
9'b111111100:begin
	if(data180 == 9'b111111110)
		BE_time <= 5'b00110;
	else if(data90 == 9'b111111110)
		BE_time <= 5'b00101;
	else if(data0 == 9'b111111110)
		BE_time <= 5'b00100;
	else
		BE_time <= 5'b00111;
end
9'b111111000:begin
	if(data180 == 9'b111111100)
		BE_time <= 5'b01010;
	else if(data90 == 9'b111111100)
		BE_time <= 5'b01001;
	else if(data0 == 9'b111111100)
		BE_time <= 5'b01000;
	else
		BE_time <= 5'b01011;
end
9'b111110000:begin
	if(data180 == 9'b111111000)
		BE_time <= 5'b01110;
	else if(data90 == 9'b111111000)
		BE_time <= 5'b01101;
	else if(data0 == 9'b111111000)
		BE_time <= 5'b01100;
	else
		BE_time <= 5'b01111;
end
9'b111100000:begin
	if(data180 == 9'b111110000)
		BE_time <= 5'b10010;
	else if(data90 == 9'b111110000)
		BE_time <= 5'b10001;
	else if(data0 == 9'b111110000)
		BE_time <= 5'b10000;
	else
		BE_time <= 5'b10011;
end
9'b111000000:begin
	if(data180 == 9'b111100000)
		BE_time <= 5'b10110;
	else if(data90 == 9'b111100000)
		BE_time <= 5'b10101;
	else if(data0 == 9'b111100000)
		BE_time <= 5'b10100;
	else
		BE_time <= 5'b10111;
end
9'b110000000:begin
	if(data180 == 9'b111000000)
		BE_time <= 5'b011010;
	else if(data90 == 9'b111000000)
		BE_time <= 5'b011001;
	else if(data0 == 9'b111000000)
		BE_time <= 5'b011000;
	else
		BE_time <= 5'b011011;
end
9'b100000000:begin
	if(data180 == 9'b110000000)
		BE_time <= 5'b11110;
	else if(data90 == 9'b110000000)
		BE_time <= 5'b11101;
	else if(data0 == 9'b110000000)
		BE_time <= 5'b11100;
	else
		BE_time <= 5'b11111;
end
*/
default:begin
		FE_time <= 'b0;
		//BE_time <= 5'b0;
end
endcase
end
end

reg [2:0]  FE_time_reg;
//reg [4:0]  BE_time_reg;
reg [2:0]  FE_time_reg_reg;
//reg [4:0]  BE_time_reg_reg;
//reg [16:0] TIME_WIDTH;
//reg [63:0] FULL_TIME_F;
//reg [17:0] FULL_TIME_B;
//reg time_valid_bb;

	

//always@(posedge clksys) begin
//	time_valid_bb <= time_valid_b;
//	if(time_valid_bb)
//	TIME_WIDTH <= (FULL_TIME_B > FULL_TIME_F)?(FULL_TIME_B - FULL_TIME_F):(FULL_TIME_B + 18'h20000 - FULL_TIME_F);
//	else
//	TIME_WIDTH <= 17'b0;
//end

//wire [8:0] Q;
//
//LUT_FOR_CAL	LUT_FOR_CAL(
//	.clk(clksys),
//	.TIME_WIDTH(TIME_WIDTH),
//
//	.Q(Q)
//);

reg [63:0] FULL_DATA_S;
//wire [31:0] FULL_DATA_M;
//reg FULL_DATA_VALID_SS;
reg FULL_DATA_VALID_S;
//wire FULL_DATA_VALID_M;
wire FULL_DATA_READY_S;
//wire FULL_DATA_READY_M;

//always@(posedge clksys)	begin
	//FULL_DATA_VALID_SS <= time_valid_f;
	//FULL_DATA_VALID_S	 <= FULL_DATA_VALID_SS;
//	if(time_valid_f)
//		FULL_DATA_S <= {CHANNEL_NUM,FULL_TIME_F}; //6bit+17bit+9bit=32bit
//	else
//		FULL_DATA_S <= 32'b0;
//end

//wire [15:0] rates;
//reg  SIGNAL_1;
//reg  SIGNAL_2;
//wire HIT_edge;
//generate
//    for (i=0;i<TDC_NUM;i=i+1) begin 
//		always@(posedge clksys) begin
//			SIGNAL_1 <= hit;
//			SIGNAL_2 <= SIGNAL_1;
//		end
//		assign HIT_edge = SIGNAL_1 & (!SIGNAL_2);
//		hit_rates hit_rates (
//		  .clk(clksys), // input clk
//		  .ce(HIT_edge),
//		  .sclr(TIM_1S_r), // input sclr
//		  .q(rates) // output [15 : 0] q
//		);
//	  end
//endgenerate

always@(posedge clksys) begin
	//FE_time_reg <= FE_time;
	//BE_time_reg <= BE_time;
	//FE_time_reg_reg <= FE_time_reg;
	//BE_time_reg_reg <= BE_time_reg;
	FULL_DATA_VALID_S <= time_valid_f;
	if(time_valid_f) begin
		FULL_DATA_S <= {8'hFC, 1'b0, CHANNEL_NUM, coarse_time, FE_time}; //8bit+1bit+7bit+45bit+3bit=64bit
	end else begin
		FULL_DATA_S <= 64'b0;
	end
//	else if(time_valid_b)
//		FULL_TIME_B <= {1'b0,coarse_time,BE_time_reg_reg};
end	

Data_FIFO Data_FIFO (
  .m_aclk(clkm), // input m_aclk
  .s_aclk(clksys), // input s_aclk
  .s_aresetn(!reset), // input s_aresetn
  .s_axis_tvalid(FULL_DATA_VALID_S), // input s_axis_tvalid
  .s_axis_tready(FULL_DATA_READY_S), // output s_axis_tready
  .s_axis_tdata(FULL_DATA_S), // input [31 : 0] s_axis_tdata
  .m_axis_tvalid(FULL_DATA_VALID_M), // output m_axis_tvalid
  .m_axis_tready(FULL_DATA_READY_M), // input m_axis_tready
  .m_axis_tdata(FULL_DATA_M) // output [31 : 0] m_axis_tdata
);

/*
generate 

if(chipscope) begin
	wire [35:0] CONTROL0;
	icon_0 icon_0_inst (
		 .CONTROL0(CONTROL0) // INOUT BUS [35:0]
		 //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
	);
	wire TIM_1S_r;
	ila_0 ila_0_inst (
		 .CONTROL(CONTROL0), // INOUT BUS [35:0]
		 .CLK(clkm), // IN
		 .TRIG0({time_valid_temp_f,time_valid_f, data270[2:0], FE_time, hit, FULL_DATA_VALID_S}), // IN BUS [7:0]
		 .TRIG1(FULL_DATA_S) // IN BUS [7:0]
//		 .TRIG2(TDC_decode_data), // IN BUS [7:0]
//		 .TRIG3(rates[7]) // IN BUS [7:0]
	//	 .TRIG4(count), // IN BUS [7:0]
	//	 .TRIG5(P6S), // IN BUS [7:0]
	//	 .TRIG6(P7S), // IN BUS [7:0]
	//	 .TRIG7(P8S), // IN BUS [7:0]
	//	 .TRIG8(P9S), // IN BUS [7:0]
	//	 .TRIG9(P10S) // IN BUS [7:0]
	);
end
endgenerate
*/

endmodule
