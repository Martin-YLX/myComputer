module reg_group(
  input clk,
  input we,
  input [1:0] sr,
  input [1:0] dr,
  input [7:0] i,
  output reg [7:0] s,
  output reg [7:0] d
);

  reg [7:0] R0 = 8'h01, R1 = 8'h00, R2 = 8'h00, R3 = 8'h07;

  always @(*) begin
    case (sr)
      2'b00: s = R0;
      2'b01: s = R1;
      2'b10: s = R2;
      2'b11: s = R3;
      default: s = 8'b0;
    endcase

    case (dr)
      2'b00: d = R0;
      2'b01: d = R1;
      2'b10: d = R2;
      2'b11: d = R3;
      default: d = 8'b0;
    endcase
  end

  always @(negedge clk) begin
    case ({we,dr})
      3'b100: R0 <= i;
      3'b101: R1 <= i;
      3'b110: R2 <= i;
      3'b111: R3 <= i;
    endcase
  end

endmodule
