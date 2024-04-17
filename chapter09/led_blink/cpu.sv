module cpu(
  input logic clk,
  input logic n_reset,
  output logic led
);
  logic a, next_a;

  always_ff @(posedge clk) begin
    a <= ~n_reset ? 1'b0 : next_a;
  end

  assign led = a;

  always_comb begin
    next_a = ~a;
  end
endmodule
