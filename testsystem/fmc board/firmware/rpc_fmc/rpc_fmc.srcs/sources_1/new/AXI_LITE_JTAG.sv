`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 01:46:32 PM
// Design Name: 
// Module Name: AXI_LITE_JTAG
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


module AXI_LITE_JTAG
	   #
	   (
		   parameter integer C_M_AXI_ADDR_WIDTH = 10,
		   parameter integer C_M_AXI_DATA_WIDTH = 32,

		   parameter integer C_S_AXI_ADDR_WIDTH = 10,
		   parameter integer C_S_AXI_DATA_WIDTH = 32,
		   parameter integer C_TCK_CLOCK_RATIO = 8

	   )
	   (
            input wire  CLK,
            input wire  RESET_n,

            input wire [31:0]  XVC_LENGTH,
            input wire [31:0]  TMS_VECTOR,
            input wire [31:0]  TDI_VECTOR,
            output wire [31:0] TDO_VECTOR,
			output reg         TDO_VECTOR_VALID,
			output reg [31:0]  TDO_VECTOR_LENGTH,
    		input wire         TDO_VECTOR_READ_EN,
            input wire         XVC_ENABLE,
			input wire         XVC_LENGTH_READY,
			input wire         TMS_VECTOR_READY,
			input wire         TDI_VECTOR_READY,

/*             input wire  WENABLE,
            output wire WBUSY,
            output wire WERR,

            input  wire RENABLE,
            output wire RBUSY,
            output wire RERR,

            input wire [(C_M_AXI_ADDR_WIDTH - 1): 0] REG_WADDR,
            input wire [(C_M_AXI_ADDR_WIDTH - 1): 0] REG_RADDR,
            input wire [1: 0] REG_WDW,
            input wire [1: 0] REG_RDW,
            input wire [(C_M_AXI_DATA_WIDTH - 1): 0] REG_WVAL,
            input wire [(C_M_AXI_DATA_WIDTH - 1): 0] REG_RVAL, */
            output wire           TCK        ,
            output wire           TMS        ,
            output wire           TDI        ,
            input  wire           TDO       
	   );

reg WENABLE;
wire WBUSY;
wire WERR;

reg RENABLE;
wire RBUSY;
wire RERR;

reg [(C_M_AXI_ADDR_WIDTH - 1): 0] REG_WADDR;
reg [(C_M_AXI_ADDR_WIDTH - 1): 0] REG_RADDR;
reg [1: 0] REG_WDW;
reg [1: 0] REG_RDW;
reg [(C_M_AXI_DATA_WIDTH - 1): 0] REG_WVAL;
wire [(C_M_AXI_DATA_WIDTH - 1): 0] REG_RVAL; 

wire axi_lite_aclk;
wire axi_lite_aresetn;
wire axi_lite_awvalid;
wire axi_lite_awready;
wire [(C_M_AXI_ADDR_WIDTH - 1) : 0] axi_lite_awaddr;
wire [2 : 0] axi_lite_awprot;
wire axi_lite_wvalid;
wire axi_lite_wready;
wire [C_M_AXI_DATA_WIDTH - 1 : 0] axi_lite_wdata;
wire [(C_M_AXI_DATA_WIDTH / 8 - 1) : 0] axi_lite_wstrb;
wire axi_lite_bvalid;
wire axi_lite_bready;
wire [1 : 0] axi_lite_bresp;
wire axi_lite_arvalid;
wire axi_lite_arready;
wire [(C_M_AXI_ADDR_WIDTH - 1) : 0] axi_lite_araddr;
wire [2 : 0] axi_lite_arprot;
wire axi_lite_rvalid;
wire axi_lite_rready;
wire [C_M_AXI_DATA_WIDTH - 1 : 0] axi_lite_rdata;
wire [1 : 0] axi_lite_rresp;

// wire TCK;
// wire TMS;
// wire TDI;



assign axi_lite_aclk = CLK;
assign axi_lite_aresetn = RESET_n;

template_m_axi_lite
	#
	(
		.C_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
		.C_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH)
	)
	template_m_axi_lite_inst
	(
		.WENABLE(WENABLE),
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
		.REG_RVAL(REG_RVAL),
		.m_axi_lite_aclk(axi_lite_aclk),
		.m_axi_lite_aresetn(axi_lite_aresetn),
		.m_axi_lite_awvalid(axi_lite_awvalid),
		.m_axi_lite_awready(axi_lite_awready),
		.m_axi_lite_awaddr(axi_lite_awaddr),
		.m_axi_lite_awprot(axi_lite_awprot),
		.m_axi_lite_wvalid(axi_lite_wvalid),
		.m_axi_lite_wready(axi_lite_wready),
		.m_axi_lite_wdata(axi_lite_wdata),
		.m_axi_lite_wstrb(axi_lite_wstrb),
		.m_axi_lite_bvalid(axi_lite_bvalid),
		.m_axi_lite_bready(axi_lite_bready),
		.m_axi_lite_bresp(axi_lite_bresp),
		.m_axi_lite_arvalid(axi_lite_arvalid),
		.m_axi_lite_arready(axi_lite_arready),
		.m_axi_lite_araddr(axi_lite_araddr),
		.m_axi_lite_arprot(axi_lite_arprot),
		.m_axi_lite_rvalid(axi_lite_rvalid),
		.m_axi_lite_rready(axi_lite_rready),
		.m_axi_lite_rdata(axi_lite_rdata),
		.m_axi_lite_rresp(axi_lite_rresp)
	);

axi_jtag_v1_0
	#
	(
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH),
		.C_TCK_CLOCK_RATIO(C_TCK_CLOCK_RATIO)
	)
	axi_jtag_instance
	(
		.s_axi_aclk(axi_lite_aclk),
		.s_axi_aresetn(axi_lite_aresetn),
		.s_axi_awaddr(axi_lite_awaddr),
		.s_axi_awprot(axi_lite_awprot),
		.s_axi_awvalid(axi_lite_awvalid),
		.s_axi_awready(axi_lite_awready),
		.s_axi_wdata(axi_lite_wdata),
		.s_axi_wstrb(axi_lite_wstrb),
		.s_axi_wvalid(axi_lite_wvalid),
		.s_axi_wready(axi_lite_wready),
		.s_axi_bresp(axi_lite_bresp),
		.s_axi_bvalid(axi_lite_bvalid),
		.s_axi_bready(axi_lite_bready),
		.s_axi_araddr(axi_lite_araddr),
		.s_axi_arprot(axi_lite_arprot),
		.s_axi_arvalid(axi_lite_arvalid),
		.s_axi_arready(axi_lite_arready),
		.s_axi_rdata(axi_lite_rdata),
		.s_axi_rresp(axi_lite_rresp),
		.s_axi_rvalid(axi_lite_rvalid),
		.s_axi_rready(axi_lite_rready),
		.TCK(TCK),
		.TMS(TMS),
		.TDI(TDI),
		.TDO(TDO)
	);

// reg global_clk;
// reg global_nrst;

// always #(5) global_clk = ~global_clk;

// assign axi_lite_aclk = global_clk;
// assign axi_lite_aresetn = global_nrst;

//initial
// begin
// 	global_clk <= 0;
// 	global_nrst <= 0;

// 	#50;
// 	global_nrst <= 1;
// end

//`define TEST_TIMES 4

