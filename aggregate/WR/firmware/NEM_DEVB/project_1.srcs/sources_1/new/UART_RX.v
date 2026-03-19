`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Linest-5
// Create Date: 2022/04/14
// Design Name: 
// Module Name: UART_RX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: UART 接收模块，将串行的数据转成并行的数据接收
// Dependencies: 
// Revision:
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
 
 
module UART_RX #(
	parameter	BAUD_RATE = 'd115200,					//波特率
	parameter	CLK_FREQ  = 'd125000000,			//时钟周期
	parameter	BAUD_CNT_MAX = CLK_FREQ/BAUD_RATE
	)
	(
	input	wire		  clk,						//接收到的数据
	input	wire		  rst_n,					//复位信号，低电平有效
	input	wire		  rx,						//输入的串行数据		
	output	reg   [7:0]	  po_data,					//输出的并行数据
	output	reg           po_flag					//并行数据输出的同步标志信号
	);			
				
	reg					  rx_reg1;					//打三拍,稳定数据
	reg 				  rx_reg2;		
	reg 				  rx_reg3;		
	reg 				  start_flag;				//数据稳定信号
	reg 				  work_en;					//开始提取数据有效信号
	reg 				  bit_flag;					//数据提取标志信号
	reg   [3:0]			  bit_cnt;					//数据位计数信号
	reg   [12:0]		  baud_cnt;					//比特计数信号，一个数据需要多少个时钟周期
	reg   [7:0]			  rx_data; 					//串转并数据
	reg 				  rx_flag;					//串转并完成信号
 
 
	//消除亚稳态
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			rx_reg1 <= 'd1;
		end
		else begin
			rx_reg1 <= rx;
		end
	end
 
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			rx_reg2 <= 'd1;
		end
		else begin
			rx_reg2 <= rx_reg1;
		end
	end
 
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			rx_reg3 <= 'd1;
		end
		else begin
			rx_reg3 <= rx_reg2;
		end
	end
	//下降沿检测
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			start_flag <= 'd0;
		end
		else if ((rx_reg2 == 0) && (rx_reg3 == 1) && (work_en == 'd0)) begin 
			start_flag <= 'd1;
		end
		else begin
			start_flag <= 'd0;
		end
	end
	//开始数据计数信号
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			work_en <= 'd0;
		end
		else if (start_flag == 1) begin
			work_en <= 'd1;
		end
		else if ((bit_flag == 1) && (bit_cnt == 'd8)) begin
			work_en <= 'd0;
		end
	end
	//波特计数信号，用时钟频率除以波特率即每个数据需要的时钟周期数
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			baud_cnt <= 'd0;
		end
		else if ((baud_cnt == BAUD_CNT_MAX-1) || (work_en == 'd0)) begin
			baud_cnt <= 'd0;
		end
		else begin
			baud_cnt <= baud_cnt + 'd1;
		end
	end
	//数据中间提取最稳定
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			bit_flag <= 'd0;
		end
		else if (baud_cnt == BAUD_CNT_MAX/2-1) begin
			bit_flag <= 'd1;
		end
		else begin
			bit_flag <= 'd0;
		end
	end
	//数据位计数信号，只去有效的数据位，起始位和结束位不要
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			bit_cnt <= 'd0;
		end
		else if ((bit_flag == 'd1) && (bit_cnt == 'd8)) begin
			bit_cnt <= 'd0;
		end
		else if (bit_flag == 'd1) begin
			bit_cnt <= bit_cnt + 'd1;
		end
	end
	//将提取的数据串转并
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			rx_data <= 'd0;
		end
		else if ((bit_flag == 'd1) && (bit_cnt >= 'd1) && (bit_cnt <= 'd8)) begin
			rx_data <= {rx_reg3,rx_data[7:1]};
		end
	end
	//完成最后一个数据的拼接之后， 就把此信号拉高 
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			rx_flag <= 'd0;
		end
		else if ((bit_flag == 'd1) && (bit_cnt == 'd8)) begin
			rx_flag <= 'd1;
		end
		else begin
			rx_flag <= 'd0;
		end
	end
	//并行数据输出
	always @(posedge clk) begin
		if (rst_n == 'd0) begin
			po_data <= 'd0;
		end
		else if (rx_flag == 'd1) begin
			po_data <= rx_data;
		end
		else begin
			po_data <= po_data;
		end
	end
	//并行数据输出标志信号
    always @(posedge clk) begin
        if (rst_n == 'd0) begin
            po_flag <= 'd0;
        end
        else begin
            po_flag <= rx_flag;
        end
    end
	
endmodule
