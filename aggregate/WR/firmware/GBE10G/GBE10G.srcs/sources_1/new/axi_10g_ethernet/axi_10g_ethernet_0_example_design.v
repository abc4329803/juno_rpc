`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/18 10:04:35
// Design Name: 
// Module Name: axi_10g_ethernet_0_example_design
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


module axi_10g_ethernet_0_example_design(

		input          		reset,
		input               clk_100,
		
		input               refclk_p,
		input               refclk_n,	
		
		input         	 	rxp,
		input          		rxn,		
		output wire        	txp,
		output wire        txn,		
		output wire        sfp_tx_disable,	
		
		output              coreclk,
		output              core_ready,
		output              core_reset,
		
        output             areset_datapathclk_out,
        output             txusrclk_out,
        output             txusrclk2_out,
        output             gttxreset_out,
        output             gtrxreset_out,
        output             txuserrdy_out,
        output             reset_counter_done_out,
        output     		   qplllock_out,
        output             qplloutclk_out,
        output             qplloutrefclk_out,	
		
		input    	  	    s_axis_tx_tvalid,
        output              s_axis_tx_tready,   
        input [63:0]        s_axis_tx_tdata,    
        input [7:0]         s_axis_tx_tkeep,    
        input               s_axis_tx_tlast,   
        
        output              m_axis_rx_tvalid,
        input               m_axis_rx_tready,    
        output [63:0]       m_axis_rx_tdata,    
        output [7:0]        m_axis_rx_tkeep,    
        output              m_axis_rx_tlast
    );

// AXI Lite config I/F
wire                 s_axi_aclk;
wire                 s_axi_aresetn;
wire       [10:0]    s_axi_awaddr;
wire                 s_axi_awvalid;
wire                 s_axi_awready;
wire       [31:0]    s_axi_wdata;
wire                 s_axi_wvalid;
wire                 s_axi_wready;
wire      [1:0]      s_axi_bresp;
wire                 s_axi_bvalid;
wire                 s_axi_bready;
wire       [10:0]    s_axi_araddr;
wire                 s_axi_arvalid;
wire                 s_axi_arready;

wire      [31:0]     s_axi_rdata;
wire      [1:0]      s_axi_rresp;
wire                 s_axi_rvalid;
wire                 s_axi_rready;

//wire                 coreclk;
wire                 block_lock;

wire [7:0] 		     pcspma_status;
wire				 signal_detect;
wire				 areset_n;
wire				 s_axi_reset;
//wire				 core_reset;
//wire				 core_ready;


assign    areset_n  = ~reset & pcspma_status[0];


    //--------------------------------------------------------------------------
    // Add reset synchronizers to the asynchronous reset inputs
    //--------------------------------------------------------------------------
    axi_10g_ethernet_0_sync_reset s_axis_reset_gen (
      .clk                             (clk_100),
      .reset_in                        (~areset_n),
      .reset_out                       (s_axi_reset)
      );
 

    axi_10g_ethernet_0_sync_reset core_reset_gen (
      .clk                             (coreclk),
      .reset_in                        (~areset_n),
      .reset_out                       (core_reset)
      ); 
	  
	axi_10g_ethernet_0_sync_block block_lock_sync (
      .data_in                         (block_lock),
      .clk                             (coreclk),
      .data_out                        (core_ready)
   );

   //----------------------------------------------------------------------------
   // Instantiate the Ethernet core
   //----------------------------------------------------------------------------
// wire         areset_datapathclk_out;
// wire         txusrclk_out;
// wire         txusrclk2_out;
// wire         gttxreset_out;
// wire         gtrxreset_out;
// wire         txuserrdy_out;
// wire         reset_counter_done_out;
//  wire		   qplllock_out;
// wire         qplloutclk_out;
// wire         qplloutrefclk_out;
 axi_10g_ethernet_0 ethernet_core_0 (
      .coreclk_out                     (coreclk),
      .areset_datapathclk_out          (areset_datapathclk_out),
      .refclk_p                        (refclk_p),
      .refclk_n                        (refclk_n),
      .dclk                            (clk_100),
      .reset                           (reset),
      .resetdone_out                   (),
      .reset_counter_done_out          (reset_counter_done_out),
      .qplllock_out                    (qplllock_out),
      .qplloutclk_out                  (qplloutclk_out),
      .qplloutrefclk_out               (qplloutrefclk_out),
      .txusrclk_out                    (txusrclk_out),
      .txusrclk2_out                   (txusrclk2_out),
      .gttxreset_out                   (gttxreset_out),
      .gtrxreset_out                   (gtrxreset_out),
      .txuserrdy_out                   (txuserrdy_out),
      .rxrecclk_out                    (),
      .tx_ifg_delay                    (8'd0),
      .tx_statistics_vector            (),
      .tx_statistics_valid             (),
      .rx_statistics_vector            (),
      .rx_statistics_valid             (),
      .s_axis_pause_tdata              (16'd0),
      .s_axis_pause_tvalid             (1'b0),

      .tx_axis_aresetn                 (areset_n),
      .s_axis_tx_tdata                 (s_axis_tx_tdata),
      .s_axis_tx_tvalid                (s_axis_tx_tvalid),
      .s_axis_tx_tlast                 (s_axis_tx_tlast),
      .s_axis_tx_tuser                 (1'b0),
      .s_axis_tx_tkeep                 (s_axis_tx_tkeep),
      .s_axis_tx_tready                (s_axis_tx_tready),

      .rx_axis_aresetn                 (areset_n),
      .m_axis_rx_tdata                 (m_axis_rx_tdata),
      .m_axis_rx_tkeep                 (m_axis_rx_tkeep),
      .m_axis_rx_tvalid                (m_axis_rx_tvalid),
      .m_axis_rx_tuser                 (),
      .m_axis_rx_tlast                 (m_axis_rx_tlast),
	  
      .s_axi_aclk                      (clk_100),
      .s_axi_aresetn                   (areset_n),
      .s_axi_awaddr                    (s_axi_awaddr),
      .s_axi_awvalid                   (s_axi_awvalid),
      .s_axi_awready                   (s_axi_awready),
      .s_axi_wdata                     (s_axi_wdata),
      .s_axi_wvalid                    (s_axi_wvalid),
      .s_axi_wready                    (s_axi_wready),
      .s_axi_bresp                     (s_axi_bresp),
      .s_axi_bvalid                    (s_axi_bvalid),
      .s_axi_bready                    (s_axi_bready),
      .s_axi_araddr                    (s_axi_araddr),
      .s_axi_arvalid                   (s_axi_arvalid),
      .s_axi_arready                   (s_axi_arready),
      .s_axi_rdata                     (s_axi_rdata),
      .s_axi_rresp                     (s_axi_rresp),
      .s_axi_rvalid                    (s_axi_rvalid),
      .s_axi_rready                    (s_axi_rready),

      .xgmacint                        (),
      // Serial links
      .txp                             (txp),
      .txn                             (txn),
      .rxp                             (rxp),
      .rxn                             (rxn),
	  //.sim_speedup_control             (sim_speedup_control),
      .sim_speedup_control             (1'b0),
      .signal_detect                   (1'b1),
      .tx_fault                        (1'b0),
      .tx_disable                      (sfp_tx_disable),
       
      .pcspma_status                   (pcspma_status)
   );

    //--------------------------------------------------------------------------
    // Instantiate the AXI-LITE Controller
    //--------------------------------------------------------------------------

    axi_10g_ethernet_0_axi_lite_sm axi_lite_controller0 (
      .s_axi_aclk                      (clk_100),
      .s_axi_reset                     (s_axi_reset),

      .pcs_loopback                    (1'b0),
      .enable_vlan                     (1'b0),
      .enable_custom_preamble          (1'b0),

      .block_lock                      (block_lock),
      .enable_gen                      (),

      .s_axi_awaddr                    (s_axi_awaddr),
      .s_axi_awvalid                   (s_axi_awvalid),
      .s_axi_awready                   (s_axi_awready),

      .s_axi_wdata                     (s_axi_wdata),
      .s_axi_wvalid                    (s_axi_wvalid),
      .s_axi_wready                    (s_axi_wready),

      .s_axi_bresp                     (s_axi_bresp),
      .s_axi_bvalid                    (s_axi_bvalid),
      .s_axi_bready                    (s_axi_bready),

      .s_axi_araddr                    (s_axi_araddr),
      .s_axi_arvalid                   (s_axi_arvalid),
      .s_axi_arready                   (s_axi_arready),

      .s_axi_rdata                     (s_axi_rdata),
      .s_axi_rresp                     (s_axi_rresp),
      .s_axi_rvalid                    (s_axi_rvalid),
      .s_axi_rready                    (s_axi_rready)
   );
  
endmodule
