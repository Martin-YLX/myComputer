module con_signal (
    input wire mova, movb, movc, movd, add, sub, jmp, jg, g, in1, out1, movi, halt, sm,
    input wire [7:0] ir,
    output reg sm_en, ir_ld, ram_re, ram_wr, pc_ld, pc_in, reg_we, au_en, gf_en, in_en, out_en, mux_s,
    output reg [1:0] reg_sr, reg_dr, s,
    output reg [3:0] au_ac
);

always @(*) begin
    sm_en = ~halt;
    
    ir_ld = ~sm;
    
    ram_re = (~sm) | movc | movi;
    ram_wr = movb;
    
    pc_ld = jmp | (jg & g);
    pc_in = movi | (~sm);
    
    reg_sr = ir[1:0];
    reg_dr = ir[3:2];
    reg_we = movi | mova | movc | movd | sub | add | in1;
    
	if(movb) s=2'b10;
	else if(movc) s=2'b01;
	else s=2'b00;
    
    au_en = mova | movb | add | out1 | sub;
    au_ac = ir[7:4];
    
    gf_en = sub;
    
    in_en = in1;
    out_en = out1;
    
    mux_s = mova | movc |movi | add | sub | in1;
end

endmodule