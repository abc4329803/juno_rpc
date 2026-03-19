`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 18:26:05
// Design Name: 
// Module Name: IIC_TOP
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


module IIC_TOP(
input        CLK        ,    //--50MHz input
input        RST_N      , 
output       CLK_LOCKED ,
output       IIC_SCL    ,    //-- IIC clock bus		
inout        IIC_SDA         //-- IIC data bus	


    );

(* mark_debug = "true" *)reg  [7:0] IIC_ADDR_DATA;  
(* mark_debug = "true" *)reg        IIC_WREN;  //  0: write; 1: read 
(* mark_debug = "true" *)reg        IIC_ENABLE;  //  1: valid  
(* mark_debug = "true" *)reg        IIC_ISTWOSTAGE;  // 1: pca9548a; 0: SI5324
(* mark_debug = "true" *)wire [2:0] IIC_STATUS;  //    
(* mark_debug = "true" *)wire [7:0] IIC_RDDATA; 

(* mark_debug = "true" *)reg  [7:0] IIC_ADDR;
(* mark_debug = "true" *)reg        IIC_RDEN;   
(* mark_debug = "true" *)wire       IIC_RDRDY;  

(* mark_debug = "true" *)reg  [7:0] IIC_WRDATA; 

(* mark_debug = "true" *)wire       IIC_BUSY; 
(* mark_debug = "true" *)reg  [6:0] IIC_DEV_ADDR;  

(* mark_debug = "true" *)reg [7:0]  num;
(* mark_debug = "true" *)reg [15:0] data;
always @(*)
    begin
    case(num)
    //'d0:  data <= {8'd0,  8'h54}; 
    'd0:  data <= {8'd0,  8'h54}; 
    'd1:  data <= {8'd0,  8'h54}; 
    'd2:  data <= {8'd1,  8'hE4};
    'd3:  data <= {8'd2,  8'h12}; 
    'd4:  data <= {8'd3,  8'h15};
    'd5:  data <= {8'd4,  8'h92}; 
    'd6:  data <= {8'd5,  8'hED};
    'd7:  data <= {8'd6,  8'h2D}; 
    'd8:  data <= {8'd7,  8'h2A};
    'd9:  data <= {8'd8,  8'h00}; 
    'd10: data <= {8'd9,  8'hC0};
    'd11: data <= {8'd10, 8'h08}; 
    'd12: data <= {8'd11, 8'h40};
    'd13: data <= {8'd19, 8'h29}; 
    'd14: data <= {8'd20, 8'h3E};
	'd15: data <= {8'd21, 8'hFF}; 
	'd16: data <= {8'd22, 8'hDF};
	'd17: data <= {8'd23, 8'h1F}; 
	'd18: data <= {8'd24, 8'h3F};
	'd19: data <= {8'd25, 8'hA0}; 
	'd20: data <= {8'd31, 8'h00};
	'd21: data <= {8'd32, 8'h00}; 
	'd22: data <= {8'd33, 8'h03};
	'd23: data <= {8'd34, 8'h00}; 
	'd24: data <= {8'd35, 8'h00};
	'd25: data <= {8'd36, 8'h03}; 
	'd26: data <= {8'd40, 8'hC2};
	'd27: data <= {8'd41, 8'h49}; 
	'd28: data <= {8'd42, 8'hEF};
	'd29: data <= {8'd43, 8'h00}; 
	'd30: data <= {8'd44, 8'h77};
	'd31: data <= {8'd45, 8'h0B}; 
	'd32: data <= {8'd46, 8'h00};
	'd33: data <= {8'd47, 8'h77}; 
	'd34: data <= {8'd48, 8'h0B};
	'd35: data <= {8'd55, 8'h00}; 
	'd36: data <= {8'd131,8'h1F};
    'd37: data <= {8'd132,8'h02}; 
	'd38: data <= {8'd137,8'h01};
	'd39: data <= {8'd138,8'h0F}; 
	'd40: data <= {8'd139,8'hFF};
	'd41: data <= {8'd142,8'h00}; 
	'd42: data <= {8'd143,8'h00};
	'd43: data <= {8'd136,8'h40}; 
    
    endcase
    end 

reg [23:0] cnt;
(* mark_debug = "true" *)reg [4:0]  state;
always @(posedge CLK)
begin
    if(!RST_N)begin
        IIC_ENABLE <= 1'b0;
        IIC_ADDR <= 'd0;
        IIC_DEV_ADDR <= 'd0;
        IIC_RDEN <= 1'b0;
		num <= 8'd0;
		cnt <= 'd0;
		state <= 5'd0;
	end else begin
    	case(state)
        	5'd0:begin
                	if(cnt >= 'd600_000)begin
                        IIC_ENABLE <= 1'b1;
                        IIC_ISTWOSTAGE <= 1'b1;
                        //cnt <= cnt + 1'b1;
                        //state <= 4'd0;
                        
                        IIC_ADDR <= 'd0;
                        IIC_DEV_ADDR <= 7'b1110_100;
                        IIC_RDEN <= 1'b0;
                        IIC_WRDATA <= 'h80;
                        
                        if(IIC_BUSY)begin
                            cnt <= 'd0;
                            state <= 5'd1;
                        end
                        
                    end else begin
                        IIC_ENABLE <= 1'b0;
                        IIC_ADDR <= 'd0;
                        IIC_DEV_ADDR <= 'd0;
                        IIC_RDEN <= 1'b0;
                        IIC_WRDATA <= 'h80;
                        cnt <= cnt + 1'b1;
                        //state <= 5'd0;
                    end
        	end
        	5'd1:begin
                	if(num > 8'd43)begin
                	   IIC_ADDR <= 'd0;
                       IIC_RDEN <= 1'b0;
                       IIC_WRDATA <= 'd0;
                       num <= 8'd0;
                       cnt <= 'd0;
                       state <= 5'd3;
                	end else if(IIC_BUSY == 1'b0)begin
                        //IIC_ADDR <= data[15:8];
                        //IIC_RDEN <= 1'b0;
                        //IIC_ISTWOSTAGE <= 1'b0;
                        //IIC_WRDATA <= data[7:0];
                        //IIC_DEV_ADDR <= 7'b1101_000;
                        /*if(IIC_BUSY)begin
                            num <= num + 1'b1;
                            cnt <= 'd0;
                            state <= 4'd2;
                        end*/
                    end else begin
                        IIC_ADDR <= IIC_ADDR;
                        IIC_RDEN <= IIC_RDEN;
                        IIC_WRDATA <= IIC_WRDATA;
                        //if(IIC_DEV_ADDR == 7'b1110_100)
                        //    num <= 0;
                        //else

                        num <= num + 1'b1;
                        cnt <= 'd0;
                        state <= 5'd2;
                    end
        	end

        	5'd2:begin
                	if(IIC_BUSY == 1'b0)begin
                        //IIC_ADDR <= 'd0;
                        //IIC_RDEN <= 1'b0;
                        //IIC_WRDATA <= 'd0;
                        IIC_ADDR <= data[15:8];
                        IIC_RDEN <= 1'b0;
                        IIC_WRDATA <= data[7:0];
                        IIC_DEV_ADDR <= 7'b1101_000;
                        IIC_ISTWOSTAGE <= 1'b0;
                        cnt <= 'd0;
                        state <= 5'd1;
                    end else begin
                        IIC_ADDR <= IIC_ADDR;
                        IIC_RDEN <= 1'b0;
                        IIC_WRDATA <= IIC_WRDATA;
                        cnt <= 'd0;
                        //state <= 5'd2;
                    end
        	end
        	
        	5'd3:begin
                IIC_ADDR <= 'd10;
                IIC_RDEN <= 1'b0;
                IIC_WRDATA <= 'd0;
                cnt <= 'd0;
                state <= 5'd4;
        	end

            5'd4:begin
                    if(IIC_BUSY == 1'b0)begin
                        IIC_ADDR <= 'd130;
                        IIC_RDEN <= 1'b1;
                        IIC_ISTWOSTAGE <= 1'b0;
                        IIC_WRDATA <= data[7:0];
                        IIC_DEV_ADDR <= 7'b1101_000;
                        /*if(IIC_BUSY)begin
                            num <= num + 1'b1;
                            cnt <= 'd0;
                            state <= 4'd2;
                        end*/
                    end else begin
                        IIC_ADDR <= IIC_ADDR;
                        IIC_RDEN <= IIC_RDEN;
                        IIC_WRDATA <= IIC_WRDATA;
                        //if(IIC_DEV_ADDR == 7'b1110_100)
                        //    num <= 0;
                        //else
                        num <= num + 1'b1;
                        cnt <= 'd0;
                        state <= 5'd5;
                    end
            end
            5'd5:begin
                    if(IIC_BUSY == 1'b0)begin
                        //IIC_ADDR <= 'd0;
                        //IIC_RDEN <= 1'b0;
                        //IIC_WRDATA <= 'd0;
                        IIC_ADDR <= 'd130;
                        IIC_RDEN <= 1'b1;
                        IIC_WRDATA <= data[7:0];
                        IIC_DEV_ADDR <= 7'b1101_000;
                        cnt <= 'd0;
                        state <= 5'd4;
                    end else begin
                        IIC_ADDR <= IIC_ADDR;
                        IIC_RDEN <= 1'b1;
                        IIC_WRDATA <= IIC_WRDATA;
                        cnt <= 'd0;
                    end
            end
    /*
    4'd6:begin
            if(IIC_BUSY == 1'b0)begin
                IIC_ADDR <= 'd0;
                IIC_RDEN <= 1'b0;
                IIC_WRDATA <= 'd0;
                IIC_WREN <= 1'b0;
                cnt <= 'd0;
                state <= 4'd1;
            end else begin
                IIC_ADDR <= IIC_ADDR;
                IIC_RDEN <= 1'b0;
                IIC_WRDATA <= 'd0;
                IIC_WREN <= 1'b0;
                cnt <= 'd0;
                state <= 4'd6;
            end
    end
    4'd7:begin
        IIC_ADDR <= 'd0;
        IIC_RDEN <= 1'b0;
        IIC_WRDATA <= 'd0;
        IIC_WREN <= 1'b0;
        cnt <= 'd0;
        state <= 4'd0;
    end
    */
	default: state <= 5'd0;
	endcase
	end 		
end

/*

IIC_DRIVER IIC_DRIVER(
    .CLK        (CLK),    //--125MHz input
    .RST_N      (RST_N), 
    .IIC_DEV_ADDR(IIC_DEV_ADDR),
    .IIC_ADDR   (IIC_ADDR),    //-- 16 bit address
    .IIC_RDEN   (IIC_RDEN),    //-- read operation enable
    .IIC_RDRDY  (IIC_RDRDY),    //-- read ready signal
    .IIC_RDDATA (IIC_RDDATA),    //-- read data output
    .IIC_WRDATA (IIC_WRDATA),    //-- write data input
    .IIC_WREN   (IIC_WREN),    //-- write operation enable
    .IIC_SCL    (IIC_SCL),    //-- IIC clock bus
    .IIC_SDA    (IIC_SDA),    //-- IIC data bus
    .IIC_BUSY   (IIC_BUSY)     //-- IIC bus busy signal
		);

*/
i2c_master #(.DATA_WIDTH(8),.REG_WIDTH(8),.ADDR_WIDTH(7)) 
        i2c_master_inst(
            .i_clk(CLK),
            .i_rst(~RST_N),
            .i_enable(IIC_ENABLE),
            .i_isTwoStage(IIC_ISTWOSTAGE),
            .i_rw(IIC_RDEN),
            .i_mosi_data(IIC_WRDATA),
            .i_reg_addr(IIC_ADDR),
            .i_device_addr(IIC_DEV_ADDR),
            .i_divider(16'd100),
            .o_miso_data(IIC_RDDATA),
            .o_busy(IIC_BUSY),
            .io_sda(IIC_SDA),
            .io_scl(IIC_SCL)
        );
		    
endmodule
