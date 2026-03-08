module PRIME_num_tb;
	reg  [3:0] num_in;
	wire led_out;

	PRIME_num dut(.num_in(num_in),.led_out(led_out));

initial 
	begin
	$display("Simulacion iniciada");
	num_in = 0; 
	#10;
	num_in = 1;  
	#10;
	num_in = 2;  
	#10;
	num_in = 3;  
	#10;
	num_in = 4;  
	#10;
	num_in = 5;  
	#10;
	num_in = 6;  
	#10;
	num_in = 7;  
	#10;
	num_in = 8;  
	#10;
	num_in = 9;  
	#10;
	num_in = 10; 
	#10;
	num_in = 11; 
	#10;
	num_in = 12; 
	#10;
	num_in = 13; 
	#10;
	num_in = 14; 
	#10;
	num_in = 15; 
	#10;
	$finish;
	$stop;
end
	
initial
	begin
		$monitor("num_in = %b, led_out = %b", num_in, led_out);
	end

endmodule