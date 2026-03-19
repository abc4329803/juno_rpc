`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/22 11:18:18
// Design Name: 
// Module Name: I2C
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


module  i2c_drive
#(
    parameter   DEVICE_ADDR     =   7'b00011_00     ,   //i2c从机地址
    parameter   SYS_CLK_FREQ    =   26'd20_000_000  ,   //系统时钟频率
    parameter   I2C_FREQ        =   21'd400_000         //i2c时钟频率，400K
)
(
//系统接口
    input		        sys_rst_n   ,   			//输入复位信号,低电平有效
    input		        sys_clk     ,   			//输入系统时钟,50MHz
//I2C时序控制接口				
	input				i2c_rw		,				//读写使能信号----1:读；0：写
    input		        i2c_start   ,   			//i2c开始信号
    input		[7:0]   i2c_addr   	,   			//i2c字节地址
    input		[15:0]  i2c_data_w	,   			//写入i2c数据
    output  reg			i2c_clk     ,   			//i2c驱动时钟
    output  reg			i2c_end     ,   			//i2c一次读/写操作完成
    output  reg	[15:0]  i2c_data_r  ,   			//i2c读取数据
//	output  reg 		i2c_busy,
//I2C物理接口				
    output  reg			scl     	,   			//输出至i2c设备的串行时钟信号scl
    inout   wire		sda         				//输出至i2c设备的串行数据信号sda
);		
		
//状态机定义		
localparam	IDLE 			= 5'd0,					//初始化状态
			START1			= 5'd1,					//发送开始信号状态1
			SEND_D_ADDR_W 	= 5'd2,					//设备地址写入状态 + 控制写
			ACK1			= 5'd3,					//等待从机响应信号1
			SEND_R_ADDR  	= 5'd4,					//发送寄存器地址
			ACK2			= 5'd5,					//应答状态2
			WR_DATA_H       = 5'd6,  				//写入数据高8位
            ACK3            = 5'd7,  				//应答状态3
            WR_DATA_L       = 5'd8,  				//写入数据低8位
            ACK4			= 5'd9,					//等待从机响应信号4
            START2          = 5'd10,  				//发送开始信号状态12
            SEND_D_ADDR_R   = 5'd11,  				//设备地址写入状态 + 控制读
            ACK5            = 5'd12,  				//应答状态5
            RD_DATA_H       = 5'd13,  				//读出数据高8位
            ACK6			= 5'd14,				//应答状态6
            RD_DATA_L       = 5'd15,   	            //读出数据低8位
            NACK            = 5'd16,  				//非应答状态
            STOP            = 5'd17;  				//结束状态
 

//根据系统频率及IIC驱动频率计算分频系数			
			localparam	CLK_DIVIDE = SYS_CLK_FREQ / I2C_FREQ >>1'd1; 

//reg定义			
reg	[7:0]	clk_cnt			;						//分频时钟计数器，最大计数64			
reg	[4:0]	cur_state		;						//状态机现态	 
reg	[4:0]	next_state		;						//状态机次态	
reg			i2c_clk_cnt_en	;			 			//驱动时钟计数使能
reg	[1:0]	i2c_clk_cnt		;			 			//驱动计数时钟，方便在SCL的高电平中间采集数据；和在SCL的低电平中间变化数据
reg			sda_out			;						//IIC总线三态输出
reg			sda_en			;						//IIC总线三态门使能
reg [2:0]	bit_cnt			;						//接收数据个数计数器
reg			ack_flag		;						//应答信号标志
reg	[15:0]	i2c_data_r_temp	;						//读取数据寄存器，暂存读到的数据
			
//wire定义		
wire		sda_in			;						//IIC总线三态输入
wire [7:0]	addr_r			;						//器件地址+读控制位
wire [7:0]	addr_w			;						//器件地址+写控制位
		
assign addr_r = {DEVICE_ADDR,1'b1};					//器件地址+读控制位
assign addr_w = {DEVICE_ADDR,1'b0};					//器件地址+写控制位
 
//双向口处理
assign sda_in = sda;				
assign sda = sda_en ? sda_out : 1'bz;
 
initial begin
	i2c_clk=0;
	clk_cnt=0;
end
//scl4分频时钟=IIC驱动时钟i2c_clk，方便操作对采集数据及变化数据操作
always@(posedge sys_clk)begin
	if(clk_cnt == CLK_DIVIDE - 1'b1)begin
		i2c_clk <= ~i2c_clk;
		clk_cnt <= 0;		
	end
	else begin
		i2c_clk <= i2c_clk;
		clk_cnt <= clk_cnt + 1'd1;	
	end
end
 
//i2c_clk计数器使能
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		i2c_clk_cnt_en <= 1'b0;
	//只有在发送完了结束信号或者没有接收到IIC开始传输信号的初始状态下才不停对i2c_clk计数器复位（使能为0）
 	else if ((cur_state == STOP && i2c_clk_cnt == 2'd3 && bit_cnt == 2'd3)||(cur_state == IDLE && !i2c_start ))
		i2c_clk_cnt_en <= 1'b0; 
	else if(i2c_start)							
		i2c_clk_cnt_en <= 1'b1;							//接收到开始信号，代表一次传输开始，计数器开始计数
	else											
		i2c_clk_cnt_en <= i2c_clk_cnt_en;				//其他时候保持不变
end
 
//i2c_clk_cnt计数器
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(!sys_rst_n)
		i2c_clk_cnt <= 2'd0;
	else if(i2c_clk_cnt_en)						
		i2c_clk_cnt <= i2c_clk_cnt + 1'd1;				//使能信号有效，计数器开始计数
	else		
		i2c_clk_cnt <= 2'd0;							//使能信号无效，计数器清零
end
	
//三段式状态机第一段
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(~sys_rst_n)
		cur_state <= IDLE;
	else
		cur_state <= next_state;
end
 
//三段式状态机第二段
always@(*)begin
	next_state = IDLE;
	case(cur_state)
		IDLE:
			if(i2c_start)
				next_state = START1;					//接收到开始信号，跳转到发送起始信号状态
			else
				next_state = IDLE;
		START1:
			if(i2c_clk_cnt == 2'd3)						//i2c_clk 计数到最大值3，跳转到发送器件地址+写标志位状态
				next_state = SEND_D_ADDR_W;
			else
				next_state = START1;
		SEND_D_ADDR_W:
			if(i2c_clk_cnt == 2'd3 && bit_cnt == 3'd7)	//发送了8位地址后跳转到从机响应状态
				next_state = ACK1;	
			else
				next_state = SEND_D_ADDR_W;			
		ACK1:
			if(ack_flag && i2c_clk_cnt == 2'd3)begin	//响应标志有效
				//根据地址状态位判断是16位地址还是8位地址，从而跳转到不同状态
					next_state = SEND_R_ADDR;			//跳转到寄存器高8位地址发送状态
			end	
			else if(i2c_clk_cnt == 2'd3)				//响应无效或者响应不及时则跳转回初始状态
				next_state = IDLE;
			else 
				next_state = ACK1;
		SEND_R_ADDR:
			if(i2c_clk_cnt == 2'd3 && bit_cnt == 3'd7)	//发送了寄存器8位地址后跳转到从机响应状态
				next_state = ACK2;
			else
				next_state = SEND_R_ADDR;
		ACK2:
			if(ack_flag && i2c_clk_cnt == 2'd3)begin	//响应标志有效	
				if(i2c_rw)								//读状态
					next_state = START2;				//跳转到第二次发送起始信号
				else									//写状态
					next_state = WR_DATA_H;				//跳转到写数据状态
			end
			else if(i2c_clk_cnt == 2'd3)				
				next_state = IDLE;						//响应无效或者响应不及时则跳转回初始状态
			else
				next_state = ACK2;
		START2:
			if(i2c_clk_cnt == 2'd3)						
				next_state = SEND_D_ADDR_R;				//第二次发送起始信号后跳转到发送器件地址+读标志位状态
			else
				next_state = START2;
		SEND_D_ADDR_R:
			if(i2c_clk_cnt == 2'd3 && bit_cnt == 3'd7)	//发送完了8位地址后跳转到从机响应状态
				next_state = ACK5;	
			else
				next_state = SEND_D_ADDR_R;			
		ACK5:
			if(ack_flag && i2c_clk_cnt == 2'd3)			
				next_state = RD_DATA_H;                   //响应标志有效则跳转到读数据状态
			else if(i2c_clk_cnt == 2'd3)                
				next_state = IDLE;				        //响应无效或者响应不及时则跳转回初始状态
			else                                        
				next_state = ACK5;		
		RD_DATA_H:
			if(i2c_clk_cnt == 2'd3 && bit_cnt == 3'd7)	//接收完了高8位数据后跳转到从机响应状态
				next_state = ACK6;
			else
				next_state = RD_DATA_H;
		ACK6:
			if(ack_flag && i2c_clk_cnt == 2'd3)			
				next_state = RD_DATA_L;                   //响应标志有效则跳转到读数据状态
			else if(i2c_clk_cnt == 2'd3)                
				next_state = IDLE;				        //响应无效或者响应不及时则跳转回初始状态
			else                                        
				next_state = ACK6;
		RD_DATA_L:
			if(i2c_clk_cnt == 2'd3 && bit_cnt == 3'd7)	//接收完了低8位数据后跳转到主机发送非响应状态
				next_state = NACK;
			else
				next_state = RD_DATA_L;		
		NACK:
			if(i2c_clk_cnt == 2'd3)						
				next_state = STOP;						//发送完了非响应信号后跳转到发送结束信号状态
			else
				next_state = NACK;						
		WR_DATA_H:
			if(bit_cnt == 3'd7 && i2c_clk_cnt == 2'd3)	
				next_state = ACK3;						//写完了高8位数据后跳转到从机响应状态
			else
				next_state = WR_DATA_H;
		ACK3:
			if(ack_flag && i2c_clk_cnt == 2'd3)
				next_state = WR_DATA_L;						//响应标志有效则跳转到发送结束信号状态
			else if(i2c_clk_cnt == 2'd3)
				next_state = IDLE;						//响应无效或者响应不及时则跳转回初始状态
			else
				next_state = ACK3;
		WR_DATA_L:
			if(bit_cnt == 3'd7 && i2c_clk_cnt == 2'd3)	
				next_state = ACK4;						//写完了低8位数据后跳转到从机响应状态
			else
				next_state = WR_DATA_L;
		ACK4:
			if(ack_flag && i2c_clk_cnt == 2'd3)
				next_state = STOP;						//响应标志有效则跳转到发送结束信号状态
			else if(i2c_clk_cnt == 2'd3)
				next_state = IDLE;						//响应无效或者响应不及时则跳转回初始状态
			else
				next_state = ACK4;
		STOP:
			if(bit_cnt == 2'd3 && i2c_clk_cnt == 2'd3)	//结束信号发送完毕（这里还预留了2个周期）跳转到初始状态，等待下一次传输开始信号
				next_state = IDLE;
			else
				next_state = STOP;		
		default:next_state = IDLE;
	endcase
end
 
//三段式状态机第三段
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(~sys_rst_n)begin								//初始状态
		sda_en <= 1'b1;
		sda_out <= 1'b1;
		bit_cnt	<= 3'd0;
		i2c_end <= 1'b0;
		i2c_data_r <= 16'd0;
		i2c_data_r_temp <= 16'd0;
	end
	else begin
		i2c_end <= 1'b0;
		case(cur_state)
			IDLE:begin
//				i2c_busy<=0;
				sda_en <= 1'b1;						//控制总线
				sda_out <= 1'b1;					//拉高总线
			end	
			START1:begin
//					i2c_busy<=1;
					if(i2c_clk_cnt == 2'd3)begin	//发送完了开始信号
						if(addr_w[7])begin			//如果器件地址的最高位为1则提前拉高总线
							sda_en <= 1'b1;
							sda_out <= 1'b1;													
						end
						else begin					//如果器件地址的最高位为0则提前拉低总线
							sda_en <= 1'b1;
							sda_out <= 1'b0;												
						end
					end
					else begin						//还没发送完开始信号则保持低电平
						sda_en <= 1'b1;
						sda_out <= 1'b0;					
					end
			end	
			SEND_D_ADDR_W:begin
				if(bit_cnt == 3'd7)begin			
					if(i2c_clk_cnt == 2'd3)begin	//发送了8个数据（器件地址+写标志位）
						bit_cnt <= 3'd0;			//发送数据计数器清零
						sda_en <= 1'b0;				//释放总线
					end
				end
				else if(i2c_clk_cnt == 2'd3)begin	//发送完了一个数据
					bit_cnt <= bit_cnt + 1'd1;		//发送数据计数器清零
					sda_en <= 1'b1;					//控制总线
					sda_out <= addr_w[6-bit_cnt];	//总线依次串行输出地址
				end
			end
			ACK1:begin
  				if(i2c_clk_cnt == 2'd3)begin				
						if(i2c_addr[7])begin		//如果器件地址的8位为1则提前拉高总线
							sda_en <= 1'b1;
							sda_out <= 1'b1;	
						end
						else begin					//如果器件地址的8位为0则提前拉低总线
							sda_en <= 1'b1;
							sda_out <= 1'b0;	
						end
					end			
				end 
			SEND_R_ADDR:begin	
				if(bit_cnt == 3'd7)begin				//8个数据发送完了
					if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b0;					//释放总线
					end
				end
				else if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= bit_cnt + 1'd1;		//发送数据计数器清零
						sda_en <= 1'b1;                 //控制总线
						sda_out <= i2c_addr[6-bit_cnt]; //总线依次串行输出地址
				end			
			end
			ACK2:begin
				if(!i2c_rw)begin					//是写操作
					if(i2c_clk_cnt == 2'd3)begin
						if(i2c_data_w[15])begin		//下一个要发送数据的首个数据为高则提前拉高总线
							sda_en <= 1'b1;
							sda_out <= 1'b1;													
						end
						else begin					//下一个要发送数据的首个数据为低则提前拉低总线
							sda_en <= 1'b1;
							sda_out <= 1'b0;												
						end				
					end 
				end
				else begin							//是读操作
					if(i2c_clk_cnt == 2'd3)begin	//提前拉高总线进入再次发送起始信号状态
						sda_en <= 1'b1;
						sda_out <= 1'b1;								
					end
					else begin
						sda_en <= 1'b1;
						sda_out <= 1'b0;												
					end				
				end
			end
			START2:begin
				if(i2c_clk_cnt == 2'd1)begin		//拉低总线
					sda_en <= 1'b1;
					sda_out <= 1'b0;						
				end
				else if(i2c_clk_cnt == 2'd3)begin
					if(addr_r[7])begin				//下一个要发送数据的首个数据为高则提前拉高总线
						sda_en <= 1'b1;
						sda_out <= 1'b1;													
					end
					else begin						//下一个要发送数据的首个数据为低则提前拉低总线
						sda_en <= 1'b1;
						sda_out <= 1'b0;												
					end						
				end
			end
			SEND_D_ADDR_R:begin
				if(bit_cnt == 3'd7)begin				//8个数据发送完了
					if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b0;					//释放总线
					end
				end
				else if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= bit_cnt + 1'd1;		//发送数据计数
						sda_en <= 1'b1;                 //控制总线
						sda_out <= addr_r[6-bit_cnt];   //总线依次串行输出地址
				end
			end		
			ACK5:begin
					sda_en <= 1'b0;						//下一个状态是接收数据，所以释放总线
			end							
			RD_DATA_H:begin
				if(i2c_clk_cnt == 2'd3)begin
					if(bit_cnt == 3'd7)begin			//接收了8个数据
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b1;					//控制总线
						sda_out <= 1'b0;                //拉低总线（主机发送响应信号）
						i2c_data_r[15:8] <= i2c_data_r_temp[15:8];	//将读取的数据输出						
					end
					else begin							//数据还未接收完毕		
						bit_cnt <= bit_cnt + 3'd1;				
					end				
				end
				else if(i2c_clk_cnt == 2'd1)begin		//在SCL的中间采集数据
					i2c_data_r_temp[15-bit_cnt] <=sda_in;//将总线上的数据依次串行采集				
				end
			end
			ACK6:begin
				if(i2c_clk_cnt == 2'd1)
					sda_en <= 1'b0;							//响应信号发送完毕，下一个状态是接收数据，所以释放总线
			end
			RD_DATA_L:begin
				if(i2c_clk_cnt == 2'd3)begin
					if(bit_cnt == 3'd7)begin			//接收了8个数据
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b1;					//控制总线
						sda_out <= 1'b1;                //拉高总线（为了下一步发送非响应信号）
						i2c_data_r[7:0] <= i2c_data_r_temp[7:0];	//将读取的数据输出						
					end
					else begin							//数据还未接收完毕		
						bit_cnt <= bit_cnt + 3'd1;				
					end				
				end
				else if(i2c_clk_cnt == 2'd1)begin		//在SCL的中间采集数据
					i2c_data_r_temp[7-bit_cnt] <=sda_in;//将总线上的数据依次串行采集				
				end
			end							
			NACK:begin
 				if(i2c_clk_cnt == 2'd3)begin			
					sda_en <= 1'b1;						//控制总线
					sda_out <= 1'b0;					//拉高总线																					
				end
			end				
			WR_DATA_H:begin
				if(bit_cnt == 3'd7)begin				//写完了高8位数据
					if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b0;					//释放总线
					end
				end
				else if(i2c_clk_cnt == 2'd3)begin		//没有写完8个数据
					bit_cnt <= bit_cnt + 1'd1;			//发送数据计数器累加
					sda_en <= 1'b1;
					sda_out <= i2c_data_w[14-bit_cnt];	//依次输出数据
				end
			end
			ACK3:begin
					if(i2c_clk_cnt == 2'd3)begin
						if(i2c_data_w[7])begin		//下一个要发送数据的首个数据为高则提前拉高总线
							sda_en <= 1'b1;
							sda_out <= 1'b1;													
						end
						else begin					//下一个要发送数据的首个数据为低则提前拉低总线
							sda_en <= 1'b1;
							sda_out <= 1'b0;												
						end				
					end 
				end
			WR_DATA_L:begin
				if(bit_cnt == 3'd7)begin				//写完了低8位数据
					if(i2c_clk_cnt == 2'd3)begin
						bit_cnt <= 3'd0;				//发送数据计数器清零
						sda_en <= 1'b0;					//释放总线
					end
				end
				else if(i2c_clk_cnt == 2'd3)begin		//没有写完8个数据
					bit_cnt <= bit_cnt + 1'd1;			//发送数据计数器累加
					sda_en <= 1'b1;
					sda_out <= i2c_data_w[6-bit_cnt];	//依次输出数据
				end
			end	
			ACK4:begin
 				if(i2c_clk_cnt == 2'd3)begin
					sda_en <= 1'b1;						//控制总线
					sda_out <= 1'b0;					//拉低总线（为了下一步发送终止信号）																					
				end
			end				 
			STOP:begin				
 				if(i2c_clk_cnt == 2'd2 && bit_cnt == 2'd0)begin	//拉高信号作为终止信号	
					sda_en <= 1'b1;
					sda_out <= 1'b1;																									
				end
				else if( i2c_clk_cnt == 2'd3 )begin
					if(bit_cnt == 2'd3)begin					
						bit_cnt <= 2'd0;
						i2c_end <= 1'b1;				//发送完了终止信号且延时一段时间发送IIC结束信号
					end
					else
						bit_cnt <= bit_cnt + 1'd1;
				end
			end
			default:;
		endcase
	end
end
 
//i2c时钟生成
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(~sys_rst_n)
		scl <= 1'b1;
	else if(cur_state != STOP)begin
		if(i2c_clk_cnt == 2'd2)
			scl <= 1'b0;
		else if(i2c_clk_cnt == 2'd0)
			scl <= 1'b1;	
	end
	else 
		scl <= 1'b1;
end
//从机响应信号标志
always@(posedge i2c_clk or negedge sys_rst_n)begin
	if(~sys_rst_n)
		ack_flag <= 1'b0;
	else 
		case(cur_state)
			ACK1,ACK2,ACK3,ACK4,ACK5,ACK6:
				if((i2c_clk_cnt == 1'd0 ||i2c_clk_cnt == 1'd1)&& !sda_in)		//在从机响应状态正确接收到了从机发送的响应信号则拉高响应标志
					ack_flag <= 1'b1;
				else if(i2c_clk_cnt == 2'd3)			
					ack_flag <= 1'b0;
			default:ack_flag <= 1'b0;
		endcase
end

//ila_1 ila1(
//	.clk(sys_clk),
//	.probe0(cur_state),
//	.probe1(i2c_end),
//	.probe2(i2c_start)
//);
endmodule
