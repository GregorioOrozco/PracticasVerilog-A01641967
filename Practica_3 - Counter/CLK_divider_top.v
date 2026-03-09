module CLK_divider_top(
	input CLOCK_50,
	input [9:0] SW,
	input [1:0] KEY, 
	output [0:6] HEX0, HEX1, HEX2
);

    wire rst = ~KEY[0];
	 wire load = ~KEY[1];
	 wire up_down = SW[9];
	 wire clk_5Hz;
	 wire [0:6] contado;
	 
	CLK_divider #(.FREQ(5)) RELOJ(
		.clk(CLOCK_50), 
		.rst(rst),
		.clk_div(clk_5Hz)
		);
	COUNTER_100 #(.CMAX(100)) CONTADOR(
		.clk(clk_5Hz), 
		.rst(rst),
		.load(load),
		.data_in(SW[6:0]),
		.up_down(up_down),
		.count(contado)
		);
	BCD_4module #(.N_in(10), .N_out(7)) DISPLAYS_3(
		.bcd_in(contado), 
		.D_un(HEX0), 
		.D_de(HEX1), 
		.D_ce(HEX2)
		);

endmodule