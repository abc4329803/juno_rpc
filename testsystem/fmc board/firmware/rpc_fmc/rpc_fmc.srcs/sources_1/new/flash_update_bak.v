 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ningzhe@ihep.ac.cn
// 
// Create Date: 2023/11/08 20:40:56
// Design Name: 
// Module Name: flash_update
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

module flash_update#(
    //parameter [31:0] main_firmware_flash_address = 32'h0040_0000,
    parameter [31:0] bit_to_read = 32'h1
)(
    input       wire            user_clk, // SiTCP RBCP clock
    input       wire            sys_clk,  // flash update module system clock
    output      reg             rst_n,
    output      wire            CS,
    input       wire            MISO,
    output      wire            MOSI,
    output      wire            WRITE_PROTECT_n,
    output      wire            HOLD_n,
    output      wire            icap_done,
//    output      wire            led,

    input       wire  [31:0]    main_firmware_flash_address,
    input       wire            FLASH_ERASE_EN,
    output      wire            FLASH_WRITE_READY,  
    input       wire  [7:0]     FLASH_WRITE_DATA,
    input       wire            FLASH_WRITE_VALID,  
    input       wire            FLASH_WRITE_FIFO_READEN,

    output      reg   [7:0]     FLASH_READ_DATA,
    output      wire            FLASH_READ_VALID,
    input       wire            FLASH_READ_EN,
    input       wire [7:0]      FLASH_READ_CMD,
    input       wire [31:0]     FLASH_READ_ADDRESS
    

);

    localparam COMBINE_READY =    8'b0000_0000;
    localparam COMBINE_PROCESS =  8'b0000_0001;
    localparam COMBINE_OVER    =  8'b0000_0010;               //Combining done 
    localparam WRITE_ERASE_WAIT = 8'b0000_0100;               //Sychronyion   
    localparam WRITE_PROCESS =    8'b0000_1000;               //Writing begins
    localparam WRITE_OVER    =    8'b0001_0000;               //Writing done
    localparam ERASE_READY =      8'b0010_0000; 
    localparam ERASE_PROCESS =    8'b0100_0000;
    
    //localparam [31:0] main_firmware_flash_address = 32'h00b0_0000;


    
    wire SCK;
    wire Read_tx_en;
    // reg  rst_n = 1'b0;
    wire [31:0] Read_Usr_Addr;
    wire [7:0]  Read_Usr_Cmd;
    wire [7:0] DATA_OUT;
    wire Read_Cmd_Send_Ok;
    wire Read_Addr_Send_Ok;
    wire Read_Data_Ok;
    wire Write_Cmd_Send_Ok;
    wire Write_Addr_Send_Ok;
    wire Write_Enable_Ok;
    wire Write_Data_Ok;
    wire Erase_Ok;
    wire [31:0] Write_Usr_Addr;
    wire [7:0] Write_Usr_Cmd;
    wire [7:0] Write_Usr_Data;
    wire [31:0] Erase_Addr;
    reg [7:0] Erase_Cmd;
    wire [7:0] uart_din;
    
    wire Write_en;
    reg Write_tx_en;
    reg Erase_en;
    reg uart_tx_en;            //串口发��使胄1�71ￄ1�771ￄ1�71ￄ1�777
    wire uart_tx_busy;
    wire uart_done;
    //wire [7:0] FLASH_WRITE_DATA;
    wire rd_en;

    
    reg [27:0] cnt;

    wire [7:0] dout;
    wire full;
    wire almost_full;
    wire prog_full;
    wire prog_empty;
    wire empty;
    wire almost_empty;
    wire valid;
    wire [7:0] data_count;
    wire rd_en_pos;
    reg [1:0] rd_en_dly;
    reg wr_en_disable = 1'b1;
    reg fifo_rd_en;
    reg [1:0] uart_done_dly;
    wire uart_done_pos;
    wire [7:0] rd_data_count;
    wire [7:0] wr_data_count;

    //   处理fifo读出的数捄1�71ￄ1�771ￄ1�71ￄ1�777
    reg [7:0] combine_state; 
    reg [7:0] combine_data[255:0];               //上位机下发的hex数据
    reg [2047:0] combine_data_serial;
    reg [2047:0] combine_data_serial_syn;        //把数据同步进杄1�71ￄ1�771ￄ1�71ￄ1�777
    reg combine_data_ok;
    reg [8:0] com_cnt;
    reg [11:0] com_num;
    reg [8:0]  erase_num;
    reg [1:0]  erase_flag;
    reg [31:0] erase_base_addr;       //给一下初始地坢�
    reg [31:0] write_base_addr;
    wire [7:0] sr1_status;
    reg [7:0] erase_64k_num;
    
    assign WRITE_PROTECT_n = 1'b1;
    assign HOLD_n = 1'b1;


    assign  FLASH_WRITE_READY = combine_state == COMBINE_READY;
    //assign  icap_flag_temp = FLASH_ERASE_EN;

    //assign Read_tx_en = FLASH_READ_EN;
    assign Read_Usr_Addr = FLASH_READ_ADDRESS;
    assign Read_Usr_Cmd = FLASH_READ_CMD;
    //assign FLASH_READ_DATA = DATA_OUT;
    //assign FLASH_READ_VALID = Read_Data_Ok;

    Flag_CrossDomain DATA_OUT_CrossDomain (
      .clkA(sys_clk),
      .FlagIn_clkA(Read_Data_Ok),
      .clkB(sys_clk),
      .FlagOut_clkB(FLASH_READ_VALID)
    );

    reg  [31:0]  wr_count_1;
    always @(posedge user_clk) begin
        if(!rst_n) begin
            wr_count_1  <= 0;
        end else if((uart_done_pos & !prog_full))begin
            wr_count_1 <= wr_count_1 + 1;
        end
        if (!rst_n)
            uart_done_dly <= 2'd0;
        else 
            uart_done_dly <= {uart_done_dly[0], FLASH_WRITE_VALID};
    end

    assign uart_done_pos = ~uart_done_dly[1] & uart_done_dly[0];

    always @(posedge sys_clk) begin
        FLASH_READ_DATA <= DATA_OUT;
    end

  
    
    flash_write_data_fifo flash_write_data_fifo (
        .rst(!rst_n),                      // input wire rst
        .wr_clk(user_clk),                // input wire wr_clk
        .rd_clk(sys_clk),                // input wire rd_clk
        .din(FLASH_WRITE_DATA),                      // input wire [7 : 0] din
        .wr_en(uart_done_pos & !prog_full),                  // input wire wr_en
        .rd_en(fifo_rd_en),                  // input wire rd_en
        .dout(dout),                    // output wire [7 : 0] dout
        .full(full),                    // output wire full
        .almost_full(almost_full),      // output wire almost_full
        .empty(empty),                  // output wire empty
        .valid(valid),                  // output wire valid
        .almost_empty(almost_empty),    // output wire almost_empty
        .rd_data_count(rd_data_count),  // output wire [7 : 0] rd_data_count
        .wr_data_count(wr_data_count),  // output wire [7 : 0] wr_data_count
        .prog_full(prog_full),          // output wire prog_full
        .prog_empty(prog_empty)        // output wire prog_empty
    );

    Flag_CrossDomain FLASH_READ_EN_CrossDomain (
      .clkA(sys_clk),
      .FlagIn_clkA(FLASH_READ_EN),
      .clkB(sys_clk),
      .FlagOut_clkB(Read_tx_en)
    );
  


    reg [1:0] state, next_state;
    parameter READY = 2'b00;
    parameter READ =  2'b01;
    reg first_erase;

     reg [15:0] prog_full_cnt;
     reg [15:0] FLASH_WRITE_VALID_cnt;
     reg [15:0] VALID_cnt;

    // 状��寄存器
    always @(posedge sys_clk) begin
        if (!rst_n) begin
            state <= READY;
            prog_full_cnt <= 0;
            VALID_cnt <= 0;
            FLASH_WRITE_VALID_cnt <= 0;
        end
        else begin
            if (prog_full | FLASH_WRITE_FIFO_READEN) begin
                prog_full_cnt <= prog_full_cnt + 1;
            end else if(first_erase) begin
                prog_full_cnt <= 0;
            end
            if(valid) begin
                VALID_cnt <= VALID_cnt + 1;
            end

            if(uart_done_pos) begin
                FLASH_WRITE_VALID_cnt <= FLASH_WRITE_VALID_cnt + 1;
            end
            state <= next_state;
        end
    end
    
    wire FLASH_WRITE_FIFO_READEN_1;
    Flag_CrossDomain FLASH_WRITE_FIFO_READEN_CrossDomain (
      .clkA(user_clk),
      .FlagIn_clkA(FLASH_WRITE_FIFO_READEN),
      .clkB(sys_clk),
      .FlagOut_clkB(FLASH_WRITE_FIFO_READEN_1)
    );

    // 状��转移��辑
   
    always @(*) begin
        case (state)
            READY:begin
                if (prog_full | FLASH_WRITE_FIFO_READEN_1) begin
                //if (~empty) begin
                    next_state = READ;
                end
                else begin
                    next_state = READY;
                end
            end
            READ:begin
                if (empty) begin
                    next_state = READY;
                end
                else begin
                    next_state = READ;
                end
            end
        endcase
    end
    
    // 输出逻辑
    always @(posedge sys_clk) begin
        case (state)
            READY:begin
                fifo_rd_en = 1'b0;
                wr_en_disable = 1'b1;
            end
            READ:begin
                fifo_rd_en = 1'b1;
                wr_en_disable = 1'b0;
            end
        endcase
    end