//integer i;

// initial
// begin
// 	WENABLE <= 0;
// 	RENABLE <= 0;

// 	REG_WADDR <= 0;
// 	REG_RADDR <= 0;
// 	REG_WDW <= 2;
// 	REG_RDW <= 2;
// 	REG_WVAL <= 0;

// 	#100;

	reg  [3:0] state;
	reg  [3:0] last_state;
	reg  [5:0] counter;
	//parameter [] = ;

	//for (i = 0;i < `TEST_TIMES;i = i + 1)

	reg [9:0] tms_wr_addr;
	reg [9:0] tdi_wr_addr;
	reg [9:0] tms_rd_addr;
	reg [9:0] tdi_rd_addr;

	reg [9:0] tdo_wr_addr;
	reg [9:0] tdo_wr_addr_1;
	reg [9:0] tdo_rd_addr;	
	reg       tdo_buf_in_wren;

	wire [31:0] TMS_VECTOR_OUT;
    wire [31:0] TDI_VECTOR_OUT;
    wire [31:0] TDO_VECTOR_OUT;
	assign TDO_VECTOR_OUT = REG_RVAL;

    always @(posedge CLK) begin
        
 
	if(~RESET_n) begin
        WENABLE <= 0;
        RENABLE <= 0;

        REG_WADDR <= 0;
        REG_RADDR <= 0;
        REG_WDW <= 2;
        REG_RDW <= 2;
        REG_WVAL <= 0;

		TDO_VECTOR_VALID <= 0;

		counter <= 0;

		tms_rd_addr <= 10'h0;
		tdi_rd_addr <= 10'h0;
		tdo_wr_addr <= 10'h0;
		tdo_wr_addr_1 <= 10'h0;
		tdo_buf_in_wren <= 0;

		state <= 0;
		last_state <= 0;
    end else begin
        TDO_VECTOR_VALID <= 0;
		tdo_buf_in_wren  <= 0;
		case(state)
		0: begin
			//write to LENGTH
			//if(XVC_ENABLE) begin
			if(((XVC_LENGTH[4:0] == 0) & ({XVC_LENGTH[31:5]} <= tdi_wr_addr)) | (( XVC_LENGTH[4:0] != 0) & ((XVC_LENGTH[31:5] + 1) <= tdi_wr_addr))) begin
				if(tdi_wr_addr != 0) begin

					if(tdi_rd_addr < tdi_wr_addr) begin
						REG_WADDR <= 'h00;
						REG_WDW <= 2;
						REG_WVAL <= XVC_LENGTH;
						WENABLE <= 1;
						state <= 12;
						last_state <= state;
					end
				end
			end
			if(TDI_VECTOR_READY) begin
				tms_rd_addr <= 0;
				tdi_rd_addr <= 0;
				tdo_wr_addr <= 10'h0;
				tdo_wr_addr_1 <= 10'h0;
			end
			// @(~WBUSY);
			// @(WBUSY);
			//WENABLE <= 0;
			//#20;
			//state <= state + 1;
		end
		1: begin
			//write to TMS_VECTOR
			REG_WADDR <= 'h04;
			REG_WDW <= 2;
			REG_WVAL <= TMS_VECTOR_OUT;
			WENABLE <= 1;
			state <= 12;
			last_state <= state;
			// @(~WBUSY);
			// @(WBUSY);
			//WENABLE <= 0;
			//#20;
		end
		2: begin
			//write to TDI_VECTOR
			REG_WADDR <= 'h08;
			REG_WDW <= 2;
			REG_WVAL <= TDI_VECTOR_OUT;
			WENABLE <= 1;
			state <= 12;
			last_state <= state;
			// @(~WBUSY);
			// @(WBUSY);
			//WENABLE <= 0;
			//#20;
			//state <= state + 1;
		end
		3: begin
			//write to CTRL
			REG_WADDR <= 'h10;
			REG_WDW <= 2;
			REG_WVAL <= 1;
			WENABLE <= 1'b1;
			state <= 12;
			last_state <= state;
			// @(~WBUSY);
			// @(WBUSY);
			//WENABLE <= 0;
			//#20;
		end
		4: begin
			//read to CTRL
			REG_RADDR <= 'h10;
			REG_RDW <= 2;
			RENABLE <= 1;
			counter <= 0;
			state <= 14;
			last_state <= state + 1;
			// @(~RBUSY);
			// @(RBUSY);
			//RENABLE <= 0;
			//#20;
			//state <= state + 1;
		end
 		5: begin
			if(REG_RVAL[0]) begin
				//read to CTRL
				REG_RADDR <= 'h10;
				REG_RDW <= 2;
				RENABLE <= 1;
				counter <= 0;
				state <= 14;
				last_state <= state;
				// @(~RBUSY);
				// @(RBUSY);
				//RENABLE <= 0;
				//#20;
				//state <= state + 1;
			end else begin
				state <= 6;
