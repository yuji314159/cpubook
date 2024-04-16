module and_gate_test;
  logic a, b, x;
  and_gate and_gate0(.a, .b, .x);

  initial begin
    $dumpfile("and_gate_test.vcd");
    $dumpvars(0, and_gate0);

    {a, b} = 2'b00;
    #10 assert(x == 1'b0) ; else $error("x must be 0, but %d", x);

    {a, b} = 2'b01;
    #10 assert(x == 1'b0) ; else $error("x must be 0, but %d", x);

    {a, b} = 2'b10;
    #10 assert(x == 1'b0) ; else $error("x must be 0, but %d", x);

    {a, b} = 2'b11;
    #10 assert(x == 1'b1) ; else $error("x must be 1, but %d", x);

    $finish;
  end
endmodule
