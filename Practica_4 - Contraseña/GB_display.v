module GB_display(
input good,
input bad,
output reg [0:6] HEX0,
output reg [0:6] HEX1,
output reg [0:6] HEX2,
output reg [0:6] HEX3
);


always @(*)
begin
   if(good)
	begin
		HEX3 = 7'b0000100; 
		HEX2 = 7'b0000001; 
		HEX1 = 7'b0000001;
		HEX0 = 7'b1000010;
	end

	else if(bad)
	begin
		HEX3 = 7'b1100000; 
		HEX2 = 7'b0001000; 
		HEX1 = 7'b1000010; 
		HEX0 = 7'b1111111; 
	end

	else
	begin
		HEX3 = 7'b1111111;
		HEX2 = 7'b1111111;
		HEX1 = 7'b1111111;
		HEX0 = 7'b1111111;
	end
end

endmodule