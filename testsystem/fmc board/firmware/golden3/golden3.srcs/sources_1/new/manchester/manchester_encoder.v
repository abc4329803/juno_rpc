`timescale 1ns / 1ps
/******************************************************************************
*
*    File Name:  manchester_encoder.v
*      Version:  1.0
*         Date:  Nov 14, 2014
*        Model:  Manchester Encoder
*       Author:  Zhang jie(zhj@ihep.ac.cn)
*      Company:  IHEP
*
******************************************************************************/
module manchester_encoder(
  input     clk2x   ,   // 80MHz
  input     clk     ,   // 40MHz, divide-by-two from clk2x.
  input     rst     ,   // active high
  input     din     ,   // 1 bit input, synchronised on the clk.
  output    mdo         // 1 bit output, synchronised on the clk2x.
);

reg shift;
always @(posedge clk2x) begin
    if(rst) begin 
        shift <= 1'b1;
    //else shift <= ~shift;
    end else if(clk) begin
        shift <= 1'b1;
    end else begin
        shift <= 1'b0;
    end
end

reg [1:0] manchester;
always @(posedge clk2x) begin
  if(rst) manchester <= 1'b0;
  else
    if(shift) manchester[1] <= manchester[0];
    else
      // if(din) manchester <= 2'b10; // as G. E. Thomas
      // else manchester <= 2'b01;
      if(din) manchester <= 2'b01; // as IEEE 802.3 (Ethernet) standards
      else manchester <= 2'b10;
end
assign mdo = manchester[1];

endmodule
