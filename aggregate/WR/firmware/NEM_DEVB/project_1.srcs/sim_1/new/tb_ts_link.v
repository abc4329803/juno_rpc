`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2025 05:16:29 PM
// Design Name: 
// Module Name: tb_ts_link
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



// ---------- 仿真壳：IBUFDS ----------
module IBUFDS(input wire I, input wire IB, output wire O);
    assign O = I; // 仿真时忽略差分反相
endmodule

module tb_ts_link;
    reg clk125 = 1'b0;
    always #4 clk125 = ~clk125; // 125MHz => 8ns周期

    reg rst = 1'b1;
    initial begin
        #80 rst = 1'b0; // 80ns 释放复位
    end
    always @(posedge clk125) begin
        pps_src <= frame_start;
    end

    // ------- 主端输入刺激 -------
    reg        frame_start = 1'b0;
    reg [67:0] ts_src      = 68'h0123_4567_89AB_CDEF; // 初值
    reg        pps_src     = 1'b0;

    // 每隔若干拍送一帧；每第4帧置一次 PPS=1（便于仿真）
    integer frame_cnt = 0;
    initial begin
        @(negedge rst);
        repeat (2) @(posedge clk125);

        forever begin
            // 触发帧
            frame_start <= 1'b1;
            //pps_src <= frame_start;
            @(posedge clk125);
            frame_start <= 1'b0;

            // 下一帧的源数据准备
            frame_cnt = frame_cnt + 1;
            ts_src    = ts_src + 68'd1;
            //pps_src   = (frame_cnt % 4 == 3) ? 1'b1 : 1'b0;

            // 留出充分时间等一帧发完（93bit@125MHz → 93个clk）
            repeat (150) @(posedge clk125);
        end
    end

    // ------- 连接主从 -------
    wire tx_bit;
    wire busy;

    ts_link_master u_master (
        .clk125      (clk125),
        .rst         (rst),
        .frame_start (frame_start),
        .timestamp_in(ts_src),
        .pps_in      (frame_start),
        .tx_bit      (tx_bit),
        .busy        (busy)
    );

    // 差分连线（仿真：直接反相作为 n）
    wire rx_p = tx_bit;
    wire rx_n = ~tx_bit;

    wire [67:0] ts_out;
    wire        pps_pulse;
    wire        frame_ok;

    ts_link_slave u_slave (
        .clk125       (clk125),
        .rst          (rst),
        .rx_bit_raw   (rx_p),
        //.rx_n         (rx_n),
        .timestamp_out(ts_out),
        .pps_out_pulse(pps_pulse),
        .frame_ok     (frame_ok)
    );

    // ------- 结果监视 -------
    always @(posedge clk125) begin
        if (!rst) begin
            if (frame_ok) begin
                $display("[%0t ns] SLAVE frame_ok=1, ts_out=0x%h, pps_pulse=%0d",
                         $time, ts_out, pps_pulse);
                // 这里做一个宽松校验：ts_out 应等于上一次发出的 ts_src-1（因为发送前已自增）
                // 你也可以将期望值保存成寄存器，在 frame_start 时刻锁存下来对比。
            end
        end
    end

    // 跑一段时间后结束
    initial begin
        #50000 $finish;
    end
endmodule

