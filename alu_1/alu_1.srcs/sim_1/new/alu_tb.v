`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 12:49:42
// Design Name: 
// Module Name: alu_tb
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


module alu_tb(

    );
    
    reg a, b, s;
    wire result, cout;
    
    alu my_alu(a, b, s, result, cout);
    
    initial begin
        a = 0;
        b = 0;
        s = 0;
        #10
        a = 0;
        b = 1;
        #10
        a = 1;
        b = 0;
        #10
        a = 1;
        b = 1;
        #10
        a = 0;
        b = 0;
        s = 1;
        #10
        a = 0;
        b = 1;
        s = 1;
        #10
        a = 1;
        b = 1;
        #10
        $stop;
    end
    
endmodule
