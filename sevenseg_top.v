module sevenseg_top (
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an
);

    wire [1:0] sel;

    counter2bit u0 (
        .clk(clk),
        .sel(sel)
    );

    decoder_v2 u1 (
        .sel(sel),
        .an(an)
    );

    hex_to_7seg u2 (
        .sw(sw),
        .seg(seg)
    );

endmodule
