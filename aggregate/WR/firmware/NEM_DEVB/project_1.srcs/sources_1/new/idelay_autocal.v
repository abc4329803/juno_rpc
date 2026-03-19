`timescale 1ns/1ps
// 自动相位校准控制器（Kintex-7 IDELAYE2 配套）
// - 训练期(train_en=1)：扫描 tap=0..TAP_MAX，按 |early-late| 最小选中心
// - 运行期：窗口内统计早/晚边沿计数差，超阈值则 mid±1 tap 微调（bang-bang）
// - 输出三路 taps：mid、early=mid-DELTA、late=mid+DELTA，并发出 load_all 去装载 IDELAYE2

module idelay_autocal #
(
  parameter integer TAP_BITS    = 5,
  parameter integer TAP_MAX     = 31,
  parameter integer DELTA_TAP   = 2,
  parameter integer WIN_BITS    = 12,  // 2^WIN_BITS 比特为一窗口
  parameter integer EDGE_THRESH = 32,
  parameter integer GUARD_TAP   = 3
)
(
  input  wire                  clk,
  input  wire                  rst,
  input  wire                  train_en,
  input  wire                  early_edge,
  input  wire                  late_edge,

  output reg  [TAP_BITS-1:0]   tap_mid,         // 对外观测
  output reg  [TAP_BITS-1:0]   tap_mid_next,    // 给 IDELAYE2 的下一个值
  output reg  [TAP_BITS-1:0]   tap_early_next,
  output reg  [TAP_BITS-1:0]   tap_late_next,
  output reg                   load_all,        // 1 拍脉冲
  output reg                   locked
);
  localparam [1:0] S_IDLE=2'd0, S_SCAN=2'd1, S_PICK=2'd2, S_RUN=2'd3;
  reg [1:0] state, state_n;

  // 窗口计数与边沿计数
  reg [WIN_BITS-1:0] win_cnt;
  wire win_done;
  assign win_done = &win_cnt;

  reg [15:0] ecnt, lcnt;

  // 扫描游标与评分
  reg [TAP_BITS-1:0] scan_tap;
  reg [15:0] best_score;
  reg [TAP_BITS-1:0] best_mid;

  // 状态
  always @(posedge clk) begin
    if (rst) state <= S_IDLE;
    else     state <= state_n;
  end

  always @* begin
    state_n = state;
    case (state)
      S_IDLE: if (train_en)                            state_n = S_SCAN;
      S_SCAN: if ((scan_tap==TAP_MAX) && win_done)     state_n = S_PICK;
      S_PICK:                                          state_n = S_RUN;
      S_RUN : if (train_en)                            state_n = S_SCAN;
      default:                                         state_n = S_IDLE;
    endcase
  end

  // 计数窗口与边沿统计
  always @(posedge clk) begin
    if (rst) begin
      win_cnt <= {WIN_BITS{1'b0}};
      ecnt    <= 16'd0;
      lcnt    <= 16'd0;
    end else begin
      win_cnt <= win_cnt + 1'b1;
      if (early_edge) ecnt <= ecnt + 1'b1;
      if (late_edge ) lcnt <= lcnt + 1'b1;
      if (win_done) begin
        win_cnt <= {WIN_BITS{1'b0}};
        ecnt    <= 16'd0;
        lcnt    <= 16'd0;
      end
    end
  end

  reg [15:0] score;
  // 主流程
  always @(posedge clk) begin
    load_all <= 1'b0;
    if (rst) begin
      scan_tap     <= {TAP_BITS{1'b0}};
      best_score   <= 16'hFFFF;
      best_mid     <= TAP_MAX[TAP_BITS-1:0] >> 1;
      tap_mid      <= TAP_MAX[TAP_BITS-1:0] >> 1;
      tap_mid_next <= TAP_MAX[TAP_BITS-1:0] >> 1;
      locked       <= 1'b0;
    end else begin
      case (state)
        S_IDLE: begin
          locked   <= 1'b0;
          scan_tap <= {TAP_BITS{1'b0}};
          best_score <= 16'hFFFF;
          best_mid   <= TAP_MAX[TAP_BITS-1:0] >> 1;
        end

        S_SCAN: begin
          if (win_done) begin
            // 得分小者为优（|early-late|）
            
            score = (ecnt > lcnt) ? (ecnt - lcnt) : (lcnt - ecnt);
            if (score < best_score) begin
              best_score <= score;
              best_mid   <= scan_tap;
            end
            if (scan_tap < TAP_MAX[TAP_BITS-1:0]) begin
              scan_tap <= scan_tap + 1'b1;
            end
          end
        end

        S_PICK: begin
          tap_mid      <= best_mid;
          tap_mid_next <= best_mid;
          load_all     <= 1'b1;     // 装载三路 IDELAY
          locked       <= 1'b1;
        end

        S_RUN: begin
          // 每窗口末按早/晚差微调（bang-bang）
          if (win_done) begin
            if ((lcnt > (ecnt + EDGE_THRESH)) && (tap_mid < (TAP_MAX - GUARD_TAP))) begin
              tap_mid      <= tap_mid + 1'b1;
              tap_mid_next <= tap_mid + 1'b1;
              load_all     <= 1'b1;
            end else if ((ecnt > (lcnt + EDGE_THRESH)) && (tap_mid > GUARD_TAP)) begin
              tap_mid      <= tap_mid - 1'b1;
              tap_mid_next <= tap_mid - 1'b1;
              load_all     <= 1'b1;
            end
          end
        end

        default: ;
      endcase
    end
  end

  // three taps （带边界保护）
  always @* begin
    if (tap_mid > DELTA_TAP[TAP_BITS-1:0]) begin
      tap_early_next = tap_mid - DELTA_TAP[TAP_BITS-1:0];
    end else begin
      tap_early_next = {TAP_BITS{1'b0}};
    end

    if ((tap_mid + DELTA_TAP[TAP_BITS-1:0]) > TAP_MAX[TAP_BITS-1:0]) begin
      tap_late_next = TAP_MAX[TAP_BITS-1:0];
    end else begin
      tap_late_next = tap_mid + DELTA_TAP[TAP_BITS-1:0];
    end
  end

endmodule
