module CLK_divider_tb();
    reg clk_tb;
    reg rst_tb;
    wire clk_div_tb;

    CLK_divider dut(.clk(clk_tb),.rst(rst_tb),.clk_div(clk_div_tb));

    initial begin
        clk_tb = 0;
        forever #10 clk_tb = ~clk_tb;
    end

    initial begin
        rst_tb = 1;
        #20;
        rst_tb = 0;

        #1000000; 
    end

endmodule
