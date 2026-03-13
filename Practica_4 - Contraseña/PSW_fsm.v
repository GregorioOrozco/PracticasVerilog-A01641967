module PSW_fsm(
	input clk, rst,
	input click,
	input [3:0] psw_in,
	output reg [3:0] leds,
	output reg good,
	output reg bad
);

parameter BAD=0,
			 IDLE=1,
			 DIG1=2,
			 DIG2=3,
			 DIG3=4,
			 GOOD=5;
			 
reg [2:0] current_state, next_state;
reg click_prev;
wire click_pulse;

always @(posedge clk)
    click_prev <= click;
assign click_pulse = click & ~click_prev;

always @(posedge clk or posedge rst)
begin
	if(rst) begin
		current_state <= IDLE;
		end
	else
		current_state <= next_state;
end

always @(*)
begin
	next_state = current_state;

	case(current_state)
	BAD:begin
		next_state = BAD;
		bad <= 1;
		end
	
	IDLE:begin
	bad = 0;
	good = 0;
	if(click_pulse)
	begin
		if(psw_in==4)
			next_state=DIG1;
		else
			next_state=BAD;
	end
	end

	DIG1:begin
	bad = 0;
	if(click_pulse)
	begin
		if(psw_in==3)
			next_state=DIG2;
		else
			next_state=BAD;
	end
	end

	DIG2:begin
	bad = 0;
	if(click_pulse)
	begin
		if(psw_in==2)
			next_state=DIG3;
		else
			next_state=BAD;
	end
	end

	DIG3:begin
	bad = 0;
	if(click_pulse)
	begin
		if(psw_in==1)
			next_state=GOOD;
		else
			next_state=BAD;
	end
	end

	GOOD:begin
		next_state = GOOD;
		good <= 1;
	end

	endcase
end

always @(*)
begin
	case(current_state)
		BAD: leds = 4'b0000;
		IDLE: leds = 4'b0000;
		DIG1: leds = 4'b0001;
		DIG2: leds = 4'b0011;
		DIG3: leds = 4'b0111;
		GOOD: leds = 4'b1111;
		default: leds = 4'b0000;
	endcase
end


/*always @(posedge clk or posedge rst) begin
    if(rst) begin
        good <= 0;
        bad  <= 0;
    end else begin
        if(current_state == GOOD)
            good <= 1;
        else if(click_pulse && current_state != IDLE && next_state == IDLE)
            bad <= 1;
    end
end*/

endmodule