# -------------------------------------------------------------------
# Copyright 2025 by Heqing Huang (feipenghhq@gamil.com)
# -------------------------------------------------------------------
#
# Project: VGA
# Author: Heqing Huang
# Date Created: 06/20/2025
#
# -------------------------------------------------------------------
# Test for the VGA demo
# -------------------------------------------------------------------

import cocotb
from cocotb.triggers import FallingEdge, RisingEdge, Timer
from cocotb.clock import Clock

from vga import VGA

async def generate_reset(dut):
    """
    Generate reset pulses.
    """
    dut.reset.value = 1
    await Timer(10, units="ns")
    dut.reset.value = 0
    await RisingEdge(dut.pixel_clk)

async def init(dut):
    """
    Initialize the environment
    """
    cocotb.start_soon(Clock(dut.pixel_clk, 20, units = 'ns').start()) # clock
    await generate_reset(dut)

@cocotb.test()
async def run(dut):
    await init(dut)
    vga = VGA()
    vga.set_vga_signal(dut.pixel_clk, dut.HSYNC, dut.VSYNC, dut.R, dut.G, dut.B)
    vga.start_display()
    cocotb.start_soon(vga.monitor_vga())
    while not vga.quit:
        await Timer(1000, units = 'ns')
