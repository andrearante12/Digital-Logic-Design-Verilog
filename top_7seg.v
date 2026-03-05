module top_7seg (
    input [3:0] sw,
    output [6:0] seg,
    output [3:0] an
);
    assign an = 4'b1110; // Enable only the first digit
    
    hex_to_7seg decoder (
        .sw(sw),
        .seg(seg)
    );
endmodule