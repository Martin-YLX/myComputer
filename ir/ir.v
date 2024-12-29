module ir(
  input clk,
  input ld_ir,
  input [7:0] a,
  output reg [7:0] x
);

always @(negedge clk) begin
  x <= ld_ir ? a : x;
end

endmodule