/*
    wire probe18 = SiTCP_rfd_top.rbcp_we;

    reg  [31:0]  counter_rbcp_we;
    reg  [31:0]  counter_done;

    always @(posedge user_clk) begin
        if (!rst_n)
            counter_rbcp_we <= 'd0;
        else if(probe18) begin
            counter_rbcp_we <= counter_rbcp_we + 1;
        end
    end

    always @(posedge user_clk) begin
        if (!rst_n)
            counter_done <= 'd0;
        else if(uart_done_pos & !prog_full) begin
            counter_done <= counter_done + 1;
        end
    end
*/
/*    ila_3 ila2(
     .clk(sys_clk),
     .probe0(combine_state),
     .probe1(combine_data[0]),
     .probe2(com_cnt),
     .probe3(combine_data_ok),
     .probe4(state),
     .probe5(FLASH_WRITE_VALID),
     .probe6(FLASH_WRITE_DATA),
     .probe7(Write_Data_Ok),
     .probe8(dout),
     .probe9(FLASH_READ_EN),
     .probe10(FLASH_READ_CMD),
     .probe11(FLASH_READ_ADDRESS),
     .probe12(Write_en),
     .probe13(Write_tx_en),
     .probe14(write_base_addr),
     .probe15(FLASH_ERASE_EN),
     .probe16(FLASH_WRITE_READY),
     .probe17(valid),
     .probe18(uart_done_pos)
     );
    

    genvar i;
    generate
        for (i=0;i<256;i=i+1) begin:data_to_serial
            assign combine_data_serial[i*8+7:i*8] = combine_data[255-i];
        end
    endgenerate
*/

    wire FLASH_ERASE_EN_1;
    reg  FLASH_ERASE_EN_2;
