`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 04:28:52 PM
// Design Name: 
// Module Name: top
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


module top#(
	parameter SPARTAN6_NUM = 'd1,
    parameter TDC_DELAY_NUM = 'd64,
    parameter DAC_NUM = 'd2,
    parameter DAC_CHANNEL_NUM = 32,
    parameter DEBUG = 0,
    parameter BIT_SIZE = 32'd350000 << 3,  // size of bit file, not size on disk
    parameter [31:0] final_board_flash_address = 32'h0080_0000,
    parameter [31:0] middle_board_flash_address = 32'h0040_0000,
    parameter [31:0] sp6_board_flash_address = 32'h00E0_0000
)
(

	output  wire   [6:1]                    LED,

    output 	wire   [SPARTAN6_NUM-1:0]    	TCK,
    output 	wire   [SPARTAN6_NUM-1:0]    	TMS,
    output 	wire   [SPARTAN6_NUM-1:0]    	TDI,
    input 	wire   [SPARTAN6_NUM-1:0]    	TDO,

    //output  wire                            Flash_Read_tx_en,   // W11  JB2
    output  wire                            FLASH_CS_n,  // W8   JB4
    input   wire                            MISO,
    output  wire                            MOSI,
    output  wire                            WRITE_PROTECT_n,
    output  wire                            HOLD_n,

	output 	wire   [SPARTAN6_NUM-1:0]       RESET_OUT,
	output 	wire   [SPARTAN6_NUM-1:0]       CLK_OUT,
	input   wire   [SPARTAN6_NUM-1:0]       DATA_IN,
	input  wire   [SPARTAN6_NUM-1:0]        FB_OUT,

    input 	wire 		                    EXT_CLK,
	//output 	wire 		                    EXT_CLK_N,

	input 	wire 		                    SYS_CLK_P,
	input 	wire 		                    SYS_CLK_N,

	//SITCP
 	// output 	wire 		                    SFP_TXP,
	// output 	wire 		                    SFP_TXN,
	// input 	wire 		                    SFP_RXP,
	// input 	wire 		                    SFP_RXN, 
	input 	wire 		                    GTREFCLK_P,
	input 	wire 		                    GTREFCLK_N,     

	input  wire                            RESET_IN,
	input   wire   [3:0]                    SW,
	output  wire   [3:0]                    GPIO
    );

	wire clk_125M;
	wire clk_125M_nobuffer;
    wire clk_10M;
	wire clk_50M;
    wire clk_62M5;
    wire clk_100M;
   	wire clk_200M;
    wire clk_250M;
 	wire clk_locked_sitcp;


    assign RESET_OUT = RESET_IN;

    wire EXTERNAL_CALIB_ENABLE;
    wire SYS_CLK;
    wire SYS_CLK_BUF;
    IBUFDS #(
        .DIFF_TERM("TRUE"),       // Differential Termination
        .IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE" 
        .IOSTANDARD("DIFF_SSTL135")     // Specify the input I/O standard
    ) IBUFDS_SYSCLK (
        .O(SYS_CLK),                     // Buffer output
        .I(SYS_CLK_P),                     // Diff_p buffer input (connect directly to top-level port)
        .IB(SYS_CLK_N)                    // Diff_n buffer input (connect directly to top-level port)
    );

    BUFG bufg_SYSCLK (
		.I     (SYS_CLK),
		.O     (SYS_CLK_BUF)
	 );

    //wire EXT_CLK;
    wire EXT_CLK_BUF;
/*     IBUFDS #(
        .DIFF_TERM("TRUE"),       // Differential Termination
        .IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE" 
        .IOSTANDARD("LVDS_25")     // Specify the input I/O standard
    ) IBUFDS_EXTCLK (
        .O(EXT_CLK),                     // Buffer output
        .I(EXT_CLK_P),                     // Diff_p buffer input (connect directly to top-level port)
        .IB(EXT_CLK_N)                    // Diff_n buffer input (connect directly to top-level port)
    ); */

     BUFG bufg_EXTCLK (
		.I     (EXT_CLK),
		.O     (EXT_CLK_BUF)
	 );

    wire ext_clk_locked;
/*     ext_clk ext_clk
    (
        // Clock out ports
        .clk_out1(EXT_CLK),     // output clk_out1
        // Status and control signals
        .reset(1'b0), // input reset
        .locked(ext_clk_locked),       // output locked
    // Clock in ports
        .clk_in1(EXT_CLK_BUF)      // input clk_in1
    ); */


    // /assign RESET_IN = clk125_remote;
    //assign EXT_CLK_P = clk_locked_sitcp;
    //assign EXT_CLK_N = ext_clk_locked;
    assign LED[1] = clk_locked_sitcp;
    assign LED[2] = ext_clk_locked;

    assign CLK_OUT = clk_125M;
    wire hardware_reset;
    //assign RESET_IN = clk_10M;
    wire probe_out0;
    TCP_clk clk_wiz_tcp (
        .clk_out1(clk_125M),
        .clk_out2(clk_125M_nobuffer),
        .clk_out3(clk_50M),
        .clk_out4(clk_250M),
        .clk_out5(clk_10M),
        .clk_out6(clk_62M5),
        .clk_out7(clk_200M),
        //.clk_in1_p(SYS_CLK_P),
        //.clk_in1_n(SYS_CLK_N),
        .clk_in1(EXT_CLK_BUF),//SYS_CLK_BUF),
        .reset(1'b0),
        //	.clk_in_sel(TDC_CLK_SELECT),
        .locked(clk_locked_sitcp)
    ); 

    wire         SOFT_RST;
    wire         SOFT_RST_BUF;
    wire         sitcp_fifo_full;
    wire         TDC_RST_SELECT;

    wire            FLASH_ERASE_DISABLE;
    wire            FLASH_WRITE_READY;
    wire            FLASH_WRITE_VALID;
    wire [7:0]      FLASH_WRITE_DATA;
    wire [7:0]      FLASH_READ_DATA;
    wire            FLASH_READ_VALID;
    wire            FLASH_READ_EN;
    wire [7:0]      FLASH_READ_CMD;
    wire [31:0]     FLASH_READ_ADDRESS;
    wire [2:0]      is_multiboot;


    

/*      vio_0 vio_0 (
      .clk(clk_125M),                // input wire clk
      .probe_out0(FLASH_READ_EN)
    );    */ 
    //wire [4:0]	 delay_value[TDC_NUM/2-1:0];

/*     ila_0 ila_0(
        .clk(clk_125M), // input wire clk
        .probe0(sitcp_fifo_full)
    ); 
    ila_0 ila_0(
        .clk(clk_125M), // input wire clk
        .probe0(clk_locked_sitcp)
    );*/


    BUFG bufg_tdc (
        .I(SOFT_RST_BUF),
        .O(SOFT_RST)
    );
    //wire sitcp_fifo_full;
    //reg [15:0] SiTCP_din;
    wire [127:0] SiTCP_din;
    wire SiTCP_din_valid;
    wire JTAG_SWITCH;
    wire [31:0] XVC_LENGTH;
    wire [31:0] TMS_VECTOR;
    wire [31:0] TDI_VECTOR;
    wire [31:0] TDO_VECTOR;
    wire        XVC_ENABLE;

    wire [ 7:0] SP6_CONFIG_ADDR;
    wire [ 7:0] SP6_CONFIG_VALUE;
    wire        SP6_CONFIG_VALID;

    wire [31:0] TDO_VECTOR_LENGTH;
    wire        TDO_VECTOR_READ_EN;

    SiTCP_rfd_top #(
        .TDC_NUM(2),
        .DAC_NUM(DAC_NUM),
        .DAC_CHANNEL_NUM(DAC_CHANNEL_NUM)
    ) SiTCP_rfd_top (
        //sys
        //.sys_clk_bufg(clk_100),
        .clk125_sys(clk_125M),
        .clk200(clk_125M),
        .clk125_eth(clk_125M),
        //.GTREFCLK_P(GTREFCLK_P),
        //.GTREFCLK_N(GTREFCLK_N),
        .gtpclkin(clk_125M_nobuffer),
        .locked(1'b1),
        //tcp
        .sys_din(SiTCP_din),
        .clk125_remote(clk125_remote),
        .SFP_TXP(SFP_TXP),
        .SFP_TXN(SFP_TXN),
        .SFP_RXP(SFP_RXP),
        .SFP_RXN(SFP_RXN),
        .din_valid(SiTCP_din_valid),
        .sitcp_fifo_full(sitcp_fifo_full),
        //盲赂聧莽鸥楼茅聛鈥溍ヂ孤裁ニ�???莽拧???
        .HARDWARE_RESET(1'b0),
        .OFFSET_SWITCH(OFFSET_SWITCH),
        .CLK_IN(CLK_IN),
        .TRIG_IN(),
        .GPIO(GPIO),
        .SW(SW),
        //UDP
        //.DELAY_VALUE(DELAY_VALUE),
        .LED_ON(LED_ON),
        .EXTERNAL_CALIB_ENABLE(EXTERNAL_CALIB_ENABLE),
        .MSB_abnormal(MSB_abnormal),
        .MSB_check(MSB_check),
        .FPGADATA_REN(FPGADATA_REN),
        .FPGADATA_EMPTY(FPGADATA_EMPTY),
        .FPGA_DATA(FPGA_DATA),
        .FPGADATA_VALID(FPGADATA_VALID),
        .FLASH_ERASE_DISABLE(FLASH_ERASE_DISABLE),
        .FLASH_WRITE_READY(FLASH_WRITE_READY),
        .FLASH_WRITE_DATA(FLASH_WRITE_DATA),
        .FLASH_WRITE_VALID(FLASH_WRITE_VALID),

        .FLASH_READ_DATA(FLASH_READ_DATA),
        .FLASH_READ_VALID(FLASH_READ_VALID),

        .XVC_LENGTH         (XVC_LENGTH),
        .TMS_VECTOR         (TMS_VECTOR),
        .TDI_VECTOR         (TDI_VECTOR),
        .TDO_VECTOR         (TDO_VECTOR),
        .TDO_VECTOR_VALID   (TDO_VECTOR_VALID),
        .TDO_VECTOR_LENGTH  (TDO_VECTOR_LENGTH),
        .TDO_VECTOR_READ_EN (TDO_VECTOR_READ_EN),
        .XVC_ENABLE         (XVC_ENABLE),
        .XVC_LENGTH_READY   (XVC_LENGTH_READY),
        .TMS_VECTOR_READY   (TMS_VECTOR_READY),
        .TDI_VECTOR_READY   (TDI_VECTOR_READY),

        .SP6_CONFIG_ADDR    (SP6_CONFIG_ADDR),
        .SP6_CONFIG_VALUE   (SP6_CONFIG_VALUE),
        .SP6_CONFIG_VALID   (SP6_CONFIG_VALID),
        // .FLASH_READ_EN(FLASH_READ_EN),
        // .FLASH_READ_CMD(FLASH_READ_CMD),
        // .FLASH_READ_ADDRESS(FLASH_READ_ADDRESS),
        .TDC_RST_SELECT(TDC_RST_SELECT),
        .JTAG_SWITCH(JTAG_SWITCH),
        .SOFT_RST(SOFT_RST_BUF),
        .clk_locked_tdc(clk_locked_tdc),
        .state(state),
        .fifo_level1_pointer(fifo_level1_pointer),
        .is_multiboot(is_multiboot),
        .i2c_clk(i2c_clk),
        .rst_fifo(rst_fifo)
    );


            
        
    reg reset_jtag;
    reg [28:0] counter_jtag = 0;
    reg sp6_program_start;

    wire            jtag_clk;
    wire            ila_clk;
    wire            FLASH_TDO_out;
    wire            flash_rd_en;
    wire            sys_rst_n;

    //assign RESET_IN = sp6_program_start;

    always @(posedge jtag_clk) begin
        /* if(probe_out0) begin
            reset_jtag <= 1;
            sp6_program_start <= 0;
            counter_jtag <= 0;
        end else  */
        if(clk_locked_sitcp) begin
            if (counter_jtag >= 29'd60_000_000) begin
                reset_jtag <= 0;
                sp6_program_start <= 0;
                //counter_jtag <= counter_jtag + 1;
                if(counter_jtag == 29'd70_000_000) begin
                    //reset_jtag <= 0;
                    sp6_program_start <= 1;
                    counter_jtag <= counter_jtag + 1;
                end else if(counter_jtag > 29'd70_000_000) begin
                    //reset_jtag <= 0;
                    sp6_program_start <= 0;
                    
                end else begin
                    counter_jtag <= counter_jtag + 1;
                end
            end else begin
                reset_jtag <= 1;
                counter_jtag <= counter_jtag + 1;
            end
           
        end else begin
            reset_jtag <= 1;
            sp6_program_start <= 0;
            counter_jtag <= 0;
        end
    end

    reg reset_sp6;
    reg [23:0] counter_sp6;

    always @(posedge jtag_clk) begin
        if(!reset_jtag) begin
            if (counter_sp6 >= 24'd10_000_000) begin
                reset_sp6 <= 0;
            end else begin
                reset_sp6 <= 1;
                counter_sp6 <= counter_sp6 + 1;
            end
        end else begin
            counter_sp6 <= 0;
            reset_sp6 <= 1;
        end
    end

    // used for Spartan-6 JTAG program

    reg             pi_key  ;
    reg             pi_key_r  ;
    wire            po_key_0;
    wire            po_key  ;   //消抖处理后的按键信号
    wire            tx_flag ;   //输入串口发送模块数据标志信号
    wire    [7:0]   tx_data ;   //输入串口发送模块数据




    //wire            Flash_Read_tx_en;

    //parameter       BIT_SIZE = 32'd340884 << 3;  // size of bit file, not size on disk

    wire clk100M_locked;
    wire clk_10M_coding;
    wire clk_20M_coding;
    clk_wiz_100M clk_wiz_100M
   (
    // Clock out ports
    //.clk_out1(clk_100M),     // output clk_out1
    .clk_out1(clk_10M_coding),     // output clk_out1
    .clk_out2(clk_20M_coding),     // output clk_out1
    .clk_out3(clk_80M_coding),     // output clk_out1
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(clk100M_locked),       // output locked
   // Clock in ports
    .clk_in1(FB_OUT));  

    //assign po_key  = EXTERNAL_CALIB_ENABLE;
    assign ila_clk = clk_100M;

/*     key_filter
    #(
        .CNT_MAX    (20'd999_999/5    )   //计数器计数最大值
    )
    key_filter_inst
    (
        .sys_clk    (jtag_clk    ),  //系统时钟，频率10MHz
        .sys_rst_n  (sys_rst_n  ),  //复位信号,低电平有效
        .key_in     (pi_key     ),  //按键输入信号

        .key_flag   (po_key     )   //消抖后信号
    ); */
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
    wire FLASH_WRITE_VALID_1;
    wire       uart_done_pos;
    wire       prog_full;
    wire [7:0] flash_dout;
    wire [63:0] TDC_decode_data;
    wire        TDC_decode_data_valid;

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

/*     sp6_program #(
        .SPARTAN6_NUM(SPARTAN6_NUM),
        .BIT_SIZE(BIT_SIZE)
    )sp6_program(
        .CLK_IN(clk_10M),
        .jtag_clk(jtag_clk),
        .RESET(SOFT_RST),
        .MANUAL_PROGRAM(po_key),
        .JTAG_SWITCH(JTAG_SWITCH),

        .TCK(TCK),
        .TMS(TMS),
        .TDI(TDI),
        .TDO(TDO),

        .RESET_OUT(RESET_OUT),
	    .CLK_OUT(CLK_OUT),
	    .DATA_IN(DATA_IN),
	    .FB_OUT(FB_OUT),
        .SiTCP_din(SiTCP_din),
        .SiTCP_din_valid(SiTCP_din_valid)
    ); */

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
                .key_begin  (po_key | sp6_program_start),
                .flash_tdo    ( FLASH_TDO_out   ),
                .flash_rd_en   ( flash_rd_en   ),
                .led     ( LED[3]     ),
                .led1    ( LED[4]    ),
                .led2    ( LED[5]    ),
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

    assign FLASH_READ_CMD[7:0]  = 8'h13; 
    assign FLASH_READ_ADDRESS = 32'h00E0_0000;
    assign FLASH_READ_EN = flash_rd_en;

    wire [31:0] main_firmware_flash_address;
    assign main_firmware_flash_address = (is_multiboot == 2)? final_board_flash_address : (is_multiboot == 3? middle_board_flash_address : sp6_board_flash_address );

    flash_update #(       
        .bit_to_read(BIT_SIZE)
    )flash_update(
        .user_clk(clk_10M),
        .sys_clk(clk_10M), //clk_10M),
        .rst_n(~reset_jtag),
        .CS(FLASH_CS_n),
        .MISO(MISO),
        .MOSI(MOSI),
        .WRITE_PROTECT_n(WRITE_PROTECT_n),
        .HOLD_n(HOLD_n),
        .icap_done(icap_done),

        //.main_firmware_flash_address(main_firmware_flash_address),
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
        //generate
        //if(DEBUG) begin
    AXI_LITE_JTAG AXI_LITE_JTAG(
        .CLK(clk_125M),
        .RESET_n(1'b1),
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
        .TDO_VECTOR_LENGTH  (TDO_VECTOR_LENGTH),
        .TDO_VECTOR_READ_EN (TDO_VECTOR_READ_EN),
        .XVC_ENABLE         (XVC_ENABLE),
        .XVC_LENGTH_READY   (XVC_LENGTH_READY),
        .TMS_VECTOR_READY   (TMS_VECTOR_READY),
        .TDI_VECTOR_READY   (TDI_VECTOR_READY),
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
    wire [127:0]    DATA_OUT;
    wire            DATA_OUT_VALID;
    TDC_data_receive #(
        .DATA_WIDTH(96)
    )TDC_data_receive(
        .CLK(clk_10M_coding),
        .CLK2X(clk_20M_coding),
        .CLK8X(clk_80M_coding),
        .RESET(1'b0),
        .SW(SW),
        .DATA_IN(DATA_IN),
        .DATA_OUT(DATA_OUT),
        .DATA_OUT_VALID(DATA_OUT_VALID)
    );

    //assign DATA_IN = clk_10M_coding;

    wire [15:0] SP6_DATA;
    wire        SP6_DATA_VALID;
    wire        SP6_READ_EN;
    wire        SP6_FIFO_FULL;
    wire        SP6_FIFO_EMPTY;
    assign SP6_READ_EN = !SP6_FIFO_EMPTY;

    sp6_config_fifo sp6_config_fifo (
        .rst(1'b0),                  // input wire rst
        .wr_clk(clk_125M),            // input wire wr_clk
        .rd_clk(clk_125M),//clk_10M_coding),            // input wire rd_clk
        .din({SP6_CONFIG_ADDR, SP6_CONFIG_VALUE}),                  // input wire [15 : 0] din
        .wr_en(SP6_CONFIG_VALID & !SP6_FIFO_FULL),              // input wire wr_en
        .rd_en(SP6_READ_EN),              // input wire rd_en
        .dout(SP6_DATA),                // output wire [15 : 0] dout
        .full(SP6_FIFO_FULL),                // output wire full
        .empty(SP6_FIFO_EMPTY),
        .valid(SP6_DATA_VALID)
    );

    wire FB_OUT_1;
    TDC_DATA_SEND #(
        .DATA_WIDTH(32)
    )TDC_DATA_SEND(
        .CLK(clk_125M),
        .CLK2X(clk_250M),
        .RESET(reset_jtag),
        .DATA_ADDR(SP6_DATA[15:8]),
        .DATA_IN(SP6_DATA[7:0]),
        .DATA_IN_VALID(SP6_DATA_VALID),
        .DATA_OUT(FB_OUT_1)

    );

    //assign FB_OUT = FB_OUT_1;

/*     OBUF #(
      .DRIVE(8),   // Specify the output drive strength
      .IOSTANDARD("LVCMOS33"), // Specify the output I/O standard
      .SLEW("SLOW") // Specify the output slew rate
    ) OBUF_inst (
        .O(FB_OUT),     // Buffer output (connect directly to top-level port)
        .I(FB_OUT_1)      // Buffer input
    );   */

    wire [7:0]    DATA_OUT2;
    wire [7:0]    DATA_ADDR2;
    wire            DATA_OUT_VALID2;

    reg reset_manchaster;
    always @(posedge clk_10M_coding) begin
        if(clk100M_locked) begin 
            reset_manchaster <= 0;
        end else begin
            reset_manchaster <= 1;
        end 
    end
    TDC_data_receive_sp6 #(
        .DATA_WIDTH(32)
    )TDC_data_receive1(
        .CLK(clk_125M),
        .CLK2X(clk_250M),
        .CLK8X(clk_80M_coding),
        .RESET(reset_manchaster),
        .DATA_IN(FB_OUT_1),
        .DATA_ADDR(DATA_ADDR2),
        .DATA_OUT(DATA_OUT2),
        .DATA_OUT_VALID(DATA_OUT_VALID2)
    );


    //assign DATA_IN = SP6_DATA_VALID;

    wire TIM_1S_r;
    TIMER #(
        .CLK_FREQ(10'd125)
    ) TIMER_0 (
        // System
        .CLK    (clk_125M),    // in: System clock
        .RST    (1'b0),      // in: System reset
        // Intrrupts
        .TIM_1US(),          // out: 1 us interval
        .TIM_1MS(),          // out: 1 ms interval
        .TIM_1S (TIM_1S_r),  // out: 1 s interval
        .TIM_1M ()           // out: 1 min interval
    );

    wire [15:0] rates;
    //generate
    //    for (i = 0; i < TDC_NUM; i = i + 1) begin
				/* always @(posedge clk_125M) begin
					if(HIT[i]) deadtime[i] <= 0;					
					else if(deadtime[i] <= 19) deadtime[i] <= deadtime[i] + 1;
				end */
            hit_rates hit_rates (
                .CLK(clk_125M),  // input clk
                .CE(SiTCP_din_valid),
                .SCLR(TIM_1S_r),  // input sclr
                .Q(rates)  // output [15 : 0] q
            );
    //    end
    //endgenerate
    wire TIM_1S;
    Flag_CrossDomain FLASH_Time_CrossDomain (
      .clkA(clk_125M),
      .FlagIn_clkA(TIM_1S_r),
      .clkB(clk_80M_coding),
      .FlagOut_clkB(TIM_1S)
    );

    

    assign rd_en = ~empty & ~sitcp_fifo_full;
    fifo_tcp fifo_tcp (
        //.clk(clk_62M5),      // input wire clk
        .rst(SOFT_RST),    // input wire srst
        .wr_clk(clk_10M_coding),  // input wire wr_clk
        .rd_clk(clk_125M),  // input wire rd_clk
        .din(DATA_OUT),      // input wire [7 : 0] din
        .wr_en(DATA_OUT_VALID & ~full),  // input wire wr_en
        .rd_en(rd_en),  // input wire rd_en
        .valid(SiTCP_din_valid),
        .dout(SiTCP_din),    // output wire [127 : 0] dout
        .full(full),    // output wire full
        .empty(empty)  // output wire empty
    );
    //assign SiTCP_din = DATA_OUT;
    //assign SiTCP_din_valid = DATA_OUT_VALID & !sitcp_fifo_full;

    
    //assign  RESET_OUT = reset_sp6 | SOFT_RST;
    //assign  RESET_OUT = SP6_DATA_VALID;

/*
    reg  [127:0] tx_data_a = 0;
    reg          tx_valid_a = 0;
    wire         tx_busy_a;
    wire [127:0] rx_data_a;
    wire         rx_valid_a;

    // DUT_B端口
    reg  [127:0] tx_data_b = 0;
    reg          tx_valid_b = 0;
    wire         tx_busy_b;
    wire [127:0] rx_data_b;
    wire         rx_valid_b;

    wire line_a2b;
    wire line_b2a;

    always @(posedge clk_10M_coding) begin
        if(FB_OUT) begin
            tx_data_a <= 128'hAABBCCDD_EEFF1122_33445566_77880099;
            tx_valid_a <= 1;
        end else begin
            tx_data_a <= 0;
            tx_valid_a <= 0;
        end
    end

    // 实例化 DUT_A
    serdes_130b_full_duplex dut_a(
        .clk_tx(clk_10M_coding),
        .clk_rx(clk_10M_coding),
        .rst_n(1'b0),
        .tx_serial_out(line_a2b),
        .rx_serial_in(line_b2a),
        .tx_data(tx_data_a),
        .tx_valid(tx_valid_a),
        .tx_busy(tx_busy_a),
        .rx_data(rx_data_a),
        .rx_valid(rx_valid_a)
    );

    // 实例化 DUT_B
    serdes_130b_full_duplex dut_b(
        .clk_tx(clk_10M_coding),
        .clk_rx(clk_10M_coding),
        .rst_n(1'b0),
        .tx_serial_out(line_b2a),
        .rx_serial_in(line_a2b),
        .tx_data(tx_data_b),
        .tx_valid(tx_valid_b),
        .tx_busy(tx_busy_b),
        .rx_data(rx_data_b),
        .rx_valid(rx_valid_b)
    );
    */

/*     vio_1 vio_1 (
        .clk(SYS_CLK_BUF),                // input wire clk
        .probe_out0(probe_out0),  // output wire [0 : 0] probe_out0
        .probe_out1(RESET_receive),  // output wire [0 : 0] probe_out0
        .probe_out2(EXT_CLK_P)  // output wire [0 : 0] probe_out0
    ); */
 /*   
    wire Flash_tx_en_pos;
    wire [7:0] Flash_rst_1;
    assign Flash_rst_1 = flash_update.combine_state;
    assign Flash_Read_tx_en = flash_update.read_write_flash_u.Write_tx_en;
    assign Flash_tx_en_pos = flash_update.read_write_flash_u.Write_tx_en_pos;
    assign Flash_cs = flash_update.read_write_flash_u.Write_tx_en_dly2;
    assign Flash_DATA_OUT = flash_update.read_write_flash_u.DATA_OUT;
    assign Flash_Current_State = flash_update.read_write_flash_u.Current_State;
    assign jtag_state = u_jtag_pl.state;
    assign FLASH_WRITE_VALID_1 = flash_update.valid;
    wire  flash_rst_n;
    assign flash_rst_n = flash_update.rst_n;
    assign flash_dout = flash_update.dout;
    assign uart_done_pos = flash_update.uart_done_pos;
    assign jtag_countbit = u_jtag_pl.countbit;
    assign prog_full = flash_update.prog_full;
    wire  [31:0] bit_jtag;
    wire  [1:0] uart_done_dly;
    assign bit_jtag = flash_update.read_write_flash_u.cnt;
    assign uart_done_dly = flash_update.uart_done_dly;
    wire SCK;
    assign SCK = flash_update.read_write_flash_u.SCK;
    wire [7:0] sr1_status;
    assign sr1_status = flash_update.read_write_flash_u.sr1_status;
    wire Erase_Ok;
    assign Erase_Ok = flash_update.read_write_flash_u.Erase_Ok;

    wire Write_Enable_Ok;
    assign Write_Enable_Ok = flash_update.read_write_flash_u.Write_Enable_Ok;
    wire [31:0] erase_base_addr;
    assign erase_base_addr = flash_update.erase_base_addr;
    wire [31:0] write_base_addr;
    assign write_base_addr = flash_update.write_base_addr;

    wire reset_decoder;
    wire [2:0] FlagToggle_clkB;
    //assign FlagToggle_clkA = flash_update.FLASH_READ_EN_CrossDomain.FlagToggle_clkA;
    assign reset_decoder = TDC_data_receive.reset_decoder;
    wire state_reg;
    assign state_reg = TDC_data_receive.state_reg;
    wire DATA_serial;
    assign DATA_serial = TDC_data_receive.DATA_SERIAL;
    reg [3:0] data_shift; 
    reg [1:0] state_reg_decode;
    assign data_shift = TDC_data_receive.tdc_data_dec.data_shift;
    assign state_reg_decode = TDC_data_receive.tdc_data_dec.state_reg1;
    wire [6:0] count;
    assign count = TDC_data_receive.count;
    wire nrz1;
    assign nrz1 = TDC_data_receive.tdc_data_dec.nrz1;
    wire  sync_shift;
    assign sync_shift = TDC_data_receive.tdc_data_dec.sync_shift;
    wire  [3:0] sync_data;
    wire  [3:0] sample_cnt;
    assign sync_data = TDC_data_receive.tdc_data_dec.sync_data;
    assign sample_cnt = TDC_data_receive.tdc_data_dec.sample_cnt;
    wire [95:0] DATA_OUT1;
    wire        DATA_OUT_VALID1;
    assign DATA_OUT1 = TDC_data_receive.TDC_decode_data;
    assign DATA_OUT_VALID1 = TDC_data_receive.TDC_decode_data_valid;
    wire dout1;
    //assign dout1 = TDC_data_receive1.tdc_data_dec.DOUT1;
    wire shift;
    assign shift = TDC_DATA_SEND.tdc_data_enc.shift;
    wire alarm;
    assign alarm = TDC_data_receive.alarm;

    wire [31:0] TDC_decode_data_sp6;
    wire        TDC_decode_data_valid_sp6;
    assign TDC_decode_data_sp6 = TDC_data_receive1.TDC_decode_data;
    assign TDC_decode_data_valid_sp6 = TDC_data_receive1.TDC_decode_data_valid;
    
     ila_0 ila_0(
        .clk(clk_50M), // input wire clk
        .probe0(FLASH_READ_VALID),
        .probe1(icap_done),
        .probe2(jtag_clk),
        .probe3(HOLD_n),
        .probe4(Erase_Ok),
        .probe5(DATA_IN),
        .probe6(bit_jtag),
        .probe7(WRITE_PROTECT_n ),
        .probe8(FLASH_WRITE_VALID_1),
        .probe9(main_firmware_flash_address),
        .probe10(DATA_OUT_VALID1),
        .probe11(Write_Enable_Ok ),
        .probe12(Flash_rst_1),
        .probe13(is_multiboot),
        .probe14(flash_dout),
        .probe15(FLASH_WRITE_DATA ),
        .probe16(FLASH_WRITE_VALID),
        .probe17(Flash_Read_tx_en),
        .probe18(uart_done_dly),
        .probe19(sr1_status),
        .probe20(Flash_Current_State),
        .probe21(FLASH_WRITE_READY ),
        .probe22(MISO),
        .probe23(FLASH_ERASE_DISABLE),
        .probe24(jtag_state),
        .probe25(FLASH_CS_n),
        .probe26(FLASH_READ_EN),
        .probe27(FLASH_READ_DATA),
        .probe28(MOSI),
        .probe29(erase_base_addr),
        .probe30(Flash_tx_en_pos),
        .probe31(Flash_cs),
        .probe32(flash_rst_n),
        .probe33(SCK)
    );  
*/

/*      ila_8 ila_8(
        .clk(clk_125M), // input wire clk
        .probe0(uart_done_dly),
        .probe1(FLASH_WRITE_VALID_1),
        .probe2(FLASH_WRITE_VALID),
        .probe3(flash_dout),
        .probe4(uart_done_pos),
        .probe5(prog_full),
        .probe6(FLASH_WRITE_DATA)
     ); */
    //assign EXT_CLK_P = clk_10M_coding;
    //assign EXT_CLK_N = clk_20M_coding;
/*      ila_5 ila_5(
        .clk(clk_80M_coding), // input wire clk
        .probe0(SP6_DATA_VALID),
        .probe1(FB_OUT_1),
        .probe2(state_reg_decode),
        .probe3(DATA_serial),
        .probe4(state_reg),
        .probe5(data_shift),
        .probe6(DATA_OUT1),
        .probe7(DATA_OUT_VALID1),
        .probe8(sample_cnt),
        .probe9(sync_data),
        .probe10(sync_shift),
        .probe11(clk_10M_coding),
        .probe12(clk_20M_coding),
        .probe13(shift)
     ); */
    //end
    //endgenerate
        // ila_3 ila_3(
        // .clk(clk_125M), // input wire clk
        // .probe0(po_key),
        // .probe1(EXTERNAL_CALIB_ENABLE)
        // );
/*
        debug_bridge_0 debug_bridge_0 (
  .s_axi_aclk(s_axi_aclk),        // input wire s_axi_aclk
  .s_axi_aresetn(s_axi_aresetn),  // input wire s_axi_aresetn
  .tap_tdi(tap_tdi),              // output wire tap_tdi
  .tap_tdo(tap_tdo),              // input wire tap_tdo
  .tap_tms(tap_tms),              // output wire tap_tms
  .tap_tck(tap_tck),              // output wire tap_tck
  .S_AXI_araddr(S_AXI_araddr),    // input wire [4 : 0] S_AXI_araddr
  .S_AXI_arprot(S_AXI_arprot),    // input wire [2 : 0] S_AXI_arprot
  .S_AXI_arready(S_AXI_arready),  // output wire S_AXI_arready
  .S_AXI_arvalid(S_AXI_arvalid),  // input wire S_AXI_arvalid
  .S_AXI_awaddr(S_AXI_awaddr),    // input wire [4 : 0] S_AXI_awaddr
  .S_AXI_awprot(S_AXI_awprot),    // input wire [2 : 0] S_AXI_awprot
  .S_AXI_awready(S_AXI_awready),  // output wire S_AXI_awready
  .S_AXI_awvalid(S_AXI_awvalid),  // input wire S_AXI_awvalid
  .S_AXI_bready(S_AXI_bready),    // input wire S_AXI_bready
  .S_AXI_bresp(S_AXI_bresp),      // output wire [1 : 0] S_AXI_bresp
  .S_AXI_bvalid(S_AXI_bvalid),    // output wire S_AXI_bvalid
  .S_AXI_rdata(S_AXI_rdata),      // output wire [31 : 0] S_AXI_rdata
  .S_AXI_rready(S_AXI_rready),    // input wire S_AXI_rready
  .S_AXI_rresp(S_AXI_rresp),      // output wire [1 : 0] S_AXI_rresp
  .S_AXI_rvalid(S_AXI_rvalid),    // output wire S_AXI_rvalid
  .S_AXI_wdata(S_AXI_wdata),      // input wire [31 : 0] S_AXI_wdata
  .S_AXI_wready(S_AXI_wready),    // output wire S_AXI_wready
  .S_AXI_wstrb(S_AXI_wstrb),      // input wire [3 : 0] S_AXI_wstrb
  .S_AXI_wvalid(S_AXI_wvalid)    // input wire S_AXI_wvalid
);
*/
endmodule