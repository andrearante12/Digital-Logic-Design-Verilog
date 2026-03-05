module counter_4bit (
    input clk,
    input reset,
    input enable,
    output reg [3:0] count
);

    always @(posedge clk) begin
        // reset to 0
        if (reset) begin
            count <= 4'b0000;
        end
        
        // if enable increment counter
        else if (enable) begin
            count <= count + 1;
        end
    end

endmodule