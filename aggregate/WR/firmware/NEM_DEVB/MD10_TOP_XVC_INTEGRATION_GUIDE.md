# MD10_top.sv XVC集成指南

## 概述
在MD10_top.sv中添加第2个SiTCP实例用于XVC调试，与现有的数据传输SiTCP共享GMII接口。

## 修改步骤

### 1. 在模块端口添加XVC状态输出（第199行后添加）

```systemverilog
  output wire [31:0] FLASH_READ_ADDRESS,

  // === XVC Debug Outputs (新增) ===
  output wire        xvc_active,
  output wire        xvc_tcp_open,
  output wire [2:0]  xvc_state_debug
);
```

### 2. 在信号声明区域添加XVC相关信号（第560行后添加）

```systemverilog
  );  // SiTCP_XC7K_32K_BBT_V110 实例结束

  // ========================================================================
  // XVC Debug - 第2个SiTCP实例和相关逻辑
  // ========================================================================

  // === SiTCP #1 (XVC) TCP接口信号 ===
  wire [7:0]  sitcp1_tcp_rx_data;
  wire        sitcp1_tcp_rx_wr;
  wire [15:0] sitcp1_tcp_rx_wc;
  wire [7:0]  sitcp1_tcp_tx_data;
  wire        sitcp1_tcp_tx_wr;
  wire        sitcp1_tcp_tx_full;
  wire        sitcp1_tcp_open;
  wire        sitcp1_tcp_close;

  // === SiTCP #1 RBCP信号（不使用，但需要声明）===
  wire [31:0] sitcp1_rbcp_addr;
  wire [7:0]  sitcp1_rbcp_wd;
  wire        sitcp1_rbcp_we;
  wire        sitcp1_rbcp_re;
  wire        sitcp1_rbcp_act;

  // === GMII仲裁器信号 ===
  wire [7:0]  arb_gmii_rxd;
  wire        arb_gmii_rx_dv;
  wire        arb_gmii_rx_er;
  wire [7:0]  sitcp0_gmii_rxd;
  wire        sitcp0_gmii_rx_dv;
  wire        sitcp0_gmii_rx_er;
  wire [7:0]  sitcp1_gmii_rxd;
  wire        sitcp1_gmii_rx_dv;
  wire        sitcp1_gmii_rx_er;
  wire        gmii_arb_active;  // 0=sitcp0, 1=sitcp1

  // === XVC服务器信号 ===
  wire        xvc_tcp_rx_ready;
  wire        xvc_tcp_tx_valid;
  wire        xvc_tck, xvc_tms, xvc_tdi, xvc_tdo;
  wire        jtag_sel;

  assign sitcp1_tcp_rx_wc = 16'hFFFF;  // XVC总是准备接收
  assign xvc_tcp_open = sitcp1_tcp_open;
```

### 3. 修改现有SiTCP #0的GMII连接（第518-525行）

**原代码：**
```systemverilog
  .GMII_TX_EN(gmii_rx_dv),                         // out: Tx enable
  .GMII_TXD(gmii_rxd[7:0]),                       // out: Tx data[7:0]
  .GMII_TX_ER(gmii_rx_er),                         // out: TX error
  // RX
  .GMII_RX_CLK(gmii_clk_o),                       // in: Rx clock(2.5 or 25MHz or 125MHz)
  .GMII_RX_DV(gmii_tx_en),                         // in: Rx data valid
  .GMII_RXD(gmii_txd[7:0]),                       // in: Rx data[7:0]
  .GMII_RX_ER(gmii_tx_er),                         // in: Rx error
```

**改为：**
```systemverilog
  .GMII_TX_EN(sitcp0_gmii_rx_dv),                 // out: Tx enable (to arbiter)
  .GMII_TXD(sitcp0_gmii_rxd[7:0]),               // out: Tx data (to arbiter)
  .GMII_TX_ER(sitcp0_gmii_rx_er),                 // out: TX error (to arbiter)
  // RX
  .GMII_RX_CLK(gmii_clk_o),                       // in: Rx clock
  .GMII_RX_DV(arb_gmii_rx_dv),                    // in: Rx data valid (from arbiter)
  .GMII_RXD(arb_gmii_rxd[7:0]),                   // in: Rx data (from arbiter)
  .GMII_RX_ER(arb_gmii_rx_er),                    // in: Rx error (from arbiter)
```

### 4. 在第560行SiTCP实例后添加第2个SiTCP实例

