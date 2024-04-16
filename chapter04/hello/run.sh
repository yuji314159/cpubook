#!/bin/bash

iverilog -g2012 -o hello hello.sv
vvp hello