/*     Flag_CrossDomain FLASH_ERASE_EN_CrossDomain (
      .clkA(user_clk),
      .FlagIn_clkA(FLASH_ERASE_EN),
      .clkB(sys_clk),
      .FlagOut_clkB(FLASH_ERASE_EN_1)
    ); */
    wire fifo_empty;
    valid_fifo valid_fifo (
        .rst(!rst_n),        // input wire rst
        .wr_clk(user_clk),  // input wire wr_clk
        .rd_clk(sys_clk),  // input wire rd_clk
        .din(1'b1),        // input wire [0 : 0] din
        .wr_en(FLASH_ERASE_EN),    // input wire wr_en
        .rd_en(~fifo_empty),    // input wire rd_en
        .dout(),      // output wire [0 : 0] dout
        .full(),      // output wire full
        .empty(fifo_empty),    // output wire empty
        .valid(FLASH_ERASE_EN_1)    // output wire valid
    ); 
    
    wire [31:0] erase_base_addr_1;
    reg  bin_file_remain_1;
    reg  bin_file_remain_2;
    assign erase_base_addr_1 = first_erase ? 32'h01FC0000 : erase_base_addr;
    always @(posedge sys_clk) begin
        if (!rst_n) begin
            //combine_data <= 2048'd0;
            combine_data_ok <= 1'b0;
            combine_state <= ERASE_READY;
            com_cnt <= 8'd1;
            com_num <= 12'd0;
            erase_num <= 9'd0;
            erase_flag <= 2'd0;
            bin_file_remain_1 <= 0;
            bin_file_remain_2 <= 0;
            erase_base_addr <= main_firmware_flash_address;
            write_base_addr <= main_firmware_flash_address;
            //erase_base_addr <= 32'h0000_0000;
            //write_base_addr <= 32'h0000_0000;
            erase_64k_num <= 8'd0;
            first_erase <= 1;
            FLASH_ERASE_EN_2 <= 0;
        end
        else begin
            if(FLASH_ERASE_EN_1) begin
                FLASH_ERASE_EN_2 <= 1'b1;
            end
            case (combine_state)
            // it is strange that FLASH_ERASE_EN = 0, and read operate nornamlly
            // it means that erase operation is necessary before reading 
            // 
                ERASE_READY:begin
                    //if (!FLASH_ERASE_EN) begin     //跳转的话，就不擦除了
                    if (first_erase | FLASH_ERASE_EN_2) begin     //跳转的话，就不擦除了
                        Erase_en <= 1'b1;
                        combine_state <= ERASE_PROCESS;
                    end
                    else begin
                        Erase_en <= 1'b0;
                        combine_state <= ERASE_READY;
                        erase_base_addr <= main_firmware_flash_address;
                        write_base_addr <= main_firmware_flash_address;
                    end
                end
                ERASE_PROCESS:begin             //因为首次擦除总失败，扢�以多擦几欄1�71ￄ1�771ￄ1�71ￄ1�777
                    Erase_en <= 1'b0;
                    if (Erase_Ok) begin
                        erase_64k_num <= erase_64k_num + 1'b1;
                        if (erase_64k_num == 8'd15) begin
                            combine_state <= COMBINE_READY;
                        end
                        else begin
                            combine_state <= ERASE_READY;
                        end
                    end
                end
                COMBINE_READY:begin
                    if (valid) begin
                        //combine_data[0] <= dout;
                        combine_data_serial[255*8+7:255*8] = dout;
                        combine_state <= COMBINE_PROCESS;
                    end 
                    else begin
                        if(first_erase) begin 
                            combine_state <= ERASE_READY;
                            first_erase <= 0;
                        end else begin
                            combine_state <= COMBINE_READY;
                        end
                        com_cnt <= 8'd1;
                        
                    end
                    if(FLASH_WRITE_FIFO_READEN_1) begin
                        bin_file_remain_1 <= 1;
                    end
                    if(bin_file_remain_2) begin
                        bin_file_remain_2 <= 0;
                        combine_state <= ERASE_READY;
                        FLASH_ERASE_EN_2 <= 0;
                    end
                end
                COMBINE_PROCESS:begin
                    if (com_cnt <= 8'd255 & valid) begin     
                        //combine_data[com_cnt] <= dout;
                        combine_data_serial[(255-com_cnt)*8+:8] = dout;
                        com_cnt <= com_cnt + 1'b1;
                    end
                    else begin
                        com_cnt <= 8'd1;
                        combine_data_ok <= 1'b1;
                        combine_state <= COMBINE_OVER;
                    end
                    if(bin_file_remain_1) begin
                        bin_file_remain_2 <= 1;
                        bin_file_remain_1 <= 0;
                    end
                end
                COMBINE_OVER:begin
                    combine_data_ok <= 1'b0;
                    combine_state <= WRITE_ERASE_WAIT;
                end
                WRITE_ERASE_WAIT:begin                //丢�次是256个数捄1�71ￄ1�771ￄ1�71ￄ1�777
                    if (erase_flag == 2'd0) begin             //第一次的话不解释，直接擦附1�71ￄ1�771ￄ1�71ￄ1�777
                        Erase_en <= 1'b1;
                        erase_flag <= 2'd1;
                        combine_state <= WRITE_ERASE_WAIT;
                    end
                    else begin
                        Erase_en <= 1'b0;
                        if (erase_num == 9'd0) begin    //擦除的时候，写入16次擦丢�欄1�71ￄ1�771ￄ1�71ￄ1�777
                            if (Erase_Ok) begin
                                erase_num <= erase_num + 1'b1;
                                combine_data_serial_syn <= combine_data_serial;          //同步丢�拄1�71ￄ1�771ￄ1�71ￄ1�777
                                Write_tx_en <= 1'b1;
                                combine_state <= WRITE_PROCESS;
                            end
                            else begin
                                combine_state <= WRITE_ERASE_WAIT;
                            end
                        end
                        else begin   //不拆附1�71ￄ1�771ￄ1�71ￄ1�777
                             erase_num <= erase_num + 1'b1;
                             combine_data_serial_syn <= combine_data_serial;          //同步丢�拄1�71ￄ1�771ￄ1�71ￄ1�777
                             Write_tx_en <= 1'b1;
                             combine_state <= WRITE_PROCESS;
                            if (erase_num == 9'd255) begin  
                                erase_flag <= 2'd0;
                                erase_base_addr <= erase_base_addr + 32'd65536;        //基地坢�加上厄1�71ￄ1�771ￄ1�71ￄ1�777
                                erase_num <= 9'd0;
                            end
                            
                        end 
                        
                    end
                end
                WRITE_PROCESS:begin
                    Write_tx_en <= 1'b0;
                    if (Write_Data_Ok) begin       //结束了写兄1�71ￄ1�771ￄ1�71ￄ1�777256丄1�71ￄ1�771ￄ1�71ￄ1�777
                        combine_state <= WRITE_OVER;
                        uart_tx_en <= 1'b1;

                    end
                    else begin
                        combine_state <= WRITE_PROCESS;
                    end
                end
                WRITE_OVER:begin
                    uart_tx_en <= 1'b0;
                    write_base_addr <= write_base_addr + 32'd256;
                    combine_state <= COMBINE_READY;
                end
            endcase
        end

    end
    
      
    
    wire icap_flag;
    
/*      
    icap_start icap_start_u(
        .sclk(sys_clk),
        .rst_n(rst_n),
        .icap_flag(FLASH_ERASE_EN),
        .icap_done(icap_done) 
    );
*/
//     assign led = clk_locked_sitcp; //(cnt == 28'd50_000_000) ? ~led : led;
    
    always @(posedge sys_clk) begin
        if (cnt > 28'd50_000_000) begin
            //cnt <= 28'd0;
            rst_n <= 1'b1;
        end else begin
            cnt <= cnt + 1'b1;
            rst_n <= 1'b0;
        end
    end

/*      ila_3 ila_3(
        .clk(sys_clk), // input wire clk
        .probe0(rst_n),
        .probe1(cnt)
        ); */

    read_write_flash#(
        .bit_to_read(bit_to_read)
    ) read_write_flash_u(

        .sys_clk(sys_clk),
        .rst_n(rst_n),
        .Read_tx_en(Read_tx_en),                         //发��使胄1�71ￄ1�771ￄ1�71ￄ1�777
        .MISO(MISO),

        .Read_Usr_Addr(Read_Usr_Addr),
        .Read_Usr_Cmd(Read_Usr_Cmd),
   
        .Write_tx_en(Write_tx_en),         //发��完 写使胄1�71ￄ1�771ￄ1�71ￄ1�777  紧接睢�就发送地坢�和数捄1�71ￄ1�771ￄ1�71ￄ1�777
        //.Write_en(Write_en),

        .Write_Usr_Addr(write_base_addr),
        .Write_Usr_Cmd(8'h12),
        .Write_Usr_Data(combine_data_serial_syn),
        
        .Erase_en(Erase_en),

        .Erase_Usr_Addr(erase_base_addr_1),
        .Erase_Usr_cmd(8'hDC),              //这个奇��了哄1�71ￄ1�771ￄ1�71ￄ1�777

        .CS(CS),
        .SCK(SCK),
        .MOSI(MOSI),
        .DATA_OUT(DATA_OUT),
        .sr1_status(sr1_status),

        .Read_Cmd_Send_Ok(Read_Cmd_Send_Ok),
        .Read_Addr_Send_Ok(Read_Addr_Send_Ok),
        .Read_Data_Ok(Read_Data_Ok),

        .Write_Cmd_Send_Ok(Write_Cmd_Send_Ok),
        .Write_Addr_Send_Ok(Write_Addr_Send_Ok),
        .Write_Data_Ok(Write_Data_Ok),
        .Write_Enable_Ok(Write_Enable_Ok),
        
        .Erase_Ok(Erase_Ok)

    );
    
    // used for config FPGA CCLK
    STARTUPE2 #(
      .PROG_USR("FALSE"),  // Activate program event security feature. Requires encrypted bitstreams.
      .SIM_CCLK_FREQ(0.0)  // Set the Configuration Clock Frequency(ns) for simulation.
    )
    STARTUPE2_inst (
      .CFGCLK(),       // 1-bit output: Configuration main clock output
      .CFGMCLK(),     // 1-bit output: Configuration internal oscillator clock output
      .EOS(),             // 1-bit output: Active high output signal indicating the End Of Startup.
      .PREQ(),           // 1-bit output: PROGRAM request to fabric output
      .CLK(0),             // 1-bit input: User start-up clock input
      .GSR(0),             // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
      .GTS(0),             // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
      .KEYCLEARB(1), // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      .PACK(1),           // 1-bit input: PROGRAM acknowledge input
      .USRCCLKO(SCK),   // 1-bit input: User CCLK input
                             // For Zynq-7000 devices, this input must be tied to GND
      .USRCCLKTS(0), // 1-bit input: User CCLK 3-state enable input
                             // For Zynq-7000 devices, this input must be tied to VCC
      .USRDONEO(1),   // 1-bit input: User DONE pin output control
      .USRDONETS(1)  // 1-bit input: User DONE 3-state enable output
    );

endmodule