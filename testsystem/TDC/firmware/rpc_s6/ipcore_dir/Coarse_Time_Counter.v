////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: Coarse_Time_Counter.v
// /___/   /\     Timestamp: Wed May 21 14:43:23 2025
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/Coarse_Time_Counter.ngc C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/Coarse_Time_Counter.v 
// Device	: 6slx16ftg256-2
// Input file	: C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/Coarse_Time_Counter.ngc
// Output file	: C:/Users/Public/rpc_s6/ipcore_dir/tmp/_cg/Coarse_Time_Counter.v
// # of Modules	: 1
// Design Name	: Coarse_Time_Counter
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

module Coarse_Time_Counter (
  clk, sclr, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input sclr;
  output [44 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \blk00000001/sig00000055 ;
  wire \blk00000001/sig00000054 ;
  wire \blk00000001/sig00000053 ;
  wire \blk00000001/sig00000052 ;
  wire \blk00000001/sig00000051 ;
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
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
  wire [44 : 0] NlwRenamedSig_OI_q;
  assign
    q[44] = NlwRenamedSig_OI_q[44],
    q[43] = NlwRenamedSig_OI_q[43],
    q[42] = NlwRenamedSig_OI_q[42],
    q[41] = NlwRenamedSig_OI_q[41],
    q[40] = NlwRenamedSig_OI_q[40],
    q[39] = NlwRenamedSig_OI_q[39],
    q[38] = NlwRenamedSig_OI_q[38],
    q[37] = NlwRenamedSig_OI_q[37],
    q[36] = NlwRenamedSig_OI_q[36],
    q[35] = NlwRenamedSig_OI_q[35],
    q[34] = NlwRenamedSig_OI_q[34],
    q[33] = NlwRenamedSig_OI_q[33],
    q[32] = NlwRenamedSig_OI_q[32],
    q[31] = NlwRenamedSig_OI_q[31],
    q[30] = NlwRenamedSig_OI_q[30],
    q[29] = NlwRenamedSig_OI_q[29],
    q[28] = NlwRenamedSig_OI_q[28],
    q[27] = NlwRenamedSig_OI_q[27],
    q[26] = NlwRenamedSig_OI_q[26],
    q[25] = NlwRenamedSig_OI_q[25],
    q[24] = NlwRenamedSig_OI_q[24],
    q[23] = NlwRenamedSig_OI_q[23],
    q[22] = NlwRenamedSig_OI_q[22],
    q[21] = NlwRenamedSig_OI_q[21],
    q[20] = NlwRenamedSig_OI_q[20],
    q[19] = NlwRenamedSig_OI_q[19],
    q[18] = NlwRenamedSig_OI_q[18],
    q[17] = NlwRenamedSig_OI_q[17],
    q[16] = NlwRenamedSig_OI_q[16],
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
  INV   \blk00000001/blk000000b5  (
    .I(NlwRenamedSig_OI_q[0]),
    .O(\blk00000001/sig0000008b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b4  (
    .I0(NlwRenamedSig_OI_q[1]),
    .O(\blk00000001/sig000000b6 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b3  (
    .I0(NlwRenamedSig_OI_q[2]),
    .O(\blk00000001/sig000000b5 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b2  (
    .I0(NlwRenamedSig_OI_q[3]),
    .O(\blk00000001/sig000000b4 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b1  (
    .I0(NlwRenamedSig_OI_q[4]),
    .O(\blk00000001/sig000000b3 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b0  (
    .I0(NlwRenamedSig_OI_q[5]),
    .O(\blk00000001/sig000000b2 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000af  (
    .I0(NlwRenamedSig_OI_q[6]),
    .O(\blk00000001/sig000000b1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ae  (
    .I0(NlwRenamedSig_OI_q[7]),
    .O(\blk00000001/sig000000b0 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ad  (
    .I0(NlwRenamedSig_OI_q[8]),
    .O(\blk00000001/sig000000af )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ac  (
    .I0(NlwRenamedSig_OI_q[9]),
    .O(\blk00000001/sig000000ae )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ab  (
    .I0(NlwRenamedSig_OI_q[10]),
    .O(\blk00000001/sig000000ad )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000aa  (
    .I0(NlwRenamedSig_OI_q[11]),
    .O(\blk00000001/sig000000ac )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a9  (
    .I0(NlwRenamedSig_OI_q[12]),
    .O(\blk00000001/sig000000ab )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a8  (
    .I0(NlwRenamedSig_OI_q[13]),
    .O(\blk00000001/sig000000aa )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a7  (
    .I0(NlwRenamedSig_OI_q[14]),
    .O(\blk00000001/sig000000a9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a6  (
    .I0(NlwRenamedSig_OI_q[15]),
    .O(\blk00000001/sig000000a8 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a5  (
    .I0(NlwRenamedSig_OI_q[16]),
    .O(\blk00000001/sig000000a7 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a4  (
    .I0(NlwRenamedSig_OI_q[17]),
    .O(\blk00000001/sig000000a6 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a3  (
    .I0(NlwRenamedSig_OI_q[18]),
    .O(\blk00000001/sig000000a5 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a2  (
    .I0(NlwRenamedSig_OI_q[19]),
    .O(\blk00000001/sig000000a4 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a1  (
    .I0(NlwRenamedSig_OI_q[20]),
    .O(\blk00000001/sig000000a3 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a0  (
    .I0(NlwRenamedSig_OI_q[21]),
    .O(\blk00000001/sig000000a2 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009f  (
    .I0(NlwRenamedSig_OI_q[22]),
    .O(\blk00000001/sig000000a1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009e  (
    .I0(NlwRenamedSig_OI_q[23]),
    .O(\blk00000001/sig000000a0 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009d  (
    .I0(NlwRenamedSig_OI_q[24]),
    .O(\blk00000001/sig0000009f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009c  (
    .I0(NlwRenamedSig_OI_q[25]),
    .O(\blk00000001/sig0000009e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009b  (
    .I0(NlwRenamedSig_OI_q[26]),
    .O(\blk00000001/sig0000009d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009a  (
    .I0(NlwRenamedSig_OI_q[27]),
    .O(\blk00000001/sig0000009c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000099  (
    .I0(NlwRenamedSig_OI_q[28]),
    .O(\blk00000001/sig0000009b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000098  (
    .I0(NlwRenamedSig_OI_q[29]),
    .O(\blk00000001/sig0000009a )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000097  (
    .I0(NlwRenamedSig_OI_q[30]),
    .O(\blk00000001/sig00000099 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000096  (
    .I0(NlwRenamedSig_OI_q[31]),
    .O(\blk00000001/sig00000098 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000095  (
    .I0(NlwRenamedSig_OI_q[32]),
    .O(\blk00000001/sig00000097 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000094  (
    .I0(NlwRenamedSig_OI_q[33]),
    .O(\blk00000001/sig00000096 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000093  (
    .I0(NlwRenamedSig_OI_q[34]),
    .O(\blk00000001/sig00000095 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000092  (
    .I0(NlwRenamedSig_OI_q[35]),
    .O(\blk00000001/sig00000094 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000091  (
    .I0(NlwRenamedSig_OI_q[36]),
    .O(\blk00000001/sig00000093 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000090  (
    .I0(NlwRenamedSig_OI_q[37]),
    .O(\blk00000001/sig00000092 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008f  (
    .I0(NlwRenamedSig_OI_q[38]),
    .O(\blk00000001/sig00000091 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008e  (
    .I0(NlwRenamedSig_OI_q[39]),
    .O(\blk00000001/sig00000090 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008d  (
    .I0(NlwRenamedSig_OI_q[40]),
    .O(\blk00000001/sig0000008f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008c  (
    .I0(NlwRenamedSig_OI_q[41]),
    .O(\blk00000001/sig0000008e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008b  (
    .I0(NlwRenamedSig_OI_q[42]),
    .O(\blk00000001/sig0000008d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000008a  (
    .I0(NlwRenamedSig_OI_q[43]),
    .O(\blk00000001/sig0000008c )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000089  (
    .C(clk),
    .D(\blk00000001/sig00000032 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000088  (
    .C(clk),
    .D(\blk00000001/sig00000033 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000087  (
    .C(clk),
    .D(\blk00000001/sig00000034 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000086  (
    .C(clk),
    .D(\blk00000001/sig00000035 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000085  (
    .C(clk),
    .D(\blk00000001/sig00000036 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000084  (
    .C(clk),
    .D(\blk00000001/sig00000037 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000083  (
    .C(clk),
    .D(\blk00000001/sig00000038 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000082  (
    .C(clk),
    .D(\blk00000001/sig00000039 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000081  (
    .C(clk),
    .D(\blk00000001/sig0000003a ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000080  (
    .C(clk),
    .D(\blk00000001/sig0000003b ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007f  (
    .C(clk),
    .D(\blk00000001/sig0000003c ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007e  (
    .C(clk),
    .D(\blk00000001/sig0000003d ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007d  (
    .C(clk),
    .D(\blk00000001/sig0000003e ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007c  (
    .C(clk),
    .D(\blk00000001/sig0000003f ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007b  (
    .C(clk),
    .D(\blk00000001/sig00000040 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007a  (
    .C(clk),
    .D(\blk00000001/sig00000041 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000079  (
    .C(clk),
    .D(\blk00000001/sig00000042 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000078  (
    .C(clk),
    .D(\blk00000001/sig00000043 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000077  (
    .C(clk),
    .D(\blk00000001/sig00000044 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000076  (
    .C(clk),
    .D(\blk00000001/sig00000045 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000075  (
    .C(clk),
    .D(\blk00000001/sig00000046 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000074  (
    .C(clk),
    .D(\blk00000001/sig00000047 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000073  (
    .C(clk),
    .D(\blk00000001/sig00000048 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000072  (
    .C(clk),
    .D(\blk00000001/sig00000049 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000071  (
    .C(clk),
    .D(\blk00000001/sig0000004a ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000070  (
    .C(clk),
    .D(\blk00000001/sig0000004b ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006f  (
    .C(clk),
    .D(\blk00000001/sig0000004c ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006e  (
    .C(clk),
    .D(\blk00000001/sig0000004d ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006d  (
    .C(clk),
    .D(\blk00000001/sig0000004e ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[28])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006c  (
    .C(clk),
    .D(\blk00000001/sig0000004f ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[29])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006b  (
    .C(clk),
    .D(\blk00000001/sig00000050 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[30])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006a  (
    .C(clk),
    .D(\blk00000001/sig00000051 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[31])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000069  (
    .C(clk),
    .D(\blk00000001/sig00000052 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[32])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000068  (
    .C(clk),
    .D(\blk00000001/sig00000053 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[33])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000067  (
    .C(clk),
    .D(\blk00000001/sig00000054 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[34])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000066  (
    .C(clk),
    .D(\blk00000001/sig00000055 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[35])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000065  (
    .C(clk),
    .D(\blk00000001/sig00000056 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[36])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000064  (
    .C(clk),
    .D(\blk00000001/sig00000057 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[37])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000063  (
    .C(clk),
    .D(\blk00000001/sig00000058 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[38])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000062  (
    .C(clk),
    .D(\blk00000001/sig00000059 ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[39])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000061  (
    .C(clk),
    .D(\blk00000001/sig0000005a ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[40])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000060  (
    .C(clk),
    .D(\blk00000001/sig0000005b ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[41])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005f  (
    .C(clk),
    .D(\blk00000001/sig0000005c ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[42])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005e  (
    .C(clk),
    .D(\blk00000001/sig0000005d ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[43])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005d  (
    .C(clk),
    .D(\blk00000001/sig0000005e ),
    .R(sclr),
    .Q(NlwRenamedSig_OI_q[44])
  );
  MUXCY   \blk00000001/blk0000005c  (
    .CI(\blk00000001/sig00000031 ),
    .DI(\blk00000001/sig00000030 ),
    .S(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig0000008a )
  );
  XORCY   \blk00000001/blk0000005b  (
    .CI(\blk00000001/sig00000031 ),
    .LI(\blk00000001/sig0000008b ),
    .O(\blk00000001/sig00000032 )
  );
  XORCY   \blk00000001/blk0000005a  (
    .CI(\blk00000001/sig0000005f ),
    .LI(NlwRenamedSig_OI_q[44]),
    .O(\blk00000001/sig0000005e )
  );
  MUXCY   \blk00000001/blk00000059  (
    .CI(\blk00000001/sig0000008a ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b6 ),
    .O(\blk00000001/sig00000089 )
  );
  XORCY   \blk00000001/blk00000058  (
    .CI(\blk00000001/sig0000008a ),
    .LI(\blk00000001/sig000000b6 ),
    .O(\blk00000001/sig00000033 )
  );
  MUXCY   \blk00000001/blk00000057  (
    .CI(\blk00000001/sig00000089 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b5 ),
    .O(\blk00000001/sig00000088 )
  );
  XORCY   \blk00000001/blk00000056  (
    .CI(\blk00000001/sig00000089 ),
    .LI(\blk00000001/sig000000b5 ),
    .O(\blk00000001/sig00000034 )
  );
  MUXCY   \blk00000001/blk00000055  (
    .CI(\blk00000001/sig00000088 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b4 ),
    .O(\blk00000001/sig00000087 )
  );
  XORCY   \blk00000001/blk00000054  (
    .CI(\blk00000001/sig00000088 ),
    .LI(\blk00000001/sig000000b4 ),
    .O(\blk00000001/sig00000035 )
  );
  MUXCY   \blk00000001/blk00000053  (
    .CI(\blk00000001/sig00000087 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b3 ),
    .O(\blk00000001/sig00000086 )
  );
  XORCY   \blk00000001/blk00000052  (
    .CI(\blk00000001/sig00000087 ),
    .LI(\blk00000001/sig000000b3 ),
    .O(\blk00000001/sig00000036 )
  );
  MUXCY   \blk00000001/blk00000051  (
    .CI(\blk00000001/sig00000086 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b2 ),
    .O(\blk00000001/sig00000085 )
  );
  XORCY   \blk00000001/blk00000050  (
    .CI(\blk00000001/sig00000086 ),
    .LI(\blk00000001/sig000000b2 ),
    .O(\blk00000001/sig00000037 )
  );
  MUXCY   \blk00000001/blk0000004f  (
    .CI(\blk00000001/sig00000085 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b1 ),
    .O(\blk00000001/sig00000084 )
  );
  XORCY   \blk00000001/blk0000004e  (
    .CI(\blk00000001/sig00000085 ),
    .LI(\blk00000001/sig000000b1 ),
    .O(\blk00000001/sig00000038 )
  );
  MUXCY   \blk00000001/blk0000004d  (
    .CI(\blk00000001/sig00000084 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000b0 ),
    .O(\blk00000001/sig00000083 )
  );
  XORCY   \blk00000001/blk0000004c  (
    .CI(\blk00000001/sig00000084 ),
    .LI(\blk00000001/sig000000b0 ),
    .O(\blk00000001/sig00000039 )
  );
  MUXCY   \blk00000001/blk0000004b  (
    .CI(\blk00000001/sig00000083 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000af ),
    .O(\blk00000001/sig00000082 )
  );
  XORCY   \blk00000001/blk0000004a  (
    .CI(\blk00000001/sig00000083 ),
    .LI(\blk00000001/sig000000af ),
    .O(\blk00000001/sig0000003a )
  );
  MUXCY   \blk00000001/blk00000049  (
    .CI(\blk00000001/sig00000082 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000ae ),
    .O(\blk00000001/sig00000081 )
  );
  XORCY   \blk00000001/blk00000048  (
    .CI(\blk00000001/sig00000082 ),
    .LI(\blk00000001/sig000000ae ),
    .O(\blk00000001/sig0000003b )
  );
  MUXCY   \blk00000001/blk00000047  (
    .CI(\blk00000001/sig00000081 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000ad ),
    .O(\blk00000001/sig00000080 )
  );
  XORCY   \blk00000001/blk00000046  (
    .CI(\blk00000001/sig00000081 ),
    .LI(\blk00000001/sig000000ad ),
    .O(\blk00000001/sig0000003c )
  );
  MUXCY   \blk00000001/blk00000045  (
    .CI(\blk00000001/sig00000080 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000ac ),
    .O(\blk00000001/sig0000007f )
  );
  XORCY   \blk00000001/blk00000044  (
    .CI(\blk00000001/sig00000080 ),
    .LI(\blk00000001/sig000000ac ),
    .O(\blk00000001/sig0000003d )
  );
  MUXCY   \blk00000001/blk00000043  (
    .CI(\blk00000001/sig0000007f ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000ab ),
    .O(\blk00000001/sig0000007e )
  );
  XORCY   \blk00000001/blk00000042  (
    .CI(\blk00000001/sig0000007f ),
    .LI(\blk00000001/sig000000ab ),
    .O(\blk00000001/sig0000003e )
  );
  MUXCY   \blk00000001/blk00000041  (
    .CI(\blk00000001/sig0000007e ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000aa ),
    .O(\blk00000001/sig0000007d )
  );
  XORCY   \blk00000001/blk00000040  (
    .CI(\blk00000001/sig0000007e ),
    .LI(\blk00000001/sig000000aa ),
    .O(\blk00000001/sig0000003f )
  );
  MUXCY   \blk00000001/blk0000003f  (
    .CI(\blk00000001/sig0000007d ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a9 ),
    .O(\blk00000001/sig0000007c )
  );
  XORCY   \blk00000001/blk0000003e  (
    .CI(\blk00000001/sig0000007d ),
    .LI(\blk00000001/sig000000a9 ),
    .O(\blk00000001/sig00000040 )
  );
  MUXCY   \blk00000001/blk0000003d  (
    .CI(\blk00000001/sig0000007c ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a8 ),
    .O(\blk00000001/sig0000007b )
  );
  XORCY   \blk00000001/blk0000003c  (
    .CI(\blk00000001/sig0000007c ),
    .LI(\blk00000001/sig000000a8 ),
    .O(\blk00000001/sig00000041 )
  );
  MUXCY   \blk00000001/blk0000003b  (
    .CI(\blk00000001/sig0000007b ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a7 ),
    .O(\blk00000001/sig0000007a )
  );
  XORCY   \blk00000001/blk0000003a  (
    .CI(\blk00000001/sig0000007b ),
    .LI(\blk00000001/sig000000a7 ),
    .O(\blk00000001/sig00000042 )
  );
  MUXCY   \blk00000001/blk00000039  (
    .CI(\blk00000001/sig0000007a ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig00000079 )
  );
  XORCY   \blk00000001/blk00000038  (
    .CI(\blk00000001/sig0000007a ),
    .LI(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig00000043 )
  );
  MUXCY   \blk00000001/blk00000037  (
    .CI(\blk00000001/sig00000079 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a5 ),
    .O(\blk00000001/sig00000078 )
  );
  XORCY   \blk00000001/blk00000036  (
    .CI(\blk00000001/sig00000079 ),
    .LI(\blk00000001/sig000000a5 ),
    .O(\blk00000001/sig00000044 )
  );
  MUXCY   \blk00000001/blk00000035  (
    .CI(\blk00000001/sig00000078 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig00000077 )
  );
  XORCY   \blk00000001/blk00000034  (
    .CI(\blk00000001/sig00000078 ),
    .LI(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig00000045 )
  );
  MUXCY   \blk00000001/blk00000033  (
    .CI(\blk00000001/sig00000077 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a3 ),
    .O(\blk00000001/sig00000076 )
  );
  XORCY   \blk00000001/blk00000032  (
    .CI(\blk00000001/sig00000077 ),
    .LI(\blk00000001/sig000000a3 ),
    .O(\blk00000001/sig00000046 )
  );
  MUXCY   \blk00000001/blk00000031  (
    .CI(\blk00000001/sig00000076 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig00000075 )
  );
  XORCY   \blk00000001/blk00000030  (
    .CI(\blk00000001/sig00000076 ),
    .LI(\blk00000001/sig000000a2 ),
    .O(\blk00000001/sig00000047 )
  );
  MUXCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig00000075 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a1 ),
    .O(\blk00000001/sig00000074 )
  );
  XORCY   \blk00000001/blk0000002e  (
    .CI(\blk00000001/sig00000075 ),
    .LI(\blk00000001/sig000000a1 ),
    .O(\blk00000001/sig00000048 )
  );
  MUXCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig00000074 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig00000073 )
  );
  XORCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig00000074 ),
    .LI(\blk00000001/sig000000a0 ),
    .O(\blk00000001/sig00000049 )
  );
  MUXCY   \blk00000001/blk0000002b  (
    .CI(\blk00000001/sig00000073 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009f ),
    .O(\blk00000001/sig00000072 )
  );
  XORCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig00000073 ),
    .LI(\blk00000001/sig0000009f ),
    .O(\blk00000001/sig0000004a )
  );
  MUXCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig00000072 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009e ),
    .O(\blk00000001/sig00000071 )
  );
  XORCY   \blk00000001/blk00000028  (
    .CI(\blk00000001/sig00000072 ),
    .LI(\blk00000001/sig0000009e ),
    .O(\blk00000001/sig0000004b )
  );
  MUXCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig00000071 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig00000070 )
  );
  XORCY   \blk00000001/blk00000026  (
    .CI(\blk00000001/sig00000071 ),
    .LI(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig0000004c )
  );
  MUXCY   \blk00000001/blk00000025  (
    .CI(\blk00000001/sig00000070 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009c ),
    .O(\blk00000001/sig0000006f )
  );
  XORCY   \blk00000001/blk00000024  (
    .CI(\blk00000001/sig00000070 ),
    .LI(\blk00000001/sig0000009c ),
    .O(\blk00000001/sig0000004d )
  );
  MUXCY   \blk00000001/blk00000023  (
    .CI(\blk00000001/sig0000006f ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig0000006e )
  );
  XORCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig0000006f ),
    .LI(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig0000004e )
  );
  MUXCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig0000006e ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000009a ),
    .O(\blk00000001/sig0000006d )
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig0000006e ),
    .LI(\blk00000001/sig0000009a ),
    .O(\blk00000001/sig0000004f )
  );
  MUXCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000006d ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig0000006c )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig0000006d ),
    .LI(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig00000050 )
  );
  MUXCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig0000006c ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000098 ),
    .O(\blk00000001/sig0000006b )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig0000006c ),
    .LI(\blk00000001/sig00000098 ),
    .O(\blk00000001/sig00000051 )
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig0000006b ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig0000006a )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig0000006b ),
    .LI(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig00000052 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig0000006a ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000096 ),
    .O(\blk00000001/sig00000069 )
  );
  XORCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig0000006a ),
    .LI(\blk00000001/sig00000096 ),
    .O(\blk00000001/sig00000053 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000069 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig00000068 )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000069 ),
    .LI(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig00000054 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig00000068 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000094 ),
    .O(\blk00000001/sig00000067 )
  );
  XORCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig00000068 ),
    .LI(\blk00000001/sig00000094 ),
    .O(\blk00000001/sig00000055 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000067 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig00000066 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig00000067 ),
    .LI(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig00000056 )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig00000066 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000092 ),
    .O(\blk00000001/sig00000065 )
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig00000066 ),
    .LI(\blk00000001/sig00000092 ),
    .O(\blk00000001/sig00000057 )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig00000065 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig00000064 )
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig00000065 ),
    .LI(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig00000058 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig00000064 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig00000090 ),
    .O(\blk00000001/sig00000063 )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig00000064 ),
    .LI(\blk00000001/sig00000090 ),
    .O(\blk00000001/sig00000059 )
  );
  MUXCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig00000063 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig00000062 )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig00000063 ),
    .LI(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig0000005a )
  );
  MUXCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig00000062 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000008e ),
    .O(\blk00000001/sig00000061 )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000062 ),
    .LI(\blk00000001/sig0000008e ),
    .O(\blk00000001/sig0000005b )
  );
  MUXCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000061 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000008d ),
    .O(\blk00000001/sig00000060 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000061 ),
    .LI(\blk00000001/sig0000008d ),
    .O(\blk00000001/sig0000005c )
  );
  MUXCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000060 ),
    .DI(\blk00000001/sig00000031 ),
    .S(\blk00000001/sig0000008c ),
    .O(\blk00000001/sig0000005f )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000060 ),
    .LI(\blk00000001/sig0000008c ),
    .O(\blk00000001/sig0000005d )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig00000031 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig00000030 )
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
