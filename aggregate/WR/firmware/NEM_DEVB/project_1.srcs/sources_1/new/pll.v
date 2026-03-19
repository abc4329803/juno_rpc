module pll (
    input clk_in,      // 输入时钟 10 MHz
    input rst_n,         // 复位信号
    output reg jtag_clk     // 输出时钟 2.5MHz
);
    reg [7:0] count;  // 计数器

//    always @(posedge clk_in or posedge rst_n) begin
    always @(posedge clk_in) begin
        if (!rst_n) begin
            count <= 0;  // 复位时，计数器清零
            jtag_clk <= 0;    // 输出时钟清零
        end else begin
/*             if (count == 1) begin
                count <= 0;  // 每 n 个输入时钟周期后重置计数器
                jtag_clk <= ~jtag_clk; // 翻转输出时钟
            end else begin
                count <= count + 1;  // 计数器递增
            end */
            jtag_clk <= ~jtag_clk; // 翻转输出时钟
        end
    end
   
endmodule
