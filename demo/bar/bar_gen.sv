// -------------------------------------------------------------------
// Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
// -------------------------------------------------------------------
//
// Project: VGA Controller
// Author: Heqing Huang
// Date Created: 06/20/2025
//
// -------------------------------------------------------------------
// bar gen: Generate color bar in the screen
//
// It generate 3 patterns:
//  1. 16 shade of gray color
//  2. 8 prime color
//  3. a continuous rainbow color spectrum
// -------------------------------------------------------------------

`include "vga.svh"

module bar_gen #(
    parameter RGB_WIDTH = 8     // with for RGB color bit. Minimum is 4
) (
    input                           pixel_clk,
    input                           reset,

    input logic                     vga_hsync,  // hsync input
    input logic                     vga_vsync,  // vsync input
    input logic                     video_on,   // display video

    input logic [`P_SIZE-1:0]       pixel_addr, // pixel address
    input logic [`H_SIZE-1:0]       x_addr,     // pixel x coordinate
    input logic [`H_SIZE-1:0]       y_addr,     // pixel y coordinate

    output logic [RGB_WIDTH-1:0]    R,
    output logic [RGB_WIDTH-1:0]    G,
    output logic [RGB_WIDTH-1:0]    B,
    output logic                    HSYNC,
    output logic                    VSYNC,
    output logic                    DISPLAY
);

    // --------------------------------
    // Signal declarations
    // --------------------------------
    logic [3:0] up;
    logic [3:0] down;

    // size fixed to 4 bit
    logic [3:0] r;
    logic [3:0] g;
    logic [3:0] b;

    // bar generation logic
    assign up = x_addr[6:3];
    assign down = 4'd15 - x_addr[6:3];

    // --------------------------------
    // Main logic
    // --------------------------------

    // bar generation logic
    always @* begin
        // 16 shade of gray
        if (y_addr < `V_DISPLAY / 3) begin
            r = {x_addr[8:5]};
            g = {x_addr[8:5]};
            b = {x_addr[8:5]};
        end
        // 8 primary color
        else if (y_addr < (`V_DISPLAY / 3) * 2) begin
            r = {4{x_addr[8]}};
            g = {4{x_addr[7]}};
            b = {4{x_addr[6]}};
        end
        // a continuous "rain bow" color spectrum
        else begin
            case(x_addr[9:7])
                3'b000: begin
                    r = 4'b1111;
                    g = up;
                    b = 4'b0000;
                end
                3'b001: begin
                    r = down;
                    g = 4'b1111;
                    b = 4'b0000;
                end
                3'b010: begin
                    r = 4'b0000;
                    g = 4'b1111;
                    b = up;
                end
                3'b011: begin
                    r = 4'b0000;
                    g = down;
                    b = 4'b1111;
                end
                3'b100: begin
                    r = up;
                    g = 4'b0000;
                    b = 4'b1111;
                end
                3'b101: begin
                    r = 4'b1111;
                    g = 4'b0000;
                    b = down;
                end
                default: begin
                    r = 4'b1111;
                    g = 4'b1111;
                    b = 4'b1111;
                end
            endcase
        end

    end

    always @(posedge pixel_clk) begin
        R     <= {b, {(RGB_WIDTH-4){1'b0}}};
        G     <= {g, {(RGB_WIDTH-4){1'b0}}};
        B     <= {r, {(RGB_WIDTH-4){1'b0}}};
        HSYNC <= vga_hsync;
        VSYNC <= vga_vsync;
        DISPLAY <= video_on;
    end

endmodule
