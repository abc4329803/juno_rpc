/*******************************************************************************
*                                                                              *
* Module      : RBCP_REG                                                       *
* Version     : v 0.2.0 2010/03/31                                             *
*                                                                              *
* Description : Register file                                                  *
*                                                                              *
*                Copyright (c) 2010 Bee Beans Technologies Co.,Ltd.            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/
//`define FPGA_VER 32'h1005_1001
//`define FPGA_ID  32'h0209_0018

`define REG_INIT_X00 8'h00
`define REG_INIT_X01 8'h01
`define REG_INIT_X02 8'h02
`define REG_INIT_X03 8'h03
`define REG_INIT_X04 8'h04
`define REG_INIT_X05 8'h05
`define REG_INIT_X06 8'h06
`define REG_INIT_X07 8'h07
`define REG_INIT_X08 8'h08
`define REG_INIT_X09 8'h09
`define REG_INIT_X0A 8'h0A
`define REG_INIT_X0B 8'h0B
`define REG_INIT_X0C 8'h0C
`define REG_INIT_X0D 8'h0D
`define REG_INIT_X0E 8'h0E
`define REG_INIT_X0F 8'h0F

module RBCP_REG(
  // System
  CLK           , // in : System clock
  RST           , // in : System reset
  LED           , // out  : LED[6:0]
  DIP_SW        , // in : DIP_SW[3:0]
  i2c_clk       ,
  // RBCP I/F
  RBCP_ACT      , // in : Active
  RBCP_ADDR     , // in : Address[31:0]
  RBCP_WE       , // in : Write enable
  RBCP_WD       , // in : Write data[7:0]
  RBCP_RE       , // in : Read enable
  RBCP_RD       , // out  : Read data[7:0]
  RBCP_ACK,        // out  : Acknowledge
  //FPGA
  FPGADATA_REN,
  FPGADATA_EMPTY,
  FPGA_DATA,
  FPGADATA_VALID,
  RST_SELECT,
  TDC_RST_ON
);

//-------- Input/Output -------------
input           CLK;
input           RST;

output  [3:0]   LED;
input   [3:0]   DIP_SW;

input           RBCP_ACT;
input   [31:0]  RBCP_ADDR;
input           RBCP_WE;
input   [7:0]   RBCP_WD;
input           RBCP_RE;
output  [7:0]   RBCP_RD;
output          RBCP_ACK;

input   wire i2c_clk;
input   wire FPGADATA_REN;
output  wire FPGADATA_EMPTY;
output  wire [18:0] FPGA_DATA;
output  wire FPGADATA_VALID;
output  reg RST_SELECT;
output  reg  TDC_RST_ON;
//------------------------------------------------------------------------------
//  Control
//------------------------------------------------------------------------------
reg [31:0]  irAddr;
reg         irWe;
reg [7:0]   irWd;
reg         irRe;

always@ (posedge CLK or posedge RST) begin
  if(RST)begin
    irAddr[31:0] <= 0;
    irWe <= 0;
    irWd[7:0] <= 0;
    irRe <= 0;
  end
  else begin
    irAddr[31:0] <= RBCP_ADDR[31:0];
    irWe <= RBCP_WE;
    irWd[7:0] <= RBCP_WD[7:0];
    irRe <= RBCP_RE;
  end
end

reg         regCs;
reg [23:0]  regAddr;
reg [7:0]   regWd;
reg         regWe;
reg         regRe;

always@ (posedge CLK) begin
  regCs <= (irAddr[31:8]==24'd0);
  regAddr[23:0] <= (irWe | irRe? irAddr[23:0]: regAddr[23:0]);
  regWd[7:0] <= (irWe? irWd[7:0]: regWd[7:0]);
  regWe <= irWe;
  regRe <= irRe;
end

//------------------------------------------------------------------------------
//  Registers
//------------------------------------------------------------------------------
reg [17:0] regBe;

always@ (posedge CLK) begin
  regBe[0] <= regCs & regWe & (regAddr[4:0] == 5'h0);
  regBe[1] <= regCs & regWe & (regAddr[4:0] == 5'h1);
  regBe[2] <= regCs & regWe & (regAddr[4:0] == 5'h2);
  regBe[3] <= regCs & regWe & (regAddr[4:0] == 5'h3);
  regBe[4] <= regCs & regWe & (regAddr[4:0] == 5'h4);
  regBe[5] <= regCs & regWe & (regAddr[4:0] == 5'h5);
  regBe[6] <= regCs & regWe & (regAddr[4:0] == 5'h6);
  regBe[7] <= regCs & regWe & (regAddr[4:0] == 5'h7);
  regBe[8] <= regCs & regWe & (regAddr[4:0] == 5'h8);
  regBe[9] <= regCs & regWe & (regAddr[4:0] == 5'h9);
  regBe[10] <= regCs & regWe & (regAddr[4:0] == 5'hA);
  regBe[11] <= regCs & regWe & (regAddr[4:0] == 5'hB);
  regBe[12] <= regCs & regWe & (regAddr[4:0] == 5'hC);
  regBe[13] <= regCs & regWe & (regAddr[4:0] == 5'hD);
  regBe[14] <= regCs & regWe & (regAddr[4:0] == 5'hE);
  regBe[15] <= regCs & regWe & (regAddr[4:0] == 5'hF);
  regBe[16] <= regCs & regWe & (regAddr[4:0] == 5'h10);
  regBe[17] <= regCs & regWe & (regAddr[4:0] == 5'h11);
/*
  regBe[16] <= regCs & regWe & (regAddr[4:0] == 5'h10);
  regBe[17] <= regCs & regWe & (regAddr[4:0] == 5'h11);
  regBe[18] <= regCs & regWe & (regAddr[4:0] == 5'h12);
  regBe[19] <= regCs & regWe & (regAddr[4:0] == 5'h13);
  regBe[20] <= regCs & regWe & (regAddr[4:0] == 5'h14);
  regBe[21] <= regCs & regWe & (regAddr[4:0] == 5'h15);
  regBe[22] <= regCs & regWe & (regAddr[4:0] == 5'h16);
  regBe[23] <= regCs & regWe & (regAddr[4:0] == 5'h17);

  regBe[24] <= regCs & regWe & (regAddr[4:0] == 5'h18);
  regBe[25] <= regCs & regWe & (regAddr[4:0] == 5'h19);
  regBe[26] <= regCs & regWe & (regAddr[4:0] == 5'h1A);
  regBe[27] <= regCs & regWe & (regAddr[4:0] == 5'h1B);
  regBe[28] <= regCs & regWe & (regAddr[4:0] == 5'h1C);
  regBe[29] <= regCs & regWe & (regAddr[4:0] == 5'h1D);
  regBe[30] <= regCs & regWe & (regAddr[4:0] == 5'h1E);
  regBe[31] <= regCs & regWe & (regAddr[4:0] == 5'h1F);
*/
end

