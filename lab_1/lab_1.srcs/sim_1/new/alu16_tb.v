`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 12:51:27 PM
// Design Name: 
// Module Name: alu16_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu16_tb(
    
    );
    reg [15:0] a;
    reg [15:0] b;
    reg [3:0] alu;
    wire of,zero;
    wire [15:0] s;
    
    alu16 uut(.a(a), .b(b), .alu(alu), .of(of), .zero(zero), .s(s));
    
    initial begin
        a=0;
        b=0;
        #10
        alu = 0; //subtraction
        // negative negative
        a=-2;
        b=-3;
        #10
        // postive positive
        a=2;
        b=3;
        #10
        // negative positive
        a=-2;
        b=3;
        #10
        // positive negative
        a=2;
        b=-3;
        #10
        // overflow 
        a=16'b1000000000000000;
        b=16'b0000000000000001;
        #10
        // zero
        a=1;
        b=1;
        #10
        alu = 1; //addition
        // negative negative
        a=-2;
        b=-3;
        #10
        // postive positive
        a=2;
        b=3;
        #10
        // negative positive
        a=-2;
        b=3;
        #10
        // positive negative
        a=2;
        b=-3;
        #10
        // overflow 
        a=16'b1000000000000000;
        b=16'b1111111111111111;
        #10
        alu = 2; //bitwise or
        a=4'b1010;
        b=4'b1100;
        #10
        alu = 3; //bitwise and
        a=4'b1010;
        b=4'b1100;
        #10
        alu =4; //decrement
        a=5;
        #10
        alu=5; //increment
        #10
        alu=6; //invert
        a=1;
        #10
        //overflow
        a=16'b0000000000000000;
        #10
        alu=7; //asl
        a=4'b1111;
        b=2;
        #10
        //overflow
        a=16'b1000000000000000;
        b=2;
        #10
        alu=8; //asr
        a=4'b1111;
        b=2;
        #10
        alu=9; //lsl
        #10
        alu=10; //lsr
        #10
        alu=11; //set le
        //a<b
        a=1;
        b=2;
        #10
        //a>b
        a=2;
        b=1;
        #10
        //a=b
        a=2;
        b=2;
        #10
        //overflow
        a=16'b1000000000000000;
        b=16'b0000000000000001;
        #10
        $stop;
    end

    
endmodule
