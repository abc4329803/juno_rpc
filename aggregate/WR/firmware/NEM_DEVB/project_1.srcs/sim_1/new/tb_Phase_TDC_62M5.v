`timescale 1ns / 1ps

module tb_Phase_TDC_62M5;

    //================================================================
    // 1. 信号定义
    //================================================================
    parameter PILELINE_NUM = 4;
    
    // Inputs
    reg hit;
    reg [6:0] CHANNEL_NUM; 
    reg clk0;
    
    // 使用 wire + assign 避免仿真器调度崩溃
    wire clk90;
    wire clk180;
    wire clk270;
    
    reg clksys;
    reg reset;
    reg [27:0] coarse_time;
    reg [39:0] second_time;
    reg FULL_DATA_READY_S; 

    // Outputs
    wire FULL_DATA_VALID_S; 
    wire [127:0] FULL_DATA_M;
    wire [3:0] FE_time_debug;
    wire time_valid_debug;

    // 测试控制变量
    integer i;
    integer timeout_cnt;
    reg data_found;
    reg [3:0] expected_fe;
    reg [3:0] measured_fe; // 新增变量用于结果对比
    reg error_flag;

    //================================================================
    // 2. 模块实例化
    //================================================================
    Phase_TDC_62M5_new #(
        .PILELINE_NUM(PILELINE_NUM)
    ) uut (
        .hit(hit), 
        .CHANNEL_NUM(CHANNEL_NUM), 
        .clk0(clk0), 
        .clk90(clk90), 
        .clk180(clk180), 
        .clk270(clk270), 
        .clksys(clksys), 
        .clkm(clksys), 
        .reset(reset), 
        .coarse_time(coarse_time), 
        .second_time(second_time), 
        .FULL_DATA_VALID_S(FULL_DATA_VALID_S), 
        .FULL_DATA_READY_S(FULL_DATA_READY_S), 
        .FULL_DATA_M(FULL_DATA_M), 
        .FE_time_debug(FE_time_debug), 
        .time_valid_debug(time_valid_debug)
    );

    //================================================================
    // 3. 时钟生成
    //================================================================
    // 250MHz Base Clock
    initial begin
        clk0 = 0;
        forever #2 clk0 = ~clk0;
    end

    // 使用 assign 产生相位延迟 (最安全的写法)
    assign #1 clk90  = clk0;
    assign #2 clk180 = clk0;
    assign #3 clk270 = clk0;

    // 62.5MHz System Clock
    initial begin
        clksys = 0;
        forever #8 clksys = ~clksys;
    end

    // Coarse Time Counter
    always @(posedge clksys) begin
        if (reset) begin
            coarse_time <= 0;
            second_time <= 0;
        end else begin
            coarse_time <= coarse_time + 1;
        end
    end

    //================================================================
    // 4. 主测试流程 (无 task, 无 fork)
    //================================================================
    initial begin
        // 初始化
        hit = 0;
        reset = 1;
        CHANNEL_NUM = 7'd5;     
        FULL_DATA_READY_S = 1;  
        error_flag = 0;

        #100;
        reset = 0;
        #100;

        $display("Starting Phase Sweep Test...");

        // 循环测试 0ns 到 15ns 的延迟
        for (i = 0; i < 16; i = i + 1) begin
            expected_fe = i[3:0];
            
            // 同步到系统时钟
            @(posedge clksys);
            
            // 产生精确的ns延迟
            #(i); 
            
            hit = 1;
            $display("[%0t ns] Testing Delay: %0d ns.", $time, i);
            
            #6; // Hit 持续 6ns
            hit = 0;

            // --- 轮询等待数据 ---
            timeout_cnt = 0;
            data_found = 0;

            // 等待最多 20 个周期
            while (data_found == 0 && timeout_cnt < 20) begin
                @(posedge clksys);
                
                // 检查 Valid 信号
                if (FULL_DATA_VALID_S == 1) begin
                    data_found = 1;
                    
                    // --- 直接在这里检查结果，不调用 task ---
                    measured_fe = FULL_DATA_M[3:0];
                    if (measured_fe === expected_fe) begin
                        $display("  [PASS] Exp: %d, Meas: %d", expected_fe, measured_fe);
                    end else begin
                        $display("  [FAIL] Exp: %d, Meas: %d", expected_fe, measured_fe);
                        error_flag = 1;
                    end
                    // -------------------------------------
                    
                end else begin
                    timeout_cnt = timeout_cnt + 1;
                end
            end

            // 超时处理
            if (data_found == 0) begin
                $display("Error: Timeout for delay %0d ns (No Valid Data)", i);
                error_flag = 1;
            end

            // 间隔等待
            repeat(5) @(posedge clksys);
        end

        if (error_flag)
            $display("TEST FAILED");
        else
            $display("TEST PASSED: All phases valid.");
        
        $stop;
    end

endmodule