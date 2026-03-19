`timescale 1ns / 1ps 
/**
 ******************************************************************************
 * @file    template_m_axi_lite.v
 * @author  KEN
 * @version V1.0
 * @date    Feb. 25th, 2020
 * @brief   Master AXI-Lite Interface Template
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; COPYRIGHT 2020 K'sP</center></h2>
 ******************************************************************************
 */

/*Template Start*/
/*

reg WENABLE;
wire WBUSY;
wire WERR;
 
reg RENABLE;
wire RBUSY;
wire RERR;
 
reg [(C_ADDR_WIDTH - 1): 0] REG_WADDR;
reg [(C_ADDR_WIDTH - 1): 0] REG_RADDR;
reg [1: 0] REG_WDW;
reg [1: 0] REG_RDW;
reg [(C_DATA_WIDTH - 1): 0] REG_WVAL;
wire [(C_DATA_WIDTH - 1): 0] REG_RVAL;

wire axi_lite_aclk;
wire axi_lite_aresetn;
wire axi_lite_awvalid;
wire axi_lite_awready;
wire [(C_ADDR_WIDTH - 1) : 0] axi_lite_awaddr;
wire [2 : 0] axi_lite_awprot;
wire axi_lite_wvalid;
wire axi_lite_wready;
wire [C_DATA_WIDTH - 1 : 0] axi_lite_wdata;
wire [(C_DATA_WIDTH / 8 - 1) : 0] axi_lite_wstrb;
wire axi_lite_bvalid;
wire axi_lite_bready;
wire [1 : 0] axi_lite_bresp;
wire axi_lite_arvalid;
wire axi_lite_arready;
wire [(C_ADDR_WIDTH - 1) : 0] axi_lite_araddr;
wire [2 : 0] axi_lite_arprot;
wire axi_lite_rvalid;
wire axi_lite_rready;
wire [C_DATA_WIDTH - 1 : 0] axi_lite_rdata;
wire [1 : 0] axi_lite_rresp;
 
template_m_axi_lite
	#
	(
		.C_AXI_ADDR_WIDTH(C_ADDR_WIDTH),
		.C_AXI_DATA_WIDTH(C_DATA_WIDTH)
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
 
*/ 
/*Template End*/

`define AXI_RESPOENSE_OKAY 2'b00
`define AXI_RESPOENSE_EXOKAY 2'b01
`define AXI_RESPOENSE_SLVERR 2'b10
`define AXI_RESPOENSE_DECERR 2'b11

`define REG_WR_W 1'b0
`define REG_WR_R 1'b1

`define REG_DW_8_BIT 2'b00
`define REG_DW_16_BIT 2'b01
`define REG_DW_32_BIT 2'b10
`define REG_DW_64_BIT 2'b11

module template_m_axi_lite
	   #(
		   /*AXI Address Map Size, 2^(C_AXI_ADDR_WIDTH) Bytes*/
		   parameter integer C_AXI_ADDR_WIDTH = 10,
		   /*AXI Data Bus Size, C_AXI_DATA_WIDTH Bits*/
		   parameter integer C_AXI_DATA_WIDTH = 32
	   )
	   (
		   input wire WENABLE,
		   output wire WBUSY,
		   output wire WERR,
		   input wire RENABLE,
		   output wire RBUSY,
		   output wire RERR,

		   input wire [(C_AXI_ADDR_WIDTH - 1): 0] REG_WADDR,
		   input wire [(C_AXI_ADDR_WIDTH - 1): 0] REG_RADDR,
		   input wire [1: 0] REG_WDW,
		   input wire [1: 0] REG_RDW,
		   input wire [(C_AXI_DATA_WIDTH - 1): 0] REG_WVAL,
		   output wire [(C_AXI_DATA_WIDTH - 1): 0] REG_RVAL,

		   /*Master AXI-Lite Interface*/
		   //Global ACLK
		   (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_lite_aclk CLK" *)
		   (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF m_axi_lite, ASSOCIATED_RESET m_axi_lite_aresetn" *)
		   input wire m_axi_lite_aclk,
		   //Global ARESETn
		   (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_lite_aresetn RST" *)
		   (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
		   input wire m_axi_lite_aresetn,

		   //Write address channel. AWVALID, AWREADY, AWADDR, AWPROT
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWVALID" *)
		   output wire m_axi_lite_awvalid,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWREADY" *)
		   input wire m_axi_lite_awready,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWADDR" *)
		   output [(C_AXI_ADDR_WIDTH - 1): 0] m_axi_lite_awaddr,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWPROT" *)
		   output [2: 0] m_axi_lite_awprot,

		   //Write data channel. WVALID, WREADY, WDATA, WSTRB
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WVALID" *)
		   output wire m_axi_lite_wvalid,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WREADY" *)
		   input wire m_axi_lite_wready,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WDATA" *)
		   output wire [(C_AXI_DATA_WIDTH - 1): 0] m_axi_lite_wdata,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WSTRB" *)
		   output wire [((C_AXI_DATA_WIDTH + 7) / 8 - 1): 0] m_axi_lite_wstrb,

		   //Write response channel. BVALID, BREADY, BRESP
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BVALID" *)
		   input wire m_axi_lite_bvalid,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BREADY" *)
		   output wire m_axi_lite_bready,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BRESP" *)
		   input wire [1: 0] m_axi_lite_bresp,

		   //Read address channel. ARVALID, ARREADY, ARADDR, ARPROT
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARVALID" *)
		   output wire m_axi_lite_arvalid,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARREADY" *)
		   input wire m_axi_lite_arready,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARADDR" *)
		   output wire [(C_AXI_ADDR_WIDTH - 1): 0] m_axi_lite_araddr,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARPROT" *)
		   output wire [2: 0] m_axi_lite_arprot,

		   //Read data channel. RVALID, RREADY, RDATA, RRESP
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RVALID" *)
		   input wire m_axi_lite_rvalid,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RREADY" *)
		   output wire m_axi_lite_rready,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RDATA" *)
		   input wire [(C_AXI_DATA_WIDTH - 1): 0] m_axi_lite_rdata,
		   (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RRESP" *)
		   input wire [1: 0] m_axi_lite_rresp
	   );

/*Module Control Ports Registers*/
reg wbusy_r;
reg werr_r;
reg rbusy_r;
reg rerr_r;
reg [(C_AXI_DATA_WIDTH - 1): 0] reg_rval_r;

assign WBUSY = wbusy_r;
assign WERR = werr_r;
assign RBUSY = rbusy_r;
assign RERR = rerr_r;
assign REG_RVAL = reg_rval_r;

/*AXI Output Port Registers*/
reg awvalid_r;
reg [(C_AXI_ADDR_WIDTH - 1): 0] awaddr_r;
reg [2: 0] awprot_r;
reg wvalid_r;
reg [(C_AXI_DATA_WIDTH - 1): 0] wdata_r;
reg [(C_AXI_DATA_WIDTH / 8 - 1): 0] wstrb_r;
reg bready_r;

reg arvalid_r;
reg [(C_AXI_ADDR_WIDTH - 1): 0] araddr_r;
reg [2: 0] arprot_r;
reg rready_r;

assign m_axi_lite_awvalid = awvalid_r;
assign m_axi_lite_awaddr = awaddr_r;
assign m_axi_lite_awprot = awprot_r;
assign m_axi_lite_wvalid = wvalid_r;
assign m_axi_lite_wdata = wdata_r;
assign m_axi_lite_wstrb = wstrb_r;
assign m_axi_lite_bready = bready_r;

assign m_axi_lite_arvalid = arvalid_r;
assign m_axi_lite_araddr = araddr_r;
assign m_axi_lite_arprot = arprot_r;
assign m_axi_lite_rready = rready_r;

/*Write Process*/
wire [1: 0] REG_WDW_TEMP;
assign REG_WDW_TEMP = ((REG_WDW == `REG_DW_64_BIT) && (C_AXI_DATA_WIDTH == 32)) ? `REG_DW_32_BIT : REG_WDW;

reg [7: 0] reg_wstate_r;
localparam REG_WSTATE_IDLE = 'd0;
localparam REG_WSTATE_START = 'd1;
localparam REG_WSTATE_WVALID = 'd2;
localparam REG_WSTATE_WREADY = 'd3;
localparam REG_WSTATE_BREADY = 'd4;
localparam REG_WSTATE_END = 'd5;

reg w_word_index;

always@(posedge m_axi_lite_aclk or negedge m_axi_lite_aresetn)
begin
	if (~m_axi_lite_aresetn)
	begin
		reg_wstate_r <= REG_WSTATE_IDLE;

		wbusy_r <= 1'b0;
		werr_r <= 1'b0;

		awvalid_r <= 1'b0;
		awaddr_r <= 0;
		awprot_r <= 0;
		wvalid_r <= 1'b0;
		wdata_r <= 0;
		wstrb_r <= 0;
		bready_r <= 1'b1;

		w_word_index <= 0;
	end
	else
	begin
		case (reg_wstate_r)
			REG_WSTATE_IDLE:
			begin
				if (WENABLE == 1'b0)
				begin
					reg_wstate_r <= REG_WSTATE_START;
				end
			end

			REG_WSTATE_START:
			begin
				if (WENABLE == 1'b1)
				begin
					reg_wstate_r <= REG_WSTATE_WVALID;

					wbusy_r <= 1'b1;
					werr_r <= 1'b0;

					w_word_index <= 0;
				end
			end

			REG_WSTATE_WVALID:
			begin
				reg_wstate_r <= REG_WSTATE_WREADY;

				awvalid_r <= 1'b1;
				wvalid_r <= 1'b1;

				awaddr_r <= REG_WADDR + w_word_index * (C_AXI_DATA_WIDTH / 8);

				if (w_word_index == 0)
				begin
					wdata_r <= REG_WVAL << (8 * (REG_WADDR % (C_AXI_DATA_WIDTH / 8)));
					wstrb_r <= ( (1 << (1 << REG_WDW_TEMP)) - 1 ) << (REG_WADDR % (C_AXI_DATA_WIDTH / 8));
				end
				else
				begin
					wdata_r <= REG_WVAL >> (8 * ((C_AXI_DATA_WIDTH / 8) - (REG_WADDR % (C_AXI_DATA_WIDTH / 8))));
					wstrb_r <= (1 << ((1 << REG_WDW_TEMP) - ((C_AXI_DATA_WIDTH / 8) - (REG_WADDR % (C_AXI_DATA_WIDTH / 8))))) - 1;
				end
			end

			REG_WSTATE_WREADY:
			begin
				if (m_axi_lite_awready && m_axi_lite_wready)
				begin
					reg_wstate_r <= REG_WSTATE_BREADY;

					awvalid_r <= 1'b0;
					wvalid_r <= 1'b0;
				end
			end

			REG_WSTATE_BREADY:
			begin
				if (m_axi_lite_bvalid)
				begin
					if (m_axi_lite_bresp != `AXI_RESPOENSE_OKAY)
					begin
						werr_r <= 1'b1;
					end

					reg_wstate_r <= REG_WSTATE_END;

					bready_r <= 1'b0;
				end

			end

			REG_WSTATE_END:
			begin
				bready_r <= 1'b1;

				if (((w_word_index == 0) && ((C_AXI_DATA_WIDTH / 8 - (REG_WADDR % (C_AXI_DATA_WIDTH / 8))) < (1 << REG_WDW_TEMP))) && (~werr_r))
				begin
					reg_wstate_r <= REG_WSTATE_WVALID;

					w_word_index <= 1;
				end
				else
				begin
					reg_wstate_r <= REG_WSTATE_IDLE;

					wbusy_r <= 1'b0;
				end
			end

			default:
			begin
				reg_wstate_r <= REG_WSTATE_IDLE;
			end

		endcase
	end
