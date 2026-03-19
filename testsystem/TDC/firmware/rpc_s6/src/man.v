`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2025 02:21:04 PM
// Design Name: 
// Module Name: man
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


module man(clk_in, datain, dataout);

input clk_in, datain;
output dataout;

reg [1:0] tmp;      // 存存一个信号两个符号
reg flag = 1;       // 前半段和后半段的标志位

always @(posedge clk_in)
begin
    if(flag == 1)   // 1表示前半段
    begin
        if(datain == 1'b0)
            tmp <= 2'b10;      // 01表示0
        else
            tmp <= 2'b01;      // 10表示1
    end
end

always @(posedge clk_in) // 关键：flag频率必须是信号的两倍，clk必须是信号的4倍，所以flag是clk的二分频
    flag <= ~flag;

assign dataout = (flag == 0) ? tmp[1] : tmp[0]; // 并转换串

endmodule

