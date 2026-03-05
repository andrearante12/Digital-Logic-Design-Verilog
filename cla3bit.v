 `timescale 1ns / 1ps

// out = A + B

module cla3bit(A,B,out);

   input [2:0] A,B;
   output [4:0] out;

   //output Cout;
   wire [2:0] S;
   wire [2:0] P,G;
   wire [3:0] carry;

   assign G = A & B;      // Generate: Gi = Ai AND Bi
   assign P = A ^ B;      // Propagate: Pi = Ai XOR Bi
  
   fulladder FA0(A[0], B[0], carry[0], S[0]);
   fulladder FA1(A[1], B[1], carry[1], S[1]);
   fulladder FA2(A[2], B[2], carry[2], S[2]);  

   assign carry[0] = 1'b0; // Initial Cin is 0
   assign carry[1] = G[0] | (P[0] & carry[0]);
   assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & carry[0]);
   assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & carry[0]);

    
   // Concatenating for a 4-bit result (Carry out + 3-bit Sum)

   assign out = {carry[3], S};
endmodule