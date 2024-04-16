#!/bin/bash

iverilog -g2012 -o sr_latch sr_latch_test.sv sr_latch.sv
vvp sr_latch
