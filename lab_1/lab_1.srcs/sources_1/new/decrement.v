`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:58:14 PM
// Design Name: 
// Module Name: decrement
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


module decrement(
    input [15:0] in,
    output [15:0] out,
    output cout,
    output of
    );
    
    subtraction dec_sub(.r1(in), .r2(1), .cin(0), .result(out), .cout(cout), .of(of));
    
endmodule
