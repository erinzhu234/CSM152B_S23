`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 01:00:49 PM
// Design Name: 
// Module Name: leq
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


module leq(
    input [15:0] r1,
    input [15:0] r2,
    output result, 
    output of
    );
    
    // r1 <= r2
    // r1 - r2 <= 0
    // r1 - r2 < 1
    // r1 - r2 - 1 < 0
    
    wire [15:0] sub_res;
    wire [15:0] inv_res;
    wire sub_cout, inv_cout, of1, of2;
    
    subtraction leq_sub(.r1(r1), .r2(r2), .cin(0), .result(sub_res), .cout(sub_cout), .of(of1));
    decrement leq_dec(.in(sub_res), .out(result), .cout(inv_res), .of(of2));
    OR(of, of1, of2);
    
    AND(result, 1, inv_res[15]);
    
endmodule
