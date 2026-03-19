`timescale 1ns / 1ps
/******************************************************************************
*
*    File Name:  manchester_decoder.v
*      Version:  1.0
*         Date:  Nov 14, 2014
*        Model:  Manchester Decoder
*       Author:  Zhang jie(zhj@ihep.ac.cn)
*     Modifier:  Ning Zhe (ningzhe@ihep.ac.cn)
*      Company:  IHEP
*
******************************************************************************/
module manchester_decoder#(
    parameter oversampling_factor = 8,
    parameter threshold = 3
)(
  input       CLK2X   ,   // 80MHz
  input       CLK8X   ,   // 80MHz
  input       CLK     ,   // 40MHz
  input       RST     ,   // active high
  input       MDI     ,   // 1 bit input, synchronised on the CLK2X.
  output reg  LINKED  ,   // 1 bit output, active high, Acknowledged Connection.
  output reg  DOUT        // 1 bit output, synchronised on the CLK.
);

reg       MDI_1;
reg [3:0] mdi_r; //sync MDI to the FPGA clock using a 4-bits shift register
(* keep = "true" *)reg [((oversampling_factor/2) - 1):0] sync_data;
always @(posedge CLK2X) begin
  MDI_1 <= MDI;
  if(RST) begin 
      mdi_r <= 0;
  end else begin 
      mdi_r[3:0] <= {mdi_r[2:0], MDI_1};
  end
end

(* keep = "true" *)reg       MDI_2;
always @(posedge CLK8X) begin
  MDI_2 <= MDI;
  if(RST) begin 
      sync_data <= 0;
  end else begin 
      sync_data <= {sync_data[oversampling_factor/2 - 2:0], MDI_2};
  end
end

(* keep = "true" *)reg sync_shift;


(* keep = "true" *)wire sync_shift1;
(* keep = "true" *)wire [((oversampling_factor/2) - 1):0] sync_data1;

assign sync_shift1 = sync_shift;

assign sync_data1 = sync_data;

reg [3:0] data_shift;
reg [3:0] sample_cnt;  
(* keep = "true" *)reg [1:0] state_reg1, state_next1;

// State Machine
reg [1:0] state_reg, state_next;
localparam
  WAIT = 0,     // wait link active
  SEARCH = 1,   // search the symbolic boundary
  DATA1 = 2,    // receive data
  DATA2 = 3;    // skip

always @(posedge CLK8X) begin
    if (RST) begin
        sync_shift <= 1'b0;
        sample_cnt <= 0;
        data_shift <= 0;
    end else begin 
      sample_cnt <= sample_cnt + 1'b1;
      if(sync_data[0+:threshold] == {threshold{1'b1}} & sample_cnt >= threshold) begin
          sync_shift <= 1'b1;
          sample_cnt <= 0;
          data_shift <= {data_shift[2:0], 1'b1};
      end else if(sync_data[0+:threshold] == {threshold{1'b0}} & sample_cnt >= threshold - 1) begin
          sync_shift <= 1'b0;
          sample_cnt <= 0;
          data_shift <= {data_shift[2:0], 1'b0};
      end
    end
end


reg LINKED1;
always @(posedge CLK8X)
  if (RST) state_reg1 <= WAIT;
  else state_reg1 <= state_next1;
always @(*) begin
  state_next1 = WAIT;
  LINKED1 = 0;
  case(state_reg1)
    WAIT: begin
      if(data_shift[3:2]==2'b10 || data_shift[3:2]==2'b01) state_next1 = SEARCH; // detect "10" and "10"
      else state_next1 = WAIT;
/*       if(sync_sr == 8'hD6)
          state_next = DATA1;
      else
          state_next = WAIT; */
    end
    SEARCH: begin
      if(data_shift[3:2]==2'b00 || data_shift[3:2]==2'b11) state_next1 = DATA1; // detect "11" and "00"
      else state_next1 = SEARCH;
    end
    DATA1: begin
      if(data_shift[3:0]==4'b000 || data_shift[3:0]==4'b1111) state_next1 = WAIT; // if link failure
      else begin
        state_next1 = DATA1;
        LINKED1 = 1;
      end
    end
    DATA2: begin
      if(data_shift[3:0]==4'b000 || data_shift[3:0]==4'b1111) state_next1 = WAIT; // if link failure
      else begin
        state_next1 = DATA1;
        LINKED1 = 1;
      end
    end
  endcase
end

reg nrz1;

always @(posedge CLK8X) begin
  if(RST) nrz1 <= 0;
  else begin
    if(state_reg1 == DATA1) begin
      case(data_shift[3:2])
        2'b01: nrz1 <= 1'b1; // IEEE 802.3 (Ethernet) standards
        2'b10: nrz1 <= 1'b0;
        default: nrz1 <= nrz1;
      endcase
    end
  end
end

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
/*       if(sync_sr == 8'hD6)
          state_next = DATA1;
      else
          state_next = WAIT; */
    end
    SEARCH: begin
      if(mdi_r[3:2]==2'b00 || mdi_r[3:2]==2'b11) state_next = DATA1; // detect "11" and "00"
      else state_next = SEARCH;
    end
    DATA1: begin
      if(mdi_r[3:1]==3'b000 || mdi_r[3:1]==3'b111) state_next = WAIT; // if link failure
      else begin
        state_next = DATA1;
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
