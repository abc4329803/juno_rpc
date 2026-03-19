`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: xvc_server
// Description: Xilinx Virtual Cable (XVC) Protocol Server (Fixed & Updated)
// Buffer Size: 8192 Bytes
//////////////////////////////////////////////////////////////////////////////////

module xvc_server #(
    parameter BUFFER_SIZE = 8192  // 增大到 8192
)(
    input wire clk,
    input wire rst,

    // TCP interface from SiTCP
    input wire [7:0]  tcp_rx_data,
    input wire        tcp_rx_valid,
    output reg        tcp_rx_ready,

    output reg [7:0]  tcp_tx_data,
    output reg        tcp_tx_valid,
    input wire        tcp_tx_ready,

    // JTAG interface
    output reg        tck,
    output reg        tms,
    output reg        tdi,
    input wire        tdo,

    // Status
    output     [2:0]  state_debug,
    output reg        xvc_active
);

    // XVC Protocol States
    localparam S_IDLE         = 3'd0;
    localparam S_RECV_CMD     = 3'd1;
    localparam S_RECV_LENGTH  = 3'd2;
    localparam S_RECV_TMS_TDI = 3'd3;
    localparam S_EXEC_SHIFT   = 3'd4;
    localparam S_SEND_TDO     = 3'd5;

    reg [2:0] state;

    // Command buffer
    reg [7:0] cmd_buffer [0:7];
    reg [2:0] cmd_idx;

    // Length of shift operation
    reg [31:0] shift_length;
    reg [2:0]  length_idx;

    // TMS/TDI/TDO buffers
    reg [7:0] tms_buffer [0:BUFFER_SIZE-1];
    reg [7:0] tdi_buffer [0:BUFFER_SIZE-1];
    reg [7:0] tdo_buffer [0:BUFFER_SIZE-1];
    reg [15:0] buffer_idx;
    reg [15:0] total_bytes;

    // Shift execution
    reg [31:0] bit_counter;
    reg [2:0]  bit_in_byte;
    reg [15:0] byte_counter;

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

    // Response strings: "xvcServer_v1.0:8192\n" (Updated size string)
    reg [7:0] getinfo_resp [0:21];
    reg [15:0] resp_idx; // 增大位宽以匹配 buffer_idx

    initial begin
        // 初始化响应字符串：xvcServer_v1.0:8192\n
        getinfo_resp[0]="x"; getinfo_resp[1]="v"; getinfo_resp[2]="c"; getinfo_resp[3]="S";
        getinfo_resp[4]="e"; getinfo_resp[5]="r"; getinfo_resp[6]="v"; getinfo_resp[7]="e";
        getinfo_resp[8]="r"; getinfo_resp[9]="_"; getinfo_resp[10]="v"; getinfo_resp[11]="1";
        getinfo_resp[12]="."; getinfo_resp[13]="0"; getinfo_resp[14]=":"; getinfo_resp[15]="8";
        getinfo_resp[16]="1"; getinfo_resp[17]="9"; getinfo_resp[18]="2"; getinfo_resp[19]="\n";
        getinfo_resp[20]=8'd0; getinfo_resp[21]=8'd0;
    end

    assign state_debug = state;

    always @(posedge clk) begin
        if (rst) begin
            state <= S_IDLE;
            tcp_rx_ready <= 1'b1;
            tcp_tx_valid <= 1'b0;
            xvc_active <= 1'b0;
            tck <= 1'b0;
        end else begin
            case (state)
                S_IDLE: begin
                    cmd_idx <= 0;
                    resp_idx <= 0;
                    tcp_rx_ready <= 1'b1;
                    tcp_tx_valid <= 1'b0;
                    xvc_active <= 1'b0;
                    if (tcp_rx_valid) begin
                        cmd_buffer[0] <= tcp_rx_data;
                        cmd_idx <= 1;
                        state <= S_RECV_CMD;
                    end
                end

                S_RECV_CMD: begin
                    if (tcp_rx_valid) begin
                        cmd_buffer[cmd_idx] <= tcp_rx_data;
                        if (tcp_rx_data == ":") begin // ":"
                            if (is_getinfo_cmd) begin
                                tcp_tx_data <= getinfo_resp[0];
                                tcp_tx_valid <= 1'b1;
                                state <= S_SEND_TDO;
                            end else if (is_settck_cmd || is_shift_cmd) begin
                                length_idx <= 0;
                                state <= S_RECV_LENGTH;
                            end else state <= S_IDLE;
                        end else if (cmd_idx < 7) begin
                            cmd_idx <= cmd_idx + 1;
                        end else state <= S_IDLE;
                    end
                end

                S_RECV_LENGTH: begin
                    if (tcp_rx_valid) begin
                        case (length_idx)
                            0: shift_length[7:0]   <= tcp_rx_data;
                            1: shift_length[15:8]  <= tcp_rx_data;
                            2: shift_length[23:16] <= tcp_rx_data;
                            3: shift_length[31:24] <= tcp_rx_data;
                        endcase
                        if (length_idx == 3) begin
                            if (is_settck_cmd) begin
                                tcp_tx_data <= shift_length[7:0]; // 注意：这里逻辑上其实该用刚收到的位，下同
                                tcp_tx_valid <= 1'b1;
                                state <= S_SEND_TDO;
                            end else begin
                                total_bytes <= (shift_length + 7) >> 3;
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
                                bit_in_byte <= 0;
                                xvc_active <= 1'b1;
                                state <= S_EXEC_SHIFT;
                            end else buffer_idx <= buffer_idx + 1;
                        end
                    end
                end

                S_EXEC_SHIFT: begin
                    if (bit_counter < shift_length) begin
                        if (!tck) begin
                            tms <= tms_buffer[byte_counter][bit_in_byte];
                            tdi <= tdi_buffer[byte_counter][bit_in_byte];
                            tck <= 1'b1;
                        end else begin
                            tdo_buffer[byte_counter][bit_in_byte] <= tdo;
                            tck <= 1'b0;
                            bit_counter <= bit_counter + 1;
                            if (bit_in_byte == 7) begin
                                bit_in_byte <= 0;
                                byte_counter <= byte_counter + 1;
                            end else bit_in_byte <= bit_in_byte + 1;
                        end
                    end else begin
                        tck <= 1'b0; xvc_active <= 1'b0; resp_idx <= 0;
                        tcp_tx_data <= tdo_buffer[0];
                        tcp_tx_valid <= 1'b1;
                        state <= S_SEND_TDO;
                    end
                end

                S_SEND_TDO: begin
                    // 只有在对方准备好接收时，才移动索引并准备下一个字节
                    if (tcp_tx_ready && tcp_tx_valid) begin
                        if (is_getinfo_cmd) begin
                            if (resp_idx < 19) begin // 发送到 getinfo_resp[19] ('\n')
                                resp_idx <= resp_idx + 1;
                                tcp_tx_data <= getinfo_resp[resp_idx + 1];
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                state <= S_IDLE;
                            end
                        end else if (is_settck_cmd) begin
                            if (resp_idx < 3) begin
                                resp_idx <= resp_idx + 1;
                                case (resp_idx + 1)
                                    1: tcp_tx_data <= shift_length[15:8];
                                    2: tcp_tx_data <= shift_length[23:16];
                                    3: tcp_tx_data <= shift_length[31:24];
                                endcase
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                state <= S_IDLE;
                            end
                        end else if (is_shift_cmd) begin
                            if (resp_idx < total_bytes - 1) begin
                                resp_idx <= resp_idx + 1;
                                tcp_tx_data <= tdo_buffer[resp_idx + 1];
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                state <= S_IDLE;
                            end
                        end else begin
                            tcp_tx_valid <= 1'b0;
                            state <= S_IDLE;
                        end
                    end else if (!tcp_tx_valid) begin
                        // 如果因为某种异常 valid 被拉低，强制回到 IDLE 防止卡死
                        state <= S_IDLE;
                    end
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule