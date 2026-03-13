module SUM_top(
    input CLOCK_50,
    input [9:0] SW,
    input [1:0] KEY,
    output [0:6] HEX0, HEX1, HEX3, HEX4, HEX5
);

wire rst = ~KEY[0];
wire add = SW[9];
wire stop;
wire clk_div;
wire [3:0] val_in;
wire [6:0] sum_out;

CLK_divider #(.FREQ(5)) CLK_div(
    .clk(CLOCK_50),
    .rst(rst),
    .clk_div(clk_div)
);

GEN_num CONTEO(
    .clk(clk_div),
    .rst(rst),
    .add(add),
	 .count_max(SW[3:0]),
    .stop(stop),
    .count(val_in)
);

SUM_num SUMA(
    .clk(clk_div),
    .rst(rst),
    .add(add),
    .stop(stop),
    .num_in(val_in),
    .resultado(sum_out)
);

BCD_4module #(.N_in(4), .N_out(7)) BCD_num(
    .bcd_in(SW[3:0]),
    .D_un(HEX0),
    .D_de(HEX1)
);

BCD_4module #(.N_in(7), .N_out(7)) BCD_res(
    .bcd_in(sum_out),
    .D_un(HEX3),
    .D_de(HEX4),
    .D_ce(HEX5)
);

endmodule