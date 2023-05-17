`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 12:30:02
// Design Name: 
// Module Name: alu
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


module alu(
    input a, b, s, 
    output result, cout
    );
    
    // s = 0, addbit
    // s = 1, andbit
    
    wire add_result;
    wire and_result;
    
    wire add_cout;
    
    addbit my_addbit(.cin(0), .a(a), .b(b), .s(add_result), .cout(add_cout));
    andbit my_andbit(.a(a), .b(b), .s(and_result));
    
    mux res_mux(.Y(result), .D0(add_result), .D1(and_result), .S(s));
    mux cout_mux(.Y(cout), .D0(add_cout), .D1(0), .S(s));
    
endmodule
