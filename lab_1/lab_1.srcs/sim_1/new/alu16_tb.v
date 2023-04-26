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
        a=16'b0000000000000011;
        b=9;
        #10
        alu = 0; 
        #10
        alu = 1; 
        #10
        alu = 2; 
        #10
        alu = 3;
        #10
        alu =4; 
        #10
        alu=5;
        #10
        alu=6;
        #10
        alu=7; 
        #10
        alu=8; 
        #10
        alu=9; 
        #10
        alu=10;
        #10
        alu=11; 
        #10 
        $stop;
    end

    
endmodule
