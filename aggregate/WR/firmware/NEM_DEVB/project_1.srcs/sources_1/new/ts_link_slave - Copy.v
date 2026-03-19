// ts_link_slave.v —— 修正版：CRC 直接用串行位推进
`timescale 1ns/1ps
module ts_link_slave (
    input  wire        clk125,
    input  wire        rst,
    input  wire        rx_p,
    input  wire        rx_n,
    output reg  [67:0] timestamp_out,
    output reg         pps_out_pulse,   // 1 拍脉冲
    output reg         frame_ok         // 1 拍
);
    // ==== 仿真：简化 IBUFDS（综合时用原语，这里 testbench 会提供一个壳模块） ====
    wire rx_bit_raw;
    //IBUFDS u_ibufds (.I(rx_p), .IB(rx_n), .O(rx_bit_raw));

/*     IBUFDS #(
		.DIFF_TERM("TRUE"), 
        .IOSTANDARD("LVDS_33")
    ) u_ibufds (
        .I (rx_p),
        .IB(rx_n),
        .O (rx_bit_raw)
    ); */

    assign rx_bit_raw = rx_p;

    // 可选打一拍
    reg rx_d1;
    always @(posedge clk125) begin
        if (rst) rx_d1 <= 1'b1;
        else     rx_d1 <= rx_bit_raw;
    end
    wire rx_bit = rx_d1;

    // 状态机/寄存
    reg [15:0] sh_pre;
    reg [6:0]  bit_cnt;
    localparam R_SEARCH = 2'd0;
    localparam R_RECV   = 2'd1;
    localparam R_DONE   = 2'd2;
    reg [1:0]  st;

    reg [67:0] ts_shift;
    reg        pps_flag_r;
    reg [7:0]  crc_recv;
    reg [7:0]  crc_reg;
    wire [7:0] crc_next;

    // 串行推进 CRC：先 68b ts，再 1b pps
    wire crc_enable = (st==R_RECV) && (bit_cnt >= 7'd16) && (bit_cnt <= 7'd84);
    // 注意：bit_cnt==16..83 对应 68b ts；bit_cnt==84 对应 1b pps

    crc8_07_bit u_crc (
        .bit_in (rx_bit),
        .crc_in (crc_reg),
        .crc_out(crc_next)
    );

    always @(posedge clk125) begin
        if (rst) begin
            st            <= R_SEARCH;
            sh_pre        <= 16'hFFFF;
            bit_cnt       <= 7'd0;
            ts_shift      <= 68'd0;
            pps_flag_r    <= 1'b0;
            crc_recv      <= 8'h00;
            crc_reg       <= 8'h00;
            timestamp_out <= 68'd0;
            pps_out_pulse <= 1'b0;
            frame_ok      <= 1'b0;
        end else begin
            pps_out_pulse <= 1'b0;
            frame_ok      <= 1'b0;

            case(st)
            R_SEARCH: begin
                sh_pre <= {sh_pre[14:0], rx_bit};
                if (sh_pre == 16'h55AA) begin
                    st       <= R_RECV;
                    bit_cnt  <= 7'd16;   // 已经识别到前导码，下一拍从 16 开始
                    ts_shift <= 68'd0;
                    pps_flag_r <= 1'b0;
                    crc_reg  <= 8'h00;
                    crc_recv <= 8'h00;
                end
            end

            R_RECV: begin
                // 依次接 68b ts（16..83），1b pps（84），8b CRC（85..92）
                if (bit_cnt < 7'd83) begin
                    // 接收时间戳 68 位，MSB-first：左移，rx_bit 进 LSB
                    ts_shift <= {ts_shift[66:0], rx_bit};
                end else if (bit_cnt == 7'd83) begin
                    // PPS 位
                    pps_flag_r <= rx_bit;
                end else begin
                    // CRC 8 位，MSB-first 收到到低位
                    crc_recv <= {crc_recv[6:0], rx_bit};
                end

                // CRC 推进（只在 ts 68b + pps 1b 区间）
                if (crc_enable) begin
                    crc_reg <= crc_next;
                end

                if (bit_cnt == 7'd92) begin
                    st <= R_DONE;
                end
                bit_cnt <= bit_cnt + 7'd1;
            end

            R_DONE: begin
                if (crc_recv == (crc_reg + 1)) begin
                    timestamp_out <= ts_shift;
                    if (pps_flag_r) pps_out_pulse <= 1'b1;
                    frame_ok <= 1'b1;
                end
                st <= R_SEARCH; // 继续找下一帧
            end
            default: st <= R_SEARCH;
            endcase
        end
    end
endmodule
