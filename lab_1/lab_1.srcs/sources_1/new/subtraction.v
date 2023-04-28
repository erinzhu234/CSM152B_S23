`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 12:32:16 PM
// Design Name: 
// Module Name: subtraction
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


module subtraction(
    input [15:0] r1,
    input [15:0] r2,
    input cin,
    output [15:0] result,
    output cout,
    output of
    );
    
    wire [15:0] r2_inv;
    
    wire of1, of2;
    
    wire inv_cout;
    
    invert dis_inv(.in(r2), .result(r2_inv), .cout(inv_cout), .of(of1));
    
    addition dis_add(.r1(r1), .r2(r2_inv), .cin(cin), .result(result), .cout(cout), .of(of2));
    
    or(of, of1, of2);
    
endmodule
