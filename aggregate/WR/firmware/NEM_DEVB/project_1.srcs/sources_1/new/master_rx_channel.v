`timescale 1ns / 1ps

module master_rx_channel #(
    parameter PAYLOAD_WIDTH = 112,
    parameter CRC_WIDTH     = 16,
    parameter TRAIN_PATTERN = 8'hB5,
    parameter SYNC_HEADER   = {112'h112233445566778899AABBCCDDEE, 16'hFFFF}
)(
    input  wire clk_250m,    
    input  wire clk_62_5m,   
    input  wire rst_n,
    input  wire rx_p, input wire rx_n,
    
    // [修改] 2bit 控制
    output reg [1:0] uart_tx_trigger, 
    
    output wire [PAYLOAD_WIDTH-1:0] m_data_out,
    output wire m_data_valid,
    output wire m_crc_error,
    output reg align_done
);

    localparam TRANS_WIDTH = PAYLOAD_WIDTH + CRC_WIDTH;

    // 1. 物理层 (4x SDR)
    wire rx_ibuf;
    IBUFDS #(.DIFF_TERM("TRUE"), .IOSTANDARD("LVDS_25")) u_ibufds (.I(rx_p), .IB(rx_n), .O(rx_ibuf));

    wire [3:0] oversample_data; 
    ISERDESE2 #(.DATA_WIDTH(4), .DATA_RATE("SDR"), .INTERFACE_TYPE("MEMORY"), .SERDES_MODE("MASTER")) 
    u_iserdes (.D(rx_ibuf), .CE1(1'b1), .CE2(1'b1), .CLK(clk_250m), .CLKDIV(clk_62_5m), .RST(~rst_n),
        .Q4(oversample_data[3]), .Q3(oversample_data[2]), .Q2(oversample_data[1]), .Q1(oversample_data[0]), 
        .BITSLIP(1'b0)
        //.SHIFTIN(1'b0)
        );

    // 2. 最佳采样点逻辑
    reg [1:0] best_tap; 
    reg [23:0] shreg_stream [0:3]; 
    reg [7:0]  match_cnt    [0:3]; 
    reg [3:0]  tap_good_mask;      
    
    function automatic is_rotation;
        input [7:0] data; input [7:0] pat;
        integer k; reg [7:0] tmp;
        begin
            is_rotation = 0; tmp = pat;
            for (k=0; k<8; k=k+1) begin
                if (data == tmp) is_rotation = 1;
                tmp = {tmp[6:0], tmp[7]};
            end
        end
    endfunction

    localparam ST_SCAN=0, ST_LOCK=1, ST_HEADER=2, ST_RUN=3;
    reg [2:0] state;
    reg [15:0] timer;
    reg polarity_inv;
    integer i;
    
    always @(posedge clk_62_5m or negedge rst_n) begin
        if(!rst_n) begin
            state <= ST_SCAN; timer <= 0; best_tap <= 0; 
            uart_tx_trigger <= 2'b00; // Reset -> IDLE
            align_done <= 0; polarity_inv <= 0; tap_good_mask <= 0;
            for(i=0; i<4; i=i+1) begin shreg_stream[i]<=0; match_cnt[i]<=0; end
        end else begin
            for(i=0; i<4; i=i+1) shreg_stream[i] <= {shreg_stream[i][22:0], oversample_data[i]};
            
            case(state)
                ST_SCAN: begin
                    uart_tx_trigger <= 2'b01; // [修改] Step 1: 请求 Training
                    
                    if(timer < 128) begin
                        timer <= timer + 1;
                        for(i=0; i<4; i=i+1) begin
                            if (is_rotation(shreg_stream[i][7:0], TRAIN_PATTERN) || 
                                is_rotation(shreg_stream[i][7:0], ~TRAIN_PATTERN)) begin
                                match_cnt[i] <= match_cnt[i] + 1;
                            end
                        end
                    end else begin
                        tap_good_mask = 0;
                        for(i=0; i<4; i=i+1) if(match_cnt[i] > 100) tap_good_mask[i] = 1'b1;
                        
                        if (tap_good_mask != 0) begin
                            if(tap_good_mask[2]) best_tap <= 2;
                            else if(tap_good_mask[1]) best_tap <= 1;
                            else if(tap_good_mask[3]) best_tap <= 3;
                            else best_tap <= 0;
                            state <= ST_LOCK;
                        end else begin
                            timer <= 0;
                            for(i=0; i<4; i=i+1) match_cnt[i] <= 0;
                        end
                    end
                end
                
                ST_LOCK: begin
                    if (is_rotation(shreg_stream[best_tap][7:0], TRAIN_PATTERN)) begin
                        polarity_inv <= 0; 
                        uart_tx_trigger <= 2'b10; // [修改] Step 2: 相位锁定，请求 Header
                        state <= ST_HEADER; 
                    end else if (is_rotation(shreg_stream[best_tap][7:0], ~TRAIN_PATTERN)) begin
                        polarity_inv <= 1; 
                        uart_tx_trigger <= 2'b10; // [修改] 请求 Header
                        state <= ST_HEADER;
                    end else begin
                        state <= ST_SCAN; timer <= 0; // 意外失锁
                        for(i=0; i<4; i=i+1) match_cnt[i] <= 0;
                    end
                end
                
                ST_HEADER: begin
                    // 只要内部逻辑识别到了 Header (align_done变高)，就进入数据模式
                    // 内部逻辑在下方
                    if(align_done) begin
                        uart_tx_trigger <= 2'b11; // [修改] Step 3: Header对齐，请求 Data
                        state <= ST_RUN; 
                    end
                end
                
                ST_RUN: begin 
                    // 保持 Data 模式
                end
            endcase
        end
    end

    // 3. 数据恢复、对齐与CRC
    wire raw_bit = oversample_data[best_tap];
    wire final_bit = polarity_inv ? ~raw_bit : raw_bit;
    
    reg [TRANS_WIDTH+7:0] shreg_final;
    reg [7:0] word_cnt;
    reg [TRANS_WIDTH-1:0] data_latched;
    reg valid_pulse;
    reg internal_align_done;
    
    always @(posedge clk_62_5m or negedge rst_n) begin
        if(!rst_n) begin
            shreg_final <= 0; word_cnt <= 0; valid_pulse <= 0; internal_align_done <= 0;
            align_done <= 0;
        end else begin
            shreg_final <= {shreg_final[TRANS_WIDTH+6:0], final_bit};
            valid_pulse <= 0;
            
            if(!internal_align_done) begin
                if (shreg_final[TRANS_WIDTH-1:0] == SYNC_HEADER) begin
                    word_cnt <= 0;
                    internal_align_done <= 1;
                    align_done <= 1; // 触发状态机跳转
                end
            end else begin
                if (word_cnt == TRANS_WIDTH-1) begin
                    word_cnt <= 0;
                    data_latched <= shreg_final[TRANS_WIDTH-1:0];
                    valid_pulse <= 1;
                end else word_cnt <= word_cnt + 1;
            end
        end
    end

    wire [PAYLOAD_WIDTH-1:0] payload = data_latched[TRANS_WIDTH-1 : CRC_WIDTH];
    wire [CRC_WIDTH-1:0]     rx_crc  = data_latched[CRC_WIDTH-1 : 0];
    wire [CRC_WIDTH-1:0]     calc_crc;
    
    crc16_parallel #(.DATA_WIDTH(PAYLOAD_WIDTH)) u_crc (
        .data_in(payload), .crc_out(calc_crc)
    );
    
    assign m_data_out = payload;
    assign m_data_valid = valid_pulse;
    assign m_crc_error = valid_pulse && (rx_crc != calc_crc);

endmodule