```systemverilog
  );  // 第1个SiTCP实例结束

  // ========================================================================
  // 第2个SiTCP实例：XVC调试（端口2542）
  // ========================================================================
  SiTCP_XC7K_32K_BBT_V110 SiTCP_XVC_inst(
    .CLK(testgtrefclk),
    .RST(RST),
    .TIM_1US(TIM_1US),
    .TIM_1MS(TIM_1MS),
    .TIM_1S(TIM_1S),
    .TIM_1M(TIM_1M),

    // Configuration
    .MODE_GMII(1'b1),
    .MIN_RX_IPG(4'd4),
    .IP_ADDR_IN(my_ip_addr),                        // 使用相同IP地址
    .IP_ADDR_DEFAULT(),
    .TCP_MAIN_PORT_IN(16'd2542),                    // *** XVC标准端口 ***
    .TCP_MAIN_PORT_DEFAULT(),
    .TCP_SUB_PORT_IN(16'b0),
    .TCP_SUB_PORT_DEFAULT(),
    .TCP_SERVER_MAC_IN(tcp_server_mac[47:0]),
    .TCP_SERVER_MAC_DEFAULT(tcp_server_mac[47:0]),
    .TCP_SERVER_ADDR_IN(tcp_server_addr[31:0]),
    .TCP_SERVER_ADDR_DEFAULT(tcp_server_addr[31:0]),
    .TCP_SERVER_PORT_IN(tcp_server_port[15:0]),
    .TCP_SERVER_PORT_DEFAULT(tcp_server_port[15:0]),
    .RBCP_PORT_IN(16'd4661),                        // 不同的RBCP端口
    .RBCP_PORT_DEFAULT(),
    .PHY_ADDR(PHY_ADDRESS[4:0]),

    // GMII Interface
    .GMII_1000M(1'b1),
    .GMII_RSTn(),
    // TX (from arbiter to SiTCP)
    .GMII_TX_CLK(gmii_clk_o),
    .GMII_TX_EN(sitcp1_gmii_rx_dv),                 // from arbiter
    .GMII_TXD(sitcp1_gmii_rxd[7:0]),
    .GMII_TX_ER(sitcp1_gmii_rx_er),
    // RX (from SiTCP to WR core via arbiter)
    .GMII_RX_CLK(gmii_clk_o),
    .GMII_RX_DV(arb_gmii_rx_dv),                    // to arbiter
    .GMII_RXD(arb_gmii_rxd[7:0]),
    .GMII_RX_ER(arb_gmii_rx_er),
    .GMII_CRS(1'b0),
    .GMII_COL(1'b0),
    .GMII_MDC(),
    .GMII_MDIO_IN(1'b1),
    .GMII_MDIO_OUT(),
    .GMII_MDIO_OE(),

    // TCP Control
    .SiTCP_RST(),
    .OPEN_REQ(1'b0),
    .MAIN_OPEN_ACK(sitcp1_tcp_open),
    .SUB_OPEN_ACK(),
    .TCP_OPEN_ERROR(),
    .TCP_TX_OW_ERROR(),
    .CLOSE_REQ(sitcp1_tcp_close),
    .CLOSE_ACK(sitcp1_tcp_close),

    // TCP FIFO Interface
    .RX_FILL(sitcp1_tcp_rx_wc),
    .RX_WR(sitcp1_tcp_rx_wr),
    .RX_DATA(sitcp1_tcp_rx_data),
    .TX_FULL(sitcp1_tcp_tx_full),
    .TX_FILL(),
    .TX_WR(sitcp1_tcp_tx_wr),
    .TX_DATA(sitcp1_tcp_tx_data),

    // RBCP (unused for XVC)
    .LOC_ACT(sitcp1_rbcp_act),
    .LOC_ADDR(sitcp1_rbcp_addr),
    .LOC_WD(sitcp1_rbcp_wd),
    .LOC_WE(sitcp1_rbcp_we),
    .LOC_RE(sitcp1_rbcp_re),
    .LOC_ACK(1'b0),
    .LOC_RD(8'h00),
    .MAC_SELECT(MAC_SELECT[3:0])
  );

  // ========================================================================
  // XVC服务器实例
  // ========================================================================
  xvc_server #(
    .BUFFER_SIZE(2048)
  ) xvc_server_inst (
    .clk(testgtrefclk),
    .rst(RST),

    // TCP接口（连接到SiTCP #1）
    .tcp_rx_data(sitcp1_tcp_rx_data),
    .tcp_rx_valid(sitcp1_tcp_rx_wr),
    .tcp_rx_ready(xvc_tcp_rx_ready),

    .tcp_tx_data(sitcp1_tcp_tx_data),
    .tcp_tx_valid(xvc_tcp_tx_valid),
    .tcp_tx_ready(~sitcp1_tcp_tx_full),

    // JTAG信号
    .tck(xvc_tck),
    .tms(xvc_tms),
    .tdi(xvc_tdi),
    .tdo(xvc_tdo),

    // 状态
    .state_debug(xvc_state_debug),
    .xvc_active(xvc_active)
  );

  assign sitcp1_tcp_tx_wr = xvc_tcp_tx_valid & ~sitcp1_tcp_tx_full;

  // ========================================================================
  // JTAG TAP控制器实例
  // ========================================================================
  jtag_tap_controller jtag_tap_inst (
    .clk(testgtrefclk),
    .rst(RST),

    .xvc_tck(xvc_tck),
    .xvc_tms(xvc_tms),
    .xvc_tdi(xvc_tdi),
    .xvc_tdo(xvc_tdo),
    .xvc_enable(xvc_active),

    .jtag_capture(),
    .jtag_shift(),
    .jtag_update(),
    .jtag_reset(),
    .jtag_sel(jtag_sel)
  );

  // ========================================================================
  // GMII仲裁器：两个SiTCP共享GMII接口
  // ========================================================================
  dual_sitcp_arbiter arbiter_inst (
    .clk(testgtrefclk),
    .rst(RST),

    // WR core的GMII接口
    .gmii_clk_i(gmii_clk_o),
    .rst_gmii_i(rst_gmii_o),
    .gmii_txd_i(gmii_txd),        // from WR core
    .gmii_tx_en_i(gmii_tx_en),
    .gmii_tx_er_i(gmii_tx_er),
    .gmii_rxd_o(gmii_rxd),        // to WR core
    .gmii_rx_dv_o(gmii_rx_dv),
    .gmii_rx_er_o(gmii_rx_er),

    // SiTCP #0 (数据)
    .sitcp0_gmii_txd(arb_gmii_rxd),     // 注意：arbiter视角的txd是SiTCP的rxd
    .sitcp0_gmii_tx_en(arb_gmii_rx_dv),
    .sitcp0_gmii_tx_er(arb_gmii_rx_er),
    .sitcp0_gmii_rxd(sitcp0_gmii_rxd),
    .sitcp0_gmii_rx_dv(sitcp0_gmii_rx_dv),
    .sitcp0_gmii_rx_er(sitcp0_gmii_rx_er),

    // SiTCP #1 (XVC)
    .sitcp1_gmii_txd(arb_gmii_rxd),     // 广播接收
    .sitcp1_gmii_tx_en(arb_gmii_rx_dv),
    .sitcp1_gmii_tx_er(arb_gmii_rx_er),
    .sitcp1_gmii_rxd(sitcp1_gmii_rxd),
    .sitcp1_gmii_rx_dv(sitcp1_gmii_rx_dv),
    .sitcp1_gmii_rx_er(sitcp1_gmii_rx_er),

    .priority_mode(2'b00),              // 平等优先级
    .active_instance(gmii_arb_active),
    .arb_cycles_data(),
    .arb_cycles_xvc()
  );
```

