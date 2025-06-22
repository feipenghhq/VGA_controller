
GIT_ROOT 	= $(shell git rev-parse --show-toplevel)
SCRIPT_DIR 	= $(GIT_ROOT)/scripts/quartus

# project name
PROJECT ?= demo
# top level name
TOP ?= top
# verilog source files
VERILOG += $(GIT_ROOT)/rtl/vga/vga_sync.sv
VERILOG += $(GIT_ROOT)/demo/bar/bar_gen.sv
VERILOG += $(GIT_ROOT)/demo/bar/bar_top.sv
VERILOG += $(GIT_ROOT)/fpga/de2/pll.v
VERILOG += $(GIT_ROOT)/fpga/de2/top.sv
# verilog include directory
SEARCH   	+= $(GIT_ROOT)/rtl/vga
# verilog define
DEFINE ?=
# sdc files
SDC	?= $(PWD)/timing.sdc
# pin assignment files
PIN ?= $(PWD)/pin.tcl
# project output directory
OUT_DIR ?= outputs

include $(GIT_ROOT)/scripts/quartus/makefile.mk