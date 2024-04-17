#!/bin/bash

iverilog -g2012 -o top_test top_test.sv top.sv prescaler.sv cpu.sv
vvp top_test
