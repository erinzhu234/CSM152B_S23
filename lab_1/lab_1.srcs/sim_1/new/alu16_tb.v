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


module alu16_tb(
    
    );
//    reg [15:0] a;
//    reg [15:0] b;
//    reg [3:0] alu;
//    wire of,zero;
//    wire [15:0] s;
    
//    alu16 uut(.a(a), .b(b), .alu(alu), .of(of), .zero(zero), .s(s));
    
//    initial begin
//        a=0;
//        b=0;
//        alu=0;
//        #10
//        a=4'b1011;
//        b=4'b1001;
//        #10
//        $stop;
//    end

    
    reg [15:0] mux_test = 16'b0000100000000000;
    
    reg [3:0] s = 4'b1011;
    
    wire result;
    
    m161 my_m161(.D0(mux_test[0]), .D1(mux_test[1]), .D2(mux_test[2]), .D3(mux_test[3]), .D4(mux_test[4]), .D5(mux_test[5]), .D6(mux_test[6]), .D7(mux_test[7]), 
                 .D8(mux_test[8]), .D9(mux_test[9]), .D10(mux_test[10]), .D11(mux_test[11]), .D12(mux_test[12]), .D13(mux_test[13]), .D14(mux_test[14]), .D15(mux_test[15]), 
                 .S(s), .Y(result));
    
endmodule
