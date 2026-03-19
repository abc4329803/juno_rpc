// ============================================================================
// 1. 波特率生成模块 (Baud Rate Generator)
// ============================================================================
module UART_BaudGen #(
    parameter CLK_FREQ = 25000000, // 修改：25MHz
    parameter BAUD_RATE = 9600,    // 修改：9600 (适配25MHz精度)
    parameter OVERSAMPLE = 16  // 接收端通常使用16倍过采样
)(
    input  wire clk,
    input  wire rst_n,
    output wire tx_tick,
    output wire rx_sample_tick
);
    // 50MHz / 115200 / 16 = 27.12 -> 整数27。误差 (27.12-27)/27.12 = 0.4%。
    // 误差极小，非常适合通信。
    localparam TX_ACC_MAX = CLK_FREQ / BAUD_RATE;
    localparam RX_ACC_MAX = CLK_FREQ / (BAUD_RATE * OVERSAMPLE);

    reg [31:0] tx_acc;
    reg [31:0] rx_acc;

    assign tx_tick = (tx_acc == 0);
    assign rx_sample_tick = (rx_acc == 0);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_acc <= 0;
            rx_acc <= 0;
        end else begin
            if (tx_acc >= TX_ACC_MAX - 1) tx_acc <= 0;
            else tx_acc <= tx_acc + 1;

            if (rx_acc >= RX_ACC_MAX - 1) rx_acc <= 0;
            else rx_acc <= rx_acc + 1;
        end
    end
endmodule

// ============================================================================
// 2. 发送模块 (Standard TX)
// ============================================================================
module UART_TX (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tx_tick,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    output reg        txd,
    output wire       tx_busy
);
    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0] state;
    reg [2:0] bit_cnt;
    reg [7:0] data_reg;
    reg       tx_req_latched;

    assign tx_busy = (state != IDLE) || tx_req_latched;

    // 锁存逻辑保留，防止丢包
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_req_latched <= 0;
        end else begin
            if (tx_start) begin
                tx_req_latched <= 1;
            end else if (state == IDLE && tx_req_latched && tx_tick) begin
                tx_req_latched <= 0;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= IDLE;
            txd     <= 1'b1;
            bit_cnt <= 0;
            data_reg <= 0;
        end else begin
            if (tx_tick) begin
                case (state)
                    IDLE: begin
                        txd <= 1'b1;
                        if (tx_req_latched || tx_start) begin
                            state <= START;
                            data_reg <= tx_data;
                            txd <= 1'b0;
                        end
                    end
                    START: begin
                        state <= DATA;
                        bit_cnt <= 0;
                        txd <= data_reg[0];
                    end
                    DATA: begin
                        if (bit_cnt == 7) begin
                            state <= STOP;
                            txd <= 1'b1;
                        end else begin
                            bit_cnt <= bit_cnt + 1;
                            data_reg <= data_reg >> 1;
                            txd <= data_reg[1];
                        end
                    end
                    STOP: begin
                        state <= IDLE;
                    end
                    default: state <= IDLE;
                endcase
            end
        end
    end
endmodule

// ============================================================================
// 3. 抗噪接收模块 (Robust RX)
// ============================================================================
module UART_RX_Robust (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       rx_sample_tick,
    input  wire       rxd_in,
    output reg        rx_done,
    output reg [7:0]  rx_data,
    output reg        rx_err
);
    reg rxd_sync1, rxd_sync2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin rxd_sync1 <= 1; rxd_sync2 <= 1; end
        else begin rxd_sync1 <= rxd_in; rxd_sync2 <= rxd_sync1; end
    end

    localparam IDLE  = 2'b00;
    localparam START = 2'b01;
    localparam DATA  = 2'b10;
    localparam STOP  = 2'b11;

    reg [1:0] state;
    reg [3:0] sample_cnt;
    reg [2:0] bit_cnt;
    reg [7:0] shift_reg;
    reg [1:0] vote_sum;

    wire is_sampling_phase;
    assign is_sampling_phase = (sample_cnt >= 6 && sample_cnt <= 8);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            sample_cnt <= 0;
            bit_cnt <= 0;
            rx_done <= 0;
            rx_data <= 0;
            rx_err <= 0;
            vote_sum <= 0;
            shift_reg <= 0; // 保留：复位逻辑，确保无红线
        end else begin
            rx_done <= 0;
            
            if (rx_sample_tick) begin
                case (state)
                    IDLE: begin
                        if (rxd_sync2 == 0) begin
                            state <= START;
                            sample_cnt <= 0;
                            vote_sum <= 0;
                        end
                    end

                    START: begin
                        if (sample_cnt == 7) begin
                            if (rxd_sync2 == 1) state <= IDLE;
                        end
                        if (sample_cnt == 15) begin
                            state <= DATA;
                            sample_cnt <= 0;
                            bit_cnt <= 0;
                            vote_sum <= 0;
                        end else begin
                            sample_cnt <= sample_cnt + 1;
                        end
                    end

                    DATA: begin
                        if (is_sampling_phase && rxd_sync2) vote_sum <= vote_sum + 1;

                        if (sample_cnt == 15) begin
                            sample_cnt <= 0;
                            shift_reg[bit_cnt] <= (vote_sum >= 2) ? 1'b1 : 1'b0;
                            vote_sum <= 0;

                            if (bit_cnt == 7) begin
                                state <= STOP;
                            end else begin
                                bit_cnt <= bit_cnt + 1;
                            end
                        end else begin
                            sample_cnt <= sample_cnt + 1;
                        end
                    end

                    STOP: begin
                        if (is_sampling_phase && rxd_sync2) vote_sum <= vote_sum + 1;

                        if (sample_cnt == 15) begin
                            if (vote_sum >= 2) begin
                                rx_data <= shift_reg;
                                rx_done <= 1;
                                rx_err <= 0;
                            end else begin
                                rx_err <= 1;
                            end
                            state <= IDLE;
                        end else begin
                            sample_cnt <= sample_cnt + 1;
                        end
                    end
                endcase
            end
        end
    end
