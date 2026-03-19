`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2025 01:10:16 PM
// Design Name: 
// Module Name: deman
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


module deman(clk_in, datain, tmp, flag1, flag2, dataout, fail);

input clk_in, datain;
output flag1, flag2, dataout, fail;
output [1:0] tmp; // 输出tmp寄存器内容

reg [1:0] tmp;
reg flag1 = 0;
reg flag2 = 0;
reg dataout;
reg fail = 0;

always @(posedge clk_in)
begin
    tmp <= {datain, tmp[1]};
    if(tmp == 2'b00 || tmp == 2'b11) begin
        flag1 <= 1; // 表示可以开始译码，因为00后面一定是1，11后面一定是0。可以确定开始，相当于rst
    end
end

always @(negedge clk_in)
begin
    if(flag1 == 1)
        flag2 <= ~flag2; // 因为要两个符号译码，时钟慢一倍
end

always @(posedge flag2)
begin
    if(tmp == 2'b10)
    begin
        dataout <= 0;
        fail <= 0;
    end
    else if(tmp == 2'b01)
    begin
        dataout <= 1;
        fail <= 0;
    end
    else if(tmp == 2'b00 || tmp == 2'b11)
    begin
        dataout <= 0;
        fail <= 1; // 有错就置1，输出置为0
    end
end


endmodule

