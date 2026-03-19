`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 04:12:16 PM
// Design Name: 
// Module Name: serdes_130b_full_duplex
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


module serdes_130b_full_duplex #(
    parameter OVERSAMPLE = 8
)(
    input         clk_tx,      // 发送时钟（20MHz）
    input         clk_rx,      // 接收过采样时钟（160MHz）
    input         rst_n,

    // 物理接口
    output        tx_serial_out, // 输出给对方RX
    input         rx_serial_in,  // 输入来自对方TX

    // 发送
    input  [127:0] tx_data,
    input          tx_valid,
    output         tx_busy,

    // 接收
    output [127:0] rx_data,
    output         rx_valid
);
    // 发送端
    wire [129:0] pkt;
    wire         pkt_valid;
    pkt_130b_encoder enc(
        .data_in(tx_data),
        .valid_in(tx_valid),
        .pkt_out(pkt),
        .valid_out(pkt_valid),
        .clk(clk_tx),
        .rst_n(rst_n)
    );
    serializer_130b ser(
        .clk(clk_tx),
        .rst_n(rst_n),
        .data_in(pkt),
        .data_in_valid(pkt_valid),
        .serial_out(tx_serial_out),
        .busy(tx_busy)
    );
    // 接收端
    rx_130b_pseudocdr #(.OVERSAMPLE(OVERSAMPLE)) rxu (
        .clk(clk_rx),
        .rst_n(rst_n),
        .serial_in(rx_serial_in),
        .data_out(rx_data),
        .data_out_valid(rx_valid)
    );
endmodule

