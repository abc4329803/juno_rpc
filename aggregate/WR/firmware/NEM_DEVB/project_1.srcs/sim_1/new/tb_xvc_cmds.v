`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2026 02:26:50 PM
// Design Name: 
// Module Name: tb_xvc_cmds
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


`timescale 1ns / 1ps

module tb_xvc_cmds();
    // 信号定义
    reg clk;
    reg rst;
    reg [7:0] tcp_rx_data;
    reg tcp_rx_valid;
    wire tcp_rx_ready;
    wire [7:0] tcp_tx_data;
    wire tcp_tx_valid;
    reg tcp_tx_ready;

    // JTAG 接口（悬空或观察）
    wire tck, tms, tdi;
    reg tdo;

    // 实例化服务器
    xvc_server #(
        .BUFFER_SIZE(1024)
    ) uut (
        .clk(clk),
        .rst(rst),
        .tcp_rx_data(tcp_rx_data),
        .tcp_rx_valid(tcp_rx_valid),
        .tcp_rx_ready(tcp_rx_ready),
        .tcp_tx_data(tcp_tx_data),
        .tcp_tx_valid(tcp_tx_valid),
        .tcp_tx_ready(tcp_tx_ready),
        .tck(tck),
        .tms(tms),
        .tdi(tdi),
        .tdo(tdo),
        .state_debug(),
        .xvc_active()
        //.last_shift()
    );

    // 时钟生成 (100MHz)
    always #5 clk = ~clk;

    // --- 任务：发送单个字节 ---
    task send_byte(input [7:0] data);
        begin
            wait(tcp_rx_ready); // 等待服务器准备好
            @(posedge clk);
            tcp_rx_data = data;
            tcp_rx_valid = 1;
            @(posedge clk);
            tcp_rx_valid = 0;
            tcp_rx_data = 8'h00;
        end
    endtask

    // --- 任务：发送字符串 ---
    task send_string(input [79:0] str, input integer len);
        integer i;
        begin
            for (i = len-1; i >= 0; i = i - 1) begin
                send_byte(str[i*8 +: 8]);
            end
        end
    endtask

    // --- 任务：监听并打印返回的数据 ---
/*     task collect_response(input integer expected_len);
        integer j;
        begin
            $write("Server Response: ");
            for (j = 0; j < expected_len; j = j + 1) begin
                wait(tcp_tx_valid);
                $write("%c", tcp_tx_data); // 打印字符格式
                @(posedge clk);
                // 模拟 TCP 栈接收
                #1; 
            end
            $write("\n");
        end
    endtask */

    task collect_response(input integer expected_len);
    integer j;
    begin
        $write("Server Response: ");
        for (j = 0; j < expected_len; j = j + 1) begin
            // 确保在采样数据前 valid 已经稳定
            @(posedge clk);
            while (!tcp_tx_valid) @(posedge clk); 
            $write("%c", tcp_tx_data);
            #1; // 稍微延迟以避开时钟沿
        end
        $write("\n");
        // 等待直到有效信号拉低，确保服务器返回 IDLE
        wait(!tcp_tx_valid);
        @(posedge clk);
    end
    endtask

    // --- 任务：监听并以十六进制打印 (用于 SetTCK) ---
    task collect_response_hex(input integer expected_len);
        integer j;
        begin
            $write("Server Response (HEX): ");
            for (j = 0; j < expected_len; j = j + 1) begin
                wait(tcp_tx_valid);
                $write("%h ", tcp_tx_data);
                @(posedge clk);
                #1;
            end
            $write("\n");
        end
    endtask

    // --- 主测试流程 ---
    initial begin
        // 初始化
        clk = 0; rst = 1; tcp_rx_valid = 0; tcp_tx_ready = 1; tdo = 0;
        
        // 1. 复位释放
        #100;
        @(posedge clk);
        #2 rst = 0;
        repeat(5) @(posedge clk);

        $display("----- Starting Test: getinfo -----");
        // 发送 "getinfo:"
        send_string("getinfo:", 8);
        // 期待返回 "xvcServer_v1.0:1024\n" (20字节)
        collect_response(20);

        #100;
/*
        $display("----- Starting Test: settck -----");
        // 发送 "settck:"
        send_string("settck:", 7);
        // 发送 4 字节周期 (例如 100ns = 0x64)
        send_byte(8'h64); // 小端模式低字节
        send_byte(8'h00);
        send_byte(8'h00);
        send_byte(8'h00);
        
        // SetTCK 应该原样返回这 4 个字节
        collect_response_hex(4);
*/
        #500;
        $display("----- All Command Tests Finished -----");
        $finish;
    end

endmodule
