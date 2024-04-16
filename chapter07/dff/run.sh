#!/bin/bash

iverilog -g2012 -o dff dff_test.sv dff.sv
vvp dff
