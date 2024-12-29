module au (
	input wire au_en,
	input wire [3:0] ac,
	input wire [7:0] a, b,
	output reg gf,
	output reg [7:0] t
);
always @(au_en or ac or a or b) begin
	gf = 0;
	t = 8'b00000000;

	if (au_en == 1'b0)
		t = 8'hZZ;
	else if (au_en == 1'b1) begin
		if (ac == 4'b1000)
			t = a + b;
		else if (ac == 4'b1001) begin
			if (b[7] == a[7]) begin
			if (b > a)
				gf = 1'b1;
			else
				gf = 1'b0;
		end else if (b[7] == 1'b0 && a[7] == 1'b1)
			gf = 1'b1;
		else if (b[7] == 1'b1 && a[7] == 1'b0)
			gf = 1'b0;
			t = b - a;
		end else if (ac == 4'b0100 || ac == 4'b0101 || ac == 4'b1101)
			t = a;
		else
			t = 8'hZZ;
		end
	end
endmodule