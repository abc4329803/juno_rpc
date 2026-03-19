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
reg clk_200_tdc;
reg [10:0]data;
reg [10:0]data_in;
reg tdc_valid;
reg CE_test;
parameter period = 10;


always #(period/2)clk_200_tdc=~clk_200_tdc;

initial begin
    clk_200_tdc=1;
    CE_test=0;
    tdc_valid=0;
    #10
    CE_test=1;
    for (data = 0; data < 'd32; data = data + 1)
              begin
                  #10
                  data_in = 1'b1;
                  tdc_valid=1;
                  #10
                  tdc_valid=0;
              end
    
    for (data = 1; data < 'd32; data = data + 1)
            begin
                #10
                data_in = data;
                tdc_valid=1;
                #10
                tdc_valid=0;
            end
    #2000
    $stop;

end
statistics_ram statistics_ram(
    .clk(clk_200_tdc),
    .data(data_in),
    .tdc_valid(tdc_valid),
    .reset(0),
    .ce(CE_test)
    );


endmodule
