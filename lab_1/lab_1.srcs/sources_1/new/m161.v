`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 01:41:35 PM
// Design Name: 
// Module Name: m161
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


module m161(
    input D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, 
    input [3:0] S,
    output Y
    );
    
    wire Y0, Y1, Y2, Y3;
    m41 my_m41_0(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .S(S[1:0]), .Y(Y0));
    m41 my_m41_1(.D0(D4), .D1(D5), .D2(D6), .D3(D7), .S(S[1:0]), .Y(Y1));
    m41 my_m41_2(.D0(D8), .D1(D9), .D2(D10), .D3(D11), .S(S[1:0]), .Y(Y2));
    m41 my_m41_3(.D0(D12), .D1(D13), .D2(D14), .D3(D15), .S(S[1:0]), .Y(Y3));
    m41 my_m41_4(.D0(Y0), .D1(Y1), .D2(Y2), .D3(Y3), .S(S[3:2]), .Y(Y));
    
endmodule
