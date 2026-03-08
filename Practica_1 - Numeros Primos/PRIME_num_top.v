module PRIME_num_top(
    input [3:0] SW,
    output [0:0] LEDR
);

    PRIME_num prime_num(
        .num_in(SW[3:0]),   
        .led_out(LEDR[0])
    );

endmodule