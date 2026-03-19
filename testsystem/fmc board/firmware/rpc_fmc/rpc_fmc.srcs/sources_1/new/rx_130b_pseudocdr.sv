`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 04:13:01 PM
// Design Name: 
// Module Name: rx_130b_pseudocdr
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


module rx_130b_pseudocdr #(
    parameter OVERSAMPLE = 8
)(
    input              clk,           // 160MHz
    input              rst_n,
    input              serial_in,
    output reg [127:0] data_out,
    output reg         data_out_valid
);
    localparam TOTAL_BITS = 130;
    reg [7:0] sample_shift;    // 过采样滑窗
    reg       in_frame = 0;
    reg [6:0] bit_cnt = 0;
    reg [129:0] data_shift = 0;
    reg [2:0] sample_phase;    // 0~7，采样点
    reg [3:0] sample_in_bit;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sample_shift    <= 0;
            in_frame        <= 0;
            bit_cnt         <= 0;
            data_shift      <= 0;
            data_out        <= 0;
            data_out_valid  <= 0;
            sample_phase    <= 0;
            sample_in_bit   <= 0;
        end else begin
            data_out_valid <= 0;
            sample_shift <= {sample_shift[6:0], serial_in};
            if (!in_frame) begin
                if (sample_shift[1:0] == 2'b01) begin
                    in_frame <= 1;
                    bit_cnt  <= 2;
                    data_shift[129:128] <= 2'b01;
                    sample_phase <= 0;
                    sample_in_bit <= 0;
                end
            end else begin
                sample_in_bit <= sample_in_bit + 1'b1;
                if (sample_in_bit == (OVERSAMPLE-1)) begin
                    data_shift[127:0] <= {data_shift[126:0], serial_in};
                    bit_cnt <= bit_cnt + 1'b1;
                    sample_in_bit <= 0;
                    if (bit_cnt == (TOTAL_BITS-1)) begin
                        in_frame <= 0;
                        data_out <= descramble(data_shift[127:0]);
                        data_out_valid <= 1;
                    end
                end
            end
        end
    end

    // 解扰功能
    function [127:0] descramble;
        input [127:0] scrambled;
        reg [127:0] outdata;
        reg [6:0] lfsr;
        integer i;
        begin
            lfsr = 7'b1011101;
            for (i = 0; i < 128; i = i + 1) begin
                outdata[i] = scrambled[i] ^ lfsr[6];
                lfsr = {lfsr[5:0], lfsr[6] ^ lfsr[5]};
            end
            descramble = outdata;
        end
    endfunction
endmodule

