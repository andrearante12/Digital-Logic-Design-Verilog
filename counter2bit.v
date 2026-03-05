module counter2bit(
    input clk,
    output reg [1:0] sel
);
    reg [17:0] clkcntr = 0;

    always @(posedge clk) begin
        clkcntr <= clkcntr + 1;
        if (clkcntr >= 18'd200000) begin
            clkcntr <= 0;
            sel <= sel + 1;
        end
    end
endmodule
