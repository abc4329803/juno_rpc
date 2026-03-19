`timescale 1ns / 1ps

module tb_top;

    parameter FPGA_FAMILY = "7SERIES"; 
    parameter PAYLOAD_WIDTH = 112; // 用户数据
    parameter CRC_WIDTH     = 16;
    // 物理传输总宽 = 128
    parameter TRANS_WIDTH   = PAYLOAD_WIDTH + CRC_WIDTH; 
    
    parameter CLK_PERIOD  = 16.0; 
    // Header 必须扩展到 128 位
    parameter SYNC_HEADER = {112'h112233445566778899AABBCCDDEE, 16'hFFFF};
    parameter POLARITY_SWAP = 1; 
    
    integer TEST_PACKET_COUNT = 500; 

    reg sys_clk, ref_clk_200m, rst_n;
    wire coax_p, coax_n, uart_ctrl;
    wire rx_p_dly, rx_n_dly;
    
    wire [PAYLOAD_WIDTH-1:0] master_data; // 只看 payload
    wire master_valid, align_done, polarity_inv, master_crc_err;
    reg [PAYLOAD_WIDTH-1:0] slave_data_src;
    
    // Debug
    wire [3:0] debug_state;
    wire [TRANS_WIDTH-1:0] debug_shreg_full;
    
    integer timeout_cnt, rx_packet_cnt, err_cnt;

    // 实例化 Master (配置 payload 和 crc 宽)
    master_rx_top #(
        .FPGA_FAMILY(FPGA_FAMILY), 
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH),
        .SYNC_HEADER(SYNC_HEADER)
    ) u_master (
        .sys_clk(sys_clk), .sys_rst_n(rst_n),
        .rx_p(rx_p_dly), .rx_n(rx_n_dly), .uart_tx_trigger(uart_ctrl),
        .m_data_out(master_data), .m_data_valid(master_valid), .m_crc_error(master_crc_err),
        .align_done(align_done), .polarity_inv(polarity_inv),
        .debug_state(debug_state), .debug_shreg_full(debug_shreg_full)
    );

    wire slave_clk;
    assign #5 slave_clk = sys_clk; 
    
    slave_tx #(
        .PAYLOAD_WIDTH(PAYLOAD_WIDTH), 
        .CRC_WIDTH(CRC_WIDTH),
        .SYNC_HEADER(SYNC_HEADER)
    ) u_slave (
        .rx_clk_in(slave_clk), .rst_n(rst_n), .uart_rx(uart_ctrl), 
        .user_data_in(slave_data_src), .tx_p(coax_p), .tx_n(coax_n)
    );

    assign #8 rx_p_dly = POLARITY_SWAP ? coax_n : coax_p;
    assign #8 rx_n_dly = POLARITY_SWAP ? coax_p : coax_n;

    initial sys_clk = 0; always #(CLK_PERIOD/2) sys_clk = ~sys_clk;
    initial ref_clk_200m = 0; always #2.5 ref_clk_200m = ~ref_clk_200m;

    // 测试流程
    initial begin
        $display("=== STRESS TEST WITH CRC START ===");
        rst_n = 0; 
        slave_data_src = 112'hAA_BB_CC_DD_EE_FF_00_11_22_33_44_55_66_77; 
        timeout_cnt = 0; rx_packet_cnt = 0; err_cnt = 0;

        #200; rst_n = 1;
        
        $display("=== Phase 1: Waiting for Lock... ===");
        while (align_done == 0 && timeout_cnt < 1000000) begin
            #10; timeout_cnt = timeout_cnt + 1;
        end

        if (timeout_cnt >= 1000000) begin
            $display("=== TIMEOUT ==="); $stop;
        end else $display("=== LOCKED! ===");
    end

    // Driver (注意这里等待时间要按 TRANS_WIDTH 算)
    initial begin
        wait(uart_ctrl == 1);
        // 等待 Header (128clk) + Base Data (128clk) + Margin
        #(300 * CLK_PERIOD); 
        
        $display("=== Phase 2: Sending Data ===");
        repeat (TEST_PACKET_COUNT) begin
            #(10 * CLK_PERIOD); 
            slave_data_src = slave_data_src + 112'h1; 
            // 等待一帧 (Payload + CRC)
            #( (TRANS_WIDTH - 10) * CLK_PERIOD );
        end
    end

    // Monitor
    reg [PAYLOAD_WIDTH-1:0] base_data;
    reg stream_synced;
    
    initial begin
        base_data = 112'hAA_BB_CC_DD_EE_FF_00_11_22_33_44_55_66_77;
        stream_synced = 0;
        
        wait(align_done == 1);
        
        while (rx_packet_cnt < TEST_PACKET_COUNT) begin
            @(posedge sys_clk);
            if (master_valid) begin
                
                // 检查 CRC
                if (master_crc_err) begin
                    $display("!!! CRC ERROR DETECTED at PKT %0d !!!", rx_packet_cnt);
                    $stop;
                end

                if (!stream_synced) begin
                    if (master_data == base_data + 1) begin
                        $display(">>> Stream Synced!");
                        stream_synced = 1;
                        rx_packet_cnt = 1;
                        base_data = base_data + 2; 
                    end
                end else begin
                    rx_packet_cnt = rx_packet_cnt + 1;
                    if (master_data !== base_data) begin
                        $display("Data Mismatch! Exp: %h, Got: %h", base_data, master_data);
                        err_cnt = err_cnt + 1;
                        $stop;
                    end
                    base_data = base_data + 1;
                end
            end
        end
        
        #1000;
        if (err_cnt == 0) $display("=== CRC TEST PASSED ===");
        $finish;
    end

endmodule