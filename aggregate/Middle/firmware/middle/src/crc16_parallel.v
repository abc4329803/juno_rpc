`timescale 1ns / 1ps

module crc16_parallel #(
    parameter DATA_WIDTH = 112,
    parameter POLY = 16'h1021,
    parameter INIT_VAL = 16'hFFFF
)(
    input  wire [DATA_WIDTH-1:0] data_in,
    output wire [15:0] crc_out
);

    // 使用组合逻辑函数计算下一态 CRC
    function [15:0] next_crc;
        input [DATA_WIDTH-1:0] data;
        input [15:0] current_crc;
        integer i;
        reg [15:0] crc;
        reg bit_in;
        reg feedback;
        begin
            crc = current_crc;
            // 模拟串行移位过程，综合器会将其展开为并行XOR树
            for (i = DATA_WIDTH-1; i >= 0; i = i - 1) begin
                bit_in = data[i];
                feedback = bit_in ^ crc[15];
                crc = {crc[14:0], 1'b0}; // 左移
                if (feedback) begin
                    crc = crc ^ POLY;
                end
            end
            next_crc = crc;
        end
    endfunction

    // 直接输出计算结果 (组合逻辑)
    assign crc_out = next_crc(data_in, INIT_VAL);

endmodule