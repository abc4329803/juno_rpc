`timescale 1ns / 1ps

/////////////
// When Read_Usr_Addr=0, Read_Usr_Cmd=8'h9F, MISO shows the normal Manufacturer and device ID by manual decoding
// But DATA_OUT shows wrong decoding
module read_write_flash#(
    parameter [31:0] bit_to_read = 32'h1
) (

    input sys_clk,
    input rst_n,
    input Read_tx_en,                         
    input MISO,

    input [31:0] Read_Usr_Addr,
    input [7:0]  Read_Usr_Cmd,
    
    input Write_tx_en,
    //input Write_en,

    input [31:0] Write_Usr_Addr,
    input [7:0] Write_Usr_Cmd,
    input [2047:0] Write_Usr_Data,

    input Erase_en,

    input [31:0] Erase_Usr_Addr,
    input [7:0] Erase_Usr_cmd,
    

    output reg CS,
    output reg SCK,
    output reg MOSI,
    output reg [7:0] DATA_OUT,
    output reg [7:0] sr1_status,

    output reg Read_Cmd_Send_Ok,
    output reg Read_Addr_Send_Ok,
    output reg Read_Data_Ok,

    output reg Write_Cmd_Send_Ok,
    output reg Write_Addr_Send_Ok,
    output reg Write_Data_Ok,
    output reg Write_Enable_Ok,
    output reg Erase_enable_Ok,

    output reg Erase_Ok

    );
    
    //  ?????бу??????иж????????
    //reg [5:0] cnt;   // for reading
    reg [31:0] cnt;   // for reading
    reg [11:0] cnt1; // for writing

    reg Write_tx_en_dly1;
    reg Write_tx_en_dly2;

    wire Write_tx_en_pos;
    reg Write_tx_en_pos_dly;

    wire [31:0] cnt_to_read;
    assign cnt_to_read  = (bit_to_read) - 1;

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            Write_tx_en_dly1 <= 1'b0;
            Write_tx_en_dly2 <= 1'b0;
        end
        else begin
            {Write_tx_en_dly2, Write_tx_en_dly1} <= {Write_tx_en_dly1, Write_tx_en};
        end
    end

    assign Write_tx_en_pos = ~Write_tx_en_dly2 & Write_tx_en_dly1;

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            Write_tx_en_pos_dly <= 1'b0;
        end
        else begin
            Write_tx_en_pos_dly <= Write_tx_en_pos;
        end
    end
/*
    ila_8 ila8(
     .clk(sys_clk),
     .probe0(Write_tx_en),
     .probe1(Write_Usr_Addr),
     .probe2(Write_Usr_Cmd),
     .probe3(Erase_Usr_cmd),
     .probe4(Write_Cmd_Send_Ok),
     .probe5(Write_Addr_Send_Ok),
     .probe6(Write_Data_Ok),
     .probe7(sr1_status),
     .probe8(MOSI),
     .probe9(MISO),
     .probe10(CS),
     .probe11(SCK),
     .probe12(Read_tx_en),
     .probe13(Read_Usr_Cmd),
     .probe14(Read_Usr_Addr),
     .probe15(Read_Data_Ok),
     .probe16(DATA_OUT),
     .probe17(Read_Cmd_Send_Ok),
     .probe18(Read_Addr_Send_Ok),
     .probe19(Erase_en)
    );

    ila_1 ila8(
     .clk(sys_clk),
     .probe0(MISO),
     .probe1(MOSI),
     .probe2(CS),
     .probe3(SCK),
     .probe4(DATA_OUT),
     .probe5(Current_State),
     .probe6(Read_tx_en)
    );*/
    //  ?????бу??????иж????????
    reg tx_en_dly1;
    reg tx_en_dly2;

    wire tx_en_pos;
    reg tx_en_pos_dly;

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            tx_en_dly1 <= 1'b0;
            tx_en_dly2 <= 1'b0;
        end
        else begin
            {tx_en_dly2, tx_en_dly1} <= {tx_en_dly1, Read_tx_en};
        end
    end

    assign tx_en_pos = ~tx_en_dly2 & tx_en_dly1;

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            tx_en_pos_dly <= 1'b0;
        end
        else begin
            tx_en_pos_dly <= tx_en_pos;
        end
    end

    // ???иж?бш??????
    reg [1:0] Erase_en_dly;
    reg Erase_en_pos_dly;
    wire Erase_en_pos;
    reg [7:0] erase_wait_cnt;
    reg [7:0] Enable_Data;

    assign Erase_en_pos = ~Erase_en_dly[1] & Erase_en_dly[0];

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            Erase_en_dly <= 2'd0;
        end
        else begin
            Erase_en_dly[1:0] <= {Erase_en_dly[0], Erase_en};
            Erase_en_pos_dly <= Erase_en_pos;
        end
    end
    

   
    reg [20:0] Current_State = 21'd0;
    reg [20:0] Next_State;

    parameter READY =       21'b0_0000_0000_0000_0000_0000;
    parameter READ_CMD =    21'b0_0000_0000_0000_0000_0001;
    parameter READ_ADDR =   21'b0_0000_0000_0000_0000_0010;
    parameter READ_DATA =   21'b0_0000_0000_0000_0000_0100;
    parameter READ_FINISH = 21'b0_0000_0000_0000_0000_1000;
 
    parameter WRITE_READY =  21'b0_0000_1000_0000_0000_0000;
    parameter WRITE_CMD =    21'b0_0000_0000_0000_0001_0000;
    parameter WRITE_ADDR =   21'b0_0000_0000_0000_0010_0000;
    parameter WRITE_DATA =   21'b0_0000_0000_0000_0100_0000;
    parameter WRITE_FINISH = 21'b0_0000_0000_0000_1000_0000;
    
    parameter WRITE_ENABLE = 21'b0_0000_0000_0001_0000_0000;
    parameter WRITE_OVER =   21'b0_0000_0000_0010_0000_0000;

   
    parameter ERASE_ENABLE = 21'b0_0000_0000_0100_0000_0000;
    parameter ERASE_OVER =   21'b0_0000_0000_1000_0000_0000;
    parameter ERASE_READY =  21'b0_0001_0000_0000_0000_0000;
    parameter ERASE_CMD =    21'b0_0000_0001_0000_0000_0000;
    parameter ERASE_ADDR =   21'b0_0000_0010_0000_0000_0000;
    parameter ERASE_FINISH = 21'b0_0000_0100_0000_0000_0000;

    parameter READ_SR1_CMD =  21'b0_0010_0000_0000_0000_0000;
    parameter READ_SR1_DATA = 21'b0_0100_0000_0000_0000_0000;
    parameter READ_SR1_OVER = 21'b0_1000_0000_0000_0000_0000;
    parameter READ_SR1_WAIT = 21'b1_0000_0000_0000_0000_0000;

    reg [7:0] sr1_data = 8'h05;

    always @(posedge sys_clk) begin
        if (!rst_n) begin
            Current_State <= READY;
        end
        else begin
            Current_State <= Next_State;
        end
    end


    always @(*) begin
        case (Current_State) 
            READY:begin
                if (tx_en_pos_dly) begin             
                    Next_State <= READ_CMD;
                end
                else if (Write_tx_en_pos_dly) begin  
                    Next_State <= WRITE_ENABLE;
                end
                else if (Erase_en_pos_dly) begin     
                    Next_State <= ERASE_ENABLE;
                end
                else begin
                    Next_State <= READY;
                end
            end
            READ_CMD:begin
                if (cnt <= 5'd6) begin
                    Next_State <= READ_CMD;
                end
                else begin
                    Next_State <= READ_ADDR;
                end
            end
            READ_ADDR:begin
                if (cnt <= 5'd31) begin
                    Next_State <= READ_ADDR;
                end
                else begin
                    Next_State <= READ_DATA;
                end
            end
            READ_DATA:begin
                //if (cnt <= 5'd7) begin
                if (cnt <= cnt_to_read) begin
                    Next_State <= READ_DATA;
                end
                else begin
                    Next_State <= READ_FINISH;
                end
            end
            READ_FINISH:begin
                Next_State <= READY;
            end
            WRITE_ENABLE:begin
                if (cnt <= 5'd6) begin
                    Next_State <= WRITE_ENABLE;
                end
                else begin
                    Next_State <= WRITE_OVER;
                end
            end
            WRITE_OVER:begin
                   Next_State <= WRITE_READY;
            end
            WRITE_READY:begin
                   Next_State <= WRITE_CMD;
            end
            WRITE_CMD:begin
                if (cnt <= 5'd6) begin
                    Next_State <= WRITE_CMD;
                end
                else begin
                    Next_State <= WRITE_ADDR;
                end
            end
            WRITE_ADDR:begin
                if (cnt <= 5'd31) begin
                   Next_State <= WRITE_ADDR;
                end
                else begin
                   Next_State <= WRITE_DATA;
                end
            end
            WRITE_DATA:begin
                if (cnt1 <= 12'd2047) begin
                   Next_State <= WRITE_DATA;
                end
                else begin
                   Next_State <= WRITE_FINISH;
                end
            end
            WRITE_FINISH:begin
               Next_State <= READY;
            end
            //???иж?бш??бу??????иж?????
            ERASE_ENABLE: begin
                if (cnt <= 5'd6)begin
                   Next_State <= ERASE_ENABLE;
                end
                else begin
                   Next_State <= ERASE_OVER;
                end
            end
            ERASE_OVER: begin
                Next_State <= ERASE_READY;
            end
            ERASE_READY:begin
                Next_State <= ERASE_CMD;
            end
            ERASE_CMD:begin
                if (cnt <= 5'd6) begin
                   Next_State <= ERASE_CMD;
                end
                else begin
                   Next_State <= ERASE_ADDR;
                end
            end
            ERASE_ADDR:begin
                if (cnt <= 5'd31) begin
                    Next_State <= ERASE_ADDR;
                end
                else begin
                   Next_State <= ERASE_FINISH;
                end
            end
            ERASE_FINISH:begin
               Next_State <= READ_SR1_WAIT;
            end
            READ_SR1_WAIT:begin
               Next_State <= READ_SR1_CMD;
            end
            READ_SR1_CMD:begin
                if (cnt <= 5'd6) begin
                   Next_State <= READ_SR1_CMD;
                end
                else begin
                   Next_State <= READ_SR1_DATA;
                end
            end
            READ_SR1_DATA:begin
                if (cnt <= 5'd7) begin
                   Next_State <= READ_SR1_DATA;
                end
                else begin
                   Next_State <= READ_SR1_OVER;
                end
            end
            READ_SR1_OVER:begin
                if (sr1_status[0] == 1'b0 && sr1_status[6] == 1'b0) begin //??????
                   Next_State <= READY;
                end
                else begin
                   Next_State <= READ_SR1_CMD;
                end
            end

        endcase
    end


    always @(posedge sys_clk) begin
        if (!rst_n) begin
            CS <= 1'b1;
            MOSI <= 1'b0;
            cnt <= 'd0;
            cnt1 <= 12'd0;
            erase_wait_cnt <= 8'd0;
            Read_Cmd_Send_Ok <= 1'b0;
            Read_Addr_Send_Ok <= 1'b0;     //???иж????????
            Read_Data_Ok <= 1'b0;
            Write_Cmd_Send_Ok <= 1'b0;
            Write_Addr_Send_Ok <= 1'b0;
            Write_Data_Ok <= 1'b0;
            Write_Enable_Ok <= 1'b0;
            Erase_enable_Ok <= 1'b0;
            Erase_Ok <= 1'b0;
            Enable_Data <= 8'h06;
            sr1_data <= 8'h05; 
            sr1_status <= 8'hff;
        end
        else begin
            case (Current_State) 
                READY:begin
                    Erase_Ok <= 1'b0;
                    if (tx_en_pos_dly) begin                  
                        CS <= 1'b0;
                        MOSI <= Read_Usr_Cmd[7];
                    end
                    else if (Write_tx_en_pos_dly) begin        
                        CS <= 1'b0;
                        MOSI <= Enable_Data[7];                
                    end
                    else if (Erase_en_pos_dly) begin            
                        CS <= 1'b0;
                        MOSI <= Enable_Data[7];
                    end
                    else begin
                         CS <= 1'b1;
                    end
                end
                READ_CMD:begin
                    if (cnt <= 5'd6) begin
                        if (SCK) begin
                            MOSI <= Read_Usr_Cmd[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                        Read_Cmd_Send_Ok <= 1'b1;
                    end
                end
                READ_ADDR:begin
                    Read_Cmd_Send_Ok <= 1'b0;
                    if (cnt <= 5'd31) begin
                        if (SCK) begin
                            MOSI <= Read_Usr_Addr[31-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                        Read_Addr_Send_Ok <= 1'b1;
                    end
                end
                READ_DATA:begin
                    Read_Addr_Send_Ok <= 1'b0;
                    //if (cnt <= 5'd7) begin
                    if (cnt <= cnt_to_read ) begin
                        if (!SCK) begin
                            DATA_OUT[7-cnt[2:0]] <= MISO;
                            cnt <= cnt + 1'b1;
                            Read_Data_Ok <= 1'b0;
                        end
                        else begin
                            if(cnt > 7 & cnt[2:0] == 0) begin
                                Read_Data_Ok <= 1'b1;
                            end else begin
                                Read_Data_Ok <= 1'b0;
                            end
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                        Read_Data_Ok <= 1'b1;
                    end
                end
                READ_FINISH:begin
                    Read_Data_Ok <= 1'b0;
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                end
                //  ???  ?????????
                WRITE_ENABLE:begin
                    if (cnt <= 5'd6) begin
                        if (SCK) begin
                            MOSI <= Enable_Data[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        Write_Enable_Ok <= 1'b1;
                        cnt <= 'd0;
                    end
                end
                WRITE_OVER:begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    Write_Enable_Ok <= 1'b0;
                end
                //  ?????бу??????иж?????
                WRITE_READY:begin
                    CS <= 1'b0;
                    MOSI <= Write_Usr_Cmd[7];
                end
                WRITE_CMD:begin
                    if (cnt <= 5'd6) begin
                        if (SCK) begin
                            MOSI <= Write_Usr_Cmd[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                       cnt <= 'd0;
                       Write_Cmd_Send_Ok <= 1'b1;
                    end
                end
                WRITE_ADDR:begin
                    Write_Cmd_Send_Ok <= 1'b0;
                    if (cnt <= 5'd31) begin
                        if (SCK) begin
                            MOSI <= Write_Usr_Addr[31-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                        Write_Addr_Send_Ok <= 1'b1;
                    end
                end
                WRITE_DATA:begin
                    Write_Addr_Send_Ok <= 1'b0;
                    if (cnt1 <= 12'd2047) begin
                        if (SCK) begin
                            MOSI <= Write_Usr_Data[2047-cnt1];
                            cnt1 <= cnt1 + 1'b1;
                        end
                        else begin
                            cnt1 <= cnt1;
                        end
                    end
                    else begin
                    cnt1 <= 12'd0;
                       Write_Data_Ok <= 1'b1;
                    end
                end
                WRITE_FINISH:begin
                    Write_Data_Ok <= 1'b0;
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                end
                //???иж?бш??бу??????иж?????
                ERASE_ENABLE: begin
                    if (cnt <= 5'd6)begin
                        if (SCK) begin
                            MOSI <= Enable_Data[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                        Erase_enable_Ok <= 1'b1;
                    end
                end
                ERASE_OVER: begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                    Erase_enable_Ok <= 1'b0;
                end
                ERASE_READY:begin
                    CS <= 1'b0;
                    MOSI <= Erase_Usr_cmd[7];
                end
                ERASE_CMD:begin
                    if (cnt <= 5'd6) begin
                        if (SCK) begin
                            MOSI <= Erase_Usr_cmd[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                    end
                end
                ERASE_ADDR:begin
                    if (cnt <= 5'd31) begin
                        if (SCK) begin
                            MOSI <= Erase_Usr_Addr[31-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                    end
                end
                ERASE_FINISH:begin
                    CS <= 1'b1;
                    MOSI <= 1'b0;
                end
                READ_SR1_WAIT:begin
                    CS <= 1'b0;
                    MOSI <= sr1_data[7];
                end
                READ_SR1_CMD:begin
                    CS <= 1'b0;
                    if (cnt <= 5'd6) begin
                        if (SCK) begin
                            MOSI <= sr1_data[6-cnt];
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                    end
                end
                READ_SR1_DATA:begin
                    if (cnt <= 5'd7) begin
                        if (!SCK) begin
                            sr1_status[7-cnt] <= MISO;
                            cnt <= cnt + 1'b1;
                        end
                        else begin
                            cnt <= cnt;
                        end
                    end
                    else begin
                        cnt <= 'd0;
                    end
                end
                READ_SR1_OVER:begin
                    CS <= 1'b0;
                    MOSI <= 1'b0;
                    if (sr1_status[0] == 1'b0 && sr1_status[6] == 1'b0) begin //??????
                        Erase_Ok <= 1'b1;
                        sr1_status <= 8'hff;
                    end
                    else begin
                        Erase_Ok <= 1'b0;
                    end
                end
            endcase
        end
    end


    


    reg [7:0] data_write;

    always @(posedge sys_clk) begin
        if (!CS) begin
            SCK <= ~SCK;
        end
        else begin
            SCK <= 1'b0;
        end
        if(cnt1[2:0] == 3'h7 & WRITE_DATA == Current_State) begin
            data_write <= Write_Usr_Data[(2047-cnt1)+:8];
        end
    end


endmodule