//--------------------------------------
//  Register file
//--------------------------------------
reg   [7:0] regX00Data;
reg   [7:0] regX01Data;
reg   [7:0] regX02Data;
reg   [7:0] regX03Data;
reg   [7:0] regX04Data;
reg   [7:0] regX05Data;
reg   [7:0] regX06Data;
reg   [7:0] regX07Data;
reg   [7:0] regX08Data;
reg   [7:0] regX09Data;
reg   [7:0] regX0AData;
reg   [7:0] regX0BData;
reg   [7:0] regX0CData;
reg   [7:0] regX0DData;
reg   [7:0] regX0EData;
reg   [7:0] regX0FData;
reg   [7:0] regX10Data;
reg   [7:0] regX11Data;

always@ (posedge CLK) begin
  if(RST)begin
    regX00Data[7:0] <= 0;
    regX01Data[7:0] <= 0;
    regX02Data[7:0] <= 0;
    regX03Data[7:0] <= 0;
    regX04Data[7:0] <= 0;
    regX05Data[7:0] <= 0;
    regX06Data[7:0] <= 0;
    regX07Data[7:0] <= 0;
    regX08Data[7:0] <= 0;
    regX09Data[7:0] <= 0;
    regX0AData[7:0] <= 0;
    regX0BData[7:0] <= 0;
    regX0CData[7:0] <= 0;
    regX0DData[7:0] <= 0;
    regX0EData[7:0] <= 0;
    regX0FData[7:0] <= 0;
    regX10Data[7:0] <= 0;
  end
  else
    begin
      if(regBe[0])begin
        regX00Data[7:0] <= regWd[7:0];
      end
      if(regBe[1])begin
        regX01Data[7:0] <= regWd[7:0];
      end
      if(regBe[2])begin
        regX02Data[7:0] <= regWd[7:0];
      end
      if(regBe[3])begin
        regX03Data[7:0] <= regWd[7:0];
      end
      if(regBe[4])begin
        regX04Data[7:0] <= regWd[7:0];
      end
      if(regBe[5])begin
        regX05Data[7:0] <= regWd[7:0];
      end
      if(regBe[6])begin
        regX06Data[7:0] <= regWd[7:0];
      end
      if(regBe[7])begin
        regX07Data[7:0] <= regWd[7:0];
      end
      if(regBe[8])begin
        regX08Data[7:0] <= regWd[7:0];
      end
      if(regBe[9])begin
        regX09Data[7:0] <= regWd[7:0];
      end
      if(regBe[10])begin
        regX0AData[7:0] <= regWd[7:0];
      end
      if(regBe[11])begin
        regX0BData[7:0] <= regWd[7:0];
      end
      if(regBe[12])begin
        regX0CData[7:0] <= regWd[7:0];
      end
      if(regBe[13])begin
        regX0DData[7:0] <= regWd[7:0];
      end
      if(regBe[14])begin
        regX0EData[7:0] <= regWd[7:0];
      end
      if(regBe[15])begin
        regX0FData[7:0] <= regWd[7:0];
      end
      if(regBe[16])begin
        regX10Data[7:0] <= regWd[7:0];
      end
      if(regBe[17])begin
        regX11Data[7:0] <= regWd[7:0];
      end
    end
  end

