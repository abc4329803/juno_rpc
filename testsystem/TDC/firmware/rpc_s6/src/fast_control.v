`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         IHEP
// Engineer:        Zhang Jie (zhj@ihep.ac.cn)
//
// Create Date:     17:01:37 10/19/2014
// Design Name:
// Module Name:     fast_control
// Project Name:    comet recbe
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:    manage trigger, clock system
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module fast_control(
// Remote FCT board interface
  input         FCT_CLK40_IN,     // The 40 MHz clock used as the base clock for the Belle-II board.
  input         FCT_TRIGGER_IN,   // 32-bit serial data synchronized on the 40MHz clock.
  input         FCT_PULSE_IN,     // reserved
  output        FCT_BUSY_OUT,     // Synchronised on the 40MHz clock.
// local interface
  input         SYSCLK,           // local clock, 125MHz
  input         RST,              // system reset
  input  [2:0]  MANCHESTER_EN,    // enable manchester coding, [0]: trg; [1]:busy ; [2] pulse
  input         BUSY,             // Indicate the Belle-II board can't take any more triggers. synchronized on the SYSCLK.
  output        CLKOUT,           // The 40MHz clock output.
  output        LINKED,           // When using manchester coding, it indicates the Belle-II board linked.
  output [29:0] TRIGGER_NUM,      // Trigger/event number parallel out, synchronized on the SYSCLK.
  output        TRIGGER_NUM_VALID,// Trigger is valid, synchronized on the SYSCLK.
  output        ERROR_VALID,      //
  output        PULSE             // reserved
);
////////////////////////////////////////////////////////////////////////////////
wire clk40;
wire [29:0] trigger_num_40;
wire trigger_num_valid_40;
wire error_valid_40;
wire pulse_40;
wire busy_40;
wire fct_linked_40;
/*
fct_interface fct_interface (
  .RST(RST),
  .TRIGGER_NUM(trigger_num_40),
  .TRIGGER_NUM_VALID(trigger_num_valid_40),
  .ERROR_VALID(error_valid_40),
  .PULSE(pulse_40),
  .BUSY(busy_40),
  .CLKOUT(clk40),
  .MANCHESTER_EN(MANCHESTER_EN[2:0]),
  .LINKED(fct_linked_40),
  .FCT_CLK40_IN(FCT_CLK40_IN),
  .FCT_TRIGGER_IN(FCT_TRIGGER_IN),
  .FCT_PULSE_IN(FCT_PULSE_IN),
  .FCT_BUSY_OUT(FCT_BUSY_OUT)
);
*/
fct_interface fct_interface (
  .RST(RST),
  .TRIGGER_NUM(trigger_num_40),
  .TRIGGER_NUM_VALID(trigger_num_valid_40),
  .ERROR_VALID(error_valid_40),
  .PULSE(pulse_40),
  .BUSY(busy_40),
  .CLKOUT(clk40),
  .MANCHESTER_EN(MANCHESTER_EN[2:0]),
  .LINKED(fct_linked_40),
  .FCT_CLK40_IN(FCT_CLK40_IN),
  .FCT_TRIGGER_IN(FCT_TRIGGER_IN),
  .FCT_PULSE_IN(FCT_PULSE_IN),
  .FCT_BUSY_OUT(FCT_BUSY_OUT)
);

assign CLKOUT = clk40;

////////////////////////////////////////////////////////////////////////////////
// Trigger
wire trigger_num_valid_o;
Flag_CrossDomain trigger_valid_CrossDomain (
  .clkA(clk40),
  .FlagIn_clkA(trigger_num_valid_40),
  .clkB(SYSCLK),
  .FlagOut_clkB(trigger_num_valid_o)
);

reg [29:0] trigger_num_r;
reg trigger_num_valid_r;
always @(posedge SYSCLK) begin
  trigger_num_valid_r <= trigger_num_valid_o;
  if(trigger_num_valid_o) trigger_num_r <= trigger_num_40;
end
assign TRIGGER_NUM = trigger_num_r;
assign TRIGGER_NUM_VALID = trigger_num_valid_r;

Flag_CrossDomain error_valid_CrossDomain (
  .clkA(clk40),
  .FlagIn_clkA(error_valid_40),
  .clkB(SYSCLK),
  .FlagOut_clkB(ERROR_VALID)
);

////////////////////////////////////////////////////////////////////////////////
// Pulse
// Not processed
assign PULSE = pulse_40;

////////////////////////////////////////////////////////////////////////////////
// Busy
Signal_CrossDomain busy_CrossDomain (
  .SignalIn_clkA(BUSY),
  .clkB(clk40),
  .SignalOut_clkB(busy_40)
);

////////////////////////////////////////////////////////////////////////////////
// Linked
assign LINKED = fct_linked_40;

endmodule
