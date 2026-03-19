`timescale 1ns / 1ps

module slave_tx_axi #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH = 16
)(
    input wire clk,              
    input wire rst,
    input wire [1:0] uart_cmd,   
    
    // --- AXI4-Stream Interface (匹配 ISE FIFO) ---
    // Slave 准备好接收数据信号 (对应 FIFO 的 m_axis_tready)
    output reg s_axis_tready,
    // FIFO 数据有效信号 (对应 FIFO 的 m_axis_tvalid)
    input wire s_axis_tvalid,
    // FIFO 数据总线 (对应 FIFO 的 m_axis_tdata)
    input wire [PAYLOAD_WIDTH-1:0] s_axis_tdata,
    
    // --- 物理接口 ---
    output wire tx_p,
    output wire tx_n,
    output reg [2:0] state
);

    localparam S_TRAIN      = 3'd0;
    localparam S_IDLE_SCAN  = 3'd1; 
    localparam S_LATCH      = 3'd2; 
    localparam S_SEND_HEAD  = 3'd3;
    localparam S_SEND_DATA  = 3'd4;
    localparam S_SEND_CRC   = 3'd5;

    // reg [2:0] state; // 已在端口列表中定义为 output reg
    
    reg [7:0] training_pattern = 8'hB5; 
    reg [7:0] idle_pattern     = 8'h55; 
    reg [63:0] sync_header     = 64'hE15D_98AF_2B4C_7036; 

    reg [PAYLOAD_WIDTH-1:0] shift_reg;
    reg [15:0] crc_reg;
    reg [7:0] bit_cnt; 
    reg [6:0] header_cnt; 
    reg tx_bit;

    // 内部标志：是否正在发送强制同步包
    reg sending_sync_packet;

    function [15:0] next_crc;
        input [15:0] current_crc;
        input serial_in;
        begin
            next_crc = {current_crc[14:0], 1'b0} ^ ({16{(current_crc[15] ^ serial_in)}} & 16'h1021); 
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_TRAIN;
            tx_bit <= 1'b1;
            s_axis_tready <= 1'b0; // 复位时该信号拉低
            header_cnt <= 0;
            bit_cnt <= 0;
            crc_reg <= 16'hFFFF;
            sending_sync_packet <= 0;
        end else begin
            // 状态机重置逻辑
            if (uart_cmd == 2'b01 && state != S_TRAIN) begin
                state <= S_TRAIN;
                s_axis_tready <= 1'b0; // 强制进入训练时，停止接收数据
                header_cnt <= 0;
                sending_sync_packet <= 0;
            end 
            else begin
                case (state)
                    S_TRAIN: begin
                        tx_bit <= training_pattern[7 - header_cnt[2:0]];
                        header_cnt <= header_cnt + 1;
                        s_axis_tready <= 1'b0; // 训练期间不接收
                        
                        // 当 Master 请求 Sync (10) 或 Data (11) 时，退出训练
                        if (uart_cmd == 2'b10 || uart_cmd == 2'b11) begin
                             state <= S_IDLE_SCAN;
                             // [优化]: 预先拉高 Ready，进入 IDLE 的第一个周期即可接收数据
                             // 但如果是 Sync 请求 (10)，则不拉高，因为我们要发空包
                             if (uart_cmd == 2'b10) 
                                 s_axis_tready <= 1'b0;
                             else 
                                 s_axis_tready <= 1'b1;
                             
                             header_cnt <= 0;
                             bit_cnt <= 0;
                        end
                    end

                    S_IDLE_SCAN: begin
                        tx_bit <= idle_pattern[7 - bit_cnt[2:0]]; 
                        bit_cnt <= bit_cnt + 1;
                        
                        // 处理 Master 的同步请求 (2'b10) - 优先级最高
                        if (uart_cmd == 2'b10) begin
                            shift_reg <= {PAYLOAD_WIDTH{1'b0}}; 
                            s_axis_tready <= 1'b0;     
                            state <= S_LATCH;
                            header_cnt <= 0;
                            bit_cnt <= 0;
                            sending_sync_packet <= 1; 
                        end
                        // 正常数据模式 (2'b11) - AXI4-Stream 握手逻辑
                        else begin
                            // 保持 Ready 为高 (除非握手成功)
                            // 握手成功条件: Valid=1 AND Ready=1
                            if (s_axis_tvalid && s_axis_tready) begin
                                shift_reg <= s_axis_tdata; // 锁存数据
                                s_axis_tready <= 1'b0;     // 拉低 Ready，开始处理数据
                                state <= S_LATCH;
                                header_cnt <= 0;
                                bit_cnt <= 0;
                                sending_sync_packet <= 0;
                            end else begin
                                // 如果没有 Valid，保持 Ready 为高，等待数据
                                s_axis_tready <= 1'b1;
                            end
                        end
                    end
                    
                    S_LATCH: begin
                        tx_bit <= sync_header[63]; 
                        crc_reg <= 16'hFFFF; 
                        header_cnt <= 1;     
                        state <= S_SEND_HEAD;
                        // 正在处理数据，Ready 保持为 0
                        s_axis_tready <= 1'b0;
                    end

                    S_SEND_HEAD: begin
                        tx_bit <= sync_header[63 - header_cnt];
                        if (header_cnt == 63) begin
                            header_cnt <= 0;
                            bit_cnt <= 0;
                            state <= S_SEND_DATA;
                        end else begin
                            header_cnt <= header_cnt + 1;
                        end
                    end

                    S_SEND_DATA: begin
                        if (bit_cnt == 0) begin
                            tx_bit <= shift_reg[PAYLOAD_WIDTH - 1];
                            crc_reg <= next_crc(16'hFFFF, shift_reg[PAYLOAD_WIDTH - 1]);
                            shift_reg[PAYLOAD_WIDTH-1:1] <= shift_reg[PAYLOAD_WIDTH-2:0];
                        end else begin
                            tx_bit <= shift_reg[PAYLOAD_WIDTH - 1];
                            shift_reg <= {shift_reg[PAYLOAD_WIDTH-2:0], 1'b0};
                            crc_reg <= next_crc(crc_reg, shift_reg[PAYLOAD_WIDTH - 1]);
                        end

                        if (bit_cnt == PAYLOAD_WIDTH - 1) begin
                            bit_cnt <= 0;
                            state <= S_SEND_CRC;
                        end else begin
                            bit_cnt <= bit_cnt + 1;
                        end
                    end

                    S_SEND_CRC: begin
                        tx_bit <= crc_reg[15];
                        crc_reg <= {crc_reg[14:0], 1'b0};
                        if (bit_cnt == CRC_WIDTH - 1) begin
                            state <= S_IDLE_SCAN; 
                            bit_cnt <= 0;
                            
                            // [优化]: 提前拉高 Ready
                            // 在 CRC 发送完的瞬间，我们知道下一个状态是 IDLE_SCAN
                            // 如果 Master 没有请求同步(10)，我们立即准备好接收下一包
                            if (uart_cmd != 2'b10) begin
                                s_axis_tready <= 1'b1;
                            end else begin
                                s_axis_tready <= 1'b0;
                            end
                        end else begin
                            bit_cnt <= bit_cnt + 1;
                        end
                    end
                endcase
            end
        end
    end

    OBUFDS obufds_inst (.O(tx_p), .OB(tx_n), .I(tx_bit));

endmodule