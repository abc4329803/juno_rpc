`timescale 1ns / 1ps

module xvc_server #(
    parameter BUFFER_SIZE = 8192
)(
    input wire clk,
    input wire rst,
    
    // 延迟调节端口：指定 TDO 采样需要回溯的时钟周期数 (0-31)
    input wire [4:0]   tdo_delay,

    // TCP 接口 [cite: 1]
    input wire [7:0]   tcp_rx_data,
    input wire         tcp_rx_valid,
    output reg         tcp_rx_ready,

    output reg [7:0]   tcp_tx_data,
    output reg         tcp_tx_valid,
    input wire         tcp_tx_ready, // [cite: 2]

    // JTAG 接口 [cite: 2]
    output reg         tck,
    output reg         tms,
    output reg         tdi,
    input wire         tdo,

    output     [2:0]   state_debug,
    output reg         xvc_active
);

    // 状态定义 [cite: 3, 4, 5]
    localparam S_IDLE         = 3'd0;
    localparam S_RECV_CMD     = 3'd1;
    localparam S_RECV_LENGTH  = 3'd2;
    localparam S_RECV_TMS_TDI = 3'd3;
    localparam S_EXEC_SHIFT   = 3'd4;
    localparam S_SEND_TDO     = 3'd5;
    localparam S_DUMMY_CLK    = 3'd6;

    reg [2:0]  state = S_IDLE; // [cite: 6]
    reg [7:0]  cmd_buffer [0:7];
    reg [2:0]  cmd_idx = 0;
    reg [31:0] shift_length = 0; // [cite: 7]
    reg [2:0]  length_idx = 0;

    // Buffer 定义 [cite: 7, 8]
    (* ram_style = "block" *)reg [7:0] tms_buffer [0:BUFFER_SIZE-1];
    (* ram_style = "block" *)reg [7:0] tdi_buffer [0:BUFFER_SIZE-1];
    (* ram_style = "block" *)reg [7:0] tdo_buffer [0:BUFFER_SIZE-1];

    reg [15:0] buffer_idx = 0; // [cite: 9]
    reg [15:0] total_bytes = 0;
    reg [31:0] bit_counter = 0;
    reg [2:0]  bit_in_byte = 0; // [cite: 10]
    reg [15:0] byte_counter = 0;
    reg [15:0] resp_idx = 0; // [cite: 11]
    reg [9:0]  tck_counter = 0;

    // --- 新增：地址流水线寄存器 ---
    reg [15:0] byte_addr_pipe [0:31];
    reg [2:0]  bit_addr_pipe  [0:31];
    integer i;

    // 命令识别 [cite: 15, 17, 18]
    wire is_getinfo_cmd = (cmd_buffer[0] == "g") && (cmd_buffer[1] == "e") && (cmd_buffer[2] == "t") && (cmd_buffer[3] == "i") && (cmd_buffer[4] == "n") && (cmd_buffer[5] == "f") && (cmd_buffer[6] == "o");
    wire is_settck_cmd  = (cmd_buffer[0] == "s") && (cmd_buffer[1] == "e") && (cmd_buffer[2] == "t") && (cmd_buffer[3] == "t") && (cmd_buffer[4] == "c") && (cmd_buffer[5] == "k");
    wire is_shift_cmd   = (cmd_buffer[0] == "s") && (cmd_buffer[1] == "h") && (cmd_buffer[2] == "i") && (cmd_buffer[3] == "f") && (cmd_buffer[4] == "t");

    // 响应字符串 [cite: 19, 20]
    reg [7:0] getinfo_resp [0:19];
    initial begin
        getinfo_resp[0]="x"; getinfo_resp[1]="v"; getinfo_resp[2]="c"; getinfo_resp[3]="S";
        getinfo_resp[4]="e"; getinfo_resp[5]="r"; getinfo_resp[6]="v"; getinfo_resp[7]="e";
        getinfo_resp[8]="r"; getinfo_resp[9]="_"; getinfo_resp[10]="v"; getinfo_resp[11]="1";
        getinfo_resp[12]="."; getinfo_resp[13]="0"; getinfo_resp[14]=":"; getinfo_resp[15]="1";
        getinfo_resp[16]="0"; getinfo_resp[17]="2"; getinfo_resp[18]="4"; getinfo_resp[19]="\n";
    end

    assign state_debug = state; // [cite: 21]

    always @(posedge clk) begin
        if (rst) begin // [cite: 23, 24]
            state <= S_IDLE;
            tcp_rx_ready <= 1'b1;
            tcp_tx_valid <= 1'b0;
            tck <= 1'b0; 
            tms <= 1'b0; 
            tdi <= 1'b0;
            xvc_active <= 1'b0;
        end else begin
            // --- 地址流水线：在移位时持续记录比特坐标 ---
            if (state == S_EXEC_SHIFT) begin
                for (i = 31; i > 0; i = i - 1) begin
                    byte_addr_pipe[i] <= byte_addr_pipe[i-1];
                    bit_addr_pipe[i]  <= bit_addr_pipe[i-1];
                end
                byte_addr_pipe[0] <= byte_counter;
                bit_addr_pipe[0]  <= bit_in_byte;
            end

            case (state)
                S_IDLE: begin // [cite: 26, 27, 28]
                    tck <= 1'b0;
                    cmd_idx <= 0; resp_idx <= 0;
                    tcp_tx_valid <= 1'b0; 
                    tcp_rx_ready <= 1'b1;
                    xvc_active <= 1'b0; 
                    bit_in_byte <= 0;
                    byte_counter <= 0;
                    // 清理流水线
                    for (i = 0; i < 32; i = i + 1) begin
                        byte_addr_pipe[i] <= 0;
                        bit_addr_pipe[i]  <= 0;
                    end
                    if (tcp_rx_valid) begin // [cite: 29, 30]
                        cmd_buffer[0] <= tcp_rx_data;
                        cmd_idx <= 1;
                        state <= S_RECV_CMD;
                    end
                end

                S_RECV_CMD: begin // [cite: 30, 31, 32]
                    if (tcp_rx_valid) begin
                        cmd_buffer[cmd_idx] <= tcp_rx_data;
                        if (tcp_rx_data == ":") begin
                            length_idx <= 0;
                            if (is_getinfo_cmd) begin // [cite: 32, 33, 34]
                                tcp_tx_data <= getinfo_resp[0];
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 1;
                                state <= S_SEND_TDO;
                            end else state <= S_RECV_LENGTH;
                        end else cmd_idx <= cmd_idx + 1;
                    end
                end

                S_RECV_LENGTH: begin // [cite: 35, 36, 37, 38]
                    if (tcp_rx_valid) begin
                        case (length_idx)
                            0: shift_length[7:0]   <= tcp_rx_data;
                            1: shift_length[15:8]  <= tcp_rx_data;
                            2: shift_length[23:16] <= tcp_rx_data;
                            3: begin 
                                shift_length[31:24] <= tcp_rx_data;
                                total_bytes <= ({tcp_rx_data, shift_length[23:0]} + 32'd7) >> 3; // [cite: 38]
                            end
                        endcase
                        if (length_idx == 3) begin
                            if (is_settck_cmd) begin // [cite: 39, 40, 41]
                                tcp_tx_data <= shift_length[7:0]; 
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 0; 
                                total_bytes <= 16'd4;
                                state <= S_SEND_TDO;
                            end else begin
                                buffer_idx <= 0;
                                state <= S_RECV_TMS_TDI; // [cite: 42]
                            end
                        end else length_idx <= length_idx + 1;
                    end
                end

                S_RECV_TMS_TDI: begin // [cite: 43, 44, 45]
                    if (tcp_rx_valid) begin
                        if (buffer_idx < total_bytes) begin
                            tms_buffer[buffer_idx] <= tcp_rx_data;
                            buffer_idx <= buffer_idx + 1;
                        end else begin // [cite: 45, 46, 47]
                            tdi_buffer[buffer_idx - total_bytes] <= tcp_rx_data;
                            if (buffer_idx == (total_bytes << 1) - 1) begin
                                bit_counter <= 0;
                                byte_counter <= 0; 
                                bit_in_byte <= 0;
                                xvc_active <= 1'b1; 
                                tcp_rx_ready <= 1'b0;
                                tms <= tms_buffer[0][0];
                                tdi <= tdi_buffer[0][0];
                                state <= S_EXEC_SHIFT; // [cite: 48]
                            end else buffer_idx <= buffer_idx + 1;
                        end
                    end
                end

                S_EXEC_SHIFT: begin // [cite: 49, 50]
                    if (bit_counter < shift_length) begin
                        if (!tck) begin
                            // --- 核心修正：利用流水线回溯地址进行采样采样 ---
                            // 根据输入的 tdo_delay，从记录的坐标历史中取出对应的 bit 位置 [cite: 50]
                            tdo_buffer[byte_addr_pipe[tdo_delay]][bit_addr_pipe[tdo_delay]] <= tdo;
                            tck <= 1'b1; // [cite: 51]
                        end else begin // [cite: 51, 52]
                            tck <= 1'b0;
                            // 提前更新下一个比特的输出数据
                            if (bit_in_byte == 7) begin // [cite: 53, 54]
                                bit_in_byte <= 0;
                                byte_counter <= byte_counter + 1;
                                tms <= tms_buffer[byte_counter + 1][0];
                                tdi <= tdi_buffer[byte_counter + 1][0];
                            end else begin
                                bit_in_byte <= bit_in_byte + 1;
                                tms <= tms_buffer[byte_counter][bit_in_byte + 1];
                                tdi <= tdi_buffer[byte_counter][bit_in_byte + 1];
                            end
                            bit_counter <= bit_counter + 1; // [cite: 52]
                        end
                    end else begin // [cite: 55, 56, 57]
                        tck <= 1'b0;
                        resp_idx <= 0;
                        tcp_tx_data <= tdo_buffer[0]; 
                        tcp_tx_valid <= 1'b1;
                        xvc_active <= 1'b0;
                        state <= S_SEND_TDO;
                    end
                end

                S_SEND_TDO: begin // [cite: 58, 59, 60]
                    if (tcp_tx_ready && tcp_tx_valid) begin
                        if (is_shift_cmd) begin
                            if (resp_idx < total_bytes - 1) begin
                                resp_idx <= resp_idx + 1;
                                tcp_tx_data <= tdo_buffer[resp_idx + 1];
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                state <= S_IDLE; // [cite: 61]
                            end
                        end else if (is_getinfo_cmd) begin // [cite: 62, 63, 64, 65]
                            tcp_tx_data <= getinfo_resp[resp_idx];
                            if (resp_idx < 20) begin
                                resp_idx <= resp_idx + 1;
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                tcp_rx_ready <= 1'b1;
                                state <= S_IDLE;
                            end
                        end else if (is_settck_cmd) begin // [cite: 65, 66, 67, 68]
                            tcp_tx_data <= 8'h0;
                            if (resp_idx < 3) begin
                                resp_idx <= resp_idx + 1;
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                tcp_rx_ready <= 1'b1;
                                state <= S_IDLE;
                            end
                        end else begin 
                            tcp_tx_valid <= 1'b0;
                            state <= S_IDLE; // [cite: 69]
                        end
                    end
                end

                default: state <= S_IDLE; // [cite: 73]
            endcase
        end
    end
endmodule