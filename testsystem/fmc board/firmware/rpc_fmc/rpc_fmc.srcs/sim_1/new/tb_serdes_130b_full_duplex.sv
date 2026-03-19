`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2025 04:14:53 PM
// Design Name: 
// Module Name: tb_serdes_130b_full_duplex
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


module tb_serdes_130b_full_duplex;

    // 时钟、复位
    reg clk_tx_a = 0, clk_rx_a = 0;
    reg clk_tx_b = 0, clk_rx_b = 0;
    reg rst_n = 0;

    // 双方物理线（A的TX连B的RX，B的TX连A的RX）
    wire line_a2b;
    wire line_b2a;

    // DUT_A端口
    reg  [127:0] tx_data_a = 0;
    reg          tx_valid_a = 0;
    wire         tx_busy_a;
    wire [127:0] rx_data_a;
    wire         rx_valid_a;

    // DUT_B端口
    reg  [127:0] tx_data_b = 0;
    reg          tx_valid_b = 0;
    wire         tx_busy_b;
    wire [127:0] rx_data_b;
    wire         rx_valid_b;

    // 实例化 DUT_A
    serdes_130b_full_duplex dut_a(
        .clk_tx(clk_tx_a),
        .clk_rx(clk_rx_a),
        .rst_n(rst_n),
        .tx_serial_out(line_a2b),
        .rx_serial_in(line_b2a),
        .tx_data(tx_data_a),
        .tx_valid(tx_valid_a),
        .tx_busy(tx_busy_a),
        .rx_data(rx_data_a),
        .rx_valid(rx_valid_a)
    );

    // 实例化 DUT_B
    serdes_130b_full_duplex dut_b(
        .clk_tx(clk_tx_b),
        .clk_rx(clk_rx_b),
        .rst_n(rst_n),
        .tx_serial_out(line_b2a),
        .rx_serial_in(line_a2b),
        .tx_data(tx_data_b),
        .tx_valid(tx_valid_b),
        .tx_busy(tx_busy_b),
        .rx_data(rx_data_b),
        .rx_valid(rx_valid_b)
    );

    // 时钟生成（发送端20MHz，接收端160MHz）
    always #25 clk_tx_a = ~clk_tx_a;  // 20MHz
    always #3.125 clk_rx_a = ~clk_rx_a; // 160MHz
    always #25 clk_tx_b = ~clk_tx_b;
    always #3.125 clk_rx_b = ~clk_rx_b;

    initial begin
        // 复位
        rst_n = 0;
        #50;
        rst_n = 1;
        #100;

        // A发B收
        tx_data_a = 128'hAAAABBBB_CCCC1111_22223333_44445555;
        tx_valid_a = 1;
        @(posedge clk_tx_a);
        tx_valid_a = 0;

        // B发A收
        tx_data_b = 128'h12345678_9abcdef0_00112233_44556677;
        tx_valid_b = 1;
        @(posedge clk_tx_b);
        tx_valid_b = 0;

        // 继续交替发包（可添加更多复杂情况）
        repeat(5000) @(posedge clk_tx_a);

        $finish;
    end

    // 打印A端收到的数据
    always @(posedge clk_rx_a) begin
        if (rx_valid_a)
            $display("A收到B的数据: %h @ %t", rx_data_a, $time);
    end

    // 打印B端收到的数据
    always @(posedge clk_rx_b) begin
        if (rx_valid_b)
            $display("B收到A的数据: %h @ %t", rx_data_b, $time);
    end

endmodule
