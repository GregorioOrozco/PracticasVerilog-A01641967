module BCD_4module_top(
	input [9:0] SW,
	output [0:6] HEX0, HEX1, HEX2, HEX3
);

	BCD_4module WRAP(.bcd_in(SW),.D_un(HEX0),.D_de(HEX1),.D_ce(HEX2),.D_mi(HEX3));
	
endmodule