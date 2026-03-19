///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2025 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : ila_0.v
// /___/   /\     Timestamp  : Fri Aug 29 11:22:31 China Standard Time 2025
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module ila_0(
    CONTROL,
    CLK,
    TRIG0,
    TRIG1,
    TRIG2,
    TRIG3,
    TRIG4) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [9 : 0] TRIG0;
input [9 : 0] TRIG1;
input [1 : 0] TRIG2;
input [3 : 0] TRIG3;
input [9 : 0] TRIG4;

endmodule
