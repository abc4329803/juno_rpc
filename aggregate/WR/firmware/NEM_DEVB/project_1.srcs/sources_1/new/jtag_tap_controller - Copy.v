`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: jtag_tap_controller
// Description: JTAG TAP interface using Xilinx BSCANE2 primitive
//              Connects XVC server to internal JTAG chain
//////////////////////////////////////////////////////////////////////////////////

module jtag_tap_controller (
    input wire clk,
    input wire rst,

    // Interface from XVC server
    input wire  xvc_tck,
    input wire  xvc_tms,
    input wire  xvc_tdi,
    output wire xvc_tdo,
    input wire  xvc_enable,

    // Debug outputs
    output wire jtag_capture,
    output wire jtag_shift,
    output wire jtag_update,
    output wire jtag_reset,
    output wire jtag_sel
);

    // BSCANE2 outputs
    wire bscan_tck;
    wire bscan_tms;
    wire bscan_tdi;
    wire bscan_tdo;
    wire bscan_sel;
    wire bscan_capture;
    wire bscan_shift;
    wire bscan_update;
    wire bscan_reset;
    wire bscan_runtest;

    // Xilinx 7 Series BSCANE2 primitive
    // USER1 (JTAG_CHAIN=1) is commonly used for user logic
    BSCANE2 #(
        .JTAG_CHAIN(2)  // USER1 instruction (can be 1-4)
    ) bscan_inst (
        .CAPTURE(bscan_capture),  // out: CAPTURE-DR state
        .DRCK(bscan_tck),         // out: Data register clock (gated TCK)
        .RESET(bscan_reset),      // out: TAP controller reset
        .RUNTEST(bscan_runtest),  // out: RUN-TEST/IDLE state
        .SEL(bscan_sel),          // out: USER instruction active
        .SHIFT(bscan_shift),      // out: SHIFT-DR state
        .TCK(bscan_tck),          // out: Test clock
        .TDI(bscan_tdi),          // out: Test data in
        .TMS(bscan_tms),          // out: Test mode select
        .UPDATE(bscan_update),    // out: UPDATE-DR state
        .TDO(bscan_tdo)           // in:  Test data out
    );

    // Multiplexer: select between XVC and physical JTAG
    reg tdo_reg;

    always @(posedge clk) begin
        if (rst) begin
            tdo_reg <= 1'b0;
        end else begin
            // When XVC is active, capture TDO for XVC
            if (xvc_enable) begin
                tdo_reg <= xvc_tdi;  // Loopback for now (will connect to scan chain)
            end else begin
                tdo_reg <= bscan_tdi;  // Pass through from BSCAN
            end
        end
    end

    // Connect XVC server to output
    assign xvc_tdo = tdo_reg;

    // Connect BSCAN TDO (driven by scan chain)
    assign bscan_tdo = tdo_reg;

    // Debug outputs
    assign jtag_capture = bscan_capture;
    assign jtag_shift   = bscan_shift;
    assign jtag_update  = bscan_update;
    assign jtag_reset   = bscan_reset;
    assign jtag_sel     = bscan_sel;

endmodule
