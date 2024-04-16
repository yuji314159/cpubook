module and_gate(input logic a, input logic b, output logic x);
  // assign x = a & b;

  always_comb begin
    case ({a, b})
      2'b00: x = 1'b0;
      2'b01: x = 1'b0;
      2'b10: x = 1'b0;
      2'b11: x = 1'b1;
    endcase
  end
endmodule
