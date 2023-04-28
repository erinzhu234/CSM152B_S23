`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 01:40:19 PM
// Design Name: 
// Module Name: alu16_tb2
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


module alu16_tb2(

    );
    
    // variables for 16-bit ALU
    reg [15:0] a;
    reg [15:0] b;
    reg [3:0] alu;
    wire of,zero;
    wire [15:0] s;
    
    alu16 uut(.a(a), .b(b), .alu(alu), .of(of), .zero(zero), .s(s));
    
    // variables for register file
    reg clk = 0;
    always #5 begin
      clk = ~clk;
    end
      
    reg [4:0] ra, rb, rw;
    reg wren, rst;
    reg [15:0] busW;
    wire [15:0] busA, busB;
      
    RegisterFile my_regfile(.ra(ra), .rb(rb), .rw(rw), .wren(wren), .clk(clk), .rst(rst), .busW(busW), .busA(busA), .busB(busB));
    
    initial begin
        a=11;
        b=9;
        #10
        alu = 0; 
        #10
        alu = 1; 
        #10
        alu = 2; 
        #10
        alu = 3;
        #10
        alu =4; 
        #10
        alu=5;
        #10
        alu=6;
        #10
        alu=7; 
        #10
        alu=8; 
        #10
        alu=9; 
        #10
        alu=10;
        #10
        alu=11; 
        #10
        a=0;
        b=0;
        alu=0;
        #100
        
        // testbench for register file
        rst = 1;
        #10
        rst = 0;
        #10
        ra = 5'b01101;
        #10
        $display("reg file is now %h", busA);
        #10
        rb = 5'b11010;
        rw = 5'b11010;
        busW = 16'h3e6f;
        wren = 1;
        #10
        ra = 5'b00110;
        rw = 5'b00110;
        busW = 16'h9ac4;
        wren = 1;
        #20
        $display("00110 is now %h", busA);
        $display("11010 is now %h", busB);
        #10
        wren = 0;
        ra = 5'b01000;
        rw = 5'b01000;
        busW = 16'h000f;
        #20
        $display("01000 is now %h", busA);
        #10
        rst = 1;
        #10
        rst = 0;
        #10
        ra = 5'b00110;
        rb = 5'b11010;
        #30
        $display("00110 is now %h", busA);
        $display("11010 is now %h", busB);
        
        $stop;
    end
endmodule
