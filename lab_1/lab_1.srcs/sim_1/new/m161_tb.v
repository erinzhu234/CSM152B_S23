`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 12:12:18 PM
// Design Name: 
// Module Name: m161_tb
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


module m161_tb(

    );
    reg D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15; 
    reg [3:0] S;
    wire Y;
    
    m161 uut(D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, S, Y);
    initial begin
            D0 = 0;
            D1 = 1;
            D2 = 2;
            D3 = 3;
            D4 = 4;
            D5 = 5;
            D6 = 6;
            D7 = 7;
            D8 = 8;
            D9 = 9;
            D10 = 10;
            D11 = 11;
            D12 = 12;
            D13 = 13;
            D14 = 14;
            D15 = 15;
            #10
            S = 4'b0000;
            #10
            S = 4'b0001;
            #10
            S = 4'b0010;
            #10
            S = 4'b0011;
            #10
            S = 4'b0100;
            #10
            $stop;
        end
    
endmodule
