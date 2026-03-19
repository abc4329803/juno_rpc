`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         IHEP
// Engineer:        Zhang Jie (zhj@ihep.ac.cn)
//
// Create Date:     17:01:37 10/19/2014
// Design Name:
// Module Name:     fct_interface
// Project Name:    comet recbe
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module fct_interface(
  input         RST,              // System reset, need to last at least 25ns.
  output [29:0] TRIGGER_NUM,      // Trigger/event number parallel out, synchronized on the CLKOUT.
  output        TRIGGER_NUM_VALID,// Trigger is valid, synchronized on the CLKOUT.
  output        ERROR_VALID,
  output        PULSE,            // reserved
  input         BUSY,             // Indicate the Belle-II board can't take any more triggers. synchronized on the CLKOUT.
  output        CLKOUT,           // The 40MHz clock output.
  input  [2:0]  MANCHESTER_EN,    // enable manchester coding, [0]: trg; [1]:busy ; [2] pulse
  output        LINKED,           // When using manchester coding, it indicates the Belle-II board linked.
// FCT board interface
  input         FCT_CLK40_IN,     // The 40 MHz clock used as the base clock for the Belle-II board.
  input         FCT_TRIGGER_IN,   // 32-bit serial data synchronized on the 40MHz clock.
  input         FCT_PULSE_IN,     // reserved
  output        FCT_BUSY_OUT      // Synchronised on the 40MHz clock.
);
////////////////////////////////////////////////////////////////////////////////
wire clk2x; // Interface clock, 80MHz.
wire dcm_locked;
dcm_interface dcm_fct (
  .CLKIN_IN(FCT_CLK40_IN),  // in, 40MHz
  .RST_IN(RST),
  .CLK0_OUT(CLKOUT),         // 40MHz
  .CLK2X_OUT(clk2x),        // 80MHz
  .LOCKED_OUT(dcm_locked)
);

wire reset = ~dcm_locked;
reg interface_rst;
////////////////////////////////////////////////////////////////////////////////
// trigger
wire trigger_in_dec, trigger_linked;
manchester_decoder trigger_dec (
  .CLK2X(clk2x),
  .CLK(CLKOUT),
  .RST(reset|interface_rst),
  .MDI(FCT_TRIGGER_IN),
  .LINKED(trigger_linked),
  .DOUT(trigger_in_dec)
);
wire trigger_serial = MANCHESTER_EN[0]? trigger_in_dec: FCT_TRIGGER_IN;
//assign LINKED = MANCHESTER_EN[0]? trigger_linked: dcm_locked;
assign LINKED = dcm_locked;
//assign LINKED = MANCHESTER_EN[0]? trigger_linked: 1'b1;
reg [4:0] count;
reg count_en;
always @(posedge CLKOUT) begin
  if(count_en) count <= count + 1'b1;
  else count <= 0;
end

// State Machine
reg [0:0] state_reg, state_next;
localparam
  IDLE = 0,
  DATA = 1;

always @(posedge CLKOUT)
  if (reset) state_reg <= IDLE;
  else state_reg <= state_next;

always @(*) begin
  state_next = IDLE;
  count_en = 0;
  case(state_reg)
    IDLE: begin
      if(trigger_serial) state_next = DATA;
      else state_next = IDLE;
    end
    DATA: begin
      count_en = 1'b1;
      if(count==30) state_next = IDLE;
      else state_next = DATA;
    end
  endcase
end

reg [30:0] trigger_parallel;
always @(posedge CLKOUT) begin
  if(reset) trigger_parallel <= 0;
  else if(state_reg == DATA) trigger_parallel <= {trigger_serial, trigger_parallel[30:1]};
end
assign TRIGGER_NUM[29:0] = trigger_parallel[30:1];

reg trigger_parallel_valid;
always @(posedge CLKOUT) begin
  if(count == 30) begin
    if(&trigger_parallel) interface_rst <= 1'b1;
    else trigger_parallel_valid <= 1'b1;
  end
  else begin
    trigger_parallel_valid <= 1'b0;
    interface_rst <= 1'b0;
  end
end

assign TRIGGER_NUM_VALID = trigger_parallel_valid & trigger_parallel[0];
assign ERROR_VALID = trigger_parallel_valid & ~trigger_parallel[0];

////////////////////////////////////////////////////////////////////////////////
// BUSY
wire busy_out_enc;
manchester_encoder busy_enc (
  .CLK2X(clk2x),
  .RST(reset),
  .DIN(BUSY),
  .MDO(busy_out_enc)
);
assign FCT_BUSY_OUT = MANCHESTER_EN[1]? busy_out_enc: BUSY;

////////////////////////////////////////////////////////////////////////////////
// pulse
wire pulse_in_dec;
manchester_decoder pulse_dec (
  .CLK2X(clk2x),
  .CLK(CLKOUT),
  .RST(reset|interface_rst),
  .MDI(FCT_PULSE_IN),
  .LINKED(),
  .DOUT(pulse_in_dec)
);
assign PULSE = MANCHESTER_EN[2]? pulse_in_dec: FCT_PULSE_IN;

endmodule
