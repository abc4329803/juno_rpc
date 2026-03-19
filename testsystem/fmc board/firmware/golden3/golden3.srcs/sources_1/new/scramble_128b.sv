`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 04:13:50 PM
// Design Name: 
// Module Name: scramble_128b
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


// --- 扰码 ---
module scramble_128b(
    input  [127:0] data_in,
    input          valid_in,
    output reg [127:0] data_out,
    output reg         valid_out,
    input              clk,
    input              rst_n
);
    reg [6:0]   lfsr;
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            lfsr <= 7'b1011101;
            data_out <= 0;
            valid_out <= 0;
        end else if (valid_in) begin
            lfsr = 7'b1011101;
            for (i = 0; i < 128; i = i + 1) begin
                data_out[i] = data_in[i] ^ lfsr[6];
                lfsr = {lfsr[5:0], lfsr[6] ^ lfsr[5]};
            end
            valid_out <= 1;
        end else begin
            valid_out <= 0;
        end
    end
endmodule

// --- 加同步头 ---
module pkt_130b_encoder(
    input  [127:0] data_in,
    input          valid_in,
    output reg [129:0] pkt_out,
    output reg         valid_out,
    input              clk,
    input              rst_n
);
    wire [127:0] scrambled;
    wire scramble_valid;
    scramble_128b u_scrambler (
        .data_in(data_in),
        .valid_in(valid_in),
        .data_out(scrambled),
        .valid_out(scramble_valid),
        .clk(clk),
        .rst_n(rst_n)
    );
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pkt_out <= 0;
            valid_out <= 0;
        end else begin
            if (scramble_valid) begin
                pkt_out <= {2'b01, scrambled};
                valid_out <= 1;
            end else begin
                valid_out <= 0;
            end
        end
    end
endmodule

// --- 串行化 ---
module serializer_130b(
    input              clk,
    input              rst_n,
    input      [129:0] data_in,
    input              data_in_valid,
    output reg         serial_out,
    output reg         busy
);
    reg [129:0] shifter = 0;
    reg [7:0]   cnt = 0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shifter <= 0; cnt <= 0; serial_out <= 0; busy <= 0;
        end else if (data_in_valid && !busy) begin
            shifter <= data_in;
            cnt <= 8'd130;
            busy <= 1;
        end else if (busy) begin
            serial_out <= shifter[129];
            shifter <= {shifter[128:0], 1'b0};
            cnt <= cnt - 1;
            if (cnt == 1) busy <= 0;
        end
    end
endmodule

