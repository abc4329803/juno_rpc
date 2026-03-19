`timescale 1ns / 100ps

module tb_system_integrated;

    // -----------------------------------------------------------
    // 参数配置
    // -----------------------------------------------------------
    parameter DATA_WIDTH = 112;
    parameter CLK_PERIOD = 16.0; // 62.5 MHz
    
    // 模拟环境参数
    parameter CABLE_DELAY = 10.0; // 10ns delay (~2 meters)
    parameter POLARITY_SWAP = 1;  // 1 = Simulate PCB error
    
    // -----------------------------------------------------------
    // 信号定义
    // -----------------------------------------------------------
    reg sys_clk;
    reg sys_rst_n;
    
    // 互连线 (Coax)
    wire master_tx_clk;     // Master -> Slave Clock
    wire master_tx_uart;    // Master -> Slave UART
    wire slave_tx_p, slave_tx_n; // Slave -> Master Data
    
    // 模拟延迟后的信号
    wire slave_rx_clk_dly;
    wire slave_rx_uart_dly;
    wire master_rx_p_dly, master_rx_n_dly;
    
    // Slave 输入数据
    reg [DATA_WIDTH-1:0] slave_user_data;
    
    // Master 输出结果
    wire [DATA_WIDTH-1:0] master_rec_data;
    wire master_rec_valid;
    wire m_align_done;
    wire m_polarity_inv;
    wire [2:0] m_debug_state;

    // -----------------------------------------------------------
    // 模块实例化
    // -----------------------------------------------------------

    // 1. Master PHY (RX)
    // 注意：UART TX 需要一个简单的Driver，这里用 assign 模拟 master_rx_phy 的输出触发
    reg uart_trigger_sim;
    always @(m_align_done) uart_trigger_sim = m_align_done ? 0 : 1; // 0=Data Mode (active low logic simulation)

    master_rx_phy #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_master (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .rx_p(master_rx_p_dly), // 接收带延迟和极性反转的数据
        .rx_n(master_rx_n_dly),
        .uart_tx_trigger(), // 连接到UART TX模块，这里简化
        .m_data_out(master_rec_data),
        .m_data_valid(master_rec_valid),
        .align_done(m_align_done),
        .polarity_inv(m_polarity_inv),
        .debug_state(m_debug_state)
    );

    // 2. Slave TX
    // 模拟 UART 接收：Master校准完成后拉低UART线告诉Slave发数据
    wire slave_uart_cmd = ~m_align_done; // Simple protocol: High=Train, Low=Data

    slave_tx #(
        .DATA_WIDTH(DATA_WIDTH)
    ) u_slave (
        .rx_clk_in(slave_rx_clk_dly),
        .rst_n(sys_rst_n), // 假设Slave复位与系统同步
        .uart_rx(slave_uart_cmd), 
        .user_data_in(slave_user_data),
        .user_data_valid(1'b1),
        .tx_p(slave_tx_p),
        .tx_n(slave_tx_n)
    );

    // -----------------------------------------------------------
    // 物理环境模拟 (关键)
    // -----------------------------------------------------------
    
    // 时钟发生器
    initial sys_clk = 0;
    always #(CLK_PERIOD/2) sys_clk = ~sys_clk;
    
    // 1. 线缆延迟 (Master -> Slave)
    assign #CABLE_DELAY slave_rx_clk_dly = sys_clk; // Master发出的时钟就是sys_clk (ODDR转发)
    
    // 2. 线缆延迟 (Slave -> Master) + 极性反转模拟
    wire p_wire = slave_tx_p;
    wire n_wire = slave_tx_n;
    
    assign #CABLE_DELAY master_rx_p_dly = POLARITY_SWAP ? n_wire : p_wire;
    assign #CABLE_DELAY master_rx_n_dly = POLARITY_SWAP ? p_wire : n_wire;

    // -----------------------------------------------------------
    // 测试流程
    // -----------------------------------------------------------
    initial begin
        $display("=== Starting Simulation with Cable Delay = %dns, Polarity Swap = %d ===", CABLE_DELAY, POLARITY_SWAP);
        
        sys_rst_n = 0;
        slave_user_data = 0;
        #200; // Hold reset
        
        sys_rst_n = 1;
        $display("=== Reset Released. Waiting for Calibration (Wait time + Scan time) ===");
        
        // 模拟用户数据 (特定Pattern以便验证)
        // 高位 AA..AA, 低位 55..55
        slave_user_data = { {(DATA_WIDTH/2){1'b1}}, {(DATA_WIDTH/2){1'b0}} }; 
        slave_user_data = 112'hAABBCCDDEEFF0011223344556677;

        // 等待Master锁定
        wait (m_align_done == 1);
        $display("=== Master Locked! Time: %t ===", $time);
        $display("Detected Polarity Inversion: %b (Expected: %b)", m_polarity_inv, POLARITY_SWAP[0]);

        if (m_polarity_inv !== POLARITY_SWAP[0]) begin
            $display("ERROR: Polarity detection failed!");
            $stop;
        end

        // 锁定后，Slave 应该收到指令切换到数据模式
        // 等待数据传输 (加上流水线延迟)
        repeat(100) @(posedge sys_clk);
        
        // 检查接收数据
        wait (master_rec_valid == 1);
        $display("Rx Data: %h", master_rec_data);
        $display("Tx Data: %h", slave_user_data);
        
        if (master_rec_data == slave_user_data) 
            $display("=== SUCCESS: Data integrity verified! ===");
        else
            $display("=== ERROR: Data mismatch! ===");
            
        #1000 $finish;
    end

endmodule