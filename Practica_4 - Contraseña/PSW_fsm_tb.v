module PSW_fsm_tb();

reg clk;
reg rst;
reg click;
reg [3:0] psw_in;
wire [3:0] leds;

PSW_fsm DUT(
    .clk(clk),
    .rst(rst),
    .click(click),
    .psw_in(psw_in),
    .leds(leds)
);

initial
begin
	clk = 0;
	forever #10 clk = ~clk;
end

//////////////////////
// Simulación
//////////////////////

initial 
begin
	$display("Simulacion iniciada");
	rst = 0;
	click = 0;
	psw_in = 0;
	#30
	rst = 1;
	#20
	rst = 0;

	psw_in = 4;
	#10 
	click = 1;
	#10 
	click = 0;

	psw_in = 2;   
	#10 
	click = 1;
	#10 
	click = 0;
	
	psw_in = 1;   
	#10 
	click = 1;
	#10 
	click = 0;

	#30 
	rst = 1;
	#20 
	rst = 0;

	psw_in = 4;
	#10 
	click = 1;
	#10 
	click = 0;

	psw_in = 3;
	#10 
	click = 1;
	#10 
	click = 0;

	psw_in = 2;
	#10 
	click = 1;
	#10 
	click = 0;

	psw_in = 1;
	#10 
	click = 1;
	#10 
	click = 0;
	#50 
	$stop;
	$finish;
end

initial
begin
$monitor("time=%0t psw=%d click=%b leds=%b", $time, psw_in, click, leds);
end

initial
begin
	$dumpfile("PSW_fsm_tb.vcd");
	$dumpvars(0,PSW_fsm_tb);
end	

endmodule