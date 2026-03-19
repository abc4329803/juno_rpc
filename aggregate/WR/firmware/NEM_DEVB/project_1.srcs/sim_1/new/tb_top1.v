`timescale 1ns / 1ps

module tb_top1;

    parameter PAYLOAD_WIDTH = 112; 
    parameter CRC_WIDTH = 16;
    parameter TRANS_WIDTH = PAYLOAD_WIDTH + CRC_WIDTH;
    parameter SYNC_HEADER = {112'h112233445566778899AABBCCDDEE, 16'hFFFF};
    
    // 全局信号
    reg sys_clk_in;
    reg rst_n;
    // 生成 62.5MHz 主时钟 (16ns 周期)
    initial sys_clk_in = 0; always #8 sys_clk_in = ~sys_clk_in; 

    // 1. 模拟 PLL 时钟
    wire clk_250m, clk_62_5m, locked;
    reg clk_250_sim = 0; always #2 clk_250_sim = ~clk_250_sim; // 4ns -> 250MHz
    reg clk_62_5_sim = 0; always #8 clk_62_5_sim = ~clk_62_5_sim; // 16ns -> 62.5MHz
    
    assign clk_250m = clk_250_sim;
    assign clk_62_5m = clk_62_5_sim;
    assign locked = rst_n;

    // 2. 实例化与连线
    wire rx_p, rx_n, uart_ctrl;
    wire m_valid, m_crc_err, align_done;
    wire [PAYLOAD_WIDTH-1:0] m_data;
    
    // Master 接收通道
    master_rx_channel #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH), 
        .SYNC_HEADER(SYNC_HEADER)
    ) u_rx_ch0 (
        .clk_250m(clk_250m), 
        .clk_62_5m(clk_62_5m), 
        .rst_n(locked),
        .rx_p(rx_p), 
        .rx_n(rx_n),
        .uart_tx_trigger(uart_ctrl),
        .m_data_out(m_data), 
        .m_data_valid(m_valid), 
        .m_crc_error(m_crc_err),
        .align_done(align_done)
    );
    
    // Slave 发送通道信号
    reg [PAYLOAD_WIDTH-1:0] slave_data;
    reg slave_valid;
    wire slave_ready;
    wire tx_p_raw, tx_n_raw;
    
    // 直连模式 (P-P, N-N)
    assign #8 rx_p = tx_p_raw; 
    assign #8 rx_n = tx_n_raw; 
    
    slave_tx #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH), 
        .SYNC_HEADER(SYNC_HEADER)
    ) u_slave (
        .rx_clk_in(sys_clk_in), 
        .rst_n(rst_n), 
        .uart_rx(uart_ctrl),
        .user_data_in(slave_data), 
        .user_data_valid(slave_valid), 
        .tx_ready(slave_ready),
        .tx_p(tx_p_raw), 
        .tx_n(tx_n_raw)
    );

    // 3. 验证流程
    integer packet_cnt;
    reg timeout_flag;

    initial begin
        $display("=== START TEST ===");
        
        // 初始化
        rst_n = 0; 
        slave_data = 112'hAA_BB_CC_DD_EE_FF_00_11_22_33_44_55_66_77; 
        slave_valid = 0;
        packet_cnt = 0;
        timeout_flag = 0;
        
        #200; 
        rst_n = 1;
        $display("=== RESET RELEASED @ %t ===", $time);
        
        // ============================================================
        // 【关键修改】使用 Verilog-2001 兼容的命名块 + disable 实现超时
        // 解决了 join_any 导致的语法错误
        // ============================================================
        begin : wait_for_lock_block
            fork
                // 线程1：等待对齐
                begin
                    wait(align_done);
                    $display("=== LOCKED / ALIGN DONE @ %t ===", $time);
                    timeout_flag = 0;
                    disable wait_for_lock_block; // 成功后，强制终止整个块(包括定时器)
                end
                
                // 线程2：超时计数
                begin
                    #1000000; // 1ms 超时
                    timeout_flag = 1;
                    disable wait_for_lock_block; // 超时后，强制终止整个块
                end
            join
        end
        // ============================================================

        // 检查是否超时
        if (timeout_flag) begin
            $display("!!! ERROR: Timeout waiting for align_done !!!");
            $display("Possible causes:");
            $display("1. Slave TX is not sending Training Pattern.");
            $display("2. Slave TX is stuck in Reset.");
            $display("3. Baud rate mismatch.");
            $finish;
        end

        $display("Waiting for uart_ctrl trigger...");
        
        #(300 * 16); 
        
        $display("=== SENDING 100 PACKETS ===");
        
        repeat(100) begin
            wait(slave_ready == 1);
            
            @(negedge sys_clk_in);
            slave_valid = 1;
            slave_data = slave_data + 1;
            
            @(negedge sys_clk_in);
            slave_valid = 0;
            
            #(TRANS_WIDTH * 16 * 1.5); 
        end
        
        #5000;
        $display("=== TEST FINISHED SUCCESSFULLY ===");
        $finish;
    end
    
    // 4. 自动比对 (Monitor)
    reg [PAYLOAD_WIDTH-1:0] exp_data;
    initial exp_data = 112'hAA_BB_CC_DD_EE_FF_00_11_22_33_44_55_66_77 + 1;
    
    always @(posedge clk_62_5m) begin
        if(m_valid) begin
            if(m_crc_err) begin
                $display("ERROR: CRC Fail at %t!", $time); 
            end
            
            if(m_data !== 0) begin
                if(m_data !== exp_data) begin
                    $display("ERROR: Data Mismatch! Exp: %h, Got: %h", exp_data, m_data); 
                end else begin
                    $display("Packet OK: %h at %t", m_data, $time);
                    exp_data = exp_data + 1;
                end
            end
        end
    end

endmodule