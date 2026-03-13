module GEN_num(
	input clk, rst,
   input add,
   input [3:0] count_max,
   output reg stop,
   output reg [3:0] count
);


always @(posedge clk or posedge rst)
begin
	if(rst) begin
		count <= 0;
      stop <= 0;
   end
   else if(add) 
	begin
		if(stop == 0) begin
			if(count == count_max)
				stop <= 1;
   else
		count <= count + 1;
		end
	end
end

endmodule