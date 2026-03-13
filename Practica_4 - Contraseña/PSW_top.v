module PSW_top(
    input CLOCK_50,
    input [3:0] SW,
    input [1:0] KEY,
    output [3:0] LEDR,
    output [0:6] HEX0,
    output [0:6] HEX1,
    output [0:6] HEX2,
    output [0:6] HEX3
);

wire good;
wire bad;

PSW_fsm PSW(
    .clk(CLOCK_50),
    .rst(~KEY[0]),
    .click(~KEY[1]),    	 
    .psw_in(SW[3:0]),
    .leds(LEDR[3:0]),
	 .good(good),
    .bad(bad)
);

GB_display DISPLAY(
    .good(good),
    .bad(bad),
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3)
);

endmodule