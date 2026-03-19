// ts_link_master.v —— 125MHz 下串行发帧
module ts_link_master (
    input  wire        clk125,
    input  wire        rst,
    input  wire        frame_start,     // 拉高1拍开始一帧
    input  wire [67:0] timestamp_in,    // 待发 68b 时间戳
    input  wire        pps_in,          // 当帧的 PPS 标志（1表示此帧夹带PPS=1）
    output wire        tx_bit,          // 串行输出，MSB-first
    output reg         busy             // 发帧期间=1
);
    localparam PREAMBLE = 16'h55AA;
    localparam TOTAL_BITS = 16 + 68 + 1 + 8; // 93

    reg [6:0]  bit_cnt;         // 0..92
    reg [15:0] pre_shift;
    reg [67:0] ts_reg;
    reg        pps_reg;
    reg [7:0]  crc_reg;
    wire [7:0] crc_next;
    reg tx_bit_reg;
    assign tx_bit = tx_bit_reg;

    // 将即将送出的位也推进到 CRC（先 ts 68 位，再 pps 1 位；16位前导码不计入 CRC）
    wire       sending_ts  = busy && (bit_cnt >= 7'd16) && (bit_cnt <  7'd84);
    wire       sending_pps = busy && (bit_cnt == 7'd84);

    // 下一个要送出的“有效载荷位”（供 CRC 使用）
    wire       payload_bit =
        sending_ts  ? ts_reg[67] :
        sending_pps ? pps_reg    :
                      1'b0;

    crc8_07_bit u_crc (
        .bit_in (payload_bit),
        .crc_in (crc_reg),
        .crc_out(crc_next)
    );

    always @(posedge clk125) begin
        if (rst) begin
            busy      <= 1'b0;
            tx_bit_reg<= 1'b1;
            bit_cnt   <= 7'd0;
            pre_shift <= PREAMBLE;
            ts_reg    <= 68'd0;
            pps_reg   <= 1'b0;
            crc_reg   <= 8'h00;
        end else begin
            pps_reg   <= pps_in;
            if (!busy) begin
                if (pps_in & ~pps_reg) begin
                    busy      <= 1'b1;
                    bit_cnt   <= 7'd0;
                    pre_shift <= PREAMBLE;
                    ts_reg    <= timestamp_in;
                    //pps_reg   <= pps_in;
                    crc_reg   <= 8'h00; // CRC 初值
                end
                tx_bit_reg <= 1'b1;
            end else begin
                // busy == 1：输出位并更新寄存
                if (bit_cnt < 7'd16) begin
                    // 发送前导码 MSB-first
                    tx_bit_reg    <= pre_shift[15];
                    pre_shift <= {pre_shift[14:0], 1'b0};
                end else if (bit_cnt < 7'd84) begin
                    // 发送 68-bit 时间戳，MSB-first
                    tx_bit_reg    <= ts_reg[67];
                    ts_reg    <= {ts_reg[66:0], 1'b0};
                    crc_reg   <= crc_next; // 将该位计入 CRC
                end else if (bit_cnt == 7'd84) begin
                    // 发送 1-bit PPS
                    tx_bit_reg    <= 1'b1;// pps_reg;
                    crc_reg   <= crc_next; // 将该位也计入 CRC
                end else begin
                    // 发送 CRC8（8bit, MSB-first）
                    tx_bit_reg    <= crc_reg[7];
                    crc_reg   <= {crc_reg[6:0], 1'b0}; // 仅用于移出显示，不再参与计算
                end

                // 计数控制
                if (bit_cnt == (TOTAL_BITS-1)) begin
                    busy    <= 1'b0;
                end
                bit_cnt <= bit_cnt + 7'd1;
            end
        end
    end
endmodule


// crc8_07_bit.v  —— 单比特推进，MSB-first
module crc8_07_bit (
    input  wire bit_in,       // 串行输入，比特顺序 MSB-first
    input  wire [7:0] crc_in, // 上一拍 CRC
    output wire [7:0] crc_out // 下一拍 CRC
);
    // feedback = MSB ^ 输入位
    wire fb = crc_in[7] ^ bit_in;

    assign crc_out[7] = crc_in[6];
    assign crc_out[6] = crc_in[5];
    assign crc_out[5] = crc_in[4];
    assign crc_out[4] = crc_in[3] ^ fb;
    assign crc_out[3] = crc_in[2] ^ fb;
    assign crc_out[2] = crc_in[1];
    assign crc_out[1] = crc_in[0];
    assign crc_out[0] = fb;
endmodule