/* 				if(counter == 63) begin
					state <= 6;
				end else begin
					counter <= counter + 1;
				end */
			end
		end
		6: begin
			//write to CTRL
			REG_RADDR <= 'h0C;  // reading TDO
			REG_RDW <= 2;
			RENABLE <= 1;
			state <= 14;
			last_state <= state;
			// @(~RBUSY);
			// @(RBUSY);
			//RENABLE <= 0;
			//#20;
			//state <= 0;
		end 

		12: begin
			if(WBUSY) begin
				state <= state + 1;
			end
		end
		13: if(~WBUSY)begin
			if(last_state == 6) begin
				WENABLE <= 0;
				RENABLE <= 0;
				state <= 0;
			end else begin
				WENABLE <= 0;
				RENABLE <= 0;
				state <= last_state + 1;
				//last_state <= 0;
			end
		end
		14: begin
			if(RBUSY) begin
				state <= state + 1;
			end
		end
		15: if(~RBUSY)begin
			if(last_state == 6) begin
				WENABLE <= 0;
				RENABLE <= 0;
				TDO_VECTOR_VALID <= 1;
				tdo_buf_in_wren <= 1;
				tdo_wr_addr_1 <= tdo_wr_addr_1 + 1;
				tdo_wr_addr <= tdo_wr_addr_1;
				tms_rd_addr <= tms_rd_addr + 1;
				tdi_rd_addr <= tdi_rd_addr + 1;
				state <= 0;
			end else begin
				WENABLE <= 0;
				RENABLE <= 0;
				state <= last_state;
				//last_state <= 0;
			end
		end
		endcase
	end

