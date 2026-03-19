`timescale  1ns/1ns


module  flash_read_ctrl
#(
    parameter   BIT_SIZE    =   32'd100    //读取数据个数
)
(

    input   wire            sys_clk     ,   //系统时钟，频率50MHz
    input   wire            ila_clk     ,
    input   wire            sys_rst_n   ,   //复位信号,低电平有效
    input   wire            key         ,   //按键输入信号
    input   wire            miso        ,   //读出flash数据

    output  reg             sck         ,   //串行时钟
    output  reg             cs_n        ,   //片选信号
    output  reg             mosi        ,   //主输出从输入数据
    output  wire            tx_flag     ,   //输出数据标志信号
    output  wire    [7:0]   tx_data         //输出数据

);

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//

//parameter define
localparam  IDLE    =   3'b001  ,   //初始状态
            READ    =   3'b010  ;   //数据读状

//localparam   READ_INST   =   8'b0000_0011;   //读指令
localparam   READ_INST   =   8'b0001_0011;   //读指令
localparam   SECTOR_ADDR =   8'b0000_0000,   //扇区地址
            PAGE_ADDR   =   8'b0000_0000,   //页地址
            BYTE_ADDR   =   8'b0000_0000;   //字节地址

//wire  define
reg    [7:0]   fifo_data_num   ;   //fifo内数据个数
//reg   define
reg     [4:0]   cnt_clk         ;   //系统时钟计数器
reg     [2:0]   state           ;   //状态机状态
reg     [31:0]  cnt_byte        ;   //字节计数器
reg     [1:0]   cnt_sck         ;   //串行时钟计数器
reg     [2:0]   cnt_bit         ;   //比特计数器
reg             miso_flag       ;   //miso提取标志信号
reg     [7:0]   data            ;   //拼接数据
reg             po_flag_reg     ;   //输出数据标志信号
reg             po_flag         ;   //输出数据
reg     [7:0]   po_data         ;   //输出数据

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//
//cnt_clk：系统时钟计数器，用以记录单个字节
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_clk  <=  5'd0;
    else    if(state == READ)
        cnt_clk  <=  cnt_clk + 1'b1;

//cnt_byte：记录输出字节个数和等待时间
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_byte    <=  16'd0;
    else    if((cnt_clk == 5'd31) && (cnt_byte == BIT_SIZE + 16'd3))
        cnt_byte    <=  16'd0;
    else    if(cnt_clk == 5'd31)
        cnt_byte    <=  cnt_byte + 1'b1;

//cnt_sck：串行时钟计数器，用以生成串行时钟
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_sck <=  2'd0;
    else    if(state == READ)
        cnt_sck <=  cnt_sck + 1'b1;

//cs_n：片选信号
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cs_n    <=  1'b1;
    else    if(key == 1'b1)
        cs_n    <=  1'b0;
    else    if((cnt_byte == BIT_SIZE + 16'd3) && (cnt_clk == 5'd31) && (state == READ))
        cs_n    <=  1'b1;

//sck：输出串行时钟
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        sck <=  1'b0;
    else    if(cnt_sck == 2'd0)
        sck <=  1'b0;
    else    if(cnt_sck == 2'd2)
        sck <=  1'b1;

//cnt_bit：高低位对调，控制mosi输出
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_bit <=  3'd0;
    else    if(cnt_sck == 2'd2)
        cnt_bit <=  cnt_bit + 1'b1;

//state：两段式状态机第一段，状态跳转
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        state   <=  IDLE;
    else
    case(state)
        IDLE:   if(key == 1'b1)
                    state   <=  READ;
        READ:   if((cnt_byte == BIT_SIZE + 16'd3) && (cnt_clk == 5'd31))
                    state   <=  IDLE;
        default:    state   <=  IDLE;
    endcase

//mosi：两段式状态机第二段，逻辑输出
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        mosi    <=  1'b0;
    else    if((state == READ) && (cnt_byte>= 16'd4))
        mosi    <=  1'b0;
    else    if((state == READ) && (cnt_byte == 16'd0) && (cnt_sck == 2'd0))
        mosi    <=  READ_INST[7 - cnt_bit];  //读指令
    else    if((state == READ) && (cnt_byte == 16'd1) && (cnt_sck == 2'd0))
        mosi    <=  SECTOR_ADDR[7 - cnt_bit];  //扇区地址
    else    if((state == READ) && (cnt_byte == 16'd2) && (cnt_sck == 2'd0))
        mosi    <=  PAGE_ADDR[7 - cnt_bit];    //页地址
    else    if((state == READ) && (cnt_byte == 16'd3) && (cnt_sck == 2'd0))
        mosi    <=  BYTE_ADDR[7 - cnt_bit];    //字节地址

//miso_flag：miso提取标志信号
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        miso_flag   <=  1'b0;
    else    if((cnt_byte >= 16'd4) && (cnt_sck == 2'd1))
        miso_flag   <=  1'b1;
    else
        miso_flag   <=  1'b0;

//data：拼接数据
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        data    <=  8'd0;
    else    if(miso_flag == 1'b1)
        data    <=  {data[6:0],miso};

//po_flag_reg:输出数据标志信号
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_flag_reg <=  1'b0;
    else    if((cnt_bit == 3'd7) && (miso_flag == 1'b1))
        po_flag_reg <=  1'b1;
    else
        po_flag_reg <=  1'b0;

//po_flag:输出数据标志信号
reg [2:0] counter;  // 3位计数器，用于计数 4 个周期

    always@(posedge sys_clk or  negedge sys_rst_n)begin
        if (!sys_rst_n) begin
            counter <= 3'd0;
            po_flag <= 0;
        end else begin
            if (po_flag_reg) begin
                // 当接收到脉冲信号时，启动计数器并输出脉冲
                counter <= 3'd1;
                po_flag <= 1;
            end else if (counter > 0 && counter < 3'd4) begin
                // 当计数器大于0且小于4时，继续输出脉冲
                counter <= counter + 1;
                po_flag <= 1;
            end else if (counter == 3'd4) begin
                // 当计数器达到4时，停止输出脉冲
                po_flag <= 0;
                counter <= 3'd0;  // 重置计数器
            end
        end
    end

//po_data:输出数据
always@(posedge sys_clk or  negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        po_data <=  8'd0;
    else    if(po_flag_reg == 1'b1)
        po_data <=  data;
    else
        po_data <=  po_data;


    assign tx_data = po_data;
    assign tx_flag = po_flag;

  ila_2 READ_ILA (
	.clk(ila_clk), // input wire clk
	.probe0({tx_data,tx_flag,state,sck,mosi,miso,cs_n}) // input wire [255:0] probe0
);


endmodule
