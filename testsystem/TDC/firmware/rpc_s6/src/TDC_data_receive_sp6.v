`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 11:21:04 AM
// Design Name: 
// Module Name: TDC _data_receive
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


module TDC_data_receive_sp6#(
  parameter  DATA_WIDTH = 32
)(
    input  wire          CLK,
    input  wire          CLK2X,
    input  wire          CLK8X,
    input  wire          RESET,
	 input  wire          TRG,
    input  wire          DATA_IN,
    output reg   [7:0]   DATA_ADDR,
    output reg   [7:0]   DATA_OUT,
    output reg           DATA_OUT_VALID
    );

////////////////////////////////////////////////////////////////////////////////
// TDC data
(* keep = "true" *)wire [DATA_WIDTH - 1:0]   TDC_decode_data;
(* keep = "true" *)reg           TDC_decode_data_valid;
(* keep = "true" *)wire DATA_SERIAL;
//(* keep = "true" *)wire [63:0] TDC_decode_data;
(* keep = "true" *)reg [6:0] count;
(* keep = "true" *)reg count_en;

(* keep = "true" *)wire [6:0] count_1;
(* keep = "true" *)wire count_en_1;

assign count_1 = count;
assign count_en_1 = count_en;

always @(posedge CLK) begin
  if(count_en) count <= count + 1'b1;
  else count <= 0;
end
// State Machine
(* keep = "true" *)reg [0:0] state_reg, state_next;
localparam
  IDLE = 0,
  DATA = 1;

reg TDC_decode_data_valid_r;
reg reset_decoder;

always @(posedge CLK) begin
    if(TDC_decode_data_valid) begin
        reset_decoder <= 1;
    end else begin
        reset_decoder <= 0;
    end
    if (RESET) begin 
        state_reg <= IDLE;
        TDC_decode_data_valid <= 0;
    end else begin 
        state_reg <= state_next;
        TDC_decode_data_valid <= TDC_decode_data_valid_r;
    end
end
always @(*) begin
  state_next = IDLE;
  count_en = 0;
  case(state_reg)
    IDLE: begin
      TDC_decode_data_valid_r <= 0;
      if(DATA_SERIAL) state_next = DATA;
      else state_next = IDLE;
    end
    DATA: begin
      count_en = 1'b1;
      if(count == (DATA_WIDTH)) begin 
          state_next = IDLE;
          TDC_decode_data_valid_r <= 1;
      end else begin 
          state_next = DATA;
          TDC_decode_data_valid_r <= 0;
      end
    end
  endcase
end

reg [DATA_WIDTH:0] DATA_parallel;
always @(posedge CLK) begin
  if(RESET) DATA_parallel <= 0;
  else if(state_reg == DATA) DATA_parallel <= {DATA_SERIAL, DATA_parallel[DATA_WIDTH:1]};
end
assign TDC_decode_data = DATA_parallel[DATA_WIDTH:1];

manchester_decoder tdc_data_dec (
  .CLK2X(CLK2X),
  .CLK8X(CLK8X),
  .CLK(CLK),
  .RST(reset_decoder),
  .MDI(DATA_IN),
  .LINKED(),
  .DOUT(DATA_SERIAL)
);

/* deman tdc_data_dec(
    .clk_in(CLK),
    .datain(DATA_IN), 
    .tmp(), 
    .flag1(), 
    .flag2(),
    .dataout(DATA_SERIAL), 
    .fail()
); */


  always @(*) begin
      if(TDC_decode_data_valid) begin
          if(TDC_decode_data[31:24] == 8'hFC & TDC_decode_data[7:0] == 8'hD7) begin
              DATA_OUT_VALID <= 1'b1;
              DATA_ADDR <= TDC_decode_data[15:8];
              DATA_OUT <= TDC_decode_data[23:16];
          end else begin
              DATA_OUT_VALID <= 1'b0;
              DATA_ADDR <= 0;
              DATA_OUT <= 0;
          end
      end else begin
              DATA_OUT_VALID <= 1'b0;
              DATA_ADDR <= 0;
              DATA_OUT <= 0;
      end
  end


/*    ila_4 ila_4(
        .clk(CLK8X), // input wire clk
        .probe0(TDC_decode_data_valid),
        .probe1(DATA_IN),
        .probe2(TDC_decode_data),
        .probe3(DATA_serial),
        .probe4(count),
        .probe5(reset_decoder),
        .probe6(count_en),
        .probe7(state_reg),
        .probe8(DATA_OUT_VALID)
    );*/
/*
    wire [35:0] CONTROL0;
    icon_0 icon_0_inst (
        .CONTROL0(CONTROL0)  // INOUT BUS [35:0]
        //.CONTROL1(CONTROL1) // INOUT BUS [35:0]		 
    );
	 
	 //wire sync_shift;
	 //assign sync_shift = tdc_data_dec.sync_shift;

    ila_1 ila_1_inst (
        .CONTROL(CONTROL0),  // INOUT BUS [35:0]
        .CLK(CLK8X),  // IN
        //.TRIG0({SIGNAL[7:2], TIM_1S_r, HIT[79], Effective_Signal[0], M_FULL_DATA_VALID}),  // IN BUS [7:0]
        .TRIG0(TDC_decode_data_valid),  // IN BUS [7:0]
        .TRIG1(DATA_IN),  // IN BUS [7:0]
		  .TRIG2(DATA_SERIAL), 
		  .TRIG3(state_reg),
		  .TRIG4(reset_decoder),
		  .TRIG5(TRG),
        .TRIG6(TDC_decode_data)  // IN BUS [7:0]
        //.TRIG4(hitmap[0])  // IN BUS [7:0]
        //.TRIG5(hitmap[0]), // IN BUS [7:0]
        //.TRIG6(M_FULL_DATA) // IN BUS [7:0]
        //	 .TRIG7(rates[4]), // IN BUS [7:0]
        //	 .TRIG8(rates[5]), // IN BUS [7:0]
        //	 .TRIG9(rates[6]), // IN BUS [7:0]
        //	 .TRIG10(rates[7]) // IN BUS [7:0]
    );
	 */

endmodule
