module BCD_4module_tb();
	reg [9:0] BCD_in;
	wire [6:0] D_un, D_de, C_ce, D_mi;

   BCD_4module dut (.bcd_in(BCD_in),.D_un(D_un), .D_de(D_de),.D_ce(D_ce),.D_mi(D_mi));
	
	initial 
		begin
		$display("Simulacion iniciada");
		repeat(10) begin
			BCD_in= $random%1024;
			#10;
		end
		$display("Simulacion iniciada");
		$stop;
		$finish;
	end
			
	initial
		begin
			$monitor("BCD_in=%d | U=%b D=%b C=%b M=%b", BCD_in, D_un, D_de, D_ce, D_mi);
		end
	initial
		begin
			$dumpfile("BCD_module_tb.vcd");
			$dumpvars(0, BCD_4module_tb);
		end
endmodule
					
					