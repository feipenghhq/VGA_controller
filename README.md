# VGA Controller

## Overview

This project implements a VGA controller using **SystemVerilog**, designed to generate video signals compatible with standard VGA displays. It supports a configurable resolution and timing parameters suitable for simulation and deployment on FPGAs.

## Features

- Standard 640x480 @ 60Hz VGA timing
- Horizontal and vertical sync signal generation
- Active video area tracking
- Pixel coordinates output (`x`, `y`)
- Fully synthesizable
- Modular design for integration into larger systems

## VGA Timing Diagram

```
            |<--------- Active Video -------->|<-- Front Porch -->|<-- Sync Pulse -->|<-- Back Porch -->|
            |---------------------------------|-------------------|------------------|------------------|
             _____________________________________________________                    __________________
H/VSYNC:                                                          |__________________|
```

## Block Diagram

![Block diagram](./doc/assets/vga_sync.drawio.png)

## Repository Structure

## Demo



