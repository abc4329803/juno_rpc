`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/28 17:32:11
// Design Name: 
// Module Name: statistics_ram
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


module statistics_ram(
    input wire clk,
    input wire [10:0]data,
    input wire tdc_valid,
    input wire reset,
    input wire ce,
    output wire [17:0]fine_time,
    output wire finetime_valid
    );
    
    wire [14:0]dina1;
    wire [14:0]dina2;
    reg [16:0]dina3;

    reg [10:0]addra1;
    reg [10:0]addra2;
    reg [10:0]addra3_0;
    reg [10:0]addra3_1;
    reg [10:0]addra3_2;

    reg [10:0]addra3;
    reg [10:0]addrb1;
    reg [10:0]addrb2;
    reg [10:0]addrb3;

    wire [14:0]doutb1;
    wire [14:0]doutb2;
    wire [16:0]doutb3;
    wire [14:0]doutb12;

    reg wea1,wea2,enb1,enb2,enb3;
    reg wea3_0,wea3_1,wea3_2,wea3;

    reg [16:0]cnt_num;
    reg [11:0]cnt_statistics;

    reg [10:0]data_delay;
    reg [10:0]data_delay2;

    reg [1:0]ram1_valid_delay;
    reg [1:0]ram2_valid_delay;
    reg [3:0]tdc_valid_delay;

    wire ram1_valid;
    wire ram2_valid;

    wire ram1_busy_2period;
    reg ram1_busy,ram1_busy_delay;

    reg [3:0]cur_state;
    reg [3:0]next_state;

    reg [17:0] fine_time_reg;
    
    localparam NUM = 'd20;
    localparam RAM = 'd20;

    
    assign ram1_busy_2period=ram1_busy | ram1_busy_delay;
    assign ram1_valid= ram1_busy_2period? 0 : tdc_valid;
    assign ram2_valid= ram1_busy_2period? tdc_valid : 0;

    assign dina1=doutb1+1'b1;
    assign dina2=doutb2+1'b1;
    assign doutb12=doutb1+doutb2;

    localparam	idle 			= 4'b0001,					//初始化状态
                calibration     = 4'b0010,
			    statistics 	    = 4'b0100,					
			    dataout      	= 4'b1000;					

    //三段式状态机第一段
always @(posedge clk) begin
	if(~ce)
	cur_state <= idle;
else
	cur_state <= next_state;
end
 
//三段式状态机第二段
always@(*)begin
	next_state = idle;
	case(cur_state)
		idle:
			if(ce)
				next_state = calibration;					//接收到开始信号，跳转到发送起始信号状态
			else
				next_state = idle;
		calibration:
			if(cnt_num==NUM)						//i2c_clk 计数到最大值3，跳转到发送器件地址+写标志位状态
				next_state = statistics;
			else
				next_state = calibration;	
		statistics:
			if(cnt_statistics==RAM+'d3)
				next_state = dataout;
			else
				next_state = statistics;
		dataout:
			if(0)
				next_state = idle;					//接收到开始信号，跳转到发送起始信号状态
			else
				next_state = dataout;
		default:next_state = idle;
	endcase
end
 
//三段式状态机第三段
always@(posedge clk)begin
	if(~ce)begin								//初始状态
		wea1<=0;
        wea2<=0;
        wea3<=0;

        enb1<=0;
        enb2<=0;
        enb3<=0;

        addrb1<=0;
        addrb2<=0;
        addrb3<=0;

        addra1<=0;
        addra2<=0;
        addra3<=0;

        wea3_0<=0;
        wea3_1<=0;
        wea3_2<=0;

        dina3<=0;

        ram1_busy<=0;
        ram1_busy_delay<=0;

        cnt_num<=0;
        cnt_statistics<=0;

	end
	else begin
		case(next_state)

			idle:begin
			end	

			calibration:begin
                if(ram1_valid_delay[1] | ram2_valid_delay[1])
                    cnt_num=cnt_num+1;
                
                data_delay<=data;
                data_delay2<=data_delay;
                ram1_busy_delay<=ram1_busy;
        
                ram1_valid_delay<={ram1_valid_delay[0],ram1_valid};
                ram2_valid_delay<={ram2_valid_delay[0],ram2_valid};
        
                if(ram1_valid)
                begin
                    wea1<=0;
                    enb1<=1;
                    addrb1<=data;
                end
                else if(ram1_valid_delay[0])
                        ram1_busy<=1;
                else if(ram1_valid_delay[1])
                begin
                    wea1<=1;
                    enb1<=0;
                    addra1<=data_delay2;
                    ram1_busy<=0;
                end
                else
                    begin
                        wea1<=0;
                        enb1<=0;
                    end
        
                if(ram2_valid)
                begin
                    wea2<=0;
                    enb2<=1;
                    addrb2<=data;
                end
                else if(ram2_valid_delay[0]);
                else if(ram2_valid_delay[1])
                begin
                    wea2<=1;
                    enb2<=0;
                    addra2<=data_delay2;
                end
                else
                begin
                    wea2<=0;
                    enb2<=0;
                end
            end

			statistics:begin
                if(cnt_statistics<RAM+'d3)
                begin
                    wea3_1<=wea3_0;
                    wea3_2<=wea3_1;
                    wea3<=wea3_2;

                    addra3_1<=addra3_0;
                    addra3_2<=addra3_1;
                    addra3<=addra3_2;
                    cnt_statistics<=cnt_statistics+1;

                    if(cnt_statistics>2)
                        dina3<=dina3+doutb12;

                    if(cnt_statistics<RAM)
                    begin
                        wea1<=0;
                        addra1<=0;
                        addrb1<=cnt_statistics;
                        enb1<=1;

                        wea2<=0;
                        addra2<=0;
                        addrb2<=cnt_statistics;
                        enb2<=1;

                        wea3_0<=1;
                        addra3_0<=cnt_statistics;
                        addrb3<=0;
                        enb3<=0;
			        end
                end
            end
            
			dataout:begin
                wea1<=0;
                addra1<=0;

                wea2<=0;
                addra2<=0;

                wea3<=0;
                addra3<=0;
                dina3<=0;

                tdc_valid_delay<={tdc_valid_delay[2:0],tdc_valid};

				if(tdc_valid)
                begin
                    addrb1<=data;
                    enb1<=1;

                    addrb2<=data;
                    enb2<=1;

                    addrb3<=data-1'b1;
                    enb3<=1;
                end

                fine_time_reg[17:1]<=doutb12[14:1]+doutb3[16:0];
                fine_time_reg[0]<=doutb12[0];
			end	
			default:;
		endcase
	end
end
    
assign  fine_time= fine_time_reg;
assign  finetime_valid= tdc_valid_delay[3];

    blk_mem_gen_0 blk_mem_gen_0(
        .clka(clk), 
        .wea(wea1),
        .addra(addra1),
        .dina(dina1), 
        .clkb(clk),
        .enb(enb1),
        .addrb(addrb1),
        .doutb(doutb1)
    );

    blk_mem_gen_1 blk_mem_gen_1(
        .clka(clk), 
        .wea(wea2),
        .addra(addra2),
        .dina(dina2), 
        .clkb(clk),
        .enb(enb2),
        .addrb(addrb2),
        .doutb(doutb2)
    );

    blk_mem_gen_2 blk_mem_gen_2(
        .clka(clk), 
        .wea(wea3),
        .addra(addra3),
        .dina(dina3), 
        .clkb(clk),
        .enb(enb3),
        .addrb(addrb3),
        .doutb(doutb3)
    );

    initial begin
        wea1<=0;
        wea2<=0;
        wea3<=0;

        enb1<=0;
        enb2<=0;
        enb3<=0;

        addrb1<=0;
        addrb2<=0;
        addrb3<=0;

        addra1<=0;
        addra2<=0;
        addra3<=0;

        wea3_0<=0;
        wea3_1<=0;
        wea3_2<=0;

        dina3<=0;

        ram1_busy<=0;
        ram1_busy_delay<=0;

        cnt_num<=0;
        cnt_statistics<=0;
    end
endmodule
