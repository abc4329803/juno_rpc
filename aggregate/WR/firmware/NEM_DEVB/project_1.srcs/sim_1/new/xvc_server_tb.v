`timescale 1ns / 1ps

module xvc_server_tb;
    reg clk;
    reg clk1;
    reg rst;
    reg [7:0] tcp_rx_data;
    reg tcp_rx_valid;
    wire last_shift;
    wire tcp_rx_ready;
    wire [7:0] tcp_tx_data;
    wire tcp_tx_valid;
    reg tcp_tx_ready;
    wire tck, tms, tdi;
    reg tdo;

    // ״̬��������
    localparam TB_S_IDLE = 3'd0;
    localparam TB_S_EXEC = 3'd4;
    localparam TB_S_SEND = 3'd5;

    xvc_server #(.BUFFER_SIZE(8192)) uut (
        .clk(clk), .rst(rst),
        .tcp_rx_data(tcp_rx_data), .tcp_rx_valid(tcp_rx_valid & tcp_rx_ready), .tcp_rx_ready(tcp_rx_ready),
        .tcp_tx_data(tcp_tx_data), .tcp_tx_valid(tcp_tx_valid), .tcp_tx_ready(tcp_tx_ready),
        .tck(tck), .tms(tms), .tdi(tdi), .tdo(tdo),
        .state_debug(),
        .last_shift(last_shift)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        clk1 = 0;           // 0ns ʱ��ʼΪ 0
        #2.5;               // �ȴ��� 7.5ns
        clk1 = 1;           // ��ʱ��תΪ 1
        forever #5 clk1 = ~clk1; // ֮��ÿ�� 5ns ��תһ��
    end
  
    // initial clk1 = 0;
    // always #5 clk1 = ~clk1;

    // ģ�� JTAG оƬ��ֻ�е� Step 3 ִ��ʱ��������λ
    reg [31:0] mock_idcode = 32'hC234567B;
    reg idcode_shift_en = 0;

    always @(negedge tck) begin
        if (idcode_shift_en && uut.state == TB_S_EXEC) begin
            tdo <= mock_idcode[0];
            mock_idcode <= {1'b0, mock_idcode[31:1]};
        end else begin
            tdo <= 1'b0; // �����׶� TDO Ĭ��Ϊ 0
        end
    end

/*     task send_byte(input [7:0] d);
        begin
            tcp_rx_data = d;
            tcp_rx_valid = 1;
            @(posedge clk);
            while(!tcp_rx_ready) @(posedge clk);
            tcp_rx_valid = 0;
            @(posedge clk);
        end
    endtask 

task send_byte(input [7:0] d);
        begin
            // 1. ��ʱ�ӱ��غ��������ݺ���Ч�źţ�ģ�� FIFO ��ￄ1�7
            tcp_rx_data  <= d;
            tcp_rx_valid <= 1'b1;

            // 2. ֻ�е� ready Ϊ 0 ʱ�����ǲŽ���ȴ�ѭ�ￄ1�7
            // ��ￄ1�7 ready �Ѿ��� 1������������һ��������ֱ�ӱ�ȡ��
            @(posedge clk); 
            while (tcp_rx_ready !== 1'b1) begin
                @(posedge clk);
            end

            // 3. ���ֳɹ���Valid=1 && Ready=1����������Ч�ź�
            // ������������ͣ��ⲿ�������ø�����valid ������һ�ı��ֻ���ￄ1�7
            tcp_rx_valid <= 1'b0;
        end
    endtask*/
    task send_byte(input [7:0] d);
        begin
            // 1. ��ʱ�ӱ��غ������������ݣ�ʹ�÷�������ֵģ��Ĵ��������
            tcp_rx_data  <= d;
            tcp_rx_valid <= 1'b1;

            // 2. �ȴ������ء�ע�⣺��������������ʱ�̲������ǡ��仯ǰ����ֵ��
            @(posedge clk); 
            
            // 3. ���ּ��ѭ�ￄ1�7
            // �����ʄ1�7 tcp_rx_ready Ϊ 0��˵�� DUT ��û׼���ã����ݱ��뱣�֡�
            // ֻ�е� ready Ϊ 1 ʱ�����ֲ����ڡ���ǰ��������ء�����ˡ�
            while (tcp_rx_ready !== 1'b1) begin
                @(posedge clk);
            end

            // 4. ���ֳɹ������һ�ģￄ1�7
            // �������û�ￄ1�7 send_byte ������������ valid��
            tcp_rx_valid <= 1'b0;
        end
    endtask

    initial begin
        // ��ʼ���븴λ
        rst = 1; tcp_rx_valid = 0; tcp_tx_ready = 1; tdo = 0;
        #100;
        rst = 0;
        #50;

        $display("--- Step 1: Reset TAP ---");
        // shift: 05 00 00 00 | 1F | 00
        send_byte("s"); send_byte("h"); send_byte("i"); send_byte("f"); send_byte("t"); send_byte(":");
        send_byte(8'h05); send_byte(8'h00); send_byte(8'h00); send_byte(8'h00);
        send_byte(8'h1F); send_byte(8'h00); 
        wait(uut.state == TB_S_IDLE);

        $display("--- Step 2: Move to Shift-DR ---");
        // shift: 04 00 00 00 | 02 | 00
        send_byte("s"); send_byte("h"); send_byte("i"); send_byte("f"); send_byte("t"); send_byte(":");
        send_byte(8'h04); send_byte(8'h00); send_byte(8'h00); send_byte(8'h00);
        send_byte(8'h02); send_byte(8'h00); 
        wait(uut.state == TB_S_IDLE);

        $display("--- Step 3: Shift 32-bit IDCODE ---");
        //if(uut.state == TB_S_IDLE)
            idcode_shift_en = 1;
        mock_idcode = 32'hC234567B;
        // shift: 20 00 00 00 | 00 00 00 00 | 00 00 00 00
        send_byte("s"); send_byte("h"); send_byte("i"); send_byte("f"); send_byte("t"); send_byte(":");
        send_byte(8'h1F); send_byte(8'h00); send_byte(8'h00); send_byte(8'h00);
        send_byte(8'h00); send_byte(8'h00); send_byte(8'h00); send_byte(8'h00);
        send_byte(8'h00); send_byte(8'h00); send_byte(8'h00); send_byte(8'h00);
        
        wait(uut.state == TB_S_SEND);
        $display("[STATUS] Entering SEND state...");
        #4000;
        
        idcode_shift_en = 0;
        $display("--- Test Completed ---");
        $finish;
    end

    // ��ￄ1�71ￄ1�77 TCP ����
    always @(posedge clk) begin
        if (tcp_tx_valid && tcp_tx_ready) begin
            $display("[MONITOR] Data on tcp_tx_data: %h", tcp_tx_data);
        end
    end

endmodule