end

/*Read Process*/
wire [1: 0] REG_RDW_TEMP;
assign REG_RDW_TEMP = ((REG_RDW == `REG_DW_64_BIT) && (C_AXI_DATA_WIDTH == 32)) ? `REG_DW_32_BIT : REG_RDW;

reg [7: 0] reg_rstate_r;
localparam REG_RSTATE_IDLE = 'd0;
localparam REG_RSTATE_START = 'd1;
localparam REG_RSTATE_ARVALID = 'd2;
localparam REG_RSTATE_ARREADY = 'd3;
localparam REG_RSTATE_RVALID = 'd4;
localparam REG_RSTATE_END = 'd5;

reg r_word_index;

always@(posedge m_axi_lite_aclk or negedge m_axi_lite_aresetn)
begin
	if (~m_axi_lite_aresetn)
	begin
		reg_rstate_r <= REG_RSTATE_IDLE;

		rbusy_r <= 1'b0;
		rerr_r <= 1'b0;

		reg_rval_r <= 0;

		arvalid_r <= 1'b0;
		araddr_r <= 0;
		arprot_r <= 0;
		rready_r <= 1'b1;

		r_word_index <= 0;
	end
	else
	begin
		case (reg_rstate_r)
			REG_RSTATE_IDLE:
			begin
				if (RENABLE == 1'b0)
				begin
					reg_rstate_r <= REG_RSTATE_START;
				end
			end

			REG_RSTATE_START:
			begin
				if (RENABLE == 1'b1)
				begin
					reg_rstate_r <= REG_RSTATE_ARVALID;

					rbusy_r <= 1'b1;
					rerr_r <= 1'b0;
					r_word_index <= 0;
				end
			end

			REG_RSTATE_ARVALID:
			begin
				reg_rstate_r <= REG_RSTATE_ARREADY;

				arvalid_r <= 1'b1;

				araddr_r = REG_RADDR + r_word_index * (C_AXI_DATA_WIDTH / 8);
			end

			REG_RSTATE_ARREADY:
			begin
				if (m_axi_lite_arready)
				begin
					reg_rstate_r <= REG_RSTATE_RVALID;

					arvalid_r <= 1'b0;
				end
			end

			REG_RSTATE_RVALID:
			begin
				if (m_axi_lite_rvalid)
				begin
					reg_rstate_r <= REG_RSTATE_END;

					rready_r <= 1'b0;

					if (m_axi_lite_rresp != `AXI_RESPOENSE_OKAY)
					begin
						rerr_r <= 1'b1;
					end


					if (r_word_index == 0)
					begin
						reg_rval_r <= (m_axi_lite_rdata >> (8 * (REG_RADDR % (C_AXI_DATA_WIDTH / 8))))
						& ((1 << (8 * (1 << REG_RDW_TEMP))) - 1);
					end
					else
					begin
						reg_rval_r <= reg_rval_r | (
							(m_axi_lite_rdata &
							 ((1 << (
								   8 * (
									   (1 << REG_RDW_TEMP) - ((C_AXI_DATA_WIDTH / 8) - (REG_RADDR % (C_AXI_DATA_WIDTH / 8)))
								   )
							   )) - 1))
							<< (8 * (C_AXI_DATA_WIDTH / 8 - (REG_RADDR % (C_AXI_DATA_WIDTH / 8))))
						);
					end

				end

			end

			REG_RSTATE_END:
			begin
				rready_r <= 1'b1;

				if (((r_word_index == 0) && ((C_AXI_DATA_WIDTH / 8 - (REG_RADDR % (C_AXI_DATA_WIDTH / 8))) < (1 << REG_RDW_TEMP))) && (~rerr_r))
				begin
					reg_rstate_r <= REG_RSTATE_ARVALID;

					r_word_index <= 1;
				end
				else
				begin
					reg_rstate_r <= REG_RSTATE_IDLE;

					rbusy_r <= 1'b0;
				end
			end

			default:
			begin
				reg_rstate_r <= REG_RSTATE_IDLE;
			end

		endcase
	end
end

endmodule