wire  [15:0] X00Data;
wire  [15:0] X01Data;
wire  [15:0] X02Data;
wire  [15:0] X03Data;
wire  [15:0] X04Data;
wire  [15:0] X05Data;
wire  [15:0] X06Data;
wire  [15:0] X07Data;
wire  [7:0] X08Data;
wire  [7:0] X09Data;

assign  X00Data[15:0] = {regX00Data[7:0] , regX01Data[7:0]};
assign  X01Data[15:0] = {regX02Data[7:0] , regX03Data[7:0]};
assign  X02Data[15:0] = {regX04Data[7:0] , regX05Data[7:0]};
assign  X03Data[15:0] = {regX06Data[7:0] , regX07Data[7:0]};
assign  X04Data[15:0] = {regX08Data[7:0] , regX09Data[7:0]};
assign  X05Data[15:0] = {regX0AData[7:0] , regX0BData[7:0]};
assign  X06Data[15:0] = {regX0CData[7:0] , regX0DData[7:0]};
assign  X07Data[15:0] = {regX0EData[7:0] , regX0FData[7:0]};
assign  X08Data[7:0] = regX10Data[7:0];
assign  X09Data[7:0] = regX11Data[7:0];


//--------------------------------------
//  Sig. assignment for outputs
//--------------------------------------


//--------------------------------------
//  Read data mux.
//--------------------------------------
reg [7:0] muxRegDataA;
reg       muxRegAck;