## 在top.sv中例化MD10_top并连接XVC信号

在`top.sv`中添加XVC输出端口：

```systemverilog
module top #(
  // ... 现有参数 ...
)(
  // ... 现有端口 ...

  // === 添加XVC调试端口 ===
  output wire        xvc_active,
  output wire        xvc_tcp_open,
  output wire [2:0]  xvc_state_debug
);
```

在MD10_top实例化中连接：

```systemverilog
MD10_top #(
  // ... 参数 ...
) MD10_top_inst (
  // ... 现有连接 ...

  // XVC调试输出
  .xvc_active(xvc_active),
  .xvc_tcp_open(xvc_tcp_open),
  .xvc_state_debug(xvc_state_debug)
);
```

## 使用方法

### 1. 编译并烧录固件

```tcl
# Vivado Tcl
open_project project_1.xpr
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
```

### 2. 在Vivado中连接XVC

```tcl
# 在Vivado Tcl Console执行
open_hw_manager
connect_hw_server
open_hw_target -xvc_url 192.168.10.34:2542

# 现在可以看到Kintex-7的JTAG链
get_hw_devices

# 烧录调试probe文件
set_property PROBES.FILE {path/to/debug_probes.ltx} [current_hw_device]
refresh_hw_device [current_hw_device]

# 运行ILA触发
run_hw_ila [get_hw_ilas]
```

### 3. 命令行测试

```bash
# 测试TCP连接
telnet 192.168.10.34 2542

# 发送XVC getinfo命令
echo -n "getinfo:" | nc 192.168.10.34 2542
# 应该返回：xvcServer_v1.0:2048
```

## 调试技巧

1. **检查TCP连接状态**：
   - 端口24：数据传输（原有功能）
   - 端口2542：XVC调试（新增功能）
   - 使用ILA观察`xvc_active`、`sitcp0_tcp_open`、`sitcp1_tcp_open`

2. **GMII仲裁监控**：
   - 观察`gmii_arb_active`信号确认两个SiTCP正确切换

3. **XVC协议调试**：
   - 观察`xvc_state_debug`了解协议状态机
   - 检查`jtag_sel`确认BSCANE2被正确选中

## 注意事项

1. **IP地址配置**：两个SiTCP使用相同IP，不同端口
2. **MAC地址**：共享同一个MAC地址
3. **时钟域**：确保所有模块使用正确的时钟（testgtrefclk或gmii_clk_o）
4. **RBCP冲突**：如果需要同时使用两个RBCP，需要添加仲裁逻辑
5. **带宽共享**：两个TCP流共享千兆以太网带宽

## 文件清单

新增文件：
- `xvc_server.v` - XVC协议服务器
- `jtag_tap_controller.v` - JTAG TAP接口
- `dual_sitcp_arbiter.v` - GMII仲裁器
- 本文档

修改文件：
- `MD10_top.sv` - 添加第2个SiTCP和XVC逻辑
- `top.sv` - 添加XVC端口（如需要）
