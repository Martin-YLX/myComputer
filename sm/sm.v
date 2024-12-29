module sm(
  input clk,
  input sm_en,
  output reg sm
);

initial begin
   sm = 1'b0;
end

always @(negedge clk) begin
  sm <= sm_en ? ~sm : sm;
end

endmodule