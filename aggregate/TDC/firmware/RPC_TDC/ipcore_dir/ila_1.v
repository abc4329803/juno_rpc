///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2026 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : ila_1.v
// /___/   /\     Timestamp  : Mon Mar 16 06:29:23 UTC 2026
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module ila_1(
    CONTROL,
    CLK,
    TRIG0,
    TRIG1,
    TRIG2,
    TRIG3,
    TRIG4,
    TRIG5,
    TRIG6,
    TRIG7,
    TRIG8) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL;
input CLK;
input [0 : 0] TRIG0;
input [1 : 0] TRIG1;
input [2 : 0] TRIG2;
input [2 : 0] TRIG3;
input [0 : 0] TRIG4;
input [0 : 0] TRIG5;
input [7 : 0] TRIG6;
input [0 : 0] TRIG7;
input [0 : 0] TRIG8;

endmodule
