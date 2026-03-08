module BCD_module_tb();
	reg [3:0] BCD_in;
	wire [6:0] BCD_out;

	BCD_module dut(.bcd_in(BCD_in), .bcd_out(BCD_out));
	initial 
		begin
		$display("Simulacion iniciada");
		repeat(55) begin
			BCD_in= $random%16;
			#10;
		end
		$display("Simulacion iniciada");
		$stop;
		$finish;
		end
			
		initial
			begin
				$monitor("BCD_in = %b, BCD_out = %b", BCD_in, BCD_out);
			end
		initial
			begin
				$dumpfile("BCD_module_tb.vcd");
				$dumpvars(0, BCD_module_tb);
			end
endmodule
					
					