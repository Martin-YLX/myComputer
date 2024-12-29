module ins_decode(
    input wire en,
    input wire [3:0] ir,
    output reg mova, movb, movc, movd, add, sub, jmp, jg, in1, out1, movi, halt
);

always @(ir or en)
begin
    {mova, movb, movc, movd, add, sub, jmp, jg, in1, out1, movi, halt} = 0;
    if (en) begin
        case (ir)
            4'b0100: mova = 1;
            4'b0101: movb = 1;
            4'b0110: movc = 1;
            4'b0111: movd = 1;
            4'b1000: add = 1;
            4'b1001: sub = 1;
            4'b1010: jmp = 1;
            4'b1011: jg = 1;
            4'b1100: in1 = 1;
            4'b1101: out1 = 1;
            4'b1110: movi = 1;
            4'b1111: halt = 1;
            default: {mova, movb, movc, movd, add, sub, jmp, jg, in1, out1, movi, halt} = 0;
        endcase
    end
end

endmodule