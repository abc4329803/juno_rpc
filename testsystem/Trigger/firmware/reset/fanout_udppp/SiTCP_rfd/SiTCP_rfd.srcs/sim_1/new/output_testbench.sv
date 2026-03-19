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
reg clk_p_tdc;
reg clk_n_tdc;
reg CE;
reg clk_ce;
reg [447:0]Data_Origin;
wire[447:0]Data_syn;


always #5 clk_p_tdc=~clk_p_tdc;
always #5 clk_n_tdc=~clk_n_tdc;
//always #2.5 clk_200_tdc=~clk_200_tdc;
//assign #1.25 clk_200_90 = clk_200_tdc;
//always #2.5 clk_200_180=~clk_200_180;


initial begin
    clk_p_tdc=1;
    clk_n_tdc=0;
    CE=1;
    clk_ce=0;
    #50
    clk_ce=1;
    #1000
    Data_Origin=0;
    #2.6
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=0;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=0;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=0;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #2.5
    Data_Origin=0;
    #2.5
    Data_Origin=448'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    #200
    $stop;

end

wire clk_200_tdc;
wire clk_200_90;
wire clk_200_180;

BUFG bufg_tdcclk (
      .I     (clk_p_tdc),
      .O     (clk_tdc_buf)
   );


clk_wiz_0 clk_wiz_tdc(
	.clk_out1(clk_340),
  	.clk_out2(clk_200_tdc),
	.clk_out3(clk_200_90),
	.clk_out4(clk_200_180),
    .resetn(clk_ce),
  	.locked(clk_locked_tdc),
  	.clk_in1(clk_tdc_buf)
);

//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.clk_200(clk_200_tdc);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.clk_200_90(clk_200_90);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.clk_200_180(clk_200_180);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.CE(CE);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.Data_Origin(Data_Origin);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.Data_syn(Data_syn);
//Calibration_table.genblk1[0].MultiEdge_DelayChain_Top.clk_syn.Data_valid(Data_valid);


clk_syn clk_syn_test(
    .clk_200(clk_200_tdc),
    .clk_200_90(clk_200_90),
    .clk_200_180(clk_200_180),
    .CE(CE),
    .Data_Origin(Data_Origin),
    .Data_syn(Data_syn),
    .Data_valid(Data_valid)
    );
endmodule