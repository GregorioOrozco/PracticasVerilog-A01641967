module COUNTER_100 #(parameter CMAX=100) (
	input clk,
	input rst,
	input [6:0] data_in,
	input up_down,
	input load,
	output reg [6:0] count);
	
	always @(posedge clk or posedge rst)
		if(rst) 
			count <= 4'b0;
		else if(load) 
		begin
			if(data_in <= CMAX)
				count <= data_in;
		else
        count <= CMAX;
		end
		else if(up_down)
		begin 
			if (count == CMAX)
				 count <= 0;
			else
				 count <= count + 1;
	  end 
	  else 
	  begin
		if (count == 0)
			 count <= CMAX;
		else
			 count <= count - 1;
	  end
endmodule