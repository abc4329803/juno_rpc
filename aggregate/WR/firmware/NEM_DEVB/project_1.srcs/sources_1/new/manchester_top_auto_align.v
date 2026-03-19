`timescale 1ns/1ps
// 单端输入版本：PAD(rx_p) → (Vivado自动插入IBUF) → 三路 IDELAYE2 (DELAY_SRC="DATAIN")
// → IDDR 边沿检测 → 自动相位校准（粗扫+微调）→ 单时钟 IEEE 802.3 曼彻斯特解码
//
// 端口：
//   clk_125    : 125 MHz 参考时钟（BUFG）
//   refclk200  : 200 MHz 给 IDELAYCTRL
//   rx_p       : 单端曼彻斯特码输入（只接一根线）
//   train_en   : 训练期使能（1=训练；0=业务）
//
// 约束（XDC）示例：
//   set_property PACKAGE_PIN <PIN>    [get_ports rx_p]
//   set_property IOSTANDARD LVCMOS25  [get_ports rx_p]

module manchester_top_auto_align #
(
  parameter integer TAP_BITS     = 5,   // IDELAYE2 CNTVALUEIN 宽度（0..31）
  parameter integer TAP_MAX      = 31,
  parameter integer DELTA_TAP    = 2,   // early/late 相对 mid 的偏移 taps
  parameter integer WIN_BITS     = 12,  // 统计窗口=2^WIN_BITS 比特（4096）
  parameter integer EDGE_THRESH  = 32,  // 早/晚差阈值（bang-bang）
  parameter integer GUARD_TAP    = 3    // 保护边界，避免贴边
)
(
  input  wire         clk_125,      // 125 MHz（BUFG）
  input  wire         rst,          // 同步复位，高有效
  input  wire         refclk200,    // 200 MHz 到 IDELAYCTRL
  input  wire         rx_p,         // 单端输入（只用这一根线）
  input  wire         train_en,     // 训练期=1

  output wire         data_valid,   // 位有效（125 Mb/s）
  output wire         data_out,     // 解码后的串行位
  output wire [TAP_BITS-1:0] tap_mid,
  output wire         locked
);

  // =========================================================================
  // 1) IDELAYCTRL（必须）——提供延迟标定参考时钟
  // =========================================================================
  wire idelayctrl_rdy;
//`ifndef SIM_IDELAY
  IDELAYCTRL u_idelayctrl (
    .RDY    (),
    .REFCLK (refclk200),
    .RST    (rst)
  );
// `else
  assign idelayctrl_rdy = 1'b1;
// `endif

  // =========================================================================
  // 2) 输入 → 三路 IDELAYE2（DELAY_SRC="DATAIN"）
  //    注意：这里**不**手写 IBUF，直接把 rx_p 喂给 DATAIN
  //    Vivado 会在 PAD 与逻辑之间自动插入 IBUF（单端）
  // =========================================================================
  wire rx_early, rx_mid, rx_late;

  wire [TAP_BITS-1:0] tap_mid_w;
  wire [TAP_BITS-1:0] tap_mid_next;
  wire [TAP_BITS-1:0] tap_early_next;
  wire [TAP_BITS-1:0] tap_late_next;
  wire                 load_all;
  wire                 cal_locked;

`ifndef SIM_IDELAY
  // ===== MID =====
  IDELAYE2 #(
    .DELAY_SRC("DATAIN"),            // <--- 关键：从 DATAIN 进
    .IDELAY_TYPE("VAR_LOAD"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .REFCLK_FREQUENCY(200.0),
    .IDELAY_VALUE(0),
    .PIPE_SEL("FALSE"),
    .CINVCTRL_SEL("FALSE"),
    .SIGNAL_PATTERN("DATA")
  ) u_idly_mid (
    .DATAOUT   (rx_mid),
    .DATAIN    (rx_p),               // <--- 直接用端口网，工具会自动插 IBUF
    .IDATAIN   (1'b0),
    .C         (clk_125),
    .CE        (1'b0),
    .INC       (1'b0),
    .CINVCTRL  (1'b0),
    .CNTVALUEIN(tap_mid_next),
    .CNTVALUEOUT(),
    .LD        (load_all),
    .LDPIPEEN  (1'b0),
    .REGRST    (rst)
  );

  // ===== EARLY =====
  IDELAYE2 #(
    .DELAY_SRC("DATAIN"),
    .IDELAY_TYPE("VAR_LOAD"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .REFCLK_FREQUENCY(200.0),
    .IDELAY_VALUE(0),
    .PIPE_SEL("FALSE"),
    .CINVCTRL_SEL("FALSE"),
    .SIGNAL_PATTERN("DATA")
  ) u_idly_early (
    .DATAOUT   (rx_early),
    .DATAIN    (rx_p),
    .IDATAIN   (1'b0),
    .C         (clk_125),
    .CE        (1'b0), .INC(1'b0), .CINVCTRL(1'b0),
    .CNTVALUEIN(tap_early_next),
    .CNTVALUEOUT(),
    .LD        (load_all), .LDPIPEEN(1'b0), .REGRST(rst)
  );

  // ===== LATE =====
  IDELAYE2 #(
    .DELAY_SRC("DATAIN"),
    .IDELAY_TYPE("VAR_LOAD"),
    .HIGH_PERFORMANCE_MODE("TRUE"),
    .REFCLK_FREQUENCY(200.0),
    .IDELAY_VALUE(0),
    .PIPE_SEL("FALSE"),
    .CINVCTRL_SEL("FALSE"),
    .SIGNAL_PATTERN("DATA")
  ) u_idly_late (
    .DATAOUT   (rx_late),
    .DATAIN    (rx_p),
    .IDATAIN   (1'b0),
    .C         (clk_125),
    .CE        (1'b0), .INC(1'b0), .CINVCTRL(1'b0),
    .CNTVALUEIN(tap_late_next),
    .CNTVALUEOUT(),
    .LD        (load_all), .LDPIPEEN(1'b0), .REGRST(rst)
  );
`else
  // 仿真：行为 IDELAY（外部 tb 提供 sim_idelay）
  sim_idelay #(.TAP_BITS(TAP_BITS)) sim_mid   (.din(rx_p), .tap(tap_mid_next),   .dout(rx_mid));
  sim_idelay #(.TAP_BITS(TAP_BITS)) sim_early (.din(rx_p), .tap(tap_early_next), .dout(rx_early));
  sim_idelay #(.TAP_BITS(TAP_BITS)) sim_late  (.din(rx_p), .tap(tap_late_next),  .dout(rx_late));
