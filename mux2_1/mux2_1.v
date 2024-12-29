module mux2_1 (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire s,
    output reg [7:0] y
);

always @(*) begin
    case (s)
        1'b0: y = a;
        1'b1: y = b;
    endcase
end

endmodule
