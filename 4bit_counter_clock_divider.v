module counter_4bit (
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);

reg [25:0] divider;

always @(posedge clk) begin
    if (reset) begin
        divider <= 0;
        count <= 0;
    end else if (enable) begin
        if (divider == 49_999_999) begin
            divider <= 0;
            count <= count + 1;
        end else begin
            divider <= divider + 1;
        end
    end
end

endmodule