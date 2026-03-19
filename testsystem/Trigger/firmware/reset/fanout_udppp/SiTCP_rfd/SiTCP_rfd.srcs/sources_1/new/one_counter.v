`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/20 16:50:11
// Design Name: 
// Module Name: one_counter
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


module one_counter(
    input wire [3:0]Data_4,
    output reg [2:0]one_count
    );

    always @(*) begin
        case (Data_4)
            4'b0000:one_count<='d0;
            4'b0001:one_count<='d1; 
            4'b0010:one_count<='d1;
            4'b0011:one_count<='d2;
            4'b0100:one_count<='d1;
            4'b0101:one_count<='d2;
            4'b0110:one_count<='d2;
            4'b0111:one_count<='d3;
            4'b1000:one_count<='d1;
            4'b1001:one_count<='d2;
            4'b1010:one_count<='d2;
            4'b1100:one_count<='d2;
            4'b1101:one_count<='d3;
            4'b1110:one_count<='d3;
            4'b1111:one_count<='d4;
            default: one_count<='d0;
        endcase
    end
endmodule
