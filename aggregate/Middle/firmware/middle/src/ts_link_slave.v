// ts_link_slave.v  棺CRC ֱôλƽ
`timescale 1ns/1ps
module ts_link_slave (
    input  wire        clk125,
    input  wire        rst,
    input  wire        rx_bit_raw,
    //input  wire        rx_n,
    output reg  [67:0] timestamp_out,
    output reg         pps_out_pulse,   // 1 
    output reg         frame_ok         // 1 
);
    // ==== 棺 IBUFDSۺʱԭ testbench ṩһģ飩 ====
    //wire rx_bit_raw;
    //IBUFDS u_ibufds (.I(rx_p), .IB(rx_n), .O(rx_bit_raw));



    //assign rx_bit_raw = rx_p;

    // ѡһ
    reg rx_d1;
    always @(posedge clk125) begin
        if (rst) rx_d1 <= 1'b1;
        else     rx_d1 <= rx_bit_raw;
    end
    wire rx_bit = rx_d1;

    // ״̬/Ĵ
    reg [15:0] sh_pre = 16'hFFFF;;
    reg [6:0]  bit_cnt;
    localparam R_SEARCH = 2'd0;
    localparam R_RECV   = 2'd1;
    localparam R_DONE   = 2'd2;
    reg [1:0]  st = R_SEARCH;

    reg [67:0] ts_shift;
    reg        pps_flag_r;
    reg [7:0]  crc_recv;
    reg [7:0]  crc_reg;
    wire [7:0] crc_next;

    // ƽ CRC 68b ts 1b pps
    wire crc_enable = (st==R_RECV) && (bit_cnt >= 7'd16) && (bit_cnt <= 7'd84);
    // ע⣺bit_cnt==16..83 Ӧ 68b tsbit_cnt==84 Ӧ 1b pps

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
                    bit_cnt  <= 7'd16;   // Ѿʶǰ룬һĴ 16 ʼ
                    ts_shift <= 68'd0;
                    pps_flag_r <= 1'b0;
                    crc_reg  <= 8'h00;
                    crc_recv <= 8'h00;
                end
            end

            R_RECV: begin
                // ν 68b ts16..831b pps848b CRC85..92
                if (bit_cnt < 7'd83) begin
                    // ʱ 68 λMSB-firstƣrx_bit  LSB
                    ts_shift <= {ts_shift[66:0], rx_bit};
                end else if (bit_cnt == 7'd83) begin
                    // PPS λ
                    pps_flag_r <= rx_bit;
                end else begin
                    // CRC 8 λMSB-first յλ
                    crc_recv <= {crc_recv[6:0], rx_bit};
                end

                // CRC ƽֻ ts 68b + pps 1b 䣩
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
                st <= R_SEARCH; // һ֡
            end
            default: st <= R_SEARCH;
            endcase
        end
    end
/*
    wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0) // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );

    ila_1 ila_1_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(clk125),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG0(sh_pre),  // IN BUS [7:0]
        .TRIG1(st), // IN BUS [7:0]
        .TRIG2(pps_out_pulse),  // IN BUS [7:0]
        .TRIG3(rx_bit_raw),  // IN BUS [7:0]
        .TRIG4(rst) // IN BUS [7:0]
    ); */
endmodule

module crc8_07_bit (
    input  wire bit_in,       // 룬˳ MSB-first
    input  wire [7:0] crc_in, // һ CRC
    output wire [7:0] crc_out // һ CRC
);
    // feedback = MSB ^ λ
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