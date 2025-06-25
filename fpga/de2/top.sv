// -------------------------------------------------------------------
// Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
// -------------------------------------------------------------------
//
// Project: VGA Controller
// Author: Heqing Huang
// Date Created: 06/20/2025
//
// -------------------------------------------------------------------
// Top level for the DE2 FPGA board
// -------------------------------------------------------------------

module top
(
    //input         CLOCK_50,    // 50 MHz
    input         CLOCK_27,     // 50 MHz

    input         KEY,          // Pushbutton[3:0]

    output        TD_RESET,     // TV Decoder Reset. Low active

    // VGA
    output        VGA_CLK,     // VGA Clock
    output        VGA_HS,      // VGA H_SYNC
    output        VGA_VS,      // VGA V_SYNC
    output        VGA_BLANK,   // VGA BLANK
    output        VGA_SYNC,    // VGA SYNC
    output [9:0]  VGA_R,       // VGA Red[9:0]
    output [9:0]  VGA_G,       // VGA Green[9:0]
    output [9:0]  VGA_B        // VGA Blue[9:0]
);

logic PIXEL_CLK;

assign VGA_BLANK = 1'b1;
assign VGA_SYNC  = 1'b0;
assign VGA_CLK = ~PIXEL_CLK;
assign TD_RESET = 1'b1;

pll
u_pll (
    .inclk0 (CLOCK_27),
	.c0     (PIXEL_CLK)
);

bar_top
    #(.RGB_WIDTH(10))
u_bar_top
(
    .pixel_clk  (PIXEL_CLK),
    .reset      (~KEY),     // default is high
    .R          (VGA_R),
    .G          (VGA_G),
    .B          (VGA_B),
    .HSYNC      (VGA_HS),
    .VSYNC      (VGA_VS),
    .DISPLAY    ()
);


endmodule
