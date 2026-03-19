`timescale 1ns/1ns

module tb_UART_Packet_Ctrl;

    // ============================================================
    // 1. 参数设置
    // ============================================================
    parameter CLK_FREQ = 25000000; // 修改：25MHz
    parameter BAUD_RATE = 9600;    // 修改：9600
    parameter CLK_PERIOD = 40;     // 修改：1/25MHz = 40ns
    
    // 计算比特周期 (纳秒)，用于手动 bit-bang 发送数据
    localparam BIT_PERIOD_NS = 1000000000 / BAUD_RATE;

    // ============================================================
    // 2. 信号定义
    // ============================================================
    reg clk;
    reg rst_n;
    
    // 用户接口信号
    reg send_req;
    reg [7:0] user_tx_data;
    wire [7:0] user_rx_data;
    wire user_rx_valid;
    wire tx_ready;
    
    // 物理接口信号
    wire uart_tx_pin;
    wire uart_rx_pin;
    
    // 测试控制信号
    reg loopback_en;       // 1: 开启回环 (TX接RX), 0: 断开 (手动控制RX)
    reg manual_rx_drive;   // 当 loopback_en=0 时，手动驱动 RX 线

    // 如果开启回环，RX = TX；否则 RX = manual_rx_drive
    assign uart_rx_pin = loopback_en ? uart_tx_pin : manual_rx_drive;

    // ============================================================
    // 3. 实例化被测模块 (DUT)
    // ============================================================
    UART_Packet_Ctrl #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .send_req(send_req),
        .user_tx_data(user_tx_data),
        .user_rx_data(user_rx_data),
        .user_rx_valid(user_rx_valid),
        .tx_ready(tx_ready),
        .uart_tx_pin(uart_tx_pin),
        .uart_rx_pin(uart_rx_pin)
    );

    // ============================================================
    // 4. 时钟生成
    // ============================================================
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    // ============================================================
    // 5. 测试流程 (Main Test)
    // ============================================================
    initial begin
        // --- 初始化 ---
        $display("=== Simulation Start ===");
        $display("Baud Rate: %d, Bit Period: %0d ns", BAUD_RATE, BIT_PERIOD_NS);
        $display("Clock Freq: %d Hz, Clock Period: %0d ns", CLK_FREQ, CLK_PERIOD);
        
        rst_n = 0;
        send_req = 0;
        user_tx_data = 0;
        loopback_en = 1;     // 默认开启回环测试
        manual_rx_drive = 1; // 空闲状态为高
        
        #200;
        rst_n = 1;
        #200;

        // ------------------------------------------------------------
        // 测试用例 A: 正常数据回环 (Normal Loopback)
        // 发送 0x37 -> 经过 TX打包 -> 回环 -> RX解包校验 -> 收到 0x37
        // ------------------------------------------------------------
        wait(tx_ready);
        $display("\n[Time %t] Test A: Sending valid packet 0x37 via Loopback...", $time);
        
        send_packet(8'h37);

        // 等待有效数据输出
        fork : wait_valid_A
            begin
                wait(user_rx_valid);
                $display("[Time %t] Data Received Valid Pulse!", $time);
                if (user_rx_data == 8'h37)
                    $display("[PASS] Test A Successful. Received 0x37.");
                else
                    $display("[FAIL] Test A Failed. Received 0x%h, Expected 0x37.", user_rx_data);
            end
            begin
                # (BIT_PERIOD_NS * 50); // 超时保护
                disable wait_valid_A;
                if (!user_rx_valid) $display("[FAIL] Test A Timeout. No data received.");
            end
        join

        # (BIT_PERIOD_NS * 5); 

        // ------------------------------------------------------------
        // 测试用例 B: 校验和错误测试 (Bad Checksum Injection)
        // ------------------------------------------------------------
        $display("\n[Time %t] Test B: Injecting packet with BAD checksum...", $time);
        loopback_en = 0; // 断开回环
        manual_rx_drive = 1;
        # (BIT_PERIOD_NS * 2);

        // 手动发送字节 (Bit-Banging)
        send_byte_manually(8'hAA); // 包头
        send_byte_manually(8'h55); // 数据
        send_byte_manually(8'h00); // 错误的校验和

        // 观察一段时间
        # (BIT_PERIOD_NS * 5); 
        
        if (user_rx_valid)
            $display("[FAIL] Test B Failed. Received data despite bad checksum!");
        else
            $display("[PASS] Test B Successful. Bad checksum packet was rejected.");

        # (BIT_PERIOD_NS * 5);

        // ------------------------------------------------------------
        // 测试用例 C: 恢复正常回环
        // ------------------------------------------------------------
        $display("\n[Time %t] Test C: Re-enabling Loopback, sending 0x88...", $time);
        loopback_en = 1;
        # (BIT_PERIOD_NS * 2);
        
        send_packet(8'h88);
        
        fork : wait_valid_C
            begin
                wait(user_rx_valid);
                if (user_rx_data == 8'h88)
                    $display("[PASS] Test C Successful. Recovery confirmed.");
                else
                    $display("[FAIL] Test C Failed. Data mismatch.");
            end
            begin
                # (BIT_PERIOD_NS * 50);
                disable wait_valid_C;
                if (!user_rx_valid) $display("[FAIL] Test C Timeout.");
            end
        join

        $display("\n=== Simulation End ===");
        $stop;
    end

    // ============================================================
    // 任务定义
    // ============================================================
    task send_packet(input [7:0] data);
    begin
        wait(tx_ready);
        @(posedge clk);
        user_tx_data = data;
        send_req = 1;
        @(posedge clk);
        send_req = 0;
    end
    endtask

    task send_byte_manually(input [7:0] byte_data);
    integer i;
    begin
        manual_rx_drive = 0; // Start Bit
        #(BIT_PERIOD_NS);
        
        for (i=0; i<8; i=i+1) begin
            manual_rx_drive = byte_data[i];
            #(BIT_PERIOD_NS);
        end
        
        manual_rx_drive = 1; // Stop Bit
        #(BIT_PERIOD_NS);
    end
    endtask

endmodule