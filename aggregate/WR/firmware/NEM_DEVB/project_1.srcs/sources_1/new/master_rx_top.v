`timescale 1ns / 1ps

module master_rx_top #(
    parameter FPGA_FAMILY = "7SERIES",
    parameter PAYLOAD_WIDTH = 112, // 用户有效数据位宽
    parameter CRC_WIDTH     = 16,  // CRC校验位宽
    parameter TRAIN_PATTERN = 8'hB5,
    // 帧头：必须覆盖整个传输位宽 (112+16=128bit)
    parameter SYNC_HEADER   = {112'h112233445566778899AABBCCDDEE, 16'hFFFF}
)(
    input  wire sys_clk,        // 62.5MHz 系统时钟
    input  wire sys_rst_n,
    input  wire rx_p, 
    input  wire rx_n,
    
    output reg  uart_tx_trigger, // 1=Data Mode, 0=Train Mode
    
    // === 数据输出接口 ===
    output wire [PAYLOAD_WIDTH-1:0] m_data_out, // 只输出用户数据 (去除CRC后)
    output wire m_data_valid,
    output wire m_crc_error,                    // 1=CRC错误, 0=正常
    
    output reg align_done,
    output reg polarity_inv,
    
    // === 调试接口 ===
    output wire [3:0] debug_state,
    output wire [7:0] debug_good_cnt,
    output wire mmcm_locked_monitor,
    // [修复报错] 这里不能用 TRANS_WIDTH，直接用参数计算
    output wire [PAYLOAD_WIDTH + CRC_WIDTH - 1 : 0] debug_shreg_full, 
    output wire debug_header_match
);

    // 在模块内部定义传输总位宽
    localparam TRANS_WIDTH = PAYLOAD_WIDTH + CRC_WIDTH;

    // =========================================================
    // 1. 动态相移时钟生成
    // =========================================================
    wire clk_rx, mmcm_locked;
    reg ps_en_req;
    wire ps_done_ack;
    assign mmcm_locked_monitor = mmcm_locked;

    // 实例化相移控制器
    clk_phase_shifter #(.FPGA_FAMILY(FPGA_FAMILY)) u_ph_shifter (
        .sys_clk(sys_clk), .rst_in(~sys_rst_n),
        .ps_en(ps_en_req), .ps_incdec(1'b1), .ps_done(ps_done_ack),
        .clk_out_shifted(clk_rx), .locked(mmcm_locked)
    );

    // =========================================================
    // 2. SDR 输入采样 (RX Domain)
    // =========================================================
    wire rx_ibuf;
    reg rx_sampled_bit;
    
    IBUFDS u_ibufds (.I(rx_p), .IB(rx_n), .O(rx_ibuf));

    // 在移相后的时钟域采样
    always @(posedge clk_rx) begin
        rx_sampled_bit <= rx_ibuf;
    end

    // =========================================================
    // 3. Pattern 检测与全旋转识别 (用于相位对齐)
    // =========================================================
    wire rst_rx = ~sys_rst_n || ~mmcm_locked;
    reg [23:0] shreg_patt; 
    reg found_any_b5, found_any_4a;
    
    // 判定函数：检查数据是否为 Pattern 的任意循环移位
    function automatic is_rotation;
        input [7:0] data;
        input [7:0] pat;
        integer k;
        reg [7:0] tmp;
        begin
            is_rotation = 0;
            tmp = pat;
            for (k=0; k<8; k=k+1) begin
                if (data == tmp) is_rotation = 1;
                tmp = {tmp[6:0], tmp[7]}; // 循环左移
            end
        end
    endfunction

    always @(posedge clk_rx or posedge rst_rx) begin
        if (rst_rx) begin
            shreg_patt <= 0; found_any_b5 <= 0; found_any_4a <= 0;
        end else begin
            shreg_patt <= {shreg_patt[22:0], rx_sampled_bit};
            found_any_b5 <= is_rotation(shreg_patt[7:0], TRAIN_PATTERN);
            found_any_4a <= is_rotation(shreg_patt[7:0], ~TRAIN_PATTERN);
        end
    end
    
    // 将匹配信号同步到 sys_clk 域 (用于状态机判断)
    reg found_b5_sync, found_b5_sync_d;
    reg found_4a_sync, found_4a_sync_d;
    always @(posedge sys_clk) begin
        found_b5_sync <= found_any_b5; found_b5_sync_d <= found_b5_sync;
        found_4a_sync <= found_any_4a; found_4a_sync_d <= found_4a_sync;
    end

    // =========================================================
    // 4. 主校准状态机 (SYS Domain)
    // =========================================================
    localparam ST_RESET=0, ST_WAIT_LOCK=1, ST_CHECK=2, ST_SHIFT=3, ST_WAIT_PS=4, ST_ALIGN=5, ST_HEADER=6, ST_LOCKED=7;
    reg [3:0] state;
    reg [15:0] timer;
    reg [7:0] good_cnt;
    
    assign debug_state = state;
    assign debug_good_cnt = good_cnt;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            state<=ST_RESET; ps_en_req<=0; align_done<=0; polarity_inv<=0; uart_tx_trigger<=0; timer<=0; good_cnt<=0;
        end else begin
            ps_en_req <= 0;
            case(state)
                ST_RESET: begin if(timer>100) state<=ST_WAIT_LOCK; else timer<=timer+1; end
                ST_WAIT_LOCK: begin if(mmcm_locked && timer>1000) begin timer<=0; state<=ST_CHECK; end else timer<=timer+1; end
                
                ST_CHECK: begin
                    // 检查当前相位质量
                    if(timer < 32) begin 
                        timer <= timer + 1;
                        if(found_b5_sync_d || found_4a_sync_d) good_cnt <= good_cnt + 1;
                    end else begin
                        timer <= 0;
                        if(good_cnt > 28) state <= ST_ALIGN; 
                        else begin good_cnt <= 0; state <= ST_SHIFT; end
                    end
                end
                
                ST_SHIFT: begin ps_en_req <= 1; state <= ST_WAIT_PS; end
                ST_WAIT_PS: begin if(ps_done_ack) state <= ST_CHECK; end
                
                ST_ALIGN: begin
                    // 确定极性并通知 Slave 发送 Header
                    if(found_b5_sync_d) begin polarity_inv<=0; uart_tx_trigger<=1; state<=ST_HEADER; end
                    else if(found_4a_sync_d) begin polarity_inv<=1; uart_tx_trigger<=1; state<=ST_HEADER; end
                    else state <= ST_CHECK;
                end
                
                ST_HEADER: begin
                    // 等待 RX 域的 CDC 信号 align_done 拉高
                    if(align_done) state <= ST_LOCKED;
                end
                ST_LOCKED: begin end
            endcase
        end
    end

    // =========================================================
    // 5. 数据恢复与 Header 对齐 (RX Domain)
    // =========================================================
    reg [7:0] word_cnt_rx;
    reg [TRANS_WIDTH-1:0] data_rx_latched; // 锁存完整帧 (Payload + CRC)
    reg valid_rx_toggle; 
    reg [TRANS_WIDTH+7:0] shreg_final_rx;  // 移位寄存器
    reg align_done_rx;
    
    wire rx_corr_rx = polarity_inv ? ~rx_sampled_bit : rx_sampled_bit;
    
    assign debug_shreg_full = shreg_final_rx[TRANS_WIDTH-1:0];
    assign debug_header_match = (shreg_final_rx[TRANS_WIDTH-1:0] == SYNC_HEADER);

    always @(posedge clk_rx or posedge rst_rx) begin
        if (rst_rx) begin
            shreg_final_rx<=0; word_cnt_rx<=0; valid_rx_toggle<=0; align_done_rx<=0;
            data_rx_latched<=0;
        end else begin
            shreg_final_rx <= {shreg_final_rx[TRANS_WIDTH+5:0], rx_corr_rx};
            
            if (!align_done_rx) begin
                // 搜索 Header
                if (shreg_final_rx[TRANS_WIDTH-1:0] == SYNC_HEADER) begin
                    word_cnt_rx <= 0;
                    align_done_rx <= 1; 
                end
            end else begin
                // 锁定后按字长切分
                if (word_cnt_rx == TRANS_WIDTH-1) begin
                    word_cnt_rx <= 0;
                    data_rx_latched <= shreg_final_rx[TRANS_WIDTH-1:0];
                    valid_rx_toggle <= ~valid_rx_toggle;
                end else word_cnt_rx <= word_cnt_rx + 1;
            end
        end
    end

    // =========================================================
    // 6. CDC (RX -> SYS) 及 CRC 校验
    // =========================================================
    reg [2:0] align_sync;
    reg [2:0] toggle_sync;
    reg [TRANS_WIDTH-1:0] m_trans_data_reg;
    reg m_data_valid_reg;
    
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            align_sync<=0; toggle_sync<=0; m_trans_data_reg<=0; m_data_valid_reg<=0; align_done<=0;
        end else begin
            align_sync <= {align_sync[1:0], align_done_rx};
            toggle_sync <= {toggle_sync[1:0], valid_rx_toggle};
            
            align_done <= align_sync[2];
            
            if (toggle_sync[2] ^ toggle_sync[1]) begin
                m_trans_data_reg <= data_rx_latched;
                m_data_valid_reg <= 1'b1;
            end else m_data_valid_reg <= 1'b0;
        end
    end
    
    // --- CRC 分离与校验 ---
    wire [PAYLOAD_WIDTH-1:0] payload_extracted;
    wire [CRC_WIDTH-1:0]     crc_received;
    wire [CRC_WIDTH-1:0]     crc_calculated_local;
    
    // 拆分数据：高位是 Payload，低位是 CRC
    assign payload_extracted = m_trans_data_reg[TRANS_WIDTH-1 : CRC_WIDTH];
    assign crc_received      = m_trans_data_reg[CRC_WIDTH-1 : 0];
    
    // 实例化 CRC 模块进行本地计算
    // 注意：需要确保工程中有 crc16_parallel.v
    crc16_parallel #(
        .DATA_WIDTH(PAYLOAD_WIDTH)
    ) u_crc_rx (
        .data_in(payload_extracted),
        .crc_out(crc_calculated_local)
    );
    
    // 输出最终结果
    assign m_data_out   = payload_extracted;
    assign m_data_valid = m_data_valid_reg;
    // 仅当数据有效时校验 CRC
    assign m_crc_error  = m_data_valid_reg && (crc_received != crc_calculated_local);

endmodule