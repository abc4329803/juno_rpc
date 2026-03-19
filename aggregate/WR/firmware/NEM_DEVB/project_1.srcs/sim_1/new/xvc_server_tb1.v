`timescale 1ns / 1ps

module xvc_server_tb1;

    // 参数与信号定义
    reg clk;
    reg rst;
    reg [4:0] tdo_delay;
    reg [7:0] tcp_rx_data;
    reg       tcp_rx_valid;
    wire      tcp_rx_ready;
    wire [7:0] tcp_tx_data;
    wire      tcp_tx_valid;
    reg       tcp_tx_ready;
    wire      tck, tms, tdi;
    reg       tdo_in;

    // 测试数据定义 (27 bits)
    reg [31:0] test_data_1 = 32'h7DA3_B2C1; // 第一阶段数据
    reg [31:0] test_data_2 = 32'h0E5C_1234; // 第二阶段数据 (与第一阶段不同)
    reg [31:0] current_mock_data;
    reg [5:0]  tdo_bit_ptr = 0;

    // 实例化被测模块 (UUT)
    xvc_server #( .BUFFER_SIZE(1024) ) uut (
        .clk(clk),
        .rst(rst),
        .tdo_delay_cycle(tdo_delay),
        .tcp_rx_data(tcp_rx_data),
        .tcp_rx_valid(tcp_rx_valid),
        .tcp_rx_ready(tcp_rx_ready),
        .tcp_tx_data(tcp_tx_data),
        .tcp_tx_valid(tcp_tx_valid),
        .tcp_tx_ready(tcp_tx_ready),
        .tck(tck),
        .tms(tms),
        .tdi(tdi),
        .tdo(tdo_in)
    );

    // 时钟生成: 62.5MHz (16ns 周期)
    initial clk = 0;
    always #8 clk = ~clk;

    // --- 精确延迟逻辑 ---
    reg [31:0] tdo_pipe;
    wire raw_tdo = current_mock_data[tdo_bit_ptr];

    // 在时钟上升沿进行流水线移动
    always @(posedge clk) begin
        tdo_pipe <= {tdo_pipe[30:0], raw_tdo};
    end
    
    // 延迟选择逻辑：
    // tdo_pipe[0] 代表延迟 1 个 clk
    // tdo_pipe[1] 代表延迟 2 个 clk
    always @(*) begin
        if (tdo_delay == 0) tdo_in = raw_tdo; 
        else tdo_in = tdo_pipe[tdo_delay-1]; 
    end

    // 模拟 Slave 设备在 TCK 下降沿更新 TDO
    always @(negedge tck) begin
        if (uut.state == 3'd4) begin // S_EXEC_SHIFT 状态 [cite: 4]
            if(tdo_bit_ptr == 'h1b) begin
                tdo_bit_ptr <= 0;
            end else begin
                tdo_bit_ptr <= tdo_bit_ptr + 1;
            end
            
        end else begin
            tdo_bit_ptr <= 0;
        end
    end

    // 发送 TCP 字节任务
    task send_tcp_byte(input [7:0] data);
        begin
            wait(tcp_rx_ready);
            @(posedge clk);
            tcp_rx_data = data;
            tcp_rx_valid = 1;
            @(posedge clk);
            tcp_rx_valid = 0;
        end
    endtask

    // 发送 27-bit Shift 指令任务
    task send_xvc_shift_27(input [31:0] tms_val);
        begin
            // 1. 发送 "shift:" [cite: 18]
            send_tcp_byte("s"); send_tcp_byte("h"); send_tcp_byte("i"); 
            send_tcp_byte("f"); send_tcp_byte("t"); send_tcp_byte(":");
            // 2. 发送长度 27 (Little Endian) [cite: 36, 37]
            send_tcp_byte(8'd27); send_tcp_byte(8'd0); send_tcp_byte(8'd0); send_tcp_byte(8'd0);
            // 3. 发送 TMS (27 bits 需要 4 字节数据) [cite: 44]
            send_tcp_byte(tms_val[7:0]);   send_tcp_byte(tms_val[15:8]); 
            send_tcp_byte(tms_val[23:16]); send_tcp_byte({5'b0, tms_val[26:24]});
            // 4. 发送 TDI (全 0) [cite: 45]
            send_tcp_byte(8'd0); send_tcp_byte(8'd0); send_tcp_byte(8'd0); send_tcp_byte(8'd0);
        end
    endtask

    // 测试主流程
    initial begin
        rst = 1; tdo_delay = 0; tcp_rx_valid = 0; tcp_tx_ready = 1;
        current_mock_data = test_data_1;
        #100 rst = 0;
        #100;

        // ==========================================
        // 阶段 1: 验证非 8 倍位宽 (27 bit), 零延迟
        // ==========================================
        $display("--- 阶段 1: 27-bit Shift, 延迟=0 ---");
        tdo_delay = 0;
        current_mock_data = test_data_1;
        // TMS=0x0000002 使其进入 Shift-DR 状态
        send_xvc_shift_27(32'h0000002); 
        
        wait(uut.state == 3'd5); // S_SEND_TDO [cite: 5]
        $display("阶段 1 结果 (十六进制): %x %x %x %x", 
                //uut.tdo_buffer[3], uut.tdo_buffer[2], uut.tdo_buffer[1], uut.tdo_buffer[0]);
                uut.tdo_ram[3], uut.tdo_ram[2], uut.tdo_ram[1], uut.tdo_ram[0]);
        #1000;

        // ==========================================
        // 阶段 2: 验证非 8 倍位宽 (27 bit), 精确延迟 2 个时钟
        // ==========================================
        $display("--- 阶段 2: 27-bit Shift, 延迟=2 clk, 不同数据 ---");
        tdo_delay = 5'd2; // 设置 UUT 内部回溯 2 个 clk 周期
        current_mock_data = test_data_2; // 使用不同的测试数据
        
        send_xvc_shift_27(32'h0000002);

        wait(uut.state == 3'd5);
        $display("阶段 2 结果 (十六进制): %x %x %x %x", 
                 uut.tdo_ram[3], uut.tdo_ram[2], uut.tdo_ram[1], uut.tdo_ram[0]);

        #1000 $finish;
    end

endmodule