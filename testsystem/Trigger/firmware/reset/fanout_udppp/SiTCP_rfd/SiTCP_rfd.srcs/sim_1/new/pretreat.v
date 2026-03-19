`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/31 00:58:10
// Design Name: 
// Module Name: testbench
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


module testbench ();
reg clk_tdc;
reg [447:0]Data_syn;
reg Data_valid;
wire [447:0]Data_pretreat;
wire pretreat_valid;

always #5 clk_tdc=~clk_tdc;
//always #2.5 clk_200_tdc=~clk_200_tdc;
//assign #1.25 clk_200_90 = clk_200_tdc;
//always #2.5 clk_200_180=~clk_200_180;


initial begin
    clk_tdc=1;
    #10
    Data_syn=448'h001b822084800000000000000000000000077ffffffffffffe800000000001007ffffffffffe800000000000000000000000000000000000;
    Data_valid=1;
    #500
    $stop;

end

Pretreatment Pretreatment(
        .clk_200(clk_tdc),
        .Data_syn(Data_syn),
        .Data_valid(Data_valid),
        .Data_pretreat(Data_pretreat),
        .pretreat_valid(pretreat_valid)
    );
endmodule