end



always @(posedge CLK) begin
	if(~RESET_n) begin
		tms_wr_addr <= 0;
		tdi_wr_addr <= 0;
    end else begin
		if(XVC_LENGTH_READY) begin
			tms_wr_addr <= 0;
			tdi_wr_addr <= 0;
			tdo_rd_addr <= 0;
			TDO_VECTOR_LENGTH <= 0;
		end else begin 
			if(TMS_VECTOR_READY) begin
				tms_wr_addr <= tms_wr_addr + 1;
			end
			if(TDI_VECTOR_READY) begin
				tdi_wr_addr <= tdi_wr_addr + 1;
			end
			if(((XVC_LENGTH[4:0] == 0) & ({XVC_LENGTH[31:5]} == tdo_wr_addr_1)) | (( XVC_LENGTH[4:0] != 0) & ((XVC_LENGTH[31:5] + 1) == tdo_wr_addr_1))) begin
				TDO_VECTOR_LENGTH <= tdo_wr_addr_1;
			end
			if(TDO_VECTOR_READ_EN) begin
				tdo_rd_addr <= tdo_rd_addr + 1;
			end
		end
		

	end
end


xvc_ram	tms_ram (
	.rd_clk		( CLK ),
	.rd_adr 	( tms_rd_addr ),
	.rd_dat_r 	( TMS_VECTOR_OUT ),
	
	.wr_clk		( CLK ),
	.wr_adr 	( tms_wr_addr ),
	.wr_dat_w 	( TMS_VECTOR ),
	.wr_we 		( TMS_VECTOR_READY )
);

xvc_ram	tdi_ram (
	.rd_clk		( CLK ),
	.rd_adr 	( tdi_rd_addr ),
	.rd_dat_r 	( TDI_VECTOR_OUT ),
	
	.wr_clk		( CLK ),
	.wr_adr 	( tdi_wr_addr ),
	.wr_dat_w 	( TDI_VECTOR ),
	.wr_we 		( TDI_VECTOR_READY )
);

xvc_ram	tdo_ram (
	.rd_clk		( CLK ),
	.rd_adr 	( tdo_rd_addr ),
	.rd_dat_r 	( TDO_VECTOR ),
	
	.wr_clk		( CLK ),
	.wr_adr 	( tdo_wr_addr ),
	.wr_dat_w 	( TDO_VECTOR_OUT ),
	.wr_we 		( tdo_buf_in_wren )
);

wire [31:0] length;
assign length = axi_jtag_instance.length;

