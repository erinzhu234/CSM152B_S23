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
    sm uut(clk, sensor, ped, rst, mg,my,mr, sg,sy,sr,walk);
    initial begin
        clk=1;
        sensor=0;
        ped=0;
        #44 //12 + 2 + 6 + 2 seconds main green light --> side green light
        sensor=1;
        #22 //9 + 2 + 6 + 2 seconds only sensor on for main g
        sensor=0;
        #16 //wait for side g
        ped=1; 
        #50 //12 + 2 + 3 + 6 + 2 seconds walk
        ped=0;
        //12 + 2 + 9 + 2 sensor on for only side g
        #28
        sensor=1;
        #22
        ped=1;
        #28 // 9 + 2 + 3 + 6 + 2 sensor only for main walk is on
        sensor=0;
        ped=0;
        #16
        sensor=1;// 9 + 2 + 9 + 2 sensor on for both
        #44
        sensor=0;
        ped=1;
        #34// 12 + 2 + 3 + 9 + 2 walk on sensor only for side
        sensor=1;
        ped=0;
        #22
        ped=1;
        sensor=1;
        #50 //9 + 2 + 3 + 9 + 2 sensor for both, walk is on
        //12 + 2 +3 turn reset on while side g is on and also see walk only registers when yellow
        sensor=0;
        ped=1;
        #12
        ped=0;
        #22
        rst=1;

        #10
        
        
        $stop;
     end
     always
         clk = #1 ~clk;
endmodule
