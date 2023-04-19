`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:43:36 PM
// Design Name: 
// Module Name: increment
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


module increment(
    input [15:0] in,
    output [15:0] out,
    output cout,
    output of
    );
    
    addition inc_add(.r1(in), .r2(1), .cin(0), .result(out), .cout(cout), .of(of));
    
endmodule
