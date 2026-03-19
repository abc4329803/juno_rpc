`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/09 10:12:20
// Design Name: 
// Module Name: channelout
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


module channelout(

    );

reg [4:0]cur_state;
reg [4:0]next_state;
reg channel1_finish;
reg channel2_finish;
reg [1:0]SiTCPin_cnt;

//状态机定义		
localparam	idle 			    =5'b00001,					//初始化状态
            channel1_valid      =5'b00010,
            channel1_empty		=5'b00100,		
			channel2_valid     	=5'b01000,
            channel2_empty  	=5'b10000;				


    //三段式状态机第一段
always @(posedge clk_125) begin
	if(~CE_test)
	    cur_state <= idle;
    else
	    cur_state <= next_state;
end
 
//三段式状态机第二段
always@(*)begin
	case(cur_state)
		idle:
			if(~fifo_empty[0])
				next_state = channel1_valid;					
			else if(~fifo_empty)
				next_state = channel1_empty;
            else 
                next_state = idle;
		channel1_valid:
			if(channel1_finish & ~fifo_empty[1])					
				next_state = channel2_valid;
			else if(channel1_finish)
				next_state = channel2_empty;
            else
                next_state = channel1_valid;
        channel1_empty:
			if(channel1_finish & ~fifo_empty[1])						
				next_state = channel2_valid;
			else if(channel1_finish)
				next_state = channel2_empty;
            else
                next_state = channel1_empty;	
		channel2_valid:
			if(channel2_finish)
				next_state = idle;					
			else
				next_state = channel2_valid;
        channel2_empty:
            if(channel2_finish)						
				next_state = idle;
            else
                next_state = channel2_empty;

		default:next_state = idle;
	endcase
end
 
//三段式状态机第三段
always@(posedge clk_125)begin
	if(~CE_test)begin								//初始状态
		fifo_ren<=0;
		SiTCPin_valid<=0;
		SiTCP_din<=0;
	end
	else begin
		case(next_state)
			idle:begin
                fifo_ren<=0;
		        SiTCPin_valid<=0;
		        SiTCP_din<=0;
                SiTCPin_cnt<=0;
                channel1_finish<=0;
                channel2_finish<=0;
			end	
			channel1_valid:begin
                if(sitcp_fifo_full | SiTCPin_cnt==3)
                begin
                    fifo_ren<=0;
                    SiTCP_din<=fifo_out[0];
                    SiTCPin_valid<=fifo_valid[0];
                end
                else 
                begin
                    fifo_ren<=0000_0000_0000_0001;
		            SiTCP_din<=fifo_out[0];
                    SiTCPin_valid<=fifo_valid[0];     
                end
                
                if(fifo_valid[0])
                begin
                    if(SiTCPin_cnt==3)
                        channel1_finish<=1;
                    SiTCPin_cnt<=SiTCPin_cnt+1;
                end
                end
            channel1_empty:begin
               if(sitcp_fifo_full)
                    SiTCPin_valid<=0;
                else 
                begin
                    if(SiTCPin_cnt==0)
                    begin
                        SiTCP_din<=16'h5555;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=1;
                    end
                    if(SiTCPin_cnt==1)
                    begin
                        SiTCP_din<=16'haaaa;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=2;
                    end
                    if(SiTCPin_cnt==2)
                    begin
                        SiTCP_din<=16'h0000;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=3;
                    end
                    if(SiTCPin_cnt==3)
                    begin
                        SiTCP_din<=16'h0000;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=0;
                        channel1_finish<=1;
                    end 
                end
            end
			channel2_valid:begin
			    if(sitcp_fifo_full | SiTCPin_cnt==3)
                begin
                    fifo_ren<=0;
                    SiTCP_din<=fifo_out[1];
                    SiTCPin_valid<=fifo_valid[1];
                end
                else
                begin
                    fifo_ren<=0000_0000_0000_0010;
	                SiTCP_din<=fifo_out[1];
                    SiTCPin_valid<=fifo_valid[1];     
                end

                if(fifo_valid[1])
                begin
                    if(SiTCPin_cnt==3)
                        channel2_finish<=1;
                    SiTCPin_cnt<=SiTCPin_cnt+1;
                end
		    end
            channel2_empty:begin
                if(sitcp_fifo_full)
                    SiTCPin_valid<=0;
                else 
                begin
                    if(SiTCPin_cnt==0)
                    begin
                        SiTCP_din<=16'h5555;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=1;
                    end
                    if(SiTCPin_cnt==1)
                    begin
                        SiTCP_din<=16'haaaa;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=2;
                    end
                    if(SiTCPin_cnt==2)
                    begin
                        SiTCP_din<=16'h0800;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=3;
                    end
                    if(SiTCPin_cnt==3)
                    begin
                        SiTCP_din<=16'h0000;
                        SiTCPin_valid<=1;
                        SiTCPin_cnt<=0;
                        channel2_finish<=1;
                    end 
                end
            end	
			default:;
		endcase
	end
end
endmodule
