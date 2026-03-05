module decoder_2_4(
    input [1:0] x,           // 2-bit input 
    output reg [3:0] y       // 4-bit output 
    );

    always @(*) begin
        case(x)              
            2'b00: y = 4'b0001; //  line 0
            2'b01: y = 4'b0010; // line 1
            2'b10: y = 4'b0100; // line 2
            2'b11: y = 4'b1000; // line 3
            default: y = 4'b0000;
        endcase
    end
endmodule