always@ (posedge CLK) begin
  case(regAddr[4:0])
    4'h0: muxRegDataA[7:0] <= regX00Data [7:0];
    4'h1: muxRegDataA[7:0] <= regX01Data [7:0];
    4'h2: muxRegDataA[7:0] <= regX02Data [7:0];
    4'h3: muxRegDataA[7:0] <= regX03Data [7:0];
    4'h4: muxRegDataA[7:0] <= regX04Data [7:0];
    4'h5: muxRegDataA[7:0] <= regX05Data [7:0];
    4'h6: muxRegDataA[7:0] <= regX06Data [7:0];
    4'h7: muxRegDataA[7:0] <= regX07Data [7:0];
    4'h8: muxRegDataA[7:0] <= regX08Data [7:0];
    4'h9: muxRegDataA[7:0] <= regX09Data [7:0];
    4'hA: muxRegDataA[7:0] <= regX0AData [7:0];
    4'hB: muxRegDataA[7:0] <= regX0BData [7:0];
    4'hC: muxRegDataA[7:0] <= regX0CData [7:0];
    4'hD: muxRegDataA[7:0] <= regX0DData [7:0];
    4'hE: muxRegDataA[7:0] <= regX0EData [7:0];
    4'hF: muxRegDataA[7:0] <= regX0FData [7:0];
  endcase
  muxRegAck   <= regCs & (regRe | regWe);
end


//------------------------------------------------------------------------------
//  Output
//------------------------------------------------------------------------------
reg       orAck;
reg [7:0] orRd;
always@ (posedge CLK) begin
  orAck   <= muxRegAck;
  orRd[7:0] <=  (muxRegAck    ? muxRegDataA[7:0]  : 8'd0);
end

wire        RBCP_ACK;
wire [7:0]  RBCP_RD;

assign RBCP_ACK     = orAck;
assign RBCP_RD[7:0] = orRd[7:0];

reg [17:0]regBe_delay;
reg [18:0]fifo_in;
reg fifo_wen;

always@ (posedge CLK) begin
  regBe_delay <= regBe;
  if(!regBe_delay[1] & !regBe_delay[3] & !regBe_delay[5] & !regBe_delay[7] & !regBe_delay[9] & !regBe_delay[11] & !regBe_delay[13] & !regBe_delay[15])
    begin
      fifo_wen<=0;
    end
  if(regBe_delay[1])
    begin
      fifo_in <= {3'b000,X00Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[3])
    begin
      fifo_in <= {3'b001,X01Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[5])
    begin
      fifo_in <= {3'b010,X02Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[7])
    begin
      fifo_in <= {3'b011,X03Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[9])
    begin
      fifo_in <= {3'b100,X04Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[11])
    begin
      fifo_in <= {3'b101,X05Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[13])
    begin
      fifo_in <= {3'b110,X06Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[15])
    begin
      fifo_in <= {3'b111,X07Data[15:0]};
      fifo_wen<=1;
    end
  if(regBe_delay[17])
    begin
      RST_SELECT <=X09Data[0];
    end
end

reg [2:0]cnt;

always @(posedge CLK) begin
    if(cnt==4)
    begin
      TDC_RST_ON<=0;
      cnt<=0;
    end
    else if(TDC_RST_ON)
      cnt<=cnt+1;
    else if(regBe_delay[16])
    begin
      TDC_RST_ON <= X08Data[0];
    end
  end

//fifo_generator_3 fifo_generator_3(
//  .wr_clk(CLK),
//  .rd_clk(i2c_clk),
//  .din(fifo_in),
//  .wr_en(fifo_wen),
//  .rd_en(FPGADATA_REN),
//  .dout(FPGA_DATA),
//  .empty(FPGADATA_EMPTY),
//  .valid(FPGADATA_VALID)
//);



/* ila_1 ila1(
  .clk(CLK),
  .probe0(TDC_RST_ON),
  .probe1(regBe_delay[16]),
  .probe2(X08Data[0]),
  .probe3(RST_SELECT),
  .probe4(regBe_delay[17]),
  .probe5(X09Data[0]),
  .probe6(regWe),
  .probe7(regCs),
  .probe8(cnt)
); */
endmodule

