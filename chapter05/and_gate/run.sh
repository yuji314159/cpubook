#!/bin/bash

iverilog -g2012 -o and_gate and_gate_test.sv and_gate.sv
vvp and_gate
