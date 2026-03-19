`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2025 02:53:56 PM
// Design Name: 
// Module Name: sp6_program
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sp6_program#(
    parameter  SPARTAN6_NUM = 1,
    parameter  BIT_SIZE = 32'd350000 << 3
)(
    input   wire                            CLK_IN,
    output  wire                            jtag_clk,
    input   wire                            RESET,
    input   wire                            MANUAL_PROGRAM,
    input   wire                            JTAG_SWITCH,
    output 	wire   [SPARTAN6_NUM-1:0]    	TCK,
    output 	wire   [SPARTAN6_NUM-1:0]    	TMS,
    output 	wire   [SPARTAN6_NUM-1:0]    	TDI,
    input 	wire   [SPARTAN6_NUM-1:0]    	TDO,

    output 	wire   [SPARTAN6_NUM-1:0]       RESET_OUT,
	output 	wire   [SPARTAN6_NUM-1:0]       CLK_OUT,
	input   wire   [SPARTAN6_NUM-1:0]       DATA_IN,
	input   wire   [SPARTAN6_NUM-1:0]       FB_OUT,

    output  wire   [127:0]                  SiTCP_din [SPARTAN6_NUM-1:0],
    output  wire   [SPARTAN6_NUM-1:0]       SiTCP_din_valid

    );

    wire rd_en;
    wire full;
    wire empty;
    wire Flash_Read_tx_en;
    wire Flash_cs;
    wire [7:0] Flash_DATA_OUT;
    wire [20:0] Flash_Current_State;
    wire [7:0] jtag_state;
    wire [31:0] jtag_countbit;
    wire [31:0] Flash_cnt;
    wire Flash_Read_Data_Ok;
    reg pi_key;
    reg pi_key_r;
    // wire [63:0] TDC_decode_data;
    // wire        TDC_decode_data_valid;

    always@(posedge clk_125M) begin
        pi_key <= EXTERNAL_CALIB_ENABLE;
        pi_key_r <= pi_key;
    end

    assign po_key_0 = ~pi_key_r & pi_key;

    Flag_CrossDomain FLASH_READ_EN_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(po_key_0),
      .clkB(jtag_clk),
      .FlagOut_clkB(po_key)
    );



    // assign rd_en = ~empty & ~sitcp_fifo_full;
    // fifo_flash fifo_flash (
    //     .clk(clk_10M),      // input wire clk
    //     .srst(1'b0),    // input wire srst
    //     .din(TDC_decode_data),      // input wire [7 : 0] din
    //     .wr_en(TDC_decode_data_valid & ~full),  // input wire wr_en
    //     .rd_en(rd_en),  // input wire rd_en
    //     .valid(SiTCP_din_valid),
    //     .dout(SiTCP_din),    // output wire [127 : 0] dout
    //     .full(full),    // output wire full
    //     .empty(empty)  // output wire empty
    // );

/*     ila_0 ila_9(
        .clk(jtag_clk), // input wire clk
        .probe0(FLASH_TDO_out),
        .probe1(po_key),
        .probe2(flash_rd_en)
    );  */

    pll u_pll(
        .clk_in ( clk_10M ),            //10MHz
        .rst_n  ( 1'b1 ),
        .jtag_clk  ( jtag_clk  )        //2.5M
    );
/*     generate
        genvar x;
        for(x = 0;x < SPARTAN6_NUM;x = x + 1) begin
            jtag_pl#(
                .BIT_SIZE    (BIT_SIZE + 100 )   //BIT文件大小
            )u_jtag_pl(
                .clk_in  ( jtag_clk  ),
                .ila_clk  ( ila_clk  ),
                .rst     ( ~sys_rst_n     ),
                .key_begin  (po_key),
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     ( LED[3]     ),
                .led1    ( LED[4]    ),
                .led2    ( LED[5]    ),
                .tck_out ( TCK[x] ),
                .tms_out ( TMS[x] ),
                .tdi_out ( TDI[x] ),
                .tdo_in  ( TDO[x] )
            );

        end
    endgenerate  */ 
            wire [SPARTAN6_NUM-1:0]    	FLASH_TCK;
            wire [SPARTAN6_NUM-1:0]    	FLASH_TMS;
            wire [SPARTAN6_NUM-1:0]    	FLASH_TDI;
            wire [SPARTAN6_NUM-1:0]    	FLASH_TDO;

            wire [SPARTAN6_NUM-1:0]    	XVC_TCK;
            wire [SPARTAN6_NUM-1:0]    	XVC_TMS;
            wire [SPARTAN6_NUM-1:0]    	XVC_TDI;
            wire [SPARTAN6_NUM-1:0]    	XVC_TDO;

            jtag_pl#(
                .BIT_SIZE    ((BIT_SIZE) + 100 )   //BIT文件大小
            )u_jtag_pl(
                .clk_in  ( jtag_clk  ),
                //.ila_clk  ( ila_clk  ),
                .rst     ( reset_jtag  ),
                .key_begin  (MANUAL_PROGRAM | sp6_program_start),
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     (),
                .led1    (),
                .led2    (),
                .tck_out ( FLASH_TCK[0] ),
                .tms_out ( FLASH_TMS[0] ),
                .tdi_out ( FLASH_TDI[0] ),
                .tdo_in  ( FLASH_TDO[0] )
            );

            assign TCK[0] = JTAG_SWITCH ? XVC_TCK[0] : FLASH_TCK[0];
            assign TMS[0] = JTAG_SWITCH ? XVC_TMS[0] : FLASH_TMS[0];
            assign TDI[0] = JTAG_SWITCH ? XVC_TDI[0] : FLASH_TDI[0];
            //assign TDO[0] = JTAG_SWITCH ? XVC_TDO[0] : FLASH_TDO[0];
            assign XVC_TDO[0] = TDO[0];
            assign FLASH_TDO[0] = TDO[0];

    //-------------flash_read_ctrl_inst-------------
              
/*         flash_read_ctrl  
        #(
            .BIT_SIZE    (BIT_SIZE    )   //读出数据个数
        )
        flash_read_ctrl_inst
        (
            .sys_clk    (clk_10M    ),  //系统时钟，频率50MHz
            .ila_clk    (ila_clk)   ,
            .sys_rst_n  (sys_rst_n  ),  //复位信号,低电平有效
            .key        ( flash_rd_en ),  //读取开始信号
            .miso       (FLASH_TDO       ),  //读出flash数据

            .sck        (Flash_Read_tx_en        ),  //片选信号
            .cs_n       (FLASH_CS_n       ),  //串行时钟
            .mosi       (FLASH_TDI       ),  //主输出从输入数据
            .tx_flag    (tx_flag    ),  //输出数据标志信号
            .tx_data    (tx_data    )   //输出数据
        );

    assign FLASH_TDO_out = FLASH_TDO; */
    assign FLASH_TDO_out = MISO; 

    wire [7:0] FLASH_READ_CMD;
    wire FLASH_READ_ADDRESS;
    wire FLASH_READ_EN;
    assign FLASH_READ_CMD[7:0]  = 8'h13; 
    assign FLASH_READ_ADDRESS = 32'h0;
    assign FLASH_READ_EN = flash_rd_en;
    parameter  main_firmware_flash_address = 32'h0;
    flash_update #(
        .main_firmware_flash_address(main_firmware_flash_address),
        .bit_to_read(BIT_SIZE)
    )flash_update(
        .user_clk(clk_10M),
        .sys_clk(clk_10M),
        .rst_n(~reset_jtag),
        .CS(FLASH_CS_n),
        .MISO(MISO),
        .MOSI(MOSI),
        .WRITE_PROTECT_n(WRITE_PROTECT_n),
        .HOLD_n(HOLD_n),
        .icap_done(icap_done),

        .FLASH_ERASE_DISABLE(FLASH_ERASE_DISABLE),
        .FLASH_WRITE_READY(FLASH_WRITE_READY),
        .FLASH_WRITE_DATA(FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID(FLASH_WRITE_VALID),

        .FLASH_READ_DATA(FLASH_READ_DATA),
        .FLASH_READ_VALID(FLASH_READ_VALID),
        .FLASH_READ_EN(FLASH_READ_EN),
        .FLASH_READ_CMD(FLASH_READ_CMD),
        .FLASH_READ_ADDRESS(FLASH_READ_ADDRESS)
    );

    AXI_LITE_JTAG AXI_LITE_JTAG(
        .CLK(clk_125M),
        .RESET_n(~RESET_receive),
/*         .WENABLE(WENABLE),
		.WBUSY(WBUSY),
		.WERR(WERR),
		.RENABLE(RENABLE),
		.RBUSY(RBUSY),
		.RERR(RERR),
		.REG_WADDR(REG_WADDR),
		.REG_RADDR(REG_RADDR),
		.REG_WDW(REG_WDW),
		.REG_RDW(REG_RDW),
		.REG_WVAL(REG_WVAL),
		.REG_RVAL(REG_RVAL), */
        .XVC_LENGTH         (XVC_LENGTH),
        .TMS_VECTOR         (TMS_VECTOR),
        .TDI_VECTOR         (TDI_VECTOR),
        .TDO_VECTOR         (TDO_VECTOR),
        .TDO_VECTOR_VALID   (TDO_VECTOR_VALID),
        .XVC_ENABLE         (XVC_ENABLE),
        .TCK( XVC_TCK[0] ),
        .TMS( XVC_TMS[0] ),
        .TDI( XVC_TDI[0] ),
        .TDO( XVC_TDO[0] )
    );



    

    wire clk2x;
    wire locked_x;
//   manchester_clk instance_name
//    (
//     // Clock out ports
//     .clk_out1(clk2x),     // output clk_out1
//     // Status and control signals
//     .reset(1'b0), // input reset
//     .locked(locked_x),       // output locked
//    // Clock in ports
//     .clk_in1(RESET_OUT));      // input clk_in1

    wire RESET_receive;
    wire [127:0]    DATA_out;
    wire            DATA_out_valid;
    TDC_data_receive TDC_data_receive(
        .CLK(clk_10M_coding),
        .CLK2X(clk_20M_coding),
        .RESET(RESET_receive),
        .SW(SW),
        .DATA_in(DATA_IN),
        .DATA_out(DATA_out),
        .DATA_out_valid(DATA_out_valid)
    );
    assign rd_en = ~empty & ~sitcp_fifo_full;
    fifo_tcp fifo_tcp (
        //.clk(clk_62M5),      // input wire clk
        .rst(SOFT_RST),    // input wire srst
        .wr_clk(clk_10M_coding),  // input wire wr_clk
        .rd_clk(clk_125M),  // input wire rd_clk
        .din(DATA_IN),      // input wire [7 : 0] din
        .wr_en(DATA_out_valid & ~full),  // input wire wr_en
        .rd_en(rd_en),  // input wire rd_en
        .valid(SiTCP_din_valid),
        .dout(SiTCP_din),    // output wire [127 : 0] dout
        .full(full),    // output wire full
        .empty(empty)  // output wire empty
    );
    //assign SiTCP_din = DATA_out;
    //assign SiTCP_din_valid = DATA_out_valid & !sitcp_fifo_full;

    
    assign  RESET_OUT = reset_sp6;

    vio_1 vio_1 (
        .clk(SYS_CLK_BUF),                // input wire clk
        .probe_out0(probe_out0),  // output wire [0 : 0] probe_out0
        .probe_out1(RESET_receive),  // output wire [0 : 0] probe_out0
        .probe_out2(EXT_CLK_P)  // output wire [0 : 0] probe_out0
    );

    wire Flash_tx_en_pos;
    wire Flash_rst_1;
    assign Flash_rst_1 = flash_update.read_write_flash_u.rst_n;
    assign Flash_Read_tx_en = flash_update.read_write_flash_u.Read_tx_en;
    assign Flash_tx_en_pos = flash_update.read_write_flash_u.tx_en_pos;
    assign Flash_cs = flash_update.read_write_flash_u.tx_en_dly2;
    assign Flash_DATA_OUT = flash_update.read_write_flash_u.DATA_OUT;
    assign Flash_Current_State = flash_update.read_write_flash_u.Current_State;
    assign jtag_state = u_jtag_pl.state;
    assign Flash_cnt = flash_update.read_write_flash_u.cnt;
    assign Flash_Read_Data_Ok = flash_update.read_write_flash_u.Read_Data_Ok;
    assign jtag_countbit = u_jtag_pl.countbit;
    wire  [31:0] bit_jtag;
    wire  [31:0] bit_flash;
    assign bit_jtag = u_jtag_pl.bit_size1;
    assign bit_flash = flash_update.read_write_flash_u.cnt_to_read;

    wire FlagToggle_clkA;
    wire [2:0] FlagToggle_clkB;
    assign FlagToggle_clkA = flash_update.FLASH_READ_EN_CrossDomain.FlagToggle_clkA;
    assign FlagToggle_clkB = flash_update.FLASH_READ_EN_CrossDomain.SyncA_clkB;
    wire state_reg;
    assign state_reg = TDC_data_receive.state_reg;
    wire DATA_serial;
    assign DATA_serial = TDC_data_receive.DATA_serial;
    reg [3:0] mdi_r; 
    reg [1:0] state_reg_decode;
    assign mdi_r = TDC_data_receive.tdc_data_dec.mdi_r;
    assign state_reg_decode = TDC_data_receive.tdc_data_dec.state_reg;
    wire [6:0] count;
    assign count = TDC_data_receive.count;

    ila_0 ila_0(
        .clk(SYS_CLK_BUF), // input wire clk
        .probe0(FLASH_READ_VALID),
        .probe1(FLASH_READ_DATA),
        .probe2(FLASH_READ_EN),
        .probe3(DATA_serial),
        .probe4(state_reg),
        .probe5(DATA_IN),
        .probe6(Flash_DATA_OUT),
        .probe7(Flash_Current_State),
        .probe8(state_reg_decode),
        .probe9(jtag_clk),
        .probe10(XVC_ENABLE),
        .probe11( FB_OUT ),
        .probe12(Flash_cnt),
        .probe13(probe_out0),
        .probe14(Flash_Read_tx_en),
        .probe15(Flash_rst_1),
        .probe16(TMS[0]),
        .probe17(Flash_tx_en_pos),
        .probe18(TDO[0]),
        .probe19(Flash_cs),
        .probe20(EXTERNAL_CALIB_ENABLE),
        .probe21(sp6_program_start),
        .probe22(DATA_out_valid),
        .probe23(DATA_out),
        .probe24(pi_key),
        .probe25(clk_locked_sitcp),
        .probe26(reset_sp6),
        .probe27(reset_jtag),
        .probe28(count),
        .probe29(counter_jtag)
    ); 

      
endmodule