endmodule

// ============================================================================
// 4. 包校验控制层 (Packet Control)
// ============================================================================
module UART_Packet_Ctrl (
    input  wire clk,
    input  wire rst_n,
    
    // 用户接口
    input  wire send_req,
    input  wire [7:0] user_tx_data,
    output reg  [7:0] user_rx_data,
    output reg  user_rx_valid,  // 只有校验通过才变高
    output wire tx_ready,       // 可以发送新数据
    
    // 物理层接口 (连接 IOBUFDS 转换后的单端信号)
    output wire uart_tx_pin,
    input  wire uart_rx_pin,

    output reg [1:0] rx_st,
    output reg [7:0] temp_rx_data
);

    parameter CLK_FREQ = 25000000; // 修改：25MHz
    parameter BAUD_RATE = 9600;    // 修改：9600

    wire tick_tx, tick_rx_samp;
    wire tx_busy;
    reg  tx_start_raw;
    reg  [7:0] tx_data_raw;
    
    wire rx_done_raw;
    wire [7:0] rx_data_raw;
    wire rx_err_raw;

    UART_BaudGen #(.CLK_FREQ(CLK_FREQ), .BAUD_RATE(BAUD_RATE)) u_baud (
        .clk(clk), .rst_n(rst_n), .tx_tick(tick_tx), .rx_sample_tick(tick_rx_samp)
    );

    UART_TX u_tx (
        .clk(clk), .rst_n(rst_n), .tx_tick(tick_tx),
        .tx_start(tx_start_raw), .tx_data(tx_data_raw), .txd(uart_tx_pin), .tx_busy(tx_busy)
    );

    UART_RX_Robust u_rx (
        .clk(clk), .rst_n(rst_n), .rx_sample_tick(tick_rx_samp),
        .rxd_in(uart_rx_pin), .rx_done(rx_done_raw), .rx_data(rx_data_raw), .rx_err(rx_err_raw)
    );

    localparam S_IDLE = 2'b00;
    localparam S_HEAD = 2'b01;
    localparam S_DATA = 2'b10;
    localparam S_SUM  = 2'b11;

    reg [1:0] tx_st;
    reg [7:0] saved_tx_data;

    assign tx_ready = (tx_st == S_IDLE);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_st <= S_IDLE;
            tx_start_raw <= 0;
            tx_data_raw <= 0;
            saved_tx_data <= 0;
        end else begin
            tx_start_raw <= 0;

            case (tx_st)
                S_IDLE: begin
                    if (send_req) begin
                        saved_tx_data <= user_tx_data;
                        tx_data_raw <= 8'hAA;
                        tx_start_raw <= 1;
                        tx_st <= S_HEAD;
                    end
                end
                S_HEAD: begin
                    if (!tx_busy && !tx_start_raw) begin
                        tx_data_raw <= saved_tx_data;
                        tx_start_raw <= 1;
                        tx_st <= S_DATA;
                    end
                end
                S_DATA: begin
                    if (!tx_busy && !tx_start_raw) begin
                        tx_data_raw <= 8'hAA + saved_tx_data;
                        tx_start_raw <= 1;
                        tx_st <= S_SUM;
                    end
                end
                S_SUM: begin
                    if (!tx_busy && !tx_start_raw) begin
                        tx_st <= S_IDLE;
                    end
                end
            endcase
        end
    end

    localparam R_IDLE = 2'b00;
    localparam R_DATA = 2'b01;
    localparam R_SUM  = 2'b10;

    // reg [1:0] rx_st;
    // reg [7:0] temp_rx_data;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_st <= R_IDLE;
            user_rx_valid <= 0;
            user_rx_data <= 0;
        end else begin
            user_rx_valid <= 0;
            
            if (rx_done_raw && !rx_err_raw) begin
                case (rx_st)
                    R_IDLE: begin
                        if (rx_data_raw == 8'hAA) begin
                            rx_st <= R_DATA;
                        end
                    end
                    R_DATA: begin
                        temp_rx_data <= rx_data_raw;
                        rx_st <= R_SUM;
                    end
                    R_SUM: begin
                        if (rx_data_raw == (8'hAA + temp_rx_data)) begin
                            user_rx_data <= temp_rx_data;
                            user_rx_valid <= 1;
                        end
                        rx_st <= R_IDLE;
                    end
                endcase
            end
        end
    end
endmodule