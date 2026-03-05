module hex_to_7seg(
    input  [15:0] sw,
    output reg [6:0] seg
);
    integer i;
    reg [3:0] value;
    reg [4:0] count;

    always @(*) begin
        value = 0;
        count = 0;

        for (i = 0; i < 16; i = i + 1) begin
            if (sw[i]) begin
                value = i[3:0];
                count = count + 1;
            end
        end

        if (count != 1)
            seg = 7'b1111111;
        else begin
            case (value)
                4'h0: seg = 7'b1000000;
                4'h1: seg = 7'b1111001;
                4'h2: seg = 7'b0100100;
                4'h3: seg = 7'b0110000;
                4'h4: seg = 7'b0011001;
                4'h5: seg = 7'b0010010;
                4'h6: seg = 7'b0000010;
                4'h7: seg = 7'b1111000;
                4'h8: seg = 7'b0000000;
                4'h9: seg = 7'b0010000;
                default: seg = 7'b1111111;
            endcase
        end
    end
endmodule