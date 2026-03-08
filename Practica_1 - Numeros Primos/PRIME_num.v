module PRIME_num(
	input [3:0] num_in,
	output reg led_out
	);


	always@(*)
	begin
		case(num_in)
			2:  led_out = 1'b1;
			3:  led_out = 1'b1;
			5:  led_out = 1'b1;
			7:  led_out = 1'b1;
			11: led_out = 1'b1;
			13: led_out = 1'b1;
			default: led_out = 1'b0;
		endcase
	end
	
endmodule