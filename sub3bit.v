`timescale 1ns / 1ps

module sub3bit(A, B, out);
    // Port Declarations
    input [2:0] A, B;
    wire mode; 
    assign mode = 1; // Fixed to 1 for subtraction
    output [3:0] out;
    
    wire [2:0] S;
    wire [2:0] dummy_P, dummy_G; // Placeholders for FA outputs
    wire FA0_Cout, FA1_Cout, FA2_Cout;
    wire [2:0] B_xor_mode;

    // XOR B with mode (1) to get 1's complement
    assign B_xor_mode = B ^ {3{mode}};

    // Port order: a, b, cin, sum, cout, P, G
    // We use mode (1) as the initial Cin to complete the 2's complement (+1)
    fulladder FA0(A[0], B_xor_mode[0], mode,     S[0], FA0_Cout, dummy_P[0], dummy_G[0]);
    fulladder FA1(A[1], B_xor_mode[1], FA0_Cout, S[1], FA1_Cout, dummy_P[1], dummy_G[1]);
    fulladder FA2(A[2], B_xor_mode[2], FA1_Cout, S[2], FA2_Cout, dummy_P[2], dummy_G[2]);
    
    assign out = {1'b0, S}; 
endmodule