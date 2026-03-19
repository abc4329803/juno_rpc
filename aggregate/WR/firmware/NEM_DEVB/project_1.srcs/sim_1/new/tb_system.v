`timescale 1ns / 1ps

module tb_system;

    parameter PAYLOAD_WIDTH = 112;

    reg clk_62_5;
    reg clk_250;
    reg rst;
    
    wire tx_p, tx_n;
    reg rx_p, rx_n;
    
    // Master Output
    wire [1:0] master_cmd;
    wire [PAYLOAD_WIDTH-1:0] rx_data;
    wire rx_valid;
    wire rx_crc_err;

    // Slave FIFO
    reg [PAYLOAD_WIDTH-1:0] fifo_mem [0:15];
    reg [PAYLOAD_WIDTH-1:0] fifo_dout;
    reg fifo_empty;
    wire fifo_rd_en;
    reg [3:0] r_ptr = 0;

    // --- Clocks ---
    initial begin
        clk_62_5 = 0; forever #8 clk_62_5 = ~clk_62_5; // 16ns
    end
    initial begin
        clk_250 = 0; forever #2 clk_250 = ~clk_250; // 4ns
    end

    // --- Slave Instantiation ---
    slave_tx #(.PAYLOAD_WIDTH(PAYLOAD_WIDTH)) u_slave (
        .clk(clk_62_5),
        .rst(rst),
        .uart_cmd(master_cmd), // Use master command loopback
        .fifo_dout(fifo_dout),
        .fifo_empty(fifo_empty),
        .fifo_rd_en(fifo_rd_en),
        .tx_p(tx_p), .tx_n(tx_n)
    );

    // --- FIFO Logic ---
    always @(posedge clk_62_5) begin
        fifo_dout <= fifo_mem[r_ptr];
        if (fifo_rd_en) begin
            r_ptr <= r_ptr + 1;
            if (r_ptr == 9) fifo_empty <= 1; // Stop after 10 packets
        end
    end

    // --- Master Instantiation ---
    master_rx_k7 #(.PAYLOAD_WIDTH(PAYLOAD_WIDTH)) u_master (
        .clk_250m(clk_250),
        .clk_62_5m(clk_62_5),
        .rst(rst),
        .rx_p(rx_p), .rx_n(rx_n),
        .uart_cmd_out(master_cmd),
        .data_out(rx_data),
        .data_valid(rx_valid),
        .crc_error(rx_crc_err)
    );

    // --- Channel Simulation (Delay + Phase Shift) ---
    // 这里模拟 4x 过采样的关键：我们需要模拟输入信号相对于 Master 时钟的相位差
    // 通过改变 rx_p 的延时，可以测试 Master 是否能选出正确的 best_tap
    always @(*) begin
         // 延迟 13ns (非整周期，模拟随机相位)
        rx_p <= #13 tx_p;
        rx_n <= #13 tx_n;
    end

    initial begin
        rst = 1;
        fifo_empty = 0;
        // Init Payload
        fifo_mem[0] = {112{1'b1}}; 
        fifo_mem[1] = {8'hAA, {104{1'b0}}};
        
        #100 rst = 0;
        
        // Wait for Training Lock
        wait(master_cmd == 2'b10); 
        $display("Time %t: Master Locked Training Pattern (0xB5).", $time);
        
        // Wait for Header Lock
        wait(master_cmd == 2'b11);
        $display("Time %t: Master Found 64-bit Header.", $time);
        
        // Check Data
        @(posedge rx_valid);
        $display("Time %t: Received Data: %h", $time, rx_data);
        
        if (rx_data == fifo_mem[0]) $display("PASS: Data 0 Mismatch");
        
        @(posedge rx_valid);
        $display("Time %t: Received Data: %h", $time, rx_data);
        
        #2000;
        $finish;
    end

endmodule