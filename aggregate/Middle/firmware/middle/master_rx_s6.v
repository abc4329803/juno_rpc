`timescale 1ns / 1ps

module master_rx_s6 #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH = 16
)(
    input wire clk_250m,      // 必须通过 BUFIO2 或 BUFPLL 驱动 (IOCLK)
    input wire clk_62_5m,     // 必须通过 BUFG 驱动 (DIVCLK)
    input wire rst,
    input wire rx_p,
    input wire rx_n,
    
    output reg [1:0] uart_cmd_out, 
    output reg [PAYLOAD_WIDTH-1:0] data_out,
    output reg data_valid,
    output reg crc_error_pulse,
	 output wire rx_ibuf
);

    // =========================================================
    // 1. Spartan-6 差分缓冲与 ISERDES2 (Layer 0: Phy)
    // =========================================================
    //wire rx_ibuf;
    
    // IBUFDS 是通用的，但在 S6 中通常需要配合 IODELAY2 (可选)，这里简化直连
    IBUFDS ibufds_inst (.O(rx_ibuf), .I(rx_p), .IB(rx_n));

    wire [3:0] oversample_data; 
    
    // Spartan-6 ISERDES2 原语实例化
    // 4x Oversampling: DATA_WIDTH=4, SDR Mode
    ISERDES2 #(
        .DATA_WIDTH(4), 
        .DATA_RATE("SDR"), 
        .BITSLIP_ENABLE("FALSE"), 
        .SERDES_MODE("MASTER"), 
        .INTERFACE_TYPE("NETWORKING") // S6 默认接口模式
    ) u_iserdes_s6 (
        .D(rx_ibuf), 
        .CE0(1'b1), 
        .CLK0(clk_250m),      // 高速采样时钟 (IOCLK)
        .CLK1(1'b0),          // SDR 模式下 CLK1 可不用
        .CLKDIV(clk_62_5m),   // 分频时钟 (DIVCLK)
        .RST(rst), 
        // 输出映射：保持与 K7 逻辑一致，Q4 是最新的位，Q1 是最旧的位
        .Q4(oversample_data[3]), 
        .Q3(oversample_data[2]), 
        .Q2(oversample_data[1]), 
        .Q1(oversample_data[0]),
        // 未使用引脚
        .BITSLIP(1'b0),
        .FABRICOUT(),
        .CFB0(), .CFB1(), .DFB(), .SHIFTOUT()
    );

    // =========================================================
    // 2. 辅助函数 (与 K7 版完全一致)
    // =========================================================
    function automatic is_training_pattern;
        input [7:0] val;
        begin
            case (val)
                8'b10110101, 8'b01101011, 8'b11010110, 8'b10101101, 
                8'b01011011, 8'b10110110, 8'b01101101, 8'b11011010: is_training_pattern = 1'b1; 
                default: is_training_pattern = 1'b0;
            endcase
        end
    endfunction

    function [15:0] next_crc;
        input [15:0] current_crc;
        input serial_in;
        begin
            next_crc = {current_crc[14:0], 1'b0} ^ ({16{(current_crc[15] ^ serial_in)}} & 16'h1021); 
        end
    endfunction

    // =========================================================
    // 3. 内部逻辑与状态机 (与 K7 最终修复版完全一致)
    // =========================================================
    reg [1:0] best_tap; 
    reg       tap_locked;
    reg       polarity_inv;
    reg [7:0] stream_shreg [0:3]; 
    reg [8:0] match_cnt    [0:3]; // 9-bit 计数器支持高阈值
    integer i;

    localparam S_M_TRAIN      = 3'd0;
    localparam S_M_WAIT_SYNC  = 3'd1;
    localparam S_M_SCAN       = 3'd2;
    localparam S_M_DATA       = 3'd3;
    localparam S_M_CRC        = 3'd4;

    // 采用高阈值以确保稳定性
    localparam STRICT_LOCK_THRESHOLD = 9'd128; 

    reg [2:0] state;
    reg [63:0] rx_shift_reg;
    reg [7:0]  bit_cnt;
    reg [15:0] crc_calc;
    reg [PAYLOAD_WIDTH-1:0] payload_shift;
    
    reg [3:0] error_counter;
    localparam MAX_ERRORS = 15;

    reg selected_bit;
    always @(*) begin
        if (polarity_inv) selected_bit = ~oversample_data[best_tap];
        else selected_bit = oversample_data[best_tap];
    end

    // --- 主状态机 ---
    always @(posedge clk_62_5m) begin
        if (rst) begin
            state <= S_M_TRAIN;
            uart_cmd_out <= 2'b01;
            tap_locked <= 0;
            best_tap <= 0;
            polarity_inv <= 0;
            error_counter <= 0;
            data_valid <= 0;
            crc_error_pulse <= 0;
            for(i=0; i<4; i=i+1) begin
                stream_shreg[i] <= 0;
                match_cnt[i] <= 0;
            end
        end else begin
            data_valid <= 0;
            crc_error_pulse <= 0;
            rx_shift_reg <= {rx_shift_reg[62:0], selected_bit};

            case (state)
                S_M_TRAIN: begin // 0
                    uart_cmd_out <= 2'b01;
                    tap_locked <= 0;
                    
                    for (i=0; i<4; i=i+1) begin
                        stream_shreg[i] <= {stream_shreg[i][6:0], oversample_data[i]};
                        
                        if (is_training_pattern(stream_shreg[i])) begin
                            if (match_cnt[i] < 500) match_cnt[i] <= match_cnt[i] + 1;
                        end else if (is_training_pattern(~stream_shreg[i])) begin
                            if (match_cnt[i] < 500) match_cnt[i] <= match_cnt[i] + 1;
                        end else begin
                            match_cnt[i] <= 0;
                        end
                    end

                    if (!tap_locked) begin
                        for (i=0; i<4; i=i+1) begin
                            if (match_cnt[i] > STRICT_LOCK_THRESHOLD) begin
                                best_tap <= i[1:0];
                                tap_locked <= 1;
                                if (is_training_pattern(~stream_shreg[i])) polarity_inv <= 1;
                                else polarity_inv <= 0;
                                state <= S_M_WAIT_SYNC; 
                                error_counter <= 0;
                            end
                        end
                    end
                end

                S_M_WAIT_SYNC: begin // 1
                    uart_cmd_out <= 2'b10;
                    if (rx_shift_reg == 64'hE15D_98AF_2B4C_7036) begin
                        state <= S_M_SCAN;
                    end
                end

                S_M_SCAN: begin // 2
                    uart_cmd_out <= 2'b11; 
                    if (rx_shift_reg == 64'hE15D_98AF_2B4C_7036) begin
                        state <= S_M_DATA;
                        bit_cnt <= 0;
                        crc_calc <= 16'hFFFF; 
                    end
                end

                S_M_DATA: begin // 3
                    uart_cmd_out <= 2'b11;
                    payload_shift <= {payload_shift[PAYLOAD_WIDTH-2:0], selected_bit};
                    crc_calc <= next_crc(crc_calc, selected_bit);
                    
                    if (bit_cnt == PAYLOAD_WIDTH - 1) begin
                        bit_cnt <= 0;
                        state <= S_M_CRC;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end

                S_M_CRC: begin // 4
                    uart_cmd_out <= 2'b11;
                    if (bit_cnt == CRC_WIDTH - 1) begin
                        if (rx_shift_reg[15:0] == crc_calc) begin
                            // Pass
                            data_valid <= 1;
                            data_out <= payload_shift;
                            error_counter <= 0; 
                            state <= S_M_SCAN; 
                        end else begin
                            // Fail
                            crc_error_pulse <= 1;
                            if (error_counter >= MAX_ERRORS) begin
                                state <= S_M_TRAIN; 
                                error_counter <= 0;
                            end else begin
                                error_counter <= error_counter + 1;
                                state <= S_M_SCAN;
                            end
                        end
                        bit_cnt <= 0;
                    end else begin
                        bit_cnt <= bit_cnt + 1;
                    end
                end
            endcase
        end
    end

	 wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0) // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_0 ila_0_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk_62_5m),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
		  .TRIG0(uart_cmd_out),  // IN BUS [7:0]
        .TRIG1(crc_error_pulse),
        .TRIG2(state),  // IN BUS [7:0]
        .TRIG3(payload_shift),
		  .TRIG4(crc_calc),
		  .TRIG5(rx_shift_reg[15:0]),
		  .TRIG6(data_valid),
		  .TRIG7(selected_bit),
		  .TRIG8(bit_cnt)
    );

endmodule