`timescale 1ns / 1ps
/******************************************************************************
*
*    File Name:  manchester_decoder.v
*      Version:  1.0
*         Date:  Nov 14, 2014
*        Model:  Manchester Decoder
*       Author:  Zhang jie(zhj@ihep.ac.cn)
*      Company:  IHEP
*
******************************************************************************/
module manchester_decoder(
  input       CLK2X   ,   // 80MHz
  input       CLK     ,   // 40MHz
  input       RST     ,   // active high
  input       MDI     ,   // 1 bit input, synchronised on the CLK2X.
  output reg  LINKED  ,   // 1 bit output, active high, Acknowledged Connection.
  output reg  DOUT        // 1 bit output, synchronised on the CLK.
);

reg [3:0] mdi_r; //sync MDI to the FPGA clock using a 4-bits shift register
always @(posedge CLK2X) begin
  if(RST) mdi_r <= 0;
  else mdi_r[3:0] <= {mdi_r[2:0], MDI};
end

// State Machine
reg [1:0] state_reg, state_next;
localparam
  WAIT = 0,     // wait link active
  SEARCH = 1,   // search the symbolic boundary
  DATA1 = 2,    // receive data
  DATA2 = 3;    // skip

always @(posedge CLK2X)
  if (RST) state_reg <= WAIT;
  else state_reg <= state_next;

always @(*) begin
  state_next = WAIT;
  LINKED = 0;
  case(state_reg)
    WAIT: begin
      if(mdi_r[3:2]==2'b10 || mdi_r[3:2]==2'b01) state_next = SEARCH; // detect "10" and "10"
      else state_next = WAIT;
    end
    SEARCH: begin
      if(mdi_r[3:2]==2'b00 || mdi_r[3:2]==2'b11) state_next = DATA1; // detect "11" and "00"
      else state_next = SEARCH;
    end
    DATA1: begin
      if(mdi_r[3:1]==3'b000 || mdi_r[3:1]==3'b111) state_next = WAIT; // if link failure
      else begin
        state_next = DATA2;
        LINKED = 1;
      end
    end
    DATA2: begin
      if(mdi_r[3:1]==3'b000 || mdi_r[3:1]==3'b111) state_next = WAIT; // if link failure
      else begin
        state_next = DATA1;
        LINKED = 1;
      end
    end
  endcase
end

reg nrz;
always @(posedge CLK2X) begin
  if(RST) nrz <= 0;
  else begin
    if(state_reg == DATA1) begin
      case(mdi_r[3:2])
        2'b01: nrz <= 1'b1; // IEEE 802.3 (Ethernet) standards
        2'b10: nrz <= 1'b0;
        default: nrz <= nrz;
      endcase
    end
  end
end

always @(posedge CLK) begin
  if(RST) DOUT <= 0;
  else DOUT <= nrz;
end

endmodule








