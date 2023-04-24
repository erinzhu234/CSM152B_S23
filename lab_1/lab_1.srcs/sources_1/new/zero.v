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
    
    not(na[0], a[0]);
    not(na[1], a[1]);
    not(na[2], a[2]);
    not(na[3], a[3]);
    not(na[4], a[4]);
    not(na[5], a[5]);
    not(na[6], a[6]);
    not(na[7], a[7]);
    not(na[8], a[8]);
    not(na[9], a[9]);
    not(na[10], a[10]);
    not(na[11], a[11]);
    not(na[12], a[12]);
    not(na[13], a[13]);
    not(na[14], a[14]);
    not(na[15], a[15]);
    
    and(t[0], na[0], na[1]);
    and(t[1], t[0], na[2]);
    and(t[2], t[1], na[3]);
    and(t[3], t[2], na[4]);
    and(t[4], t[3], na[5]);
    and(t[5], t[4], na[6]);
    and(t[6], t[5], na[7]);
    and(t[7], t[6], na[8]);
    and(t[8], t[7], na[9]);
    and(t[9], t[8], na[10]);
    and(t[10], t[9], na[11]);
    and(t[11], t[10], na[12]);
    and(t[12], t[11], na[13]);
    and(t[13], t[12], na[14]);
    and(z, t[13], na[15]);
    
endmodule
