module CLK_divider #(parameter FREQ = 5)(
	input clk, rst,
	output reg clk_div
);

	reg [31:0] count;
	parameter CLK_FREQ = 50000000;
	parameter ConstantNumber= (CLK_FREQ/(2*FREQ));
	
	always@(posedge clk or posedge rst)
	begin
		if(rst == 1)
			count <= 32'b0;
		else if (count == ConstantNumber - 1)
			count <= 32'b0;
		else
			count <= count+1;
		end
		
	always@(posedge clk or posedge rst)
	begin
		if (rst ==1)
			clk_div <= 0;
		else if(count == ConstantNumber-1)
			clk_div <= ~clk_div;
		else
			clk_div <= clk_div;
	end
endmodule