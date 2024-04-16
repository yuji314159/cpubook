module dff(input logic d, input logic clk, output logic q);
  always_ff @(posedge clk) begin
    q <= d;
  end
endmodule
