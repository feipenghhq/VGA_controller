// -------------------------------------------------------------------
// Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
// -------------------------------------------------------------------
//
// Project: VGA Controller
// Author: Heqing Huang
// Date Created: 06/23/2025
//
// -------------------------------------------------------------------
// Top level for the Arty FPGA board
// -------------------------------------------------------------------

module top
(
    input         CLOCK_100,    // 100 MHz

    input         RESETn,       // RESET, low active

    // VGA
    output        VGA_HS,       // VGA H_SYNC
    output        VGA_VS,       // VGA V_SYNC
    output [3:0]  VGA_R,        // VGA Red[9:0]
    output [3:0]  VGA_G,        // VGA Green[9:0]
    output [3:0]  VGA_B         // VGA Blue[9:0]
);

logic VGA_CLK;

pll
u_pll (
    .clk_in1(CLOCK_100),
    .clk_out1(VGA_CLK)
);

bar_top
    #(.RGB_WIDTH(4))
u_bar_top
(
    .pixel_clk  (VGA_CLK),
    .reset      (~RESETn),     // default is high
    .R          (VGA_R),
    .G          (VGA_G),
    .B          (VGA_B),
    .HSYNC      (VGA_HS),
    .VSYNC      (VGA_VS),
    .DISPLAY    ()
);


endmodule
