`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 10:22:25
// Design Name: 
// Module Name: top
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


module top(
    input      sys_clk_p,
    input      sys_clk_n,
    
    output     SFF_TX_DIS,
    
    input      refclk10g_p,
    input      refclk10g_n,
    output     txp10g,
    output     txn10g,
    input      rxp10g,
    input      rxn10g,
    
    output     user_sma_gpio_p,
    output     user_sma_gpio_n,

    output     si5338_scl,          //i2c clock
    inout      si5338_sda,          //i2c data
    output     Si5326_RSTn,
    //le
    output[3:0]led
    
    );

assign Si5326_RSTn = 1'b1;

parameter NTCPSTREAMS = 1;

//--// User controls
wire [128*NTCPSTREAMS-1 : 0] TCP_DEST_IP_ADDR;
wire [NTCPSTREAMS-1 : 0]     TCP_DEST_IPv4_6n;
wire [16*NTCPSTREAMS-1 : 0]  TCP_DEST_PORT;
wire [NTCPSTREAMS-1 : 0]     TCP_KEEPALIVE_EN;
    //-- enable TCP Keepalive (1) or not (0)

//--//-- Application <- UDP rx payload
(* MARK_DEBUG="true" *)wire [63:0]                  UDP_RX_DATA;
(* MARK_DEBUG="true" *)wire                         UDP_RX_DATA_VALID;
(* MARK_DEBUG="true" *)wire [7:0]                   UDP_RX_DATA_KEEP;
(* MARK_DEBUG="true" *)wire                         UDP_RX_SOF;    //-- start of UDP payload data field
(* MARK_DEBUG="true" *)wire                         UDP_RX_EOF;    //-- end of UDP frame
wire                         UDP_RX_FRAME_VALID;
    //-- check entire frame validity at UDP_RX_EOF
    //-- 1 CLK pulse indicating that UDP_RX_DATA is the last byte in the UDP payload data field.
    //-- ALWAYS CHECK UDP_RX_FRAME_VALID at the end of packet (UDP_RX_EOF = '1') to confirm
    //-- that the UDP packet is valid. External buffer may have to backtrack to the the last
    //-- valid pointer to discard an invalid UDP packet.
    //-- Reason: we only knows about bad UDP packets at the end.
wire [15:0]                  UDP_RX_DEST_PORT_NO_IN;
wire [15:0]                  UDP_RX_SOURCE_PORT_NO_IN;
wire                         CHECK_UDP_RX_DEST_PORT_NO;
    //-- check the destination port number matches UDP_RX_DEST_PORT_NO (1) or ignore it (0)
    //-- The latter case is useful when this component is shared among multiple UDP ports
wire [15:0]                  UDP_RX_DEST_PORT_NO_OUT;
    //-- Collected destination UDP port in received UDP frame. Read when APP_EOF = '1' 
        
//--//-- Application -> UDP tx
(* MARK_DEBUG="true" *)reg  [63:0]                  UDP_TX_DATA;
(* MARK_DEBUG="true" *)reg                          UDP_TX_DATA_VALID;
(* MARK_DEBUG="true" *)reg  [7:0]                   UDP_TX_DATA_KEEP;
(* MARK_DEBUG="true" *)reg                          UDP_TX_SOF; //-- 1 CLK-wide pulse to mark the first byte in the tx UDP frame
(* MARK_DEBUG="true" *)reg                          UDP_TX_EOF; //-- 1 CLK-wide pulse to mark the last byte in the tx UDP frame
(* MARK_DEBUG="true" *)wire                         UDP_TX_CTS; 
(* MARK_DEBUG="true" *)wire                         UDP_TX_ACK; //-- 1 CLK-wide pulse indicating that the previous UDP frame is being sent
(* MARK_DEBUG="true" *)wire                         UDP_TX_NAK; //-- 1 CLK-wide pulse indicating that the previous UDP frame could not be sent
wire [127:0]                 UDP_TX_DEST_IP_ADDR;
wire                         UDP_TX_DEST_IPv4_6n;
wire [15:0]                  UDP_TX_DEST_PORT_NO;
wire [15:0]                  UDP_TX_SOURCE_PORT_NO;
    //-- the IP and port information is latched in at the UDP_TX_SOF pulse.
    //-- USAGE: wait until the previous UDP tx frame UDP_TX_ACK or UDP_TX_NAK to send the follow-on UDP tx frame

//--//-- Application <- TCP rx
//-- NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
//-- Usage: application raises the Clear-To-Send flag for one CLK. If a 64-bit word is available to be read, it is
//-- placed in RX_APP_DATA with a latency of 2 CLKs. In this case RX_APP_DATA_VALID(I) = x"FF" indicating a data width of 8 bytes.
//-- The application can also request to 'peek' into the next 8-bytes in memory by raising RX_APP_PEEK_NEXT(I) for one CLK. 
//-- The data will also be placed in RX_APP_DATA and the width (which can be 1-8 bytes) will  be placed in RX_APP_DATA_VALID.
//-- Peeking does not advance the read pointer. It is mutually exclusive with a Clear-To-Send request. It has lower priority.
wire [16*NTCPSTREAMS-1 : 0]  TCP_LOCAL_PORTS;
    //-- TCP_CLIENTS ports configuration. Each one of the NTCPSTREAMS streams handled by this
    //-- component must be configured with a distinct port number. 
    //-- This value is used as destination port number to filter incoming packets, 
    //-- and as source port number in outgoing packets.
(* MARK_DEBUG="true" *)wire [64*NTCPSTREAMS-1 : 0]  TCP_RX_DATA;
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_RX_DATA_VALID;
(* MARK_DEBUG="true" *)wire [8*NTCPSTREAMS-1 : 0]   TCP_RX_DATA_KEEP;
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_RX_RTS; //-- Ready To Send
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_RX_CTS;
    //-- 1 CLK pulse to read the next (partial) word TCP_RX_DATA
    //-- Latency: 2 CLKs to TCP_RX_DATA, but only IF AND ONLY IF the next word has at least one available byte.
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_RX_CTS_ACK;
    //-- '1' the TCP_RX_CTS request for new data is accepted:
    //-- indicating that a new (maybe partial) word will be placed on the output TCP_RX_DATA at the next CLK.

//--//-- Application -> TCP tx
//-- NTCPSTREAMS can operate independently and concurrently. No scheduling arbitration needed here.
(* MARK_DEBUG="true" *)reg [64*NTCPSTREAMS-1 : 0]  TCP_TX_DATA;
(* MARK_DEBUG="true" *)reg [NTCPSTREAMS-1 : 0]     TCP_TX_DATA_VALID;
(* MARK_DEBUG="true" *)reg [8*NTCPSTREAMS-1 : 0]   TCP_TX_DATA_KEEP;
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_TX_DATA_FLUSH;
(* MARK_DEBUG="true" *)wire [NTCPSTREAMS-1 : 0]     TCP_TX_CTS;

wire coreclk;
wire corerst;

wire clk_50m;
wire clk_100m;
wire clk_20m;
wire locked;
(* MARK_DEBUG="true" *)wire sys_rstn ;

clk_wiz_0 clk_wiz_0(
    // Clock out ports
    .clk_out1(clk_50m),     // output clk_out1
    .clk_out2(clk_100m),     // output clk_out2
    .clk_out3(clk_20m),     // output clk_out3
    // Status and control signals
    .locked(locked),      // output locked
    // Clock in ports
    .clk_in1_p(sys_clk_p),    // input clk_in1
    .clk_in1_n(sys_clk_n)    // input clk_in1
    ); 

assign sys_rstn = locked ;//& ~vio_rst;


assign UDP_RX_DEST_PORT_NO_IN = 16'h0400;//-- looking for UDP rx port 1024 only
assign UDP_RX_SOURCE_PORT_NO_IN = 16'h0400;
assign CHECK_UDP_RX_DEST_PORT_NO = 1'b1;

assign UDP_TX_DEST_IP_ADDR = {96'd0,32'hC0A8020D};// 192.168.2.13
assign UDP_TX_DEST_IPv4_6n = 1'b1;
assign UDP_TX_DEST_PORT_NO = 16'h0400;
assign UDP_TX_SOURCE_PORT_NO = 16'h0400;

assign TCP_LOCAL_PORTS[15:0] = 16'd4660;

//////// second //////
//assign TCP_LOCAL_PORTS[31:16] = 16'h0401;

wire clk_out;
wire userclk;
wire userclk_g;
/*
IBUFDS_GTE2 ibufgte
    (
      .O(userclk),
      .ODIV2(),
      .CEB(1'b0),
      .I(refclk10g_p),
      .IB(refclk10g_n)
    ); 
*/
BUFG BUFG_inst(.I(coreclk), .O(userclk_g));

/*
ODDR ODDR_inst1 (
.Q(clk_out), // 1-bit DDR output
.C(userclk_g), // 1-bit clock input
.CE(1'b1), // 1-bit clock enable input
.D1(1'b1), // 1-bit data input (positive edge)
.D2(1'b0) // 1-bit data input (negative edge)
);
*/
 /*  OBUFDS #(
      .IOSTANDARD("LVDS_25"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_inst (
      .O(user_sma_gpio_p),     // Diff_p output (connect directly to top-level port)
      .OB(user_sma_gpio_n),   // Diff_n output (connect directly to top-level port)
      .I(userclk_g)      // Buffer input
   );
*/
OBUF OBUF_inst1 (
    .I(clk_100m),
    .O(user_sma_gpio_p)
);
OBUF OBUF_inst2 (
    .I(clk_100m),
    .O(user_sma_gpio_n)
); 

wire start;
wire vio_rst;
vio_0 vio_0(
   .clk(clk_100m),

   .probe_out0(start),
   .probe_out1(vio_rst)
);


//assign user_sma_gpio_p = 1'b1;
//assign user_sma_gpio_n = 1'b1;
    
network_top #(
    .NTCPSTREAMS(NTCPSTREAMS)
) network_top(
    .sys_rst(~sys_rstn),
    .clk_100m(clk_100m),
    .coreclk(coreclk),
    .corerst(corerst),
    .trig_in(ser_sma_gpio_p),
    
    .refclk10g_p(refclk10g_p),
    .refclk10g_n(refclk10g_n),
    .txp10g(txp10g),
    .txn10g(txn10g),
    .rxp10g(rxp10g),
    .rxn10g(rxn10g),
    .SFF_TX_DIS(SFF_TX_DIS),    
    
    //--//-- Application <- UDP rx payload
    .UDP_RX_DATA(UDP_RX_DATA),
    .UDP_RX_DATA_VALID(UDP_RX_DATA_VALID),
    .UDP_RX_DATA_KEEP(UDP_RX_DATA_KEEP),
    .UDP_RX_SOF(UDP_RX_SOF),      
    .UDP_RX_EOF(UDP_RX_EOF),     
    .UDP_RX_FRAME_VALID(UDP_RX_FRAME_VALID),
    .UDP_RX_DEST_PORT_NO_IN(UDP_RX_DEST_PORT_NO_IN),
    .UDP_RX_SOURCE_PORT_NO_IN(UDP_RX_SOURCE_PORT_NO_IN),
    .CHECK_UDP_RX_DEST_PORT_NO(CHECK_UDP_RX_DEST_PORT_NO),
    .UDP_RX_DEST_PORT_NO_OUT(UDP_RX_DEST_PORT_NO_OUT),
            
    //--//-- Application -> UDP tx
    .UDP_TX_DATA(UDP_TX_DATA),
    .UDP_TX_DATA_VALID(UDP_TX_DATA_VALID),
    .UDP_TX_DATA_KEEP(UDP_TX_DATA_KEEP),
    .UDP_TX_SOF(UDP_TX_SOF),    
    .UDP_TX_EOF(UDP_TX_EOF),    
    .UDP_TX_CTS(UDP_TX_CTS),
    .UDP_TX_ACK(UDP_TX_ACK),    
    .UDP_TX_NAK(UDP_TX_NAK),    
    .UDP_TX_DEST_IP_ADDR(UDP_TX_DEST_IP_ADDR),
    .UDP_TX_DEST_IPv4_6n(UDP_TX_DEST_IPv4_6n),
    .UDP_TX_DEST_PORT_NO(UDP_TX_DEST_PORT_NO),
    .UDP_TX_SOURCE_PORT_NO(UDP_TX_SOURCE_PORT_NO),
    
    //--//-- Application <- TCP rx
    .TCP_LOCAL_PORTS(TCP_LOCAL_PORTS),
    .TCP_RX_DATA(TCP_RX_DATA),
    .TCP_RX_DATA_VALID(TCP_RX_DATA_VALID),
    .TCP_RX_DATA_KEEP(TCP_RX_DATA_KEEP),
    .TCP_RX_RTS(TCP_RX_RTS),    
    .TCP_RX_CTS(TCP_RX_CTS),
    .TCP_RX_CTS_ACK(TCP_RX_CTS_ACK),
    
    //--//-- Application -> TCP tx
    .TCP_TX_DATA(TCP_TX_DATA),
    .TCP_TX_DATA_VALID(TCP_TX_DATA_VALID),
    .TCP_TX_DATA_KEEP(TCP_TX_DATA_KEEP),
    .TCP_TX_DATA_FLUSH(TCP_TX_DATA_FLUSH),
    .TCP_TX_CTS(TCP_TX_CTS)
    );    


////////////////////////////////////// test /////////////////////////////////////////

//assign UDP_TX_DATA = UDP_RX_DATA;   
//assign UDP_TX_DATA_VALID = UDP_RX_DATA_VALID; 
//assign UDP_TX_DATA_KEEP = UDP_RX_DATA_KEEP;    
//assign UDP_TX_SOF = UDP_RX_SOF;
//assign UDP_TX_EOF = UDP_RX_EOF; 
/*
assign TCP_TX_DATA[63:0] = TCP_RX_DATA[63:0];
assign TCP_TX_DATA_VALID[0] = TCP_RX_DATA_VALID[0];
assign TCP_TX_DATA_KEEP[7:0] = TCP_RX_DATA_KEEP[7:0];
assign TCP_TX_DATA_FLUSH[0] = 1'b0;
assign TCP_RX_CTS[0] = 1'b1; //TCP_TX_CTS[0];
*/
/*
assign TCP_TX_DATA[127:64] = TCP_RX_DATA[127:64];
assign TCP_TX_DATA_VALID[1] = TCP_RX_DATA_VALID[1];
assign TCP_TX_DATA_KEEP[15:8] = TCP_RX_DATA_KEEP[15:8];
assign TCP_TX_DATA_FLUSH[1] = 1'b0;
assign TCP_RX_CTS[1] = 1'b1;//TCP_TX_CTS[1];
*/
//wire start;
//wire vio_rst;
//vio_0 vio_0(
//    .clk(coreclk),

//    .probe_out0(start),
//    .probe_out1(vio_rst)
//);

localparam tx_length = 16'd128;//
reg [15:0] tx_num;
always @(posedge coreclk or posedge corerst)
   begin
   if(corerst)begin
       UDP_TX_DATA <= 64'd0;
       UDP_TX_DATA_KEEP <= 8'h00;
       UDP_TX_DATA_VALID <= 1'b0;
       UDP_TX_SOF <= 1'b0;
       UDP_TX_EOF <= 1'b0;
       tx_num <= 16'd0;
   end else if(UDP_TX_CTS & tx_num == 16'd0)begin
       UDP_TX_DATA <= UDP_TX_DATA + 1'b1;
       UDP_TX_DATA_KEEP <= 8'hff;
       UDP_TX_DATA_VALID <= 1'b1;
       UDP_TX_SOF <= 1'b1;
       UDP_TX_EOF <= 1'b0;
       tx_num <= tx_num + 1'b1;
   end else if(UDP_TX_CTS & tx_num < tx_length - 1)begin
       UDP_TX_DATA <= UDP_TX_DATA + 1'b1;
       UDP_TX_DATA_KEEP <= 8'hff;
       UDP_TX_DATA_VALID <= 1'b1;
       UDP_TX_SOF <= 1'b0;
       UDP_TX_EOF <= 1'b0;
       tx_num <= tx_num + 1'b1;
   end else if(UDP_TX_CTS & tx_num == tx_length - 1)begin
       UDP_TX_DATA <= UDP_TX_DATA + 1'b1;
       UDP_TX_DATA_KEEP <= 8'hff;
       UDP_TX_DATA_VALID <= 1'b1;
       UDP_TX_SOF <= 1'b0;
       UDP_TX_EOF <= 1'b1;
       tx_num <= tx_num + 1'b1;
   end else if(UDP_TX_CTS & tx_num >= tx_length)begin
       UDP_TX_DATA <= 64'd0;
       UDP_TX_DATA_KEEP <= 8'h00;
       UDP_TX_DATA_VALID <= 1'b0;
       UDP_TX_SOF <= 1'b0;
       UDP_TX_EOF <= 1'b0;
       tx_num <= 16'd0;
   end else begin
       UDP_TX_DATA <= UDP_TX_DATA;
       UDP_TX_DATA_KEEP <= 8'h00;
       UDP_TX_DATA_VALID <= 1'b0;
       UDP_TX_SOF <= 1'b0;
       UDP_TX_EOF <= 1'b0;
       tx_num <= tx_num;
   end
   end
/*
always @(posedge coreclk or posedge corerst)
    begin
        if(corerst)begin
            UDP_TX_DATA <= 64'd0;
            UDP_TX_DATA_VALID <= 1'b0;
            UDP_TX_DATA_KEEP <= 8'd0;
            UDP_TX_SOF <= 1'b0;
            UDP_TX_EOF <= 1'b0;
        end else if(UDP_TX_CTS == 1'b1)begin
            UDP_TX_DATA <= UDP_RX_DATA;
            UDP_TX_DATA_VALID <= UDP_RX_DATA_VALID;
            UDP_TX_DATA_KEEP <= UDP_RX_DATA_KEEP;
            UDP_TX_SOF <= UDP_RX_SOF;
            UDP_TX_EOF <= UDP_RX_EOF;
        end else begin
            UDP_TX_DATA <= 64'd0;
            UDP_TX_DATA_VALID <= 1'b0;
            UDP_TX_DATA_KEEP <= 8'd0;
            UDP_TX_SOF <= 1'b0;
            UDP_TX_EOF <= 1'b0;
        end
    end
    */
genvar i;
generate for (i = 0 ; i < NTCPSTREAMS ; i = i + 1)   
begin : TCP_DATA

always @(posedge coreclk or posedge corerst)
   begin
       if(corerst)begin
           TCP_TX_DATA[64*i +: 64] <= 64'd0;
           TCP_TX_DATA_VALID[i] <= 1'b0;
           TCP_TX_DATA_KEEP[8*i +: 8] <= 8'd0;
       end else if(TCP_TX_CTS[i] == 1'b1 & start)begin
           TCP_TX_DATA[64*i +: 64] <= TCP_TX_DATA[64*i +: 64] + 1'b1;
           TCP_TX_DATA_VALID[i] <= 1'b1;
           TCP_TX_DATA_KEEP[8*i +: 8] <= 8'hff;
       end else begin
           TCP_TX_DATA[64*i +: 64] <= TCP_TX_DATA[64*i +: 64];
           TCP_TX_DATA_VALID[i] <= 1'b0;
           TCP_TX_DATA_KEEP[8*i +: 8] <= 8'hff;
       end
   end

assign TCP_TX_DATA_FLUSH[i] = 1'b0;
assign TCP_RX_CTS[i] = 1'b1;

end
endgenerate
/*
wire si5338_done;
si5338# 
(
    .kInitFileName              ("si5338_i4_50_200_156_156_100.mif"            ),
    .input_clk                  (100000000                ),
    .i2c_address                (7'b1110000              ), 
    .bus_clk                    (400000                   )
)
si5338_inst(
    .clk                        (clk_100m                 ),
    .reset                      (1'b0                     ),
    .done                       (si5338_done              ),
    .error                      (                         ),
    .SCL                        (si5338_scl               ),
    .SDA                        (si5338_sda               )
    );
*/

IIC_TOP IIC_TOP (
  .CLK         (clk_20m    ), //CLK), //ilaClk),                  // input wire clk
  //.trig_in    (go_1        ),
  //.trig_in_ack(          ), // output wire trig_in_ack
  .RST_N       (1'b1),
  .CLK_LOCKED  (    ),
  .IIC_SCL     (si5338_scl    ), // input wire [30 : 0] probe0
  .IIC_SDA     (si5338_sda    )
);

////LED
//reg [23:0] led_cnt;
//always @(posedge clk_100m or negedge locked) 
//begin 
//  if (~locked)
//      led_cnt <= {24{1'b0}};
//  else 
//      led_cnt <= led_cnt + 1'b1;  
//end   

//assign led[0] = led_cnt[23] ;
//assign led[1] = led_cnt[23] ;
//assign led[2] = led_cnt[23] ;
//assign led[3] = led_cnt[23] ;

reg [31:0]rx_cnt;
reg [31:0]tx_cnt;
reg UDP_TX_EOF_dly;
reg UDP_RX_EOF_dly;
always @(posedge coreclk or posedge corerst) 
begin 
if(corerst)begin
    UDP_TX_EOF_dly <= 1'b0;
    UDP_RX_EOF_dly <= 1'b0;
    rx_cnt <= 32'd0;
    tx_cnt <= 32'd0;    
end else begin
    UDP_TX_EOF_dly <= UDP_TX_EOF;
    UDP_RX_EOF_dly <= UDP_RX_EOF;
    if(UDP_RX_EOF_dly == 'd0 & UDP_RX_EOF)begin
        rx_cnt <= 32'd0;
    end else if(rx_cnt< 32'h100_0000)begin
        rx_cnt <= rx_cnt + 1'b1;
    end else begin
        rx_cnt <= rx_cnt;
    end
    if(UDP_TX_EOF_dly == 'd0 & UDP_TX_EOF)begin
        tx_cnt <= 32'd0;
    end else if(tx_cnt< 32'h100_0000)begin
        tx_cnt <= tx_cnt + 1'b1;
    end else begin
        tx_cnt <= tx_cnt;
    end      
end
end

assign led[0] = 1'b0 ;
assign led[1] = rx_cnt[23] ;
assign led[2] = 1'b0 ;
assign led[3] = tx_cnt[23] ;
    
endmodule