reg [31:0]   tdo_capture;
reg [31:0]   tdo_capture2;
wire done_i;
wire slv_reg_wren;
wire [4:0] axi_araddr;
wire [31:0] slv_reg3;
wire [31:0] slv_reg4;
wire [31:0] reg_data_out;
wire slv_reg_rden;
wire axi_rvalid;
wire [7:0] reg_rstate_r;
wire [7:0] reg_wstate_r;

assign axi_araddr = axi_jtag_instance.u_axi4_lite_if.axi_araddr;
assign done_i = axi_jtag_instance.u_jtag_proc.done_i;
assign tdo_capture = axi_jtag_instance.u_jtag_proc.tdo_capture;
assign tdo_capture2 = axi_jtag_instance.tdo_vector;
assign slv_reg_wren = axi_jtag_instance.u_axi4_lite_if.slv_reg_wren;
assign slv_reg_rden = axi_jtag_instance.u_axi4_lite_if.slv_reg_rden;
assign slv_reg3 = axi_jtag_instance.u_axi4_lite_if.slv_reg3;
assign slv_reg4 = axi_jtag_instance.u_axi4_lite_if.slv_reg4;
assign reg_data_out = axi_jtag_instance.u_axi4_lite_if.reg_data_out;
assign axi_rvalid = axi_jtag_instance.u_axi4_lite_if.axi_rvalid;
assign reg_rstate_r = template_m_axi_lite_inst.reg_rstate_r;
assign reg_wstate_r = template_m_axi_lite_inst.reg_wstate_r;
    /*
	ila_3 ila3(
     .clk(CLK),
     .probe0(state),
     .probe1(last_state),
     .probe2(WENABLE),
     .probe3(RENABLE),
     .probe4(REG_RADDR),
     .probe5(RBUSY),
     .probe6(REG_RDW),
     .probe7(REG_WVAL),
     .probe8(REG_RVAL),
     .probe9(counter),
	 .probe10(TDO_VECTOR_VALID),
	 .probe11(XVC_LENGTH),
	 .probe12(TMS_VECTOR_OUT),
	 .probe13(TDI_VECTOR_OUT),
	 .probe14(XVC_LENGTH_READY),
	 .probe15(TMS_VECTOR_READY),
	 .probe16(TDI_VECTOR_READY),
	 .probe17(tdo_wr_addr),
	 .probe18(tdo_rd_addr),
	 .probe19(tdo_buf_in_wren),
	 .probe20(TMS),
	 .probe21(TDI),
	 .probe22(TDO),
	 .probe23(TCK),
	 .probe24(length),
	 .probe25(done_i),
	 .probe26(axi_lite_rdata),
	 .probe27(TDO_VECTOR),
	 .probe28(axi_lite_rvalid),
	 .probe29(axi_lite_rready),
	 .probe30(slv_reg_wren),
	 .probe31(axi_lite_wstrb),
	 .probe32(axi_araddr),
	 .probe33(TDO_VECTOR_OUT),
	 .probe34(TDO_VECTOR_LENGTH),
	 .probe35(slv_reg_rden),
	 .probe36(reg_data_out),
	 .probe37(TDO_VECTOR_READ_EN),
	 .probe38(axi_lite_arvalid),
	 .probe39(axi_rvalid),
	 .probe40(reg_rstate_r),
	 .probe41(WBUSY),
	 .probe42(reg_wstate_r)
     ); 
*/
module xvc_ram(
	input wr_clk,
	input wr_rst,
	input wr_we,
	input [9:0] wr_adr,
	input [31:0] wr_dat_w,

	input rd_clk,
	input rd_rst,
	input [9:0] rd_adr,
	output reg [31:0] rd_dat_r
);

reg [31:0] mem[0:1023];
reg [9:0] rd_adr_i;
always @(posedge wr_clk) begin
	if (wr_we)
		mem[wr_adr] <= wr_dat_w;
end

always @(posedge rd_clk) begin
	rd_adr_i <= rd_adr;
	rd_dat_r = mem[rd_adr_i];
end

endmodule


endmodule



