`timescale 1ns / 1ps

module tb_xvc_server();
    reg clk, rst, tcp_rx_valid, tcp_tx_ready;
    wire tdo_phys;
    reg [7:0] tcp_rx_data;
    wire tcp_rx_ready, tcp_tx_valid, tck, tms, tdi;
    wire [7:0] tcp_tx_data;
    wire [2:0]   state_debug;

    // TAP 状态
    reg [3:0] tap_state = 4'h0;
    reg [31:0] mock_idcode = 32'h24001093;

    xvc_server uut (
        .clk(clk), .rst(rst),
        .tcp_rx_data(tcp_rx_data), .tcp_rx_valid(tcp_rx_valid), .tcp_rx_ready(tcp_rx_ready),
        .tcp_tx_data(tcp_tx_data), .tcp_tx_valid(tcp_tx_valid), .tcp_tx_ready(tcp_tx_ready),
        .tck(tck), .tms(tms), .tdi(tdi), .tdo(tdo_phys), .state_debug(state_debug)
    );

    always #5 clk = ~clk;

    // --- 模拟 TAP 状态机切换 ---
    always @(posedge tck or posedge rst) begin
        if (rst) tap_state <= 4'h0; // Reset
        else begin
            case (tap_state)
                4'h0: tap_state <= tms ? 4'h0 : 4'h1; // Reset -> Idle
                4'h1: tap_state <= tms ? 4'h2 : 4'h1; // Idle -> Select-DR
                4'h2: tap_state <= tms ? 4'h8 : 4'h3; // Select-DR -> Capture-DR
                4'h3: tap_state <= tms ? 4'h5 : 4'h4; // Capture-DR -> Shift-DR
                4'h4: tap_state <= tms ? 4'h5 : 4'h4; // Shift-DR -> Exit1-DR
                4'h5: tap_state <= tms ? 4'h2 : 4'h1; // Exit1-DR -> Update-DR...
                default: tap_state <= tms ? 4'h0 : 4'h1;
            endcase
        end
    end

    // --- 核心修正：TDO 异步输出 Bit 0 ---
    //assign tdo_phys = ((tap_state == 4'h4) ? mock_idcode[0] : 1'b0 ) || ((tap_state == 4'h3 & state_debug == 4) ? mock_idcode[0] : 1'b0) ;
    assign tdo_phys = ((tap_state == 4'h4 & state_debug == 4 & uut.shift_length == 32) ? mock_idcode[0] : 1'b0) ;

    always @(negedge tck) begin
        if (tap_state == 4'h4 & state_debug == 4 & uut.shift_length == 32) begin
            // 移位也加入微小延迟，确保在上升沿采样时数据绝对稳定
            mock_idcode <= {1'b0, mock_idcode[31:1]};
        end else if (tap_state == 4'h3) begin
            mock_idcode <= 32'h24001093;
        end
    end

/*     assign tdo_phys = (tap_state == 3 || tap_state == 4) ? mock_idcode[0] : 1'b0;

    always @(negedge tck) begin
        if (tap_state == 3) begin
            // 只有在 Shift 状态的下降沿，才移出下一位
            mock_idcode <= {1'b0, mock_idcode[31:1]};
        end else if (tap_state == 4) begin
            // 在 Capture 状态装填 IDCODE，此时 Bit 0 已经通过上面的 assign 映射到引脚
            mock_idcode <= 32'h24001093; 
        end
    end */

// --- 修正后的激励逻辑 ---
    task send_shift(input [31:0] len, input [31:0] tms_v, input [31:0] tdi_v);
        integer i;
        begin
            // 核心修正：在发送指令首字符前，先同步到时钟沿
            @(posedge clk); 
            
            {tcp_rx_data, tcp_rx_valid} = {"s", 1'b1}; @(posedge clk);
            {tcp_rx_data, tcp_rx_valid} = {"h", 1'b1}; @(posedge clk);
            {tcp_rx_data, tcp_rx_valid} = {"i", 1'b1}; @(posedge clk);
            {tcp_rx_data, tcp_rx_valid} = {"f", 1'b1}; @(posedge clk);
            {tcp_rx_data, tcp_rx_valid} = {"t", 1'b1}; @(posedge clk);
            {tcp_rx_data, tcp_rx_valid} = {":", 1'b1}; @(posedge clk);
            
            tcp_rx_data = len[7:0];   @(posedge clk);
            tcp_rx_data = len[15:8];  @(posedge clk);
            tcp_rx_data = len[23:16]; @(posedge clk);
            tcp_rx_data = len[31:24]; @(posedge clk);
            
            for(i=0; i < (len+7)/8; i=i+1) begin 
                tcp_rx_data = tms_v[i*8 +: 8]; 
                @(posedge clk); 
            end
            for(i=0; i < (len+7)/8; i=i+1) begin 
                tcp_rx_data = tdi_v[i*8 +: 8]; 
                @(posedge clk); 
            end
            
            tcp_rx_valid = 0;
            tcp_rx_data = 8'h00;
            
            // 等待服务器处理完并准备好接收下一条
            wait(tcp_rx_ready); 
            #50;
        end
    endtask

    initial begin
        clk=0; rst=1; tcp_rx_valid=0; tcp_tx_ready=1;
        
        // 建议：复位释放也同步化
        #80; 
        @(posedge clk); 
        #2 rst=0; // 在上升沿后 2ns 释放复位，模拟真实电路的 Tco
        
        // 等待几个空周期
        repeat(5) @(posedge clk);
        
        //send_shift(32, 32'hFFFFFFFF, 32'h0); // Reset
        send_shift(5, 5'h1F, 5'h0); // Reset
        send_shift(4,  32'h00000002, 32'h0); // To Shift-DR
        send_shift(32, 32'h0, 32'h0);        // Read IDCODE
        
        #1000 $stop;
    end
endmodule