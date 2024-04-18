#!/bin/bash

iverilog -g2012 -o top_test top_test.sv top.sv prescaler.sv mother_board.sv cpu.sv rom.sv
vvp top_test
