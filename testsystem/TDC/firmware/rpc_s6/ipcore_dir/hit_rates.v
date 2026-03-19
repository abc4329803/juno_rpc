////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: hit_rates.v
// /___/   /\     Timestamp: Wed Apr 23 12:15:24 2025
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/hit_rates.ngc C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/hit_rates.v 
// Device	: 6slx9ftg256-2
// Input file	: C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/hit_rates.ngc
// Output file	: C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/hit_rates.v
// # of Modules	: 1
// Design Name	: hit_rates
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module hit_rates (
  clk, ce, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input ce;
  input sclr;
  output [15 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  wire \blk00000001/sig00000030 ;
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \blk00000001/sig00000025 ;
  wire \blk00000001/sig00000024 ;
  wire \blk00000001/sig00000023 ;
  wire \blk00000001/sig00000022 ;
  wire \blk00000001/sig00000021 ;
  wire \blk00000001/sig00000020 ;
  wire \blk00000001/sig0000001f ;
  wire \blk00000001/sig0000001e ;
  wire \blk00000001/sig0000001d ;
  wire \blk00000001/sig0000001c ;
  wire \blk00000001/sig0000001b ;
  wire \blk00000001/sig0000001a ;
  wire \blk00000001/sig00000019 ;
  wire \blk00000001/sig00000018 ;
  wire \blk00000001/sig00000017 ;
  wire \blk00000001/sig00000016 ;
  wire \blk00000001/sig00000015 ;
  wire \blk00000001/sig00000014 ;
  wire [15 : 0] NlwRenamedSig_OI_q;
  assign
    q[15] = NlwRenamedSig_OI_q[15],
    q[14] = NlwRenamedSig_OI_q[14],
    q[13] = NlwRenamedSig_OI_q[13],
    q[12] = NlwRenamedSig_OI_q[12],
    q[11] = NlwRenamedSig_OI_q[11],
    q[10] = NlwRenamedSig_OI_q[10],
    q[9] = NlwRenamedSig_OI_q[9],
    q[8] = NlwRenamedSig_OI_q[8],
    q[7] = NlwRenamedSig_OI_q[7],
    q[6] = NlwRenamedSig_OI_q[6],
    q[5] = NlwRenamedSig_OI_q[5],
    q[4] = NlwRenamedSig_OI_q[4],
    q[3] = NlwRenamedSig_OI_q[3],
    q[2] = NlwRenamedSig_OI_q[2],
    q[1] = NlwRenamedSig_OI_q[1],
    q[0] = NlwRenamedSig_OI_q[0];
  INV   \blk00000001/blk00000041  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig00000035 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000040  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig00000043 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003f  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig00000042 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003e  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig00000041 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003d  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\blk00000001/sig00000040 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003c  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig0000003f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003b  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig0000003e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000003a  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\blk00000001/sig0000003d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000039  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\blk00000001/sig0000003c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000038  (
    .I0(NlwRenamedSig_OI_q[9]),
    .O(\blk00000001/sig0000003b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000037  (
    .I0(NlwRenamedSig_OI_q[10]),
    .O(\blk00000001/sig0000003a )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000036  (
    .I0(NlwRenamedSig_OI_q[11]),
    .O(\blk00000001/sig00000039 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000035  (
    .I0(NlwRenamedSig_OI_q[12]),
    .O(\blk00000001/sig00000038 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000034  (
    .I0(NlwRenamedSig_OI_q[13]),
    .O(\blk00000001/sig00000037 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000033  (
    .I0(NlwRenamedSig_OI_q[14]),
    .O(\blk00000001/sig00000036 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000032  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000016 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000031  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000017 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000018 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000019 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001a ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001b ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001c ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001d ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001e ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000029  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000001f ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000028  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000020 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000027  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000021 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000026  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000022 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000025  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000023 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000024  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000024 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000023  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000025 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[15])
  );
  MUXCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig00000015 ),
    .DI(\blk00000001/sig00000014 ),
    .S(\blk00000001/sig00000035 ),
    .O(\blk00000001/sig00000034 )
  );
  XORCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig00000015 ),
    .LI(\blk00000001/sig00000035 ),
    .O(\blk00000001/sig00000016 )
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig00000026 ),
    .LI(NlwRenamedSig_OI_q[15]),
    .O(\blk00000001/sig00000025 )
  );
  MUXCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig00000034 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig00000033 )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig00000034 ),
    .LI(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig00000017 )
  );
  MUXCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig00000033 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig00000032 )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig00000033 ),
    .LI(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig00000018 )
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig00000032 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000031 )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig00000032 ),
    .LI(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000019 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig00000031 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000040 ),
    .O(\blk00000001/sig00000030 )
  );
  XORCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig00000031 ),
    .LI(\blk00000001/sig00000040 ),
    .O(\blk00000001/sig0000001a )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000030 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig0000002f )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000030 ),
    .LI(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig0000001b )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig0000002f ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003e ),
    .O(\blk00000001/sig0000002e )
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig0000002f ),
    .LI(\blk00000001/sig0000003e ),
    .O(\blk00000001/sig0000001c )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000002e ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig0000002d )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000002e ),
    .LI(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig0000001d )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000002d ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003c ),
    .O(\blk00000001/sig0000002c )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000002d ),
    .LI(\blk00000001/sig0000003c ),
    .O(\blk00000001/sig0000001e )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000002c ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000002b )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000002c ),
    .LI(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000001f )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000002b ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig0000003a ),
    .O(\blk00000001/sig0000002a )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000002b ),
    .LI(\blk00000001/sig0000003a ),
    .O(\blk00000001/sig00000020 )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000002a ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig00000029 )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000002a ),
    .LI(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig00000021 )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig00000029 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000038 ),
    .O(\blk00000001/sig00000028 )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000029 ),
    .LI(\blk00000001/sig00000038 ),
    .O(\blk00000001/sig00000022 )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000028 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig00000027 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000028 ),
    .LI(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig00000023 )
  );
  MUXCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000027 ),
    .DI(\blk00000001/sig00000015 ),
    .S(\blk00000001/sig00000036 ),
    .O(\blk00000001/sig00000026 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000027 ),
    .LI(\blk00000001/sig00000036 ),
    .O(\blk00000001/sig00000024 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig00000015 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig00000014 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
