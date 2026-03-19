`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: load zynq7020 bit
// Engineer:  
//////////////////////////////////////////////////////////////////////////////////
/*
module top(
    output led
);
    assign led = 1'b1;
endmodule
*/

module jtag_pl
#(
    parameter   BIT_SIZE    =   32'd100    //bit文件大小
)
(
    input clk_in, //Y9
    //input ila_clk,
    input rst,  //T18

    input key_begin,
    input flash_tdo,
    output  reg flash_rd_en,

    output reg led, //T22
    output reg led1,//T21
    output reg led2,//U22
    output tck_out, //AA9
    output tms_out, //Y10
    output tdi_out, //Y11
    input  tdo_in  //AA11   
);
    wire tck;

    reg[7:0]    count2;
    reg[7:0]    count5;
    reg[15:0]   count2000;
    reg[32:0]   count10000;
    reg[7:0]    state;
    reg         tms;
    reg         tdi;

    // ZYNQ
    // reg[8:0]    jprogram;
    // reg[8:0]    cfg_in;
    // reg[8:0]    jstart;
    // Spartan-6， Kintex-7
    reg[5:0]    jprogram;
    reg[5:0]    cfg_in;
    reg[5:0]    jstart;

    reg[31:0]       countbit;


    assign tck_out = tck;
    assign tms_out = tms;
    assign tdi_out = tdi;

    parameter   IDLE = 0,
                WAIT = 1,
                Test_Logic_Reset = 2,
                RUN_TEST_IDLE = 3,
                SELECT_IR = 4,
                SELECT_IR_CFG_IN = 5,
                LOADING_CFG_IN = 6,
                EXIT_IR_CFG_IN = 7,
                SELECT_DR = 8,
                SHIFT_DR = 9,
                LOADING_BITSTREAM = 10,
                EXIT_DR = 11,
                UPDATE_DR = 12,
                LOADING_JSTART = 13,
                UPDATE_IR = 14,
                SELECT_IR_JSTART = 15,
                EXIT_IR_JSTART = 16,
                RUN_TEST_IDLE_JSTART = 17,
                RUN_TEST_IDLE_END = 18,
                Test_Logic_Reset_END = 19;
                



    //state leds
    always@(posedge clk_in,posedge rst)begin
        if(rst) led <=0;
        else if(state == 25) led <=1;
    end
    always@(posedge clk_in,posedge rst)begin
        if(rst) led1 <=0;
        else if(state == 8) led1 <=1;
    end
    always@(posedge clk_in,posedge rst)begin
        if(rst) led2<=0;
        else if(state == 22) led2 <=1;
    end

    assign tck = clk_in;  // make sure that TCK = FLASH_SCK
    wire [31:0]  bit_size1 = BIT_SIZE;
    
    always@(negedge tck,posedge rst)begin
        if(rst) begin
            state       <='d0;
            count2      <='d0;
            count5      <='d0;
            count2000   <='d0;
            count10000  <='d0;
            tms         <= 1'b1;
            tdi         <= 1'b0;

            jprogram    <=6'b001011;
            cfg_in      <=6'b000101;
            jstart      <=6'b001100;          
            countbit    <='d0;
            flash_rd_en <= 0;
        end
        else begin
            //flash_rd_en <= 0;
            case(state) 
                IDLE: begin            // 等待按键触发
                    if (key_begin) begin
                        state <= WAIT;
                        flash_rd_en <= 1;
                    end else begin
                        state <= IDLE;
                        flash_rd_en <= 0;
                        count2      <='d0;
                        count5      <='d0;
                        count2000   <='d0;
                        count10000  <='d0;
                        tms         <= 1'b1;
                        tdi         <= 1'b0;

                        jprogram    <=6'b001011;
                        cfg_in      <=6'b000101;
                        jstart      <=6'b001100;          
                        countbit    <='d0;
                    end
                end
                WAIT: begin            // go to Test-Logic-Reset
                    tms <= 1'b1;
                    tdi <= 1'b0;
                    flash_rd_en <= 0;
                    //if(count5 == 8'd5) begin
                    if(count5 == 8'd26) begin    
                        count5 <='d0;
                        state <= Test_Logic_Reset;
                    end
                    else begin 
                        count5 <=count5 +1;
                    end
                end
                Test_Logic_Reset:begin             // go to RUN-TEST
                    tms <=1'b0;
                    tdi <=1'b0;
                    state <= RUN_TEST_IDLE;
                end
                RUN_TEST_IDLE:begin             // go to SELECT-IR
                    tms <=1'b1;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= SELECT_IR_CFG_IN;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end
                SELECT_IR_CFG_IN:begin                 // go to SHIFT-IR
                    tms <=1'b0;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        //state <= state+1;
                        state <= LOADING_CFG_IN;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end
                /*
                5: begin                // loading the jprogram
                    tms <= 1'b0;
                    tdi <= jprogram[0];
                    if(count5 == 8'd5) begin
                        count5 <='d0;
                        state <= state+1;
                    end
                    else begin 
                        count5 <=count5 +1;
                        jprogram<={jprogram[0],jprogram[5:1]};
                    end
                end
                6:begin                 //loading the jprogram 最高位
                    tms <=1'b1;
                    tdi <=1'b0;
                    state <= state+1;
                end
                7: begin            //  回到 Test- Logic-Reset
                    tms <= 1'b1;
                    tdi <= 1'b0;
                    if(count5 == 8'd5) begin
                        count5 <='d0;
                        state <= state+1;
                    end
                    else begin 
                        count5 <=count5 +1;
                    end
                end
                8: begin            // 循环 RUN-TEST （最低10ms）
                    tms <= 1'b0;
                    tdi <= 1'b0;
                    //if(count10000 >16'd10) begin   //仿真
                    if(count10000 >32'd1000000) begin   //板子
                        count10000 <='d0;
                        state <= state+1;
                        flash_rd_en <= 0;
                    end
                    else if(count10000 == 32'd999976) begin
                        flash_rd_en <= 1;
                        count10000 <=count10000 +1;
                    end else begin 
                        flash_rd_en <= 0;
                        count10000 <=count10000 +1;
                    end
                end
                
                9:begin             // 进入SELECT-IR
                    tms <=1'b1;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= state+1;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end*/
                LOADING_CFG_IN: begin           //loading the CFG_IN
                    tms <= 1'b0;
                    tdi <= cfg_in[0];
                    if(count5 == 8'd5) begin
                        count5 <='d0;
                        tms <= 1'b1;
                        state <= EXIT_IR_CFG_IN;
                    end
                    else begin 
                        count5 <=count5 +1;
                        cfg_in<={cfg_in[0],cfg_in[5:1]};
                    end
                end
                EXIT_IR_CFG_IN: begin            // go to SELECT-DR
                    tms <=1'b1;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= SELECT_DR;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end
                SELECT_DR:begin        // go to SHIFT-DR 
                    tms <=1'b0;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= SHIFT_DR;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end

                SHIFT_DR: begin        // load bit 
                    tms <= 1'b0;
                    tdi <= flash_tdo;
                    //if(countbit>1011391*32-3) begin
                    if(countbit > BIT_SIZE) begin
                        countbit <='d0;
                        tms <= 1'b1;
                        state <= EXIT_DR;    
                    end
                    else
                        countbit <=countbit +1;
                
                end
                EXIT_DR: begin 
                    tms <=1'b1;
                    tdi <=1'b0;
                    state <= UPDATE_DR;
                end

                UPDATE_DR: begin        
                    tms <=1'b0;
                    tdi <=1'b0;
                    state <= RUN_TEST_IDLE_JSTART;
                end
               
                RUN_TEST_IDLE_JSTART: begin            // go to SELECT-IR 
                    tms <=1'b1;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= SELECT_IR_JSTART;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end
                SELECT_IR_JSTART: begin                // 进入SHIFT-IR
                    tms <=1'b0;
                    tdi <=1'b0;
                    if(count2 == 8'd1) begin
                        count2 <= 'd0;
                        state <= LOADING_JSTART;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end
                LOADING_JSTART: begin           // loading the JSTART
                    tms <= 1'b0;
                    tdi <= jstart[0];
                    if(count5 == 8'd5) begin
                        count5 <='d0;
                        tms <= 1'b1;
                        state <= EXIT_IR_JSTART;
                    end
                    else begin 
                        count5 <=count5 +1;
                        jstart<={jstart[0],jstart[5:1]};
                    end
                end
                EXIT_IR_JSTART: begin            // Load the last bit of the JSTART
                    tms <=1'b1;
                    tdi <=1'b0;
                    state <= UPDATE_IR;
                end
                UPDATE_IR: begin            // 进入UPDATE-IR
                    tms <=1'b0;
                    tdi <=1'b0;
                    state <= RUN_TEST_IDLE_END;
                end
                RUN_TEST_IDLE_END: begin            //循环 RUN-TEST 使bit加载
                    tms <=1'b0;
                    tdi <=1'b0;
                    if(count2000 == 16'd10000) begin
                        count2000 <= 'd0;
                        state <= Test_Logic_Reset_END;
                    end 
                    else begin 
                        count2000 <=count2000 +1;
                    end
                end
                Test_Logic_Reset_END: begin            // 回到Test-Logic-Reset
                    tms <=1'b1;
                    tdi <=1'b0;
                    //state <= 0;
                    if(count2 == 8'd2) begin
                        count2 <= 'd0;
                        state <= IDLE;
                    end 
                    else begin 
                        count2 <=count2 +1;
                    end
                end         
            endcase
        end
    end

    // flash_rd_en
    // always@(negedge tck,posedge rst)begin
    //     if (rst) begin
    //         flash_rd_en <= 1'b0;
    //     end 
    //     else if (state == 15)
    //         flash_rd_en <= 1'b1;
    //     else    
    //         flash_rd_en <= 1'b0;
    // end

/*     ila_2 JTAG_ILA (
	.clk(ila_clk), // input wire clk
	.probe0({flash_rd_en, state, tms, tdi, tdo,key_begin, cfg_in, count5, jstart}) // input wire [255:0] probe0
); */



endmodule

