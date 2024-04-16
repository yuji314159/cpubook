module dff_test;
  logic d, clk, q;
  dff dff0(.d, .clk, .q);

  initial clk = 1'b0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("dff_test.vcd");
    $dumpvars(0, dff0);

    #1
    d = 1'b0;
    $display("d = %d, q = %d", d, q);
    // assert(q == 1'b0) ; else $error("q must be 0, but %d", q);

    #5
    $display("d = %d, q = %d", d, q);
    assert(q == 1'b0) ; else $error("q must be 0, but %d", q);

    #5
    d = 1'b1;

    #10
    $display("d = %d, q = %d", d, q);
    assert(q == 1'b1) ; else $error("q must be 0, but %d", q);

    d = 1'b1;
    #10
    $display("d = %d, q = %d", d, q);
    assert(q == 1'b1) ; else $error("q must be 0, but %d", q);

    d = 1'b0;
    #10
    $display("d = %d, q = %d", d, q);
    assert(q == 1'b0) ; else $error("q must be 0, but %d", q);

    $finish;
  end
endmodule
