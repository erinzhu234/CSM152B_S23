`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:26:39 PM
// Design Name: 
// Module Name: invert
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


module invert(
    input [15:0] in,
    output [15:0] result,
    output cout,
    output of
    );
    
    wire [15:0] out;
    
    NOT(out[0], in[0]);
    NOT(out[1], in[1]);
    NOT(out[2], in[2]);
    NOT(out[3], in[3]);
    NOT(out[4], in[4]);
    NOT(out[5], in[5]);
    NOT(out[6], in[6]);
    NOT(out[7], in[7]);
    NOT(out[8], in[8]);
    NOT(out[9], in[9]);
    NOT(out[10], in[10]);
    NOT(out[11], in[11]);
    NOT(out[12], in[12]);
    NOT(out[13], in[13]);
    NOT(out[14], in[14]);
    NOT(out[15], in[15]);
    
    addition inv_add(.r1(out), .r2(1), .cin(0), .result(result), .cout(cout), .of(of));
    
endmodule
