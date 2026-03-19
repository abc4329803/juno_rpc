`timescale 1ns / 1ps

module slave_tx #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH = 16
)(
    input wire clk,              
    input wire rst,
    input wire [1:0] uart_cmd,   
    
    output reg tx_ready,
    input wire tx_data_valid,
    input wire [PAYLOAD_WIDTH-1:0] tx_data,
    
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

    // reg [2:0] state;
    
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
            tx_ready <= 1'b0;
            header_cnt <= 0;
            bit_cnt <= 0;
            crc_reg <= 16'hFFFF;
            sending_sync_packet <= 0;
        end else begin
            // 状态机重置逻辑
            if (uart_cmd == 2'b01 && state != S_TRAIN) begin
                state <= S_TRAIN;
                tx_ready <= 1'b0;
                header_cnt <= 0;
                sending_sync_packet <= 0;
            end 
            else begin
                case (state)
                    S_TRAIN: begin
                        tx_bit <= training_pattern[7 - header_cnt[2:0]];
                        header_cnt <= header_cnt + 1;
                        
                        // 当 Master 请求 Sync (10) 或 Data (11) 时，退出训练
                        if (uart_cmd == 2'b10 || uart_cmd == 2'b11) begin
                             state <= S_IDLE_SCAN;
                             header_cnt <= 0;
                             bit_cnt <= 0;
                        end
                    end

                    S_IDLE_SCAN: begin
                        tx_bit <= idle_pattern[7 - bit_cnt[2:0]]; 
                        bit_cnt <= bit_cnt + 1;
                        
                        // [关键修改]: 处理 Master 的同步请求 (2'b10)
                        // 如果 Master 请求 Sync，且我们没有正在发，则强制构造一个空包
                        if (uart_cmd == 2'b10) begin
                            shift_reg <= {PAYLOAD_WIDTH{1'b0}}; // 发送全0作为同步填充
                            tx_ready <= 1'b0;     
                            state <= S_LATCH;
                            header_cnt <= 0;
                            bit_cnt <= 0;
                            sending_sync_packet <= 1; // 标记这是同步包，不需要外部Valid
                        end
                        // 正常数据模式 (2'b11)
                        else begin
                            tx_ready <= 1'b1; 
                            if (tx_data_valid) begin
                                shift_reg <= tx_data; 
                                tx_ready <= 1'b0;     
                                state <= S_LATCH;
                                header_cnt <= 0;
                                bit_cnt <= 0;
                                sending_sync_packet <= 0;
                            end
                        end
                    end
                    
                    S_LATCH: begin
                        tx_bit <= sync_header[63]; 
                        crc_reg <= 16'hFFFF; 
                        header_cnt <= 1;     
                        state <= S_SEND_HEAD;
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
                        // 逻辑不变，移位发送 shift_reg
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