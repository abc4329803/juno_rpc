`timescale 1ns / 1ps

module xvc_server #(
    parameter BUFFER_SIZE = 8192
)(
    input wire clk,
    input wire rst,

    // TCP 接口
    input wire [7:0]   tcp_rx_data,
    input wire         tcp_rx_valid,
    output reg         tcp_rx_ready,

    output reg [7:0]   tcp_tx_data,
    output reg         tcp_tx_valid,
    input wire         tcp_tx_ready,

    input wire [2:0]   tdo_delay_cycle,

    // JTAG 接口
    output reg         tck,
    output reg         tms,
    output reg         tdi,
    input wire         tdo,

    output     [2:0]   state_debug,
    output reg         xvc_active
);


    localparam S_IDLE         = 3'd0;
    localparam S_RECV_CMD     = 3'd1;
    localparam S_RECV_LENGTH  = 3'd2;
    localparam S_RECV_TMS_TDI = 3'd3;
    localparam S_EXEC_SHIFT   = 3'd4;
    localparam S_SEND_TDO     = 3'd5;
    localparam S_DUMMY_CLK    = 3'd6;

    reg [2:0]  state = S_IDLE;
    reg [7:0]  cmd_buffer [0:7];
    reg [2:0]  cmd_idx = 0;
    reg [31:0] shift_length = 0;
    reg [2:0]  length_idx = 0;

    (* ram_style = "block" *)reg [7:0] tms_buffer [0:BUFFER_SIZE-1];
    (* ram_style = "block" *)reg [7:0] tdi_buffer [0:BUFFER_SIZE-1];
    (* ram_style = "block" *)reg [7:0] tdo_buffer [0:BUFFER_SIZE-1];

    reg [15:0] buffer_idx = 0;
    reg [15:0] total_bytes = 0;
    reg [31:0] bit_counter = 0;
    reg [2:0]  bit_in_byte = 0;
    reg [2:0]  bit_in_byte_1 = 0;
    reg [15:0] byte_counter = 0;
    reg [15:0] byte_counter_1 = 0;
    reg [15:0] resp_idx = 0;
    reg [9:0]  tck_counter = 0;
    reg        last_shift_reg = 0;
    reg        fake_tck = 0;
    reg [2:0]  fake_tck_counter;

    // wire is_getinfo_cmd = (cmd_buffer[0]=="g" && cmd_buffer[1]=="e" && cmd_buffer[2]=="t");
    // wire is_settck_cmd  = (cmd_buffer[0]=="s" && cmd_buffer[1]=="e" && cmd_buffer[4]=="c");
    // wire is_shift_cmd   = (cmd_buffer[0]=="s" && cmd_buffer[1]=="h" && cmd_buffer[4]=="t");


        // XVC command recognition
    wire is_getinfo_cmd = (cmd_buffer[0] == "g") && (cmd_buffer[1] == "e") &&
                          (cmd_buffer[2] == "t") && (cmd_buffer[3] == "i") &&
                          (cmd_buffer[4] == "n") && (cmd_buffer[5] == "f") &&
                          (cmd_buffer[6] == "o");

    wire is_settck_cmd  = (cmd_buffer[0] == "s") && (cmd_buffer[1] == "e") &&
                          (cmd_buffer[2] == "t") && (cmd_buffer[3] == "t") &&
                          (cmd_buffer[4] == "c") && (cmd_buffer[5] == "k");

    wire is_shift_cmd   = (cmd_buffer[0] == "s") && (cmd_buffer[1] == "h") &&
                          (cmd_buffer[2] == "i") && (cmd_buffer[3] == "f") &&
                          (cmd_buffer[4] == "t");


    // 响应字符串 (xvcServer_v1.0:8192\n)
    reg [7:0] getinfo_resp [0:19];
    initial begin
        getinfo_resp[0]="x"; getinfo_resp[1]="v"; getinfo_resp[2]="c"; getinfo_resp[3]="S";
        getinfo_resp[4]="e"; getinfo_resp[5]="r"; getinfo_resp[6]="v"; getinfo_resp[7]="e";
        getinfo_resp[8]="r"; getinfo_resp[9]="_"; getinfo_resp[10]="v"; getinfo_resp[11]="1";
        getinfo_resp[12]="."; getinfo_resp[13]="0"; getinfo_resp[14]=":"; getinfo_resp[15]="1";
        getinfo_resp[16]="0"; getinfo_resp[17]="2"; getinfo_resp[18]="4"; getinfo_resp[19]="\n";
    end

    assign state_debug = state;

/*     integer j;
    initial begin
        for (j = 0; j < BUFFER_SIZE; j = j + 1) begin
            tms_buffer[j] = 8'h00;
            tdi_buffer[j] = 8'h00;
            tdo_buffer[j] = 8'h00;
        end
    end */

    always @(posedge clk) begin
        if (rst) begin
            state <= S_IDLE;
            tcp_rx_ready <= 1'b1;
            tcp_tx_valid <= 1'b0;
            tck <= 1'b0; 
            tms <= 1'b0; 
            tdi <= 1'b0;
            xvc_active <= 1'b0;
            fake_tck <= 1'b0;
        end else begin
            if(tck | fake_tck) begin
                //byte_counter_1 <= byte_counter;
                if(bit_in_byte_1 == 7 & byte_counter != 0) begin
                    byte_counter_1 <= byte_counter_1 + 1;
                end
                if(bit_in_byte >= tdo_delay_cycle) begin
                    bit_in_byte_1 <= bit_in_byte - tdo_delay_cycle;
                end else begin
                    bit_in_byte_1 <= 8 + bit_in_byte - tdo_delay_cycle;
                end
            end
            case (state)
                S_IDLE: begin
                    tck <= 1'b0; 
                    fake_tck <= 1'b0;
                    cmd_idx <= 0; 
                    resp_idx <= 0;
                    tcp_tx_valid <= 1'b0; 
                    tcp_rx_ready <= 1'b1;
                    xvc_active <= 1'b0; 
                    last_shift_reg <= 1'b0;
                    bit_in_byte <= 0;
                    bit_in_byte_1 <= 0;
                    byte_counter <= 0;
                    byte_counter_1 <= 0;
                    fake_tck_counter <= 0;
                    if (tcp_rx_valid) begin
                        cmd_buffer[0] <= tcp_rx_data;
                        cmd_idx <= 1;
                        state <= S_RECV_CMD;
                    end
                end

                S_RECV_CMD: begin
                    if (tcp_rx_valid) begin
                        cmd_buffer[cmd_idx] <= tcp_rx_data;
                        if (tcp_rx_data == ":") begin
                            length_idx <= 0;
                            if (is_getinfo_cmd) begin
                                tcp_tx_data <= getinfo_resp[0]; // 简化的 GetInfo 响应起始
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 1;
                                state <= S_SEND_TDO;
                            end else state <= S_RECV_LENGTH;
                        end else cmd_idx <= cmd_idx + 1;
                    end
                end

                S_RECV_LENGTH: begin
                    if (tcp_rx_valid) begin
                        case (length_idx)
                            0: shift_length[7:0]   <= tcp_rx_data;
                            1: shift_length[15:8]  <= tcp_rx_data;
                            2: shift_length[23:16] <= tcp_rx_data;
                            3: begin 
                                shift_length[31:24] <= tcp_rx_data;
                                // 核心修正：立即拼接计算长度，消除非阻塞赋值延迟
                                total_bytes <= ({tcp_rx_data, shift_length[23:0]} + 32'd7) >> 3;
                            end
                        endcase
                        if (length_idx == 3) begin
                            if (is_settck_cmd) begin
                                tcp_tx_data <= shift_length[7:0]; 
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 0; 
                                total_bytes <= 16'd4;
                                state <= S_SEND_TDO;
                            end else begin
                                buffer_idx <= 0;
                                state <= S_RECV_TMS_TDI;
                            end
                        end else length_idx <= length_idx + 1;
                    end
                end

                S_RECV_TMS_TDI: begin
                    if (tcp_rx_valid) begin
                        if (buffer_idx < total_bytes) begin
                            tms_buffer[buffer_idx] <= tcp_rx_data;
                            buffer_idx <= buffer_idx + 1;
                        end else begin
                            tdi_buffer[buffer_idx - total_bytes] <= tcp_rx_data;
                            if (buffer_idx == (total_bytes << 1) - 1) begin
                                bit_counter <= 0; 
                                byte_counter <= 0; 
                                bit_in_byte <= 1;
                                xvc_active <= 1'b1; 
                                tcp_rx_ready <= 1'b0;
                                tms <= tms_buffer[byte_counter][bit_in_byte];
                                tdi <= tdi_buffer[byte_counter][bit_in_byte];
                                state <= S_EXEC_SHIFT;
                            end else buffer_idx <= buffer_idx + 1;
                        end
                    end
                end

                S_EXEC_SHIFT: begin
                    if (bit_counter < shift_length) begin
                        if (!tck) begin
                            // 修正采样：在上升沿时刻抓取 TDO
                            //tdo_buffer[byte_counter_1][bit_in_byte_1] <= tdo;
                            tck <= 1'b1;
                        end else begin
                            tck <= 1'b0;
                            tms <= tms_buffer[byte_counter][bit_in_byte];
                            tdi <= tdi_buffer[byte_counter][bit_in_byte];
                            tdo_buffer[byte_counter_1][bit_in_byte_1] <= tdo;
                            bit_counter <= bit_counter + 1;
                            if (bit_in_byte == 7) begin
                                bit_in_byte <= 0; 
                                byte_counter <= byte_counter + 1;
                            end else bit_in_byte <= bit_in_byte + 1;
                        end
                    end else begin
                        if(tdo_delay_cycle == 0) begin
                            tck <= 1'b0; 
                            resp_idx <= 0;
                            tcp_tx_data <= tdo_buffer[0]; 
                            tcp_tx_valid <= 1'b1;
                            xvc_active <= 1'b0;
                            last_shift_reg <= tms; // 记录最后一次 TMS 状态
                            state <= S_SEND_TDO;
                        end else begin
                            tck <= 1'b0; 
                            fake_tck <= !tck;
                            fake_tck_counter <= 0;
                            if (!tck) begin
                            // 修正采样：在上升沿时刻抓取 TDO
                                tdo_buffer[byte_counter_1][bit_in_byte_1] <= tdo;
                            end
                            state <= S_DUMMY_CLK;
                        end
                    end
                end

                S_SEND_TDO: begin
                    if (tcp_tx_ready && tcp_tx_valid) begin
                        if (is_shift_cmd) begin
                            if (resp_idx < total_bytes - 1) begin
                                resp_idx <= resp_idx + 1;
                                tcp_tx_data <= tdo_buffer[resp_idx + 1];
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                //state <= last_shift_reg ? S_DUMMY_CLK : S_IDLE;
                                state <= S_IDLE;
                                tck_counter <= 0;
                            end
                        end else if (is_getinfo_cmd) begin
                            tcp_tx_data <= getinfo_resp[resp_idx];
                            if (resp_idx < 20) begin
                                resp_idx <= resp_idx + 1;
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                cmd_idx <= 3'b0;
                                tcp_rx_ready <= 1'b1;
                                state <= S_IDLE;
                            end
                        end else if (is_settck_cmd) begin
                            tcp_tx_data <= 8'h0;
                            if (resp_idx < 3) begin
                                resp_idx <= resp_idx + 1;
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                cmd_idx <= 3'b0;
                                tcp_rx_ready <= 1'b1;
                                state <= S_IDLE;
                            end
                        end else begin 
                            tcp_tx_valid <= 1'b0; 
                            state <= S_IDLE;
                        end
                    end
                end

                S_DUMMY_CLK: begin
                    if (fake_tck_counter <= tdo_delay_cycle) begin
                        if (!fake_tck) begin
                            // 修正采样：在上升沿时刻抓取 TDO
                            tdo_buffer[byte_counter_1][bit_in_byte_1] <= tdo;
                            fake_tck <= 1'b1;
                        end else begin
                            fake_tck <= 1'b0;
                            bit_counter <= bit_counter + 1;
                            if (bit_in_byte == 7) begin
                                bit_in_byte <= 0; 
                                byte_counter <= byte_counter + 1;
                            end else bit_in_byte <= bit_in_byte + 1;
                        end
                        fake_tck_counter <= fake_tck_counter + 1;
                    end else begin
                        resp_idx <= 0;
                        tcp_tx_data <= tdo_buffer[0]; 
                        tcp_tx_valid <= 1'b1;
                        xvc_active <= 1'b0;
                        fake_tck <= 1'b0;
                        state <= S_SEND_TDO;
                    end 
                end
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule