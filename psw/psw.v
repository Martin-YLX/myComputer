module psw(
  input clk,
  input g_en,
  input g,
  output reg gf
);

always @(negedge clk) begin
  gf <= g_en ? g : gf;
end

endmodule

