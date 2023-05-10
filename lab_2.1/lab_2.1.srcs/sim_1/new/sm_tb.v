`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 12:37:36 PM
// Design Name: 
// Module Name: sm_tb
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


module sm_tb(

    );
    reg clk;
    reg sensor;
    reg ped;
    reg rst;
    wire mg;
    wire my;
    wire mr;
    wire sg;
    wire sy;
    wire sr;
    wire walk;
    always
        clk = #1 ~clk;
    sm uut(clk, sensor, ped, rst, mg,my,mr, sg,sy,sr,walk);
    initial begin
        clk=1;
        sensor=0;
        ped=0;
        rst=0;
        #10
        $stop;
     end
endmodule
