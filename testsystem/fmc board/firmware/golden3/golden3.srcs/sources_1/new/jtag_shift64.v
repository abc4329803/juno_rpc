`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 09:59:01 PM
// Design Name: 
// Module Name: jtag_shift64
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

module jtag_shift64 (
    output wire TDO  // This connects to BSCANE2.TDO
);

    // JTAG inputs from BSCANE2
    wire TCK, TDI, TMS;
    wire SEL, SHIFT, UPDATE;

    // BSCANE2 primitive: Use JTAG_CHAIN = 1 (for USER1)
    BSCANE2 #(
        .JTAG_CHAIN(1) // USER1
    ) bscane2_inst (
        .TCK(TCK),
        .TDI(TDI),
        .TMS(TMS),
        .SHIFT(SHIFT),
        .UPDATE(UPDATE),
        .SEL(SEL),
        .RUNTEST(), // optional
        .RESET(),   // optional
        .CAPTURE(), // optional
        .TDO(TDO)
    );

    // Shift register
    reg [63:0] shift_reg = 64'hCAFEBABE_DEADBEEF;
    reg [6:0] shift_count = 0;

    always @(posedge TCK) begin
        if (SHIFT && SEL) begin
            // Valid DR Shift for USER1
            shift_reg <= {TDI, shift_reg[63:1]};
            shift_count <= shift_count + 1;
        end else if (!SHIFT) begin
            shift_count <= 0;
            shift_reg <= 64'hCAFEBABE_DEADBEEF; // Reset pattern
        end
    end

    assign TDO = shift_reg[0];  // LSB-first
endmodule


/*
module jtag_shift64 (
    input wire tck,
    input wire tms,
    input wire tdi,
    output wire tdo
);

    // TAP controller states
    //typedef enum logic  {
    parameter   TEST_LOGIC_RESET = 4'd0,
        RUN_TEST_IDLE    = 4'd1,
        SELECT_DR_SCAN   = 4'd2,
        CAPTURE_DR       = 4'd3,
        SHIFT_DR         = 4'd4,
        EXIT1_DR         = 4'd5,
        UPDATE_DR        = 4'd6,
        SELECT_IR_SCAN   = 4'd7,
        CAPTURE_IR       = 4'd8,
        SHIFT_IR         = 4'd9,
        EXIT1_IR         = 4'd10,
        UPDATE_IR        = 4'd11;
    //} tap_state_t;

    reg [3:0] tap_state = TEST_LOGIC_RESET;

    // Instruction Register
    reg [5:0] current_ir = 6'b000000;

    // Shift Register for DR (64-bit)
    reg [63:0] shift_reg = 64'hCAFEBABE_DEADBEEF;
    reg [6:0] shift_count = 0;

    // TAP FSM update
    always @(posedge tck) begin
        case (tap_state)
            TEST_LOGIC_RESET: tap_state <= tms ? TEST_LOGIC_RESET : RUN_TEST_IDLE;
            RUN_TEST_IDLE:    tap_state <= tms ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            SELECT_DR_SCAN:   tap_state <= tms ? SELECT_IR_SCAN : CAPTURE_DR;
            CAPTURE_DR:       tap_state <= tms ? EXIT1_DR : SHIFT_DR;
            SHIFT_DR:         tap_state <= tms ? EXIT1_DR : SHIFT_DR;
            EXIT1_DR:         tap_state <= tms ? UPDATE_DR : SHIFT_DR;
            UPDATE_DR:        tap_state <= tms ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            SELECT_IR_SCAN:   tap_state <= tms ? TEST_LOGIC_RESET : CAPTURE_IR;
            CAPTURE_IR:       tap_state <= tms ? EXIT1_IR : SHIFT_IR;
            SHIFT_IR:         tap_state <= tms ? EXIT1_IR : SHIFT_IR;
            EXIT1_IR:         tap_state <= tms ? UPDATE_IR : SHIFT_IR;
            UPDATE_IR:        tap_state <= tms ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            default:          tap_state <= TEST_LOGIC_RESET;
        endcase
    end

    // IR shift and capture
    always @(posedge tck) begin
        if (tap_state == SHIFT_IR) begin
            current_ir <= {tdi, current_ir[5:1]};  // LSB-first
        end
    end

    // DR shift when IR = USER1 (0b000010)
    always @(posedge tck) begin
        if (tap_state == SHIFT_DR && current_ir == 6'b000010) begin
            shift_reg <= {tdi, shift_reg[63:1]};
            shift_count <= shift_count + 1;
        end else if (tap_state != SHIFT_DR) begin
            shift_count <= 0;
            shift_reg <= 64'hCAFEBABE_DEADBEEF; // Reset to fixed pattern
        end
    end

    assign tdo = shift_reg[0];  // LSB first

endmodule
*/

