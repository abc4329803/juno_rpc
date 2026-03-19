/*******************************************************************************
*                                                                              *
* Module      : TIMER                                                          *
* Version     : v 0.2.0 2010/03/31                                             *
*               v 3.0  2010/04/21 Change polarity of system reset              *
*                                                                              *
* Description : TIMER                                                          *
*                                                                              *
*                Copyright (c) 2010 Bee Beans Technologies Co.,Ltd.            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/
module REGISTER_RECEIVE #(
  parameter CLK_FREQ = 125
)(
    input  wire          CLK,
    input  wire          CLK2X,
    input  wire          CLK8X,
    input  wire          RESET,
    input  wire          DATA_IN,
    output reg  [15:0]   SOFT_TRIGGER_RATE,
    output reg           SOFT_TRIGGER_ENABLE,
    input wire           CONFIG_VALID
);

    (* keep = "true" *)wire [7:0]    DATA_OUT;
    (* keep = "true" *)wire          DATA_OUT_VALID;

    (* keep = "true" *)wire [7:0]    CONFIG_ADDR;
    //assign CONFIG_ADDR = DATA_OUT[7:0];
always @(posedge CLK) begin
    if(RESET) begin
        //CONFIG_ADDR <= 0;
        SOFT_TRIGGER_RATE <= 'd100;
        SOFT_TRIGGER_ENABLE <= 0;
    end else if(DATA_OUT_VALID) begin
        //CONFIG_VALID <= DATA_OUT_VALID;
        if(CONFIG_ADDR == 1) begin
            SOFT_TRIGGER_RATE <= DATA_OUT;
        end else if(CONFIG_ADDR == 2) begin
            SOFT_TRIGGER_ENABLE <= DATA_OUT[0];
        end     
    end
end
    TDC_data_receive_sp6 #(
		  .DATA_WIDTH(32)
	 )TDC_data_receive(
        .CLK(CLK),
        .CLK2X(CLK2X),
        .CLK8X(CLK8X),
        .RESET(RESET),
		  .TRG(CONFIG_VALID),
        .DATA_IN(DATA_IN),
        .DATA_ADDR(CONFIG_ADDR),
        .DATA_OUT(DATA_OUT),
        .DATA_OUT_VALID(DATA_OUT_VALID)
    );



endmodule
