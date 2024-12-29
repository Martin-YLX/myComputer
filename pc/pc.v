module pc(
  input clk,
  input in_pc,
  input ld_pc,
  input [7:0] a,
  output reg [7:0] c
);

always @(negedge clk) begin
  case ({in_pc, ld_pc})
    2'b10: c <= c + 1'b1;
    2'b01: c <= a;
    default: c <= c;
  endcase
end

endmodule
