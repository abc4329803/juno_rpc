`timescale 1ns/1ps
`define SIM_IDELAY
// Testbench 说明：
// - 使用你的 manchester_encoder.v 作为 Slave 端发射（IEEE 802.3 极性）
// - 不使用 Slave→Master 时钟线；Master 端为 manchester_top_auto_align
// - sim_idelay 行为模型用 #delay 实现 tap*STEP_NS + drift 的延迟
// - “温漂”变量现在声明在 testbench 内部，由 sim_idelay 通过层次名读取
//   （避免在 Verilog 根作用域声明，修复 [VRFC 10-8386] 报错）

module tb_manchester_autocal;

  //====================== 时钟产生 ======================
  reg clk_125 = 0;  // 125 MHz → 8 ns
  always #4  clk_125 = ~clk_125;

  reg clk_250 = 0;  // 250 MHz → 4 ns
  always #2  clk_250 = ~clk_250;

  reg refclk200 = 0; // 200 MHz 给 IDELAYCTRL（仿真）
  always #2.5 refclk200 = ~refclk200;

  //====================== 复位/训练 ======================
  reg rst = 1;
  initial begin
    #100 rst = 0;
  end

  reg train_en = 1;   // 上电训练 2 us
  initial begin
    #2000; train_en = 0;
  end

  //====================== Slave 侧：你的编码器 ======================
  reg  din = 0;
  wire mdo;

  manchester_encoder u_enc (
    .clk2x (clk_250),
    .clk   (clk_125),
    .rst   (rst),
    .din   (din),
    .mdo   (mdo)
  );

  // 简单 PRBS 驱动
  reg [6:0] prbs = 7'h5A;
  always @(posedge clk_125) begin
    if (rst) begin
      prbs <= 7'h5A;
      din  <= 1'b0;
    end else begin
      din  <= prbs[0];
      prbs <= {prbs[5:0], prbs[6]^prbs[5]};
    end
  end

  //====================== Master 侧 DUT ======================
  wire rx_p = mdo;     // LVDS 仿真：单端驱动正端
  wire rx_n = ~mdo;    // 负端取反

  wire        data_valid, data_out, locked;
  wire [4:0]  tap_mid;

  manchester_top_auto_align #(
    .TAP_BITS(5), .TAP_MAX(31), .DELTA_TAP(2),
    .WIN_BITS(12), .EDGE_THRESH(32), .GUARD_TAP(3)
  ) dut (
    .clk_125   (clk_125),
    .rst       (rst),
    .refclk200 (refclk200),
    .rx_p      (rx_p),
    .rx_n      (rx_n),
    .train_en  (train_en),
    .data_valid(data_valid),
    .data_out  (data_out),
    .tap_mid   (tap_mid),
    .locked    (locked)
  );

  //====================== 误码统计 ======================
  integer bit_cnt = 0;
  integer err_cnt = 0;
  always @(posedge clk_125) begin
    if (rst) begin
      bit_cnt <= 0;
      err_cnt <= 0;
    end else if (data_valid) begin
      bit_cnt <= bit_cnt + 1;
      if (data_out !== din) err_cnt <= err_cnt + 1;
    end
  end

  //====================== 温漂注入（testbench 内部变量） ======================
  // 注意：Vivado 不允许在 root 作用域声明变量，这里把 drift 放在 tb 模块内
  integer sim_idelay_drift_units = 0;

  // 漂移脚本（按时间改变 drift 单位）
  initial begin
    #20000; sim_idelay_drift_units = 1;  // +1 单位
    #20000; sim_idelay_drift_units = 2;  // +2 单位
    #20000; sim_idelay_drift_units = 3;  // +3 单位
    #20000; sim_idelay_drift_units = 1;  // 回到 +1
  end

  // 观察窗口
  initial begin
    $display("  time  locked  tap  bits   errs");
    repeat (60) begin
      #2000;
      $display("%6t   %1d     %2d  %5d  %5d",
               $time, locked, tap_mid, bit_cnt, err_cnt);
    end
    $finish;
  end

endmodule


//====================== 行为版 IDELAY（仅仿真） ======================
// 接口保持与顶层中 `sim_idelay` 一致（.din .tap .dout）。
// 通过层次名访问 testbench 中的 sim_idelay_drift_units，避免 root 变量。
module sim_idelay #(
  parameter integer TAP_BITS = 5,
  parameter real    STEP_NS  = 0.050   // 50 ps / tap
)(
  input  wire                din,
  input  wire [TAP_BITS-1:0] tap,
  output reg                 dout
);
  real total_ns;

  // 使用层次引用读取 testbench 内的 drift 变量：
  // tb_manchester_autocal.sim_idelay_drift_units
  // 这在仿真中是合法的（不可综合）。
  always @(din or tap
           or tb_manchester_autocal.sim_idelay_drift_units) begin
    total_ns = (tap * STEP_NS)
             + (tb_manchester_autocal.sim_idelay_drift_units * STEP_NS);
    #(total_ns) dout = din;
  end
endmodule
