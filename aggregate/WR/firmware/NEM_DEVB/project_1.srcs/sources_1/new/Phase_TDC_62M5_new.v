`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    Phase_TDC_62M5
// Description:    Fixed Port definitions to match Testbench
//////////////////////////////////////////////////////////////////////////////////

module Phase_TDC_62M5_new #
(
    parameter PILELINE_NUM = 4'd4 // 保持兼容性保留
)
(
    input   hit,                // 探测器击中信号
    input   reset,              // 高电平复位
    
    // --- Configuration Port ---
    input   [6:0] CHANNEL_NUM,  // [恢复为输入端口] 通道编号
    
    // --- Clocks ---
    input   clk0,               // 250MHz Phase 0
    input   clk90,              // 250MHz Phase 90
    input   clk180,             // 250MHz Phase 180
    input   clk270,             // 250MHz Phase 270
    input   clksys,             // 62.5MHz System Clock
    input   clkm,               // 62.5MHz (Optional)

    // --- Coarse Time Inputs ---
    input   [27:0] coarse_time, // Unit: 16ns
    input   [39:0] second_time, // Unit: 1s

    // --- Output Interface (Connect to FIFO Slave) ---
    output  reg FULL_DATA_VALID_S,    // TDC Output Data Valid
    input       FULL_DATA_READY_S,    // FIFO Ready (Backpressure)
    output  [127:0] FULL_DATA_M,      // TDC Output Data (Data to FIFO)
    
    // --- Debug/Status Outputs ---
    output  [3:0] FE_time_debug,
    output  time_valid_debug
);

    //================================================================
    // 1. High Speed Sampling (250 MHz Domain)
    //================================================================
    wire sample_0, sample_90, sample_180, sample_270;
    
    FDCE #(.INIT(1'b0)) FD_0   (.C(clk0),   .CE(1'b1), .CLR(reset), .D(hit), .Q(sample_0));
    FDCE #(.INIT(1'b0)) FD_90  (.C(clk90),  .CE(1'b1), .CLR(reset), .D(hit), .Q(sample_90));
    FDCE #(.INIT(1'b0)) FD_180 (.C(clk180), .CE(1'b1), .CLR(reset), .D(hit), .Q(sample_180));
    FDCE #(.INIT(1'b0)) FD_270 (.C(clk270), .CE(1'b1), .CLR(reset), .D(hit), .Q(sample_270));

    //================================================================
    // 2. Alignment to clk0 (250 MHz Domain)
    //================================================================
    reg [3:0] phase_data_raw;
    always @(posedge clk0) begin
        if (reset) phase_data_raw <= 4'b0;
        else begin
            phase_data_raw[0] <= sample_0;
            phase_data_raw[1] <= sample_90;
            phase_data_raw[2] <= sample_180;
            phase_data_raw[3] <= sample_270;
        end
    end

    //================================================================
    // 3. Deserialization 4:16 (Sync to clksys 62.5 MHz)
    //================================================================
    reg [15:0] hit_window_shift;
    reg [15:0] captured_window;
    
    always @(posedge clk0) begin
        if (reset) hit_window_shift <= 16'b0;
        else hit_window_shift <= {phase_data_raw, hit_window_shift[15:4]};
    end

    always @(posedge clksys) begin
        if (reset) captured_window <= 16'b0;
        else captured_window <= hit_window_shift; 
    end

    //================================================================
    // 4. Fine Time Encoding (62.5 MHz Domain)
    //================================================================
    reg [3:0] r_FE_time;
    reg       r_hit_valid;
    reg       last_bit_history; 
    integer i;
    reg found_edge;
    reg [3:0] temp_fine_time;

    always @(posedge clksys) begin
        if (reset) begin
            r_FE_time <= 4'b0;
            r_hit_valid <= 1'b0;
            last_bit_history <= 1'b0;
        end else begin
            found_edge = 1'b0;
            temp_fine_time = 4'b0;
            last_bit_history <= captured_window[15]; 

            for (i = 0; i < 16; i = i + 1) begin
                if (!found_edge) begin
                    if (captured_window[i] == 1'b1) begin
                        if (i == 0) begin
                            if (last_bit_history == 1'b0) begin
                                temp_fine_time = i[3:0];
                                found_edge = 1'b1;
                            end
                        end else begin
                            if (captured_window[i-1] == 1'b0) begin
                                temp_fine_time = i[3:0];
                                found_edge = 1'b1;
                            end
                        end
                    end
                end
            end

            if (found_edge) begin
                r_FE_time <= temp_fine_time;
                r_hit_valid <= 1'b1;
            end else begin
                r_hit_valid <= 1'b0;
            end
        end
    end

    //================================================================
    // 5. Coarse Time Delay Alignment
    //================================================================
    reg [27:0] coarse_time_d1, coarse_time_d2, coarse_time_d3;
    reg [39:0] second_time_d1, second_time_d2, second_time_d3;

    always @(posedge clksys) begin
        coarse_time_d1 <= coarse_time;
        coarse_time_d2 <= coarse_time_d1;
        coarse_time_d3 <= coarse_time_d2; 

        second_time_d1 <= second_time;
        second_time_d2 <= second_time_d1;
        second_time_d3 <= second_time_d2;
    end

    //================================================================
    // 6. Output Generation
    //================================================================
    reg [127:0] data_pack;
    reg [15:0]  trig_cnt;

    always @(posedge clksys) begin
        if (reset) begin
            trig_cnt <= 16'b0;
            FULL_DATA_VALID_S <= 1'b0;
            data_pack <= 128'b0;
        end else begin
            if (r_hit_valid) begin
                trig_cnt <= trig_cnt + 1'b1;
                FULL_DATA_VALID_S <= 1'b1;
                
                // Data Layout: [TriggerID 16] [Channel 7] [Second 40] [Coarse 28] [Fine 4]
                data_pack <= {
                    32'b0,                  // Padding
                    trig_cnt,               // 16 bit
                    CHANNEL_NUM,            // 7 bit (Input Port)
                    1'b0,                   // Padding
                    second_time_d3,         // 40 bit
                    coarse_time_d3,         // 28 bit
                    r_FE_time               // 4 bit
                };
            end else begin
                FULL_DATA_VALID_S <= 1'b0;
            end
        end
    end

    assign FULL_DATA_M = data_pack;
    
    // Debug output
    assign FE_time_debug = r_FE_time;
    assign time_valid_debug = r_hit_valid;
    
endmodule