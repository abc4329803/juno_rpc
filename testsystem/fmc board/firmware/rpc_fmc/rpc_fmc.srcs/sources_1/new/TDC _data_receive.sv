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


module TDC_data_receive#(
  parameter  DATA_WIDTH = 88
)(
    input  wire          CLK,
    input  wire          CLK2X,
    input  wire          CLK8X,
    input  wire          RESET,
    input  wire [3:0]    SW,
    input  wire          DATA_IN,
    output reg  [127:0]  DATA_OUT,
    output reg           DATA_OUT_VALID
    );

////////////////////////////////////////////////////////////////////////////////
// TDC data
wire [DATA_WIDTH - 1:0]   TDC_decode_data;
reg           TDC_decode_data_valid;
wire DATA_SERIAL;
//(* keep = "true" *)wire [63:0] TDC_decode_data;
reg [6:0] count;
reg count_en;
always @(posedge CLK) begin
  if(count_en) count <= count + 1'b1;
  else count <= 0;
end
// State Machine
reg [0:0] state_reg, state_next;
localparam
  IDLE = 0,
  DATA = 1;

reg TDC_decode_data_valid_r;
reg TDC_decode_data_valid_rr;
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
      TDC_decode_data_valid_r = 0;
      if(DATA_SERIAL) state_next = DATA;
      else state_next = IDLE;
    end
    DATA: begin
      count_en = 1'b1;
      if(count == (DATA_WIDTH)) begin 
          state_next = IDLE;
          TDC_decode_data_valid_r = 1;
      end else begin 
          state_next = DATA;
          TDC_decode_data_valid_r = 0;
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

reg [15:0] serial_counter;

reg  alarm;

always @(posedge CLK8X) begin
    if(RESET) begin 
        serial_counter <= 0;
    end else if(DATA_SERIAL) begin
        serial_counter <= 0;
    end else begin 
        if(serial_counter <= 16'd1000 ) begin
            serial_counter <= serial_counter + 1;
        end 
    end

    if(RESET) alarm <= 0;
    else if(serial_counter == 16'd1000) alarm <= 1;
    else if(serial_counter == 0) alarm <= 0;

end

/* deman tdc_data_dec(
    .clk_in(CLK),
    .datain(DATA_IN), 
    .tmp(), 
    .flag1(), 
    .flag2(),
    .dataout(DATA_SERIAL), 
    .fail()
); */

/*   assign DATA_OUT[127:112] = {8'h5A, 4'h0, SW};
  assign DATA_OUT[111:88] = 0;
  assign DATA_OUT[87:0] = TDC_decode_data[DATA_WIDTH - 1: 8];
  assign DATA_OUT_VALID = TDC_decode_data_valid & (TDC_decode_data[7:0] == 8'hD7) & (TDC_decode_data[71:64] == 8'hFC); */

  always @(posedge CLK) begin
      TDC_decode_data_valid_rr <= TDC_decode_data_valid;
      if(RESET) begin
          DATA_OUT <= 0;
          DATA_OUT_VALID <= 0;
      end else if( TDC_decode_data_valid & ~TDC_decode_data_valid_rr) begin
          DATA_OUT[127:112] <= {8'h5A, 4'h0, SW};
          DATA_OUT[111:(DATA_WIDTH - 8)] <= 0;
          DATA_OUT[0+:(DATA_WIDTH - 8)] <= TDC_decode_data[DATA_WIDTH - 1: 8];
          DATA_OUT_VALID <= (TDC_decode_data[7:0] == 8'hD7) & (TDC_decode_data[71:64] == 8'hFC);
      end else begin
          DATA_OUT_VALID <= 0;
      end
  end

endmodule
