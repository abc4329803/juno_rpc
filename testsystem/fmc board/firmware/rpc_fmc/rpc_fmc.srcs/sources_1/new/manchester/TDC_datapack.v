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
    input     wire clk_10M,
    input     wire clk_20M,
    //	input CLKM_P,
    //	input CLKM_N,
    input reset,

    input  [63:0] M_FULL_DATA,
    input         M_FULL_DATA_VALID,
    input  [            15:0] rates_r             [TDC_NUM - 1:0],
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


    reg tx_tready_i;


    reg  [DATA_WIDTH + 1:0] TDC_data;
    reg  [             5:0] channel;
    reg                     M_FULL_DATA_VALID_r;
    reg  [            63:0] M_FULL_DATA_r;

    wire [            15:0] rates               [TDC_NUM - 1:0];
    
	 reg  [            5:0] deadtime            [TDC_NUM - 1:0];	



    always @(posedge clk_10M) begin
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
       .clk2x(clk_20M),
       .clk  (clk_10M),
       .rst  (reset),
       .din  (TDC_data[0]),
       .mdo  (mdo)
    );
	 

 











endmodule
