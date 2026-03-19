`timescale 1ns / 1ps

module tb_auto_recovery;

    // --- 参数定义 ---
    parameter PAYLOAD_WIDTH = 112;
    parameter CRC_WIDTH = 16;

    // --- 信号定义 ---
    reg clk_62_5;
    reg clk_250;
    reg rst;

    // 物理接口
    wire tx_p, tx_n;
    reg  rx_p, rx_n; 

    // 控制与数据
    wire [1:0] master_cmd; 
    wire tx_ready;
    reg  tx_data_valid;
    reg  [PAYLOAD_WIDTH-1:0] tx_data;

    wire [PAYLOAD_WIDTH-1:0] rx_data_out;
    wire rx_valid;
    wire rx_crc_err_pulse;

    // 测试变量
    reg inject_error;      
    integer error_count;   

    // --- 1. 时钟生成 ---
    initial begin
        clk_62_5 = 1;
        forever #8 clk_62_5 = ~clk_62_5; 
    end
    initial begin
        clk_250 = 0;
        forever #2 clk_250 = ~clk_250;   
    end

    slave_tx_axi #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH)
    ) u_slave (
        .clk(clk_62_5), 
        .rst(rst), 
        .uart_cmd(master_cmd), 
        .s_axis_tready(tx_ready), 
        .s_axis_tvalid(tx_data_valid), 
        .s_axis_tdata(tx_data),
        .tx_p(tx_p), 
        .tx_n(tx_n)
    );



    master_rx_k7 #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), .CRC_WIDTH(CRC_WIDTH)
    ) u_master (
        .clk_250m(clk_250), .clk_62_5m(clk_62_5), .rst(rst),
        .rx_p(rx_p), .rx_n(rx_n),
        .uart_cmd_out(master_cmd),
        .data_out(rx_data_out), .data_valid(rx_valid), .crc_error_pulse(rx_crc_err_pulse)
    );

    // --- 3. 物理信道模拟 ---
    // 完全由 Testbench 的 inject_error 信号控制时机
    always @(*) begin
        if (inject_error) begin
            rx_p <= #10 ~tx_p; // 翻转制造错误
            rx_n <= #10 ~tx_n;
        end else begin
            rx_p <= #10 tx_p;  // 正常传输
            rx_n <= #10 tx_n;
        end
    end

    // --- 4. 发送任务 ---
    task send_packet;
        input [PAYLOAD_WIDTH-1:0] data_to_send;
        begin
            wait(tx_ready == 1'b1);
            @(posedge clk_62_5); 
            tx_data_valid <= 1'b1;
            tx_data <= data_to_send;
            @(posedge clk_62_5);
            tx_data_valid <= 1'b0;
            // Slave 开始处理: LATCH -> HEAD -> DATA...
        end
    endtask

    // --- 5. 主测试流程 ---
    initial begin
        // 初始化
        rst = 1;
        inject_error = 0;
        tx_data_valid = 0;
        tx_data = 0;
        error_count = 0;
        
        $display("------------------------------------------------");
        $display("Simulation Start: Auto-Recovery Test (Smart Loop)");
        $display("------------------------------------------------");

        #100;
        rst = 0;
        $display("[Time %t] Reset Released. Waiting for Link Up...", $time);

        // --- 阶段 1: 初始链路建立 ---
        // 只需要等待 11，因为 Slave 会自动处理 10 请求
        while (master_cmd != 2'b11) begin
             @(posedge clk_62_5);
        end
        $display("[Time %t] >>> LINK ESTABLISHED (Master CMD = 11).", $time);

        // --- 阶段 2: 正常数据验证 ---
        #1000;
        $display("[Time %t] Sending Normal Packet...", $time);
        send_packet({PAYLOAD_WIDTH{1'b1}}); 
        @(posedge rx_valid);
        if (rx_data_out == {PAYLOAD_WIDTH{1'b1}})
            $display("PASS: Packet 1 OK.");

        // --- 阶段 3: 智能故障注入 ---
        $display("------------------------------------------------");
        $display("[Time %t] >>> INJECTING FAULT (Corrupting Data/CRC)...", $time);
        
        inject_error = 0; // 确保初始干净

        begin : fault_loop
            integer k;
            // [关键修改]: 
            // 循环条件加入 (master_cmd == 2'b11)。
            // 一旦 Master 变成 01 (Train) 或 10 (Sync)，立即停止发送坏包。
            for (k = 0; k < 20 && master_cmd == 2'b11; k = k + 1) begin
                
                // 1. 发送数据包
                send_packet(112'hDEAD_BEEF);
                
                // 2. 等待 Header 通过 (约 70 cycle)
                // 必须保证 Header 完好，Master 才能识别出这是个包，进而检测 CRC
                repeat(70) @(posedge clk_62_5);
                
                // 3. 再次检查：在发 Header 期间 Master 是否已经挂了？
                // 如果还在 Data Mode，才开启干扰
                if (master_cmd == 2'b11) begin
                    inject_error = 1;
                    $display("[Time %t] Injecting Error into Packet %0d", $time, k+1);
                    
                    // 4. 持续干扰 (覆盖 Payload/CRC)
                    repeat(40) @(posedge clk_62_5);
                    
                    inject_error = 0; // 停止干扰
                end
                
                // 5. 等待包结束及 Master 处理时间
                repeat(50) @(posedge clk_62_5);
                
                // 6. 稍作停顿，让 while 条件能捕捉到 Master 的状态变化
                repeat(20) @(posedge clk_62_5);
            end
        end

        // --- 阶段 4: 验证 Master 触发重训 ---
        $display("[Time %t] Loop finished. Checking Master State...", $time);
        
        // 此时 master_cmd 应该已经不是 11 了
        if (master_cmd != 2'b11) begin
            $display("[Time %t] >>> AUTO-RECOVERY TRIGGERED! (Left Data Mode)", $time);
            // 清零计数器，为了观察恢复后的情况（可选）
            error_count = 0; 
        end else begin
            $display("[Time %t] ERROR: Master did not trigger retraining.", $time);
            $finish;
        end

        // --- 阶段 5: 链路恢复 ---
        $display("[Time %t] Waiting for Link Restoration (01 -> 10 -> 11)...", $time);
        
        // 我们只需要傻傻地等回到 11
        // Slave 内部逻辑会自动响应 10 发送 Header
        while (master_cmd != 2'b11) begin
            @(posedge clk_62_5);
            if ($time > 60000000) begin // 超时保护
                $display("TIMEOUT waiting for Link Restore.");
                $finish;
            end
        end
        $display("[Time %t] >>> LINK RESTORED (Master CMD = 11).", $time);

        // --- 阶段 6: 验证恢复后通信 ---
        #1000;
        $display("[Time %t] Sending Post-Recovery Packet...", $time);
        send_packet(112'hD123_ABCD_EF97_1234_5678_9ABC_DEF1);
        #1000;
        $display("[Time %t] Sending Post-Recovery Packet...", $time);
        send_packet(112'h0123_ABCD_EF97_1234_5678_9ABC_DEF7);

        @(posedge rx_valid);
        if (rx_data_out[31:0] == 32'h9ABC_DEF1) // 检查低32位
            $display("[Time %t] PASS: Recovery Packet Received Correctly.", $time);
        else 
            $display("[Time %t] FAIL: Data Mismatch after Recovery.", $time);

        #4000;
        $display("------------------------------------------------");
        $display("TEST FINISHED SUCCESSFULLY");
        $display("------------------------------------------------");
        //$finish;
    end
    
    // 监视 CRC 错误脉冲
    always @(posedge rx_crc_err_pulse) begin
        error_count = error_count + 1;
        $display("[Time %t] Monitor: CRC Error Pulse (Total: %d)", $time, error_count);
    end

endmodule