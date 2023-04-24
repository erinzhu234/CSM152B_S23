`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 12:29:31 PM
// Design Name: 
// Module Name: zero
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


module zero(
    input [15:0] a, 
    output z
    );
    
    wire [15:0] na;
    wire [13:0] t;
    
    NOT(na[0], a[0]);
    NOT(na[1], a[1]);
    NOT(na[2], a[2]);
    NOT(na[3], a[3]);
    NOT(na[4], a[4]);
    NOT(na[5], a[5]);
    NOT(na[6], a[6]);
    NOT(na[7], a[7]);
    NOT(na[8], a[8]);
    NOT(na[9], a[9]);
    NOT(na[10], a[10]);
    NOT(na[11], a[11]);
    NOT(na[12], a[12]);
    NOT(na[13], a[13]);
    NOT(na[14], a[14]);
    NOT(na[15], a[15]);
    
    AND(t[0], na[0], na[1]);
    AND(t[1], t[0], na[2]);
    AND(t[2], t[1], na[3]);
    AND(t[3], t[2], na[4]);
    AND(t[4], t[3], na[5]);
    AND(t[5], t[4], na[6]);
    AND(t[6], t[5], na[7]);
    AND(t[7], t[6], na[8]);
    AND(t[8], t[7], na[9]);
    AND(t[9], t[8], na[10]);
    AND(t[10], t[9], na[11]);
    AND(t[11], t[10], na[12]);
    AND(t[12], t[11], na[13]);
    AND(t[13], t[12], na[14]);
    AND(z, t[13], na[15]);
    
endmodule
