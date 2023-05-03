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
    output [15:0] result, 
    output of
    );
    
    // r1 <= r2
    // r1 - r2 <= 0
    // r1 - r2 < 1
    // r1 - r2 - 1 < 0
    
    wire [15:0] sub_res;
    wire [15:0] dec_res;
    wire sub_cout, dec_cout, of1, of2;
    
    wire diff;
    xor(diff, r1[15], r2[15]);
    
    wire res_diff;
    and(res_diff, diff, r1[15]);
    
    subtraction leq_sub(.r1(r1), .r2(r2), .cin(0), .result(sub_res), .cout(sub_cout), .of(of1));
    decrement leq_dec(.in(sub_res), .out(dec_res), .cout(dec_cout), .of(of2));
    or(of, of1, of2);
    
    wire res_one;
    mux21 leq_mux(.Y(res_one), .D0(dec_res[15]), .D1(res_diff), .S(diff));
    
    and(result[0], 1, res_one);
    not(result[1], 1);
    not(result[2], 1);
    not(result[3], 1);
    not(result[4], 1);
    not(result[5], 1);
    not(result[6], 1);
    not(result[7], 1);
    not(result[8], 1);
    not(result[9], 1);
    not(result[10], 1);
    not(result[11], 1);
    not(result[12], 1);
    not(result[13], 1);
    not(result[14], 1);
    not(result[15], 1);
    
endmodule
