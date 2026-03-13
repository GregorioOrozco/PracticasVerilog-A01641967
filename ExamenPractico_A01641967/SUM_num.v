module SUM_num(
	input clk, rst,
   input add,
   input stop,
   input [3:0] num_in,
   output reg [6:0] resultado
);

always @(posedge clk or posedge rst)
begin
   if(rst)
		resultado <= 0;
   else if(add) begin
		if(stop==0)
			resultado <= resultado + num_in;
	end
end
endmodule