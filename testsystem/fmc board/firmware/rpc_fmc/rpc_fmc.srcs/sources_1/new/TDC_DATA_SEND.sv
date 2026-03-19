`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 05:58:51 PM
// Design Name: 
// Module Name: TDC_DATA_SEND
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


module TDC_DATA_SEND#(
  parameter  DATA_WIDTH = 32
)(
    input  wire          CLK,
    input  wire          CLK2X,
    input  wire          RESET,
    input  wire  [7:0]   DATA_ADDR,
    input  wire  [7:0]   DATA_IN,
    input  wire          DATA_IN_VALID,
    output wire          DATA_OUT
    );

    reg [DATA_WIDTH + 1: 0] TDC_data;

    always @(posedge CLK) begin
        if (RESET) begin
            TDC_data <= 0;
        end else if (DATA_IN_VALID) begin
            TDC_data <= { 8'hFC, DATA_IN, DATA_ADDR, 8'b11010111, 1'b1, 1'b1};
        end else begin
            TDC_data <= {1'b0, TDC_data[DATA_WIDTH+1:1]};  // right shift, LSB
        end
        //else if(error_vaild) TDC_data <= {M_FULL_DATA, 1'b0, 1'b1};

    end

    //assign CLK_OUT = clkm;

    ////////////////////////////////////////////////////////////////////////////////
    // TDC data

    wire mdo;
    assign DATA_OUT = mdo;
    manchester_encoder tdc_data_enc (
        .clk2x(CLK2X),
        .clk  (CLK),
        .rst  (RESET),
        .din  (TDC_data[0]),
        .mdo  (mdo)
    );
endmodule
