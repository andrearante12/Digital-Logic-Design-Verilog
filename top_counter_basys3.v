module top_counter_basys3 (
    input clk,          
    input reset,        // Switch V17
    input enable,       // Switch V16
    output reg [3:0] led // Map to LEDs P3, N3, P1, L1
);

    // Clock Divider 100 million cycles = 1 second
    reg [26:0] div_counter; 
    wire tick_1hz;

    always @(posedge clk) begin
        if (reset) begin
            div_counter <= 0;
        end else if (div_counter == 100_000_000 - 1) begin
            div_counter <= 0;
        end else begin
            div_counter <= div_counter + 1;
        end
    end

    // Pulse high for one cycle every second
    assign tick_1hz = (div_counter == 100_000_000 - 1);

    // 4-bit Counter Logic
    always @(posedge clk) begin
        if (reset) begin
            led <= 4'b0000;      // Hold zero when reset is high
        end else if (enable && tick_1hz) begin
            led <= led + 1;      // Increment every second if enabled
        end
    end

endmodule