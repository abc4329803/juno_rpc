`timescale 1ns / 1ps

module master_rx_oversample #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH = 16
)(
    input wire clk_fast,      // 250 MHz (4x Oversampling Clock)
    input wire rst,
    input wire rx_p,          // 差分输入
    input wire rx_n,
    
    // 给 Slave 的控制指令 (输出给外部 UART 模块)
    output reg [1:0] uart_cmd_out, 
    
    // 接收到的数据
    output reg [PAYLOAD_WIDTH-1:0] data_out,
    output reg data_valid,
    output reg crc_error
);

    // --- 1. 差分输入与同步 ---
    wire rx_raw;
    IBUFDS ibufds_inst (.O(rx_raw), .I(rx_p), .IB(rx_n));

    reg [2:0] rx_sync;
    always @(posedge clk_fast) rx_sync <= {rx_sync[1:0], rx_raw};
    wire rx_in = rx_sync[2]; // 同步后的输入

    // --- 2. 4x 过采样逻辑 ---
    reg [1:0] phase_cnt;
    reg rx_in_d;
    wire edge_detect = (rx_in != rx_in_d);
    reg sample_en;   // 62.5MHz 有效选通信号
    reg sampled_bit; // 采样到的位

    always @(posedge clk_fast) begin
        if (rst) begin
            phase_cnt <= 0;
            rx_in_d <= 0;
        end else begin
            rx_in_d <= rx_in;
            // 边沿重置相位，实现软同步
            if (edge_detect) begin
                phase_cnt <= 0; // 边沿视为相位0
            end else begin
                phase_cnt <= phase_cnt + 1;
            end
        end
    end

    // 在相位 2 (中心) 采样
    always @(posedge clk_fast) begin
        sample_en <= (phase_cnt == 2'd2);
        if (phase_cnt == 2'd2) begin
            sampled_bit <= rx_in;
        end
    end

    // --- 3. 极性控制与解串 ---
    reg polarity_inv;
    wire effective_bit = polarity_inv ? ~sampled_bit : sampled_bit;

    // --- 4. 接收状态机 ---
    localparam S_M_TRAIN  = 3'd0;
    localparam S_M_HEADER = 3'd1;
    localparam S_M_DATA   = 3'd2;
    localparam S_M_CRC    = 3'd3;

    reg [2:0] state;
    reg [7:0] shift_reg_8;
    reg [15:0] shift_reg_16;
    reg [PAYLOAD_WIDTH-1:0] payload_shift;
    reg [15:0] crc_calc;
    reg [7:0] bit_cnt;
    
    // Watchdog: 防止死锁
    reg [15:0] watchdog_cnt; 

    // CRC 函数 (同 Slave)
    function [15:0] next_crc;
        input [15:0] current_crc;
        input serial_in;
        begin
            next_crc = {current_crc[14:0], 1'b0} ^ ({16{(current_crc[15] ^ serial_in)}} & 16'h1021); 
        end
    endfunction

    always @(posedge clk_fast) begin
        if (rst) begin
            state <= S_M_TRAIN;
            uart_cmd_out <= 2'b01; // Default Training
            polarity_inv <= 0;
            data_valid <= 0;
            watchdog_cnt <= 0;
            crc_error <= 0;
        end else if (sample_en) begin // 以下逻辑运行在有效采样点 (等效 62.5MHz)
            
            // 移位寄存器更新
            shift_reg_8 <= {shift_reg_8[6:0], effective_bit};
            shift_reg_16 <= {shift_reg_16[14:0], effective_bit};

            case (state)
                S_M_TRAIN: begin
                    uart_cmd_out <= 2'b01;
                    // 寻找 0xB5 (10110101) 或 反码 0x4A (01001010)
                    if (shift_reg_8 == 8'hB5) begin
                        polarity_inv <= 0;
                        state <= S_M_HEADER;
                        uart_cmd_out <= 2'b10; // Request Header
                        watchdog_cnt <= 0;
                    end else if (shift_reg_8 == 8'h4A) begin
                        polarity_inv <= 1; // 识别到反极性
                        state <= S_M_HEADER;
                        uart_cmd_out <= 2'b10;
                        watchdog_cnt <= 0;
                    end
                end

                S_M_HEADER: begin
                    uart_cmd_out <= 2'b10;
                    // 寻找 Header 0xEB90
                    if (shift_reg_16 == 16'hEB90) begin
                        state <= S_M_DATA;
                        uart_cmd_out <= 2'b11; // Request Data
                        bit_cnt <= 0;
                        crc_calc <= 16'hFFFF;
                        watchdog_cnt <= 0;
                    end else begin
                        // 超时回退
                        if (watchdog_cnt > 1000) state <= S_M_TRAIN;
                        else watchdog_cnt <= watchdog_cnt + 1;
                    end
                end

                S_M_DATA: begin
                    uart_cmd_out <= 2'b11;
                    payload_shift <= {payload_shift[PAYLOAD_WIDTH-2:0], effective_bit};
                    crc_calc <= next_crc(crc_calc, effective_bit);
                    
                    if (bit_cnt == PAYLOAD_WIDTH - 1) begin
                        state <= S_M_CRC;
                        bit_cnt <= 0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                    
                    // 看门狗：如果长期没收到数据(需上层协议支持keepalive，此处仅防死锁)
                    // 此处简化：假设连续流，不做特定超时
                end

                S_M_CRC: begin
                    // 接收 CRC 并校验
                    // 注意：这里我们通过比较接收到的位和计算出的 CRC
                    // 实际上最简单的办法是继续推导 CRC，最终余数为0
                    // 或者接收完16位后对比。这里采用接收后对比。
                    // 这里的 crc_calc 在 bit_cnt=0...15 时不应继续计算 payload 的逻辑
                    // 而是应该移入 shift_reg_16 或者单独处理
                    
                    // 修正：在接收 CRC 阶段，不计算 CRC，只接收
                    shift_reg_16 <= {shift_reg_16[14:0], effective_bit};
                    
                    if (bit_cnt == CRC_WIDTH - 1) begin
                        // 比较接收到的 CRC (在 shift_reg_16 中) 和 计算出的 CRC (crc_calc)
                        // 注意时序：shift_reg_16 当前值就是收到的 CRC
                        if ({shift_reg_16[14:0], effective_bit} == crc_calc) begin
                            data_valid <= 1;
                            data_out <= payload_shift;
                            crc_error <= 0;
                        end else begin
                            data_valid <= 0;
                            crc_error <= 1;
                            // CRC 错误，可能失锁，请求重训
                            state <= S_M_TRAIN; 
                        end
                        state <= S_M_DATA; // 准备接收下一帧 (如果没出错)
                        if ({shift_reg_16[14:0], effective_bit} != crc_calc) state <= S_M_TRAIN; // 出错回退
                        
                        bit_cnt <= 0;
                        crc_calc <= 16'hFFFF; // Reset for next packet
                    end else begin
                        data_valid <= 0;
                        bit_cnt <= bit_cnt + 1;
                    end
                end
            endcase
        end
    end

endmodule