module cpu(
  input logic clk,
  input logic n_reset,
  output logic [3:0] addr,
  input logic [7:0] data,
  input logic [3:0] switch,
  output logic [3:0] led
);
  logic [3:0] a, next_a;
  logic [3:0] b, next_b;
  logic cf, next_cf;
  logic [3:0] ip, next_ip;
  logic [3:0] out, next_out;

  always_ff @(posedge clk) begin
    if (~n_reset) begin
      a <= '0;
      b <= '0;
      cf <= '0;
      ip <= '0;
      out <= '0;
    end else begin
      a <= next_a;
      b <= next_b;
      cf <= next_cf;
      ip <= next_ip;
      out <= next_out;
    end
  end

  logic [3:0] opecode, imm;
  assign opecode = data[7:4];
  assign imm = data[3:0];
  assign addr = ip;
  assign led = out;

  always_comb begin
    // NOP
    next_a = a;
    next_b = b;
    next_cf = 1'b0;
    next_ip = ip + 4'd1;
    next_out = out;

    unique case (opecode)
      4'b0000: {next_cf, next_a} = a + imm;     // ADD a, imm
      4'b0101: {next_cf, next_b} = b + imm;     // ADD b, imm
      4'b0011: next_a = imm;                    // MOV a, imm
      4'b0111: next_b = imm;                    // MOV b, imm
      4'b0001: next_a = b;                      // MOV a, b
      4'b0100: next_b = a;                      // MOV b, a
      4'b1111: next_ip = imm;                   // JMP imm
      4'b1110: next_ip = cf ? ip + 4'd1 : imm;  // JNC imm
      4'b0010: next_a = switch;                 // IN  a
      4'b0110: next_b = switch;                 // IN  b
      4'b1001: next_out = b;                    // OUT b
      4'b1011: next_out = imm;                  // OUT imm
      default: ;                                // NOP
    endcase
  end
endmodule
