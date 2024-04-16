module sr_latch_test;
  logic s, r, q, q_inv;
  sr_latch sr_latch0(.s, .r, .q, .q_inv);

  initial begin
    $dumpfile("sr_latch_test.vcd");
    $dumpvars(0, sr_latch0);

    {s, r} = 2'b10;
    #10
    $display("s = %d, r = %d, q = %d, q_inv = %d", s, r, q, q_inv);
    assert(q == 1'b1) ; else $error("q must be 1, but %d", q);
    assert(q_inv == 1'b0) ; else $error("q_inv must be 0, but %d", q_inv);

    {s, r} = 2'b00;
    #10
    $display("s = %d, r = %d, q = %d, q_inv = %d", s, r, q, q_inv);
    assert(q == 1'b1) ; else $error("q must be 1, but %d", q);
    assert(q_inv == 1'b0) ; else $error("q_inv must be 0, but %d", q_inv);

    {s, r} = 2'b01;
    #10
    $display("s = %d, r = %d, q = %d, q_inv = %d", s, r, q, q_inv);
    assert(q == 1'b0) ; else $error("q must be 0, but %d", q);
    assert(q_inv == 1'b1) ; else $error("q_inv must be 1, but %d", q_inv);

    {s, r} = 2'b00;
    #10
    $display("s = %d, r = %d, q = %d, q_inv = %d", s, r, q, q_inv);
    assert(q == 1'b0) ; else $error("q must be 0, but %d", q);
    assert(q_inv == 1'b1) ; else $error("q_inv must be 1, but %d", q_inv);

    $finish;
  end
endmodule
