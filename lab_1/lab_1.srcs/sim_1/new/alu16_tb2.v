`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 12:51:27 PM
// Design Name: 
// Module Name: alu16_tb
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
        a=0;
        b=0;
        #10
        alu = 0; //subtraction
        // negative negative
        a=-2;
        b=-3;
        #10
        // postive positive
        a=2;
        b=3;
        #10
        // negative positive
        a=-2;
        b=3;
        #10
        // positive negative
        a=2;
        b=-3;
        #10
        // overflow 
        a=16'b1000000000000000;
        b=16'b0000000000000001;
        #10
        // zero
        a=1;
        b=1;
        #10
        alu = 1; //addition
        // negative negative
        a=-2;
        b=-3;
        #10
        // postive positive
        a=2;
        b=3;
        #10
        // negative positive
        a=-2;
        b=3;
        #10
        // positive negative
        a=2;
        b=-3;
        #10
        // overflow 
        a=16'b1000000000000000;
        b=16'b1111111111111111;
        #10
        alu = 2; //bitwise or
        a=4'b1010;
        b=4'b1100;
        #10
        alu = 3; //bitwise and
        a=4'b1010;
        b=4'b1100;
        #10
        alu =4; //decrement
        a=5;
        #10
        alu=5; //increment
        #10
        alu=6; //invert
        a=1;
        #10
        a = 16'b1000000000000000;
        #10
        //overflow
        a=16'b0000000000000000;
        #10
        alu=7; //asl
        a=4'b1111;
        b=2;
        #10
        //overflow
        a=16'b1000000000000000;
        b=2;
        #10
        alu=8; //asr
        a=4'b1111;
        b=2;
        #10
        alu=8;
        a=16'b0000000000011111;
        b=3;
        #10
        alu=9; //lsl
        #10
        alu=10; //lsr
        #10
        alu=11; //set le
        //a<b
        a=1;
        b=2;
        #10
        //a>b
        a=2;
        b=1;
        #10
        //a=b
        a=2;
        b=2;
        #10
        //overflow
        a=16'b1000000000000000;
        b=16'b0000000000000001;
        #10

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
        wren = 1;
        #10
        rst = 0;
        wren = 0;
        #10
        ra = 5'b00110;
        rb = 5'b11010;
        #30
        $display("00110 is now %h", busA);
        $display("11010 is now %h", busB);
        $stop;
    end

    
endmodule
