module sr_latch(input logic s, input logic r, output logic q, output logic q_inv);
  assign q = ~(r | q_inv);
  assign q_inv = ~(s | q);
endmodule
