`timescale 1ns / 1ps

module clk_phase_shifter #(
    parameter FPGA_FAMILY = "7SERIES"
)(
    input  wire sys_clk,       // 62.5MHz
    input  wire rst_in,
    input  wire ps_en,
    input  wire ps_incdec,
    output wire ps_done,
    output wire clk_out_shifted,
    output wire locked
);

    generate
        if (FPGA_FAMILY == "7SERIES") begin : gen_k7_mmcm
            wire clkfb_out, clkfb_in;
            wire clk_out0_shifted_int;
            
            MMCME2_ADV #(
                .BANDWIDTH("OPTIMIZED"),
                .CLKOUT0_DIVIDE_F(8.0),    // 1000/16 = 62.5MHz
                .CLKOUT0_PHASE(0.0),
                .CLKOUT0_USE_FINE_PS("TRUE"),
                .CLKFBOUT_MULT_F(8.0),     // 62.5 * 16 = 1000MHz VCO
                .CLKIN1_PERIOD(8.0),
                .DIVCLK_DIVIDE(1)
            ) u_mmcm (
                .CLKIN1(sys_clk),
                .CLKIN2(1'b0), .CLKINSEL(1'b1),
                .CLKFBIN(clkfb_in),
                .CLKFBOUT(clkfb_out),
                .CLKOUT0(clk_out0_shifted_int),
                .PSCLK(sys_clk),
                .PSEN(ps_en),
                .PSINCDEC(ps_incdec),
                .PSDONE(ps_done),
                .LOCKED(locked),
                .RST(rst_in),
                .PWRDWN(1'b0), .DO(), .DRDY()
            );
            
            BUFG u_bufg_fb  (.I(clkfb_out), .O(clkfb_in));
            BUFG u_bufg_out (.I(clk_out0_shifted_int), .O(clk_out_shifted));

        end else if (FPGA_FAMILY == "SPARTAN6") begin : gen_s6_dcm
            wire clkfb, clk0;
            DCM_SP #(
                .CLKIN_PERIOD(16.0),
                .CLK_FEEDBACK("1X"),
                .CLKOUT_PHASE_SHIFT("VARIABLE_CENTER"), 
                .PHASE_SHIFT(0)
            ) u_dcm (
                .CLKIN(sys_clk),
                .CLKFB(clkfb),
                .RST(rst_in),
                .CLK0(clk0), 
                .PSCLK(sys_clk),
                .PSEN(ps_en),
                .PSINCDEC(ps_incdec),
                .PSDONE(ps_done),
                .STATUS(),
                .LOCKED(locked)
            );
            BUFG u_bufg_fb  (.I(clk0), .O(clkfb));
            assign clk_out_shifted = clkfb;
        end
    endgenerate

endmodule