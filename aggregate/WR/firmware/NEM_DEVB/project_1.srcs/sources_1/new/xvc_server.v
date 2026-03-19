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
    localparam S_WAIT         = 3'd7;
    reg [2:0]  state = S_IDLE;
    reg [7:0]  cmd_buffer [0:7];
    reg [2:0]  cmd_idx = 0;
    reg [31:0] shift_length = 0;
    reg [2:0]  length_idx = 0;

    // ----------------------------------------------------
    // 标准 BRAM 推断模板 (分离出状态机逻辑)
    // ----------------------------------------------------
    (* ram_style = "block" *) reg [7:0] tms_ram [0:BUFFER_SIZE-1];
    (* ram_style = "block" *) reg [7:0] tdi_ram [0:BUFFER_SIZE-1];
    (* ram_style = "block" *) reg [7:0] tdo_ram [0:BUFFER_SIZE-1];

    reg [7:0] tms_dout, tdi_dout, tdo_dout;
    reg        tms_we, tdi_we, tdo_we;
    reg [15:0] tms_addr, tdi_addr, tdo_addr;
    reg [7:0]  tms_din, tdi_din, tdo_din;

    always @(posedge clk) begin
        if (tms_we) tms_ram[tms_addr] <= tms_din;
        tms_dout <= tms_ram[tms_addr];
    end

    always @(posedge clk) begin
        if (tdi_we) tdi_ram[tdi_addr] <= tdi_din;
        tdi_dout <= tdi_ram[tdi_addr];
    end

    always @(posedge clk) begin
        if (tdo_we) tdo_ram[tdo_addr] <= tdo_din;
        tdo_dout <= tdo_ram[tdo_addr];
    end

    // ----------------------------------------------------
    // 核心寄存器
    // ----------------------------------------------------
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
    reg [7:0]  dynamic_mask;

    // 零延迟首字节旁路寄存器 (解决 BRAM 读取的 1 周期延迟)
    reg [7:0]  tms_byte_0;
    reg [7:0]  tdi_byte_0;

    always @(posedge clk) begin
        if (state == S_RECV_TMS_TDI && tcp_rx_valid) begin
            if (buffer_idx == 0) tms_byte_0 <= tcp_rx_data;
            if (buffer_idx == total_bytes) tdi_byte_0 <= tcp_rx_data;
        end
    end

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
        getinfo_resp[0]="x";
        getinfo_resp[1]="v"; getinfo_resp[2]="c"; getinfo_resp[3]="S";
        getinfo_resp[4]="e"; getinfo_resp[5]="r"; getinfo_resp[6]="v"; getinfo_resp[7]="e";
        getinfo_resp[8]="r"; getinfo_resp[9]="_"; getinfo_resp[10]="v"; getinfo_resp[11]="1";
        getinfo_resp[12]="."; getinfo_resp[13]="0"; getinfo_resp[14]=":"; getinfo_resp[15]="1";
        getinfo_resp[16]="0"; getinfo_resp[17]="2"; getinfo_resp[18]="4"; getinfo_resp[19]="\n";
    end

    assign state_debug = state;

    // ----------------------------------------------------
    // BRAM 控制逻辑 (组合逻辑映射)
    // ----------------------------------------------------
    always @(*) begin
        // 默认映射到读逻辑，保障无 latch
        tms_we   = 1'b0;
        tms_addr = byte_counter;
        tms_din  = 8'h00;

        tdi_we   = 1'b0;
        tdi_addr = byte_counter;
        tdi_din  = 8'h00;

        tdo_we   = 1'b0;
        tdo_addr = byte_counter_1;
        //tdo_din  = tdo_dout; // TDO 默认维持当前读取出的数据

        if (state == S_RECV_TMS_TDI) begin
            tms_we   = tcp_rx_valid && (buffer_idx < total_bytes);
            tms_addr = buffer_idx;
            tms_din  = tcp_rx_data;

            tdi_we   = tcp_rx_valid && (buffer_idx >= total_bytes) && (buffer_idx < (total_bytes << 1));
            tdi_addr = buffer_idx - total_bytes;
            tdi_din  = tcp_rx_data;
        end

        // TDO 读-修改-写 (Read-Modify-Write)
        if (state == S_EXEC_SHIFT) begin
            if (bit_counter < shift_length) begin
                if (tck) begin // 等效于原代码 else 的进入时刻
                    tdo_we = 1'b1;
                    tdo_din[bit_in_byte_1] = tdo;
                end
            end else begin
                if (tdo_delay_cycle != 0 && !tck) begin // 收尾时刻的修正采样
                    tdo_we = 1'b1;
                    tdo_din[bit_in_byte_1] = tdo;
                end
            end
        end else if (state == S_DUMMY_CLK) begin
            if (fake_tck_counter <= tdo_delay_cycle && !fake_tck) begin
                tdo_we = 1'b1;
                tdo_din[bit_in_byte_1] = tdo;
            end
        end else if (state == S_SEND_TDO) begin
            //tdo_addr = resp_idx; // 发送阶段端口复用
        end
    end

    // ----------------------------------------------------
    // 主状态机
    // ----------------------------------------------------
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
                                tcp_tx_data <= getinfo_resp[0];
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 1;
                                byte_counter_1 <= 1;
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
                                total_bytes <= ({tcp_rx_data, shift_length[23:0]} + 32'd7) >> 3;
                            end
                        endcase
                        if (length_idx == 3) begin
                            if (is_settck_cmd) begin
                                tcp_tx_data <= shift_length[7:0]; 
                                tcp_tx_valid <= 1'b1;
                                resp_idx <= 0; 
                                byte_counter_1 <= 0;
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
                            buffer_idx <= buffer_idx + 1;
                        end else begin
                            if (buffer_idx == (total_bytes << 1) - 1) begin
                                bit_counter <= 0;
                                byte_counter <= 0; 
                                bit_in_byte <= 1;
                                xvc_active <= 1'b1; 
                                tcp_rx_ready <= 1'b0;
                                // 提取首位：若是首字或单字，则从直通寄存器拿数据
                                tms <= tms_byte_0[0];
                                tdi <= (total_bytes == 1) ? tcp_rx_data[0] : tdi_byte_0[0];
                                state <= S_EXEC_SHIFT;
                            end else buffer_idx <= buffer_idx + 1;
                        end
                    end
                end

                S_EXEC_SHIFT: begin
                    if (bit_counter < shift_length) begin
                        if (!tck) begin
                            tck <= 1'b1;
                        end else begin
                            tck <= 1'b0;
                            // 对于第一字节从寄存器直读，其余正常走 BRAM dout
                            tms <= (byte_counter == 0) ? tms_byte_0[bit_in_byte] : tms_dout[bit_in_byte];
                            tdi <= (byte_counter == 0) ? tdi_byte_0[bit_in_byte] : tdi_dout[bit_in_byte];
                            
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
                            byte_counter_1 <= 0;
                            tcp_tx_valid <= 1'b0; // 延时一拍，等待 RAM 数据准备完毕
                            xvc_active <= 1'b0;
                            last_shift_reg <= tms;
                            
                            state <= S_WAIT;
                        end else begin
                            tck <= 1'b0;
                            fake_tck <= !tck;
                            fake_tck_counter <= 0;
                            state <= S_DUMMY_CLK;
                        end
                    end
                end

                S_WAIT: begin
                    byte_counter_1 <= byte_counter_1 + 1;
                    if(bit_in_byte_1 == 0) begin
                        dynamic_mask <= 8'hFF;
                    end else begin
                        dynamic_mask <= (8'h1 << bit_in_byte_1) - 1'b1;
                    end
                    
                    state <= S_SEND_TDO;
                end

                S_SEND_TDO: begin
                    if (is_shift_cmd) begin
                        // 发送 TDO 需要兼顾 BRAM 的一个周期读延迟
                        if (!tcp_tx_valid) begin
                            if (byte_counter_1 > total_bytes - 1) begin
                                if(bit_in_byte_1 == 7) begin
                                    tcp_tx_data <= tdo_dout; 
                                end else begin
                                    tcp_tx_data <= tdo_dout & dynamic_mask; //[bit_in_byte_1+:0]; 
                                end
                                
                            end else begin
                                tcp_tx_data <= tdo_dout; 
                            end
                            
                            //tcp_tx_data <= tdo_dout & dynamic_mask; 
                            tcp_tx_valid <= 1'b1;
                        end else if (tcp_tx_ready) begin
                            //if (resp_idx < total_bytes - 1) begin
                            //    resp_idx <= resp_idx + 1;
                            if (byte_counter_1 <= total_bytes - 1) begin
                                byte_counter_1 <= byte_counter_1 + 1;
                                tcp_tx_valid <= 1'b0; // 回去等下一拍 BRAM
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                state <= S_IDLE;
                                tck_counter <= 0;
                            end
                        end
                    end else if (tcp_tx_ready && tcp_tx_valid) begin
                        // GetInfo 与 SetTCK 不走 TDO BRAM，维持原逻辑不变
                        if (is_getinfo_cmd) begin
                            //tcp_tx_data <= getinfo_resp[resp_idx];
                            //if (resp_idx < 20) begin
                            //    resp_idx <= resp_idx + 1;
                            tcp_tx_data <= getinfo_resp[byte_counter_1];
                            if (byte_counter_1 < 20) begin
                                byte_counter_1 <= byte_counter_1 + 1;
                            end else begin
                                tcp_tx_valid <= 1'b0;
                                cmd_idx <= 3'b0;
                                tcp_rx_ready <= 1'b1;
                                state <= S_IDLE;
                            end
                        end else if (is_settck_cmd) begin
                            tcp_tx_data <= 8'h0;
                            //if (resp_idx < 3) begin
                            //    resp_idx <= resp_idx + 1;
                            if (byte_counter_1 < 3) begin
                                byte_counter_1 <= byte_counter_1 + 1;
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
                    if (fake_tck_counter < tdo_delay_cycle) begin
                        if (!fake_tck) begin
                            
                            fake_tck <= 1'b1;
                        end else begin
                            fake_tck <= 1'b0;
                            fake_tck_counter <= fake_tck_counter + 1;
                            bit_counter <= bit_counter + 1;
                            if (bit_in_byte == 7) begin
                                bit_in_byte <= 0;
                                byte_counter <= byte_counter + 1;
                            end else bit_in_byte <= bit_in_byte + 1;
                        end
                        //fake_tck_counter <= fake_tck_counter + 1;
                    end else begin
                        resp_idx <= 0;
                        byte_counter_1 <= 0;
                        tcp_tx_valid <= 1'b0; // 延时一拍，等待 RAM
                        xvc_active <= 1'b0;
                        fake_tck <= 1'b0;
                        byte_counter_1 <= 0;
                        state <= S_WAIT;
                    end 
                end
                default: state <= S_IDLE;
            endcase
        end
    end
endmodule