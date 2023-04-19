`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 01:34:07 PM
// Design Name: 
// Module Name: m41
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


module m41(
    input D0, D1, D2, D3,
    input [1:0] S, 
    output Y
    );
    
    wire Y1, Y2;
    
    m21 my_m21_0(.Y(Y1), .D0(D0), .D1(D1), .S(S[0]));
    m21 my_m21_1(.Y(Y2), .D0(D2), .D1(D3), .S(S[0]));
    m21 my_m21_2(.Y(Y), .D0(Y1), .D1(Y2), .S(S[1]));
    
endmodule
