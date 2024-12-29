module mux3_1 (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [7:0] c,
    input wire [1:0] s,
    output reg [7:0] y
);

always @(*) begin
    case (s)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        default: y = a;
    endcase
end

endmodule
