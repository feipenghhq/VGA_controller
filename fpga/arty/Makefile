
GIT_ROOT 	= $(shell git rev-parse --show-toplevel)
SCRIPT_DIR 	= $(GIT_ROOT)/scripts/vivado

# FPGA Device
DEVICE ?= xc7a35ticsg324-1L
# project name
PROJECT ?= demo
# top level name
TOP ?= top
# verilog source files
VERILOG += $(GIT_ROOT)/rtl/vga/vga_sync.sv
VERILOG += $(GIT_ROOT)/demo/bar/bar_gen.sv
VERILOG += $(GIT_ROOT)/demo/bar/bar_top.sv
VERILOG += $(GIT_ROOT)/fpga/arty/pll_clk_wiz.v
VERILOG += $(GIT_ROOT)/fpga/arty/pll.v
VERILOG += $(GIT_ROOT)/fpga/arty/top.sv
# verilog include directory
SEARCH  += $(GIT_ROOT)/rtl/vga
# verilog define
DEFINE ?=
# sdc files
XDC += $(PWD)/timing.xdc
# pin assignment files
XDC += $(PWD)/pin.xdc
# project output directory
OUT_DIR ?= outputs

include $(GIT_ROOT)/scripts/vivado/makefile.mk