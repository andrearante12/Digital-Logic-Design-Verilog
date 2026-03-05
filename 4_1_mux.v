module 4_1_mux_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] C;
    reg [3:0] D;
    reg [1:0] sel;
    
    wire [3:0] out;
   
    
    4_1_mux_DUT(
            .A          (A),
            .B          (B),
            .C          (C),
            .D          (D),
            .sel        (sel),
            .out        (out),
            
    );  
       
   initial begin
          
        A = 4'b0001;
        B = 4'b0010;
        C = 4'b0100;
        D = 4'b1000;
           
        sel = 2'b00;
        #5
        sel = 2'b10;
        #5
        sel = 2'b11;
        #5
        sel = 2'b01;
        #5
        $finish;
        end
    endmodule  