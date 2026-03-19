`timescale 1ns / 1ps



module icap_start(
    input                   sclk            ,
    input                   rst_n           ,
    input   [31:0]          jump_addr       , // 新增：从外部传入跳转地址
    input                   icap_flag       ,
    output  reg             icap_done 
);
 
    //========================================================================================\
    //**************Define Parameter and  Internal Signals**********************************
    //========================================================================================/
    reg                        csib   = 1'b1;
    reg                 [31:0]  con_data [ 7:0] ;
    wire                [31:0]  con_data_r      ;
    reg                 [ 2:0]  cnt             ;
    reg                         busy_flag       ;
    reg                         rdwrb    = 1'b1 ;
     
    //========================================================================================\
    //**************     Main      Code        **********************************
    //========================================================================================/
    always @(*) begin
        con_data[0]             =       32'hFFFF_FFFF;
        con_data[1]             =       32'hAA99_5566;
        con_data[2]             =       32'h2000_0000;
        con_data[3]             =       32'h3002_0001;
        con_data[4]             =       jump_addr;       //32'h00B0_0000;        //update address
        con_data[5]             =       32'h3000_8001;
        con_data[6]             =       32'h0000_000F;
        con_data[7]             =       32'h2000_0000;
    end
         
    assign      con_data_r      =       {con_data[cnt][24],con_data[cnt][25],con_data[cnt][26],con_data[cnt][27],con_data[cnt][28],con_data[cnt][29],
                                         con_data[cnt][30],con_data[cnt][31],con_data[cnt][16],con_data[cnt][17],con_data[cnt][18],con_data[cnt][19],
                                         con_data[cnt][20],con_data[cnt][21],con_data[cnt][22],con_data[cnt][23],con_data[cnt][08],con_data[cnt][09],
                                         con_data[cnt][10],con_data[cnt][11],con_data[cnt][12],con_data[cnt][13],con_data[cnt][14],con_data[cnt][15],
                                         con_data[cnt][00],con_data[cnt][01],con_data[cnt][02],con_data[cnt][03],con_data[cnt][04],con_data[cnt][05],
                                         con_data[cnt][06],con_data[cnt][07]};
    
    always @(posedge sclk or negedge rst_n)
        if(rst_n == 1'b0)
            busy_flag           <=      1'b0;
        else if(icap_flag == 1'b1 && busy_flag == 1'b0)
            busy_flag           <=      1'b1; 
        else if(cnt == 3'd7 && rdwrb == 1'b0)
            busy_flag           <=      1'b0;
        else
            busy_flag           <=      busy_flag;

    
    always @(posedge sclk or negedge rst_n)
        if(rst_n == 1'b0)
            cnt                 <=      3'd0;
        else if(busy_flag == 1'b1 && rdwrb == 1'b0)            
            cnt                 <=      cnt + 1'b1;
        else if(cnt == 3'd7 && rdwrb == 1'b0)
            cnt                 <=      3'd0;
        else
            cnt                 <=      cnt;
    
    
    always @(posedge sclk or negedge rst_n)
        if(rst_n == 1'b0)
            icap_done           <=      1'b0;        
        else if(cnt == 3'd7 && rdwrb == 1'b0)
            icap_done           <=      1'b1;
        else
            icap_done           <=      1'b0;
    
              
    always @(posedge sclk or negedge rst_n)  begin
        if(rst_n == 1'b0)  begin  
            rdwrb               <=      1'b1; 
            csib                <=      1'b1;
        end
        else if(cnt == 3'd7 && rdwrb == 1'b0) begin
            rdwrb               <=      1'b1;
            csib                <=      1'b1; 
        end     
        else if(busy_flag == 1'b1)  begin                //只有在忙得时候才给O
            rdwrb               <=      1'b0;
            csib                <=      1'b0;
         end
        else
            rdwrb               <=      rdwrb;

    end


    ICAPE2 #(
      .DEVICE_ID(32'h3651093),     // Specifies the pre-programmed Device ID value to be used for simulation
                                  // purposes.
      .ICAP_WIDTH("X32"),         // Specifies the input and output data width.
      .SIM_CFG_FILE_NAME("NONE")  // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation
                                  // model.
   )
   ICAPE2_test_inst (
      .O(),         // 32-bit output: Configuration data output bus
      .CLK(sclk),     // 1-bit input: Clock Input
      .CSIB(csib),   // 1-bit input: Active-Low ICAP Enable
      .I(con_data_r),         // 32-bit input: Configuration data input bus
      .RDWRB(rdwrb)  // 1-bit input: Read/Write Select input
   );



endmodule
