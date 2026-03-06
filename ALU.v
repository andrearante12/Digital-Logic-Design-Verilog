`timescale 1ns / 1ps

module ALU(clk, A, B, seg, an);
    input clk;
    input [2:0] A, B;    
    output [6:0] seg;   
    output [3:0] an;    

    reg [3:0] add_ones, sub_ones;
    reg [3:0] add_tens;
    
    wire [3:0] cla_out, sub_out;
    wire [1:0] counter_out;
    wire [3:0] mux_out;
    wire [15:0] hex_in; 

    cla3bit cla_inst (.A(A), .B(B), .out(cla_out));
    sub3bit sub_inst (.A(A), .B(B), .out(sub_out));

    counter2bit counter_inst (.clk(clk), .sel(counter_out));
    decoder_v2 dec_inst (.sel(counter_out), .an(an));

    mux_v2 mux_inst (
        .A(add_ones), .B(add_tens), 
        .C(sub_ones), .D(4'b0000), 
        .sel(counter_out), .out(mux_out)
    );

    assign hex_in = (16'b1 << mux_out); 

    hex_to_7seg h2s_inst (.sw(hex_in), .seg(seg));

    always @(posedge clk) begin
        if (cla_out > 9) begin
            add_ones <= cla_out - 10;
            add_tens <= 4'b0001;
        end else begin
            add_ones <= cla_out;
            add_tens <= 4'b0000;
        end
    end

    always @(posedge clk) begin
        if (B > A) sub_ones <= 4'b0000; 
        else sub_ones <= sub_out[2:0];
    end
endmodule
