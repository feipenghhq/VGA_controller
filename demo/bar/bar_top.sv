// -------------------------------------------------------------------
// Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
// -------------------------------------------------------------------
//
// Project: VGA Controller
// Author: Heqing Huang
// Date Created: 06/20/2025
//
// -------------------------------------------------------------------
// Top level for the demo program
// -------------------------------------------------------------------

`include "vga.svh"

module bar_top #(
    parameter RGB_WIDTH = 8     // with for RGB color bit. Minimum is 4
)(
    input                           pixel_clk,
    input                           reset,

    output logic [RGB_WIDTH-1:0]    R,
    output logic [RGB_WIDTH-1:0]    G,
    output logic [RGB_WIDTH-1:0]    B,
    output logic                    HSYNC,
    output logic                    VSYNC,
    output logic                    DISPLAY

);


    logic                   vga_hsync;
    logic                   vga_vsync;
    logic                   video_on;
    logic [`P_SIZE-1:0]     pixel_addr;
    logic [`H_SIZE-1:0]     x_addr;
    logic [`H_SIZE-1:0]     y_addr;
    logic                   vga_start;

    assign vga_start = 1'b1;

    vga_sync #(1, 1, 1)   u_vga_sync(.*);
    bar_gen  #(RGB_WIDTH) u_bar_gen(.*);

endmodule
