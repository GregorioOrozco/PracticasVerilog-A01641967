module SUM_tb;

reg clk;
reg rst;
reg add;
reg [3:0] max;
wire stop;
wire [3:0] count;
wire [6:0] resultado;


GEN_num CONTADOR(
    .clk(clk),
    .rst(rst),
    .add(add),
    .max(max),
    .stop(stop),
    .count(count)
);

SUM_num SUMADOR(
    .clk(clk),
    .rst(rst),
    .add(add),
    .stop(stop),
    .num_in(count),
    .resultado(resultado)
);


always
begin
    #10 clk = ~clk;
end

initial begin
clk = 0;
rst = 1;
add = 0;
max = 0;
#20
rst = 0;
#20
max = 4'd5;
#20
add = 1;
#500
add = 0;
#100
$stop;
end

endmodule