`endif

  // =========================================================================
  // 3) IDDR 采样（早/中/晚三路），做边沿统计
  // =========================================================================
  wire mid_q1, mid_q2, early_q1, early_q2, late_q1, late_q2;

`ifndef SIM_IDELAY
  IDDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE"), .SRTYPE("SYNC")) u_iddr_mid (
    .Q1(mid_q1), .Q2(mid_q2), .C(clk_125), .CE(1'b1), .D(rx_mid), .R(rst), .S(1'b0)
  );
  IDDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE"), .SRTYPE("SYNC")) u_iddr_early (
    .Q1(early_q1), .Q2(early_q2), .C(clk_125), .CE(1'b1), .D(rx_early), .R(rst), .S(1'b0)
  );
  IDDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE"), .SRTYPE("SYNC")) u_iddr_late (
    .Q1(late_q1), .Q2(late_q2), .C(clk_125), .CE(1'b1), .D(rx_late), .R(rst), .S(1'b0)
  );
`else
  // 仿真下用两拍替代
  reg mid_d, early_d, late_d;
  always @(posedge clk_125) begin
    mid_d   <= rx_mid;
    early_d <= rx_early;
    late_d  <= rx_late;
  end
  assign mid_q1   = rx_mid;   assign mid_q2   = mid_d;
  assign early_q1 = rx_early; assign early_q2 = early_d;
  assign late_q1  = rx_late;  assign late_q2  = late_d;
`endif

  wire mid_sample;
  assign mid_sample = mid_q1;                 // 中路“主采样”

  wire early_edge_pulse, late_edge_pulse;
  assign early_edge_pulse = early_q1 ^ early_q2;
  assign late_edge_pulse  =  late_q1 ^  late_q2;

  // =========================================================================
  // 4) 自动相位校准（粗扫 + 运行期微调）
  // =========================================================================
  idelay_autocal #(
    .TAP_BITS    (TAP_BITS),
    .TAP_MAX     (TAP_MAX),
    .DELTA_TAP   (DELTA_TAP),
    .WIN_BITS    (WIN_BITS),
    .EDGE_THRESH (EDGE_THRESH),
    .GUARD_TAP   (GUARD_TAP)
  ) u_autocal (
    .clk           (clk_125),
    .rst           (rst | ~idelayctrl_rdy),
    .train_en      (train_en),
    .early_edge    (early_edge_pulse),
    .late_edge     (late_edge_pulse),
    .tap_mid       (tap_mid_w),
    .tap_mid_next  (tap_mid_next),
    .tap_early_next(tap_early_next),
    .tap_late_next (tap_late_next),
    .load_all      (load_all),
    .locked        (cal_locked)
  );

  assign tap_mid = tap_mid_w;
  assign locked  = cal_locked;

  // =========================================================================
  // 5) 单时钟曼彻斯特解码（IEEE 802.3：上升=1，下降=0）
  // =========================================================================
  manchester_decoder_sc u_dec (
    .clk       (clk_125),
    .rst       (rst),
    .din       (mid_sample),
    .bit_valid (data_valid),
    .dout      (data_out)
  );

endmodule


// ======== 单时钟 Manchester 解码（IEEE 802.3：上升=1，下降=0） ========
// 假设输入采样点已由 IDELAY 居中
module manchester_decoder_sc(
  input  wire clk,
  input  wire rst,
  input  wire din,
  output reg  bit_valid,
  output reg  dout
);
  reg d1, d2;
  always @(posedge clk) begin
    if (rst) begin
      d1 <= 1'b0;
      d2 <= 1'b0;
    end else begin
      d1 <= din;
      d2 <= d1;
    end
  end

  wire edge_pulse;
  wire rise_pulse;
  assign edge_pulse = d1 ^ d2;
  assign rise_pulse = (~d2) & d1;

  always @(posedge clk) begin
    if (rst) begin
      bit_valid <= 1'b0;
      dout      <= 1'b0;
    end else begin
      bit_valid <= edge_pulse;
      if (edge_pulse) begin
        dout <= rise_pulse;  // 上升=1，下降=0
      end
    end
  end
endmodule
