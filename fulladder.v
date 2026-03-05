// Full Adder Module (Using Half Adders)

module fulladder(
    input a,
    input b,
    input cin,
    output sum,
    output cout,
    output P,
    output G
    );

    wire sum1;     
    wire carry1;    // Output from first half adder 
    wire carry2;    // Output from second half adder 

    // adds a and b
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );
    
    // adds sum1 and cin
    half_adder ha2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(carry2)
    );
    
    assign cout = carry1 | carry2;
    assign P = a | b;
    assign G = a & b;
    

endmodule
