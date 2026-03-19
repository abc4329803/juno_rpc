`timescale 1ns / 1ps

module tb_phase_test;

    parameter PAYLOAD_WIDTH = 112;
    parameter CRC_WIDTH = 16;
    
    // --- 时钟生成 ---
    reg clk_master_62_5;
    reg clk_master_250;
    reg rst;

    // --- 物理模拟 ---
    // 定义线缆延迟 (模拟 1.5米左右线缆, 约 7.3ns)
    // 故意使用非整数，制造相位差
    parameter CABLE_DELAY = 7.3; 
    
    // Slave 的时钟 (来源于 Master，但经过了线缆延迟)
    wire clk_slave;
    assign #CABLE_DELAY clk_slave = clk_master_62_5;

    // 信号连接
    wire tx_p, tx_n; // Slave 发出的
    reg  rx_p, rx_n; // Master 收到的 (经过延迟)

    wire [1:0] master_cmd; 
    wire tx_ready;
    reg  tx_data_valid;
    reg  [PAYLOAD_WIDTH-1:0] tx_data;
    wire [PAYLOAD_WIDTH-1:0] rx_data_out;
    wire rx_valid;
    wire rx_crc_err_pulse;

    // --- Master 时钟源 ---
    initial begin
        clk_master_62_5 = 0;
        forever #8 clk_master_62_5 = ~clk_master_62_5; // 16ns 周期
    end
    initial begin
        clk_master_250 = 0;
        forever #2 clk_master_250 = ~clk_master_250;   // 4ns 周期
    end

    // --- 实例化 Slave (注意时钟是 clk_slave) ---
    slave_tx #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH)
    ) u_slave (
        .clk(clk_slave), // <--- 关键：Slave 使用有相位差的时钟
        .rst(rst),
        .uart_cmd(master_cmd), 
        .tx_ready(tx_ready),
        .tx_data_valid(tx_data_valid),
        .tx_data(tx_data),
        .tx_p(tx_p),
        .tx_n(tx_n)
    );

    // --- 实例化 Master (使用本地时钟) ---
    master_rx_k7 #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH)
    ) u_master (
        .clk_250m(clk_master_250),
        .clk_62_5m(clk_master_62_5),
        .rst(rst),
        .rx_p(rx_p),
        .rx_n(rx_n),
        .uart_cmd_out(master_cmd),
        .data_out(rx_data_out),
        .data_valid(rx_valid),
        .crc_error_pulse(rx_crc_err_pulse)
    );

    // --- 回程线缆延迟模拟 ---
    always @(*) begin
        rx_p <= #CABLE_DELAY tx_n;
        rx_n <= #CABLE_DELAY tx_p;
    end

    // --- 发送任务 (配合 Slave 时钟域) ---
    task send_packet;
        input [PAYLOAD_WIDTH-1:0] data_to_send;
        begin
            // 等待 Slave Ready
            // 注意：因为 Slave 跑在 delayed 时钟域，TB 最好与 Slave 时钟同步
            wait(tx_ready == 1'b1);
            @(posedge clk_slave); 
            tx_data_valid <= 1'b1;
            tx_data <= data_to_send;
            @(posedge clk_slave);
            tx_data_valid <= 1'b0;
            @(posedge clk_slave);
        end
    endtask

    // --- 测试流程 ---
    initial begin
        rst = 1;
        tx_data_valid = 0;
        tx_data = 0;
        
        $display("------------------------------------------------");
        $display("Test Start: Phase Shift & Oversampling Verification");
        $display("Cable Delay set to: %0dns (Round Trip: %0dns)", CABLE_DELAY, CABLE_DELAY*2);
        $display("------------------------------------------------");

        #100;
        rst = 0;
        
        // 1. 等待训练完成
        // 由于我们在 slave_tx 加入了自动握手逻辑，
        // 这里我们只需要傻傻地等 master_cmd 变成 11 即可，不用发包了！
        $display("[Time %t] Waiting for Link Training (01 -> 10 -> 11)...", $time);
        
        // 监视一下中间状态
        while (master_cmd != 2'b11) begin
            if (master_cmd == 2'b10) 
                 $display("[Time %t] Master Requesting Sync (10). Slave should auto-reply.", $time);
            @(posedge clk_master_62_5);
        end
        
        $display("[Time %t] >>> LINK LOCKED (CMD=11). Phase alignment successful!", $time);
        
        // 2. 发送数据验证误码率
        #500;
        $display("[Time %t] Sending Test Packet...", $time);
        send_packet(112'hAABB_CCDD_1122_3344_5566_7788_9901);
        
        // 等待接收 (Master 时钟域)
        @(posedge rx_valid);
        
        if (rx_data_out == 112'hAABB_CCDD_1122_3344_5566_7788_9901) begin
            $display("[Time %t] PASS: Data Received Correctly despite Phase Shift.", $time);
            $display("------------------------------------------------");
        end else begin
            $display("[Time %t] FAIL: Data Mismatch! Received: %h", $time, rx_data_out);
            $display("------------------------------------------------");
        end
        
        #1000;
        $finish;
    end

endmodule