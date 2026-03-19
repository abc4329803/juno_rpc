`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Linest-5
// Create Date: 2022/04/15
// Design Name: 
// Module Name: UART_TX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: UART 发送模块，将接收到的并行数据转成串行数据并发送
// Dependencies: 
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
 
module UART_TX(
 
    input 			clk,					//系统时钟
    input 			rst_n,					//系统复位，低电平有效
    input 			valid,					//数据有效信号
    input [7:0] 	pi_data,				//输入的并行数据
 
    output 			tx,						//并转串的输出数据
    output 			tx_done, 				//并转串的输出数据发送完成标志信号
    output	reg		dir=1,					//控制max3485的dir使能信号
    output	reg 	ready,					//tx模块可以接收数据信号
    output	reg 	ena 					//使能信号
    );
 
    reg   [7:0] 	pi_data_reg;			//输入数据寄存
    reg 			work_en;				//开始提取数据有效信号
    reg   [17:0] 	baud_cnt;				//波特计数信号，每个数据需要的波特数
    reg   [3:0] 	bit_cnt;				//数据位计数信号
    reg 			bit_flag;				//数据提取标志信号
    reg 			tx_reg;					//发送数据寄存
    reg 			tx_done_reg;			//发送数据完成标志信号
 
    //参数定义
    parameter	CLK_FREQ 	 = 'd125000000;				
    parameter	BAUD_RATE 	 = 'd115200;
    parameter	BAUD_CNT_MAX = CLK_FREQ/BAUD_RATE;
 
	//检测输入数据的到来，并将数据寄存
    always @(posedge clk) begin
        if (rst_n == 'd0) begin
            pi_data_reg <= 'd0;
        end
        else if (valid == 'd1) begin
            pi_data_reg <= pi_data ;
        end
        else begin
            pi_data_reg <= pi_data_reg;
        end
    end
	//工作使能，在数据标志信号为高时拉高，在发送数据完成信号为高时拉低
   	always @(posedge clk) begin
   	    if (rst_n == 'd0) begin
   	        work_en <= 'd0;
   	    end
   	    else if (valid == 'd1) begin 
   	        work_en <= 'd1;
   	    end
   	    else if (tx_done == 'd1) begin
   	        work_en <= 'd0;
   	    end
   	end
	//根据不同的波特率，对每个数据需要波特数进行计数
    always @(posedge clk) begin
        if(rst_n == 'd0)begin
            baud_cnt <= 'd0;
        end
        else if(work_en == 'd1 && (baud_cnt == BAUD_CNT_MAX - 'd1))begin
			baud_cnt <= 'd0 ;
        end
        else if (work_en == 'd1) begin
            baud_cnt <= baud_cnt + 'd1 ; 
        end
        else begin
            baud_cnt <= 'd0;
        end
    end
	//比特标志信号拉高，在每一个波特计数为1时拉高，相当于对数据的提取标志信号
    always @(posedge clk) begin
        if (rst_n == 'd0) begin
            bit_flag <= 'd0;
        end
        else if (baud_cnt == 'd1) begin
            bit_flag <= 'd1;
        end
        else begin
            bit_flag <= 'd0;
        end
    end
    //比特计数信号，在对每一个数据为进行计数
    always @(posedge clk) begin
        if(rst_n == 'd0)begin
            bit_cnt <= 'd0;
        end
        else if ((work_en == 'd1) && (bit_flag == 'd1) && (bit_cnt == 'd11)) begin
			bit_cnt <= 'd0;                       
        end
        else if ((work_en == 'd1) && (bit_flag == 'd1)) begin
            bit_cnt <= bit_cnt + 'd1;
        end
        else if (work_en == 'd0) begin
            bit_cnt <= 'd0;
        end
    end
	//对并行数据映射到串行数据
    always @(posedge clk) begin
        if (rst_n == 'd0) begin
            tx_reg <= 'd0;
        end
        else begin
            case (bit_cnt)
                4'd1: tx_reg <= 'd0;
                4'd2: tx_reg <= pi_data_reg[0];
                4'd3: tx_reg <= pi_data_reg[1];
                4'd4: tx_reg <= pi_data_reg[2];
                4'd5: tx_reg <= pi_data_reg[3];
                4'd6: tx_reg <= pi_data_reg[4];
                4'd7: tx_reg <= pi_data_reg[5];
                4'd8: tx_reg <= pi_data_reg[6];
                4'd9: tx_reg <= pi_data_reg[7];
                4'd10:tx_reg <= 'd1;
                4'd11:tx_reg <= 'd1;
                default :tx_reg <= 'd1; 
            endcase
        end
    end
	//发送数据完成标志信号
    always @(posedge clk) begin
        if (rst_n == 'd0) begin
            tx_done_reg <= 'd0;
        end
        else if ((bit_flag == 'd1) && (bit_cnt == 'd10)) begin
            tx_done_reg <= 'd1;
        end
        else begin
            tx_done_reg <= 'd0;
        end
    end
    //在tx模块发送数据完成时或者空闲状态时拉高，拉高表示可以接收上游传来的数据，在数据并转串时拉低
    always @(posedge clk) begin
    	if (rst_n == 'd0) begin
    		ready <= 'd1;
    	end
    	else if (tx_done == 'd1) begin
    		ready <= 'd1;
    	end
    	else if (valid == 'd1) begin
    		ready <= 'd0;
    	end
    end
    //Bram的使能信号
    always @(posedge clk) begin
    	if (rst_n) begin
    		ena <= 'd0;
    	end
    	else begin
    		ena <= tx_done;
    	end
    end
    
    assign tx = tx_reg;
    assign tx_done = tx_done_reg;
endmodule