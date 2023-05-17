`timescale 1ns / 1ps
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
    wire [3:0]timer;
    sm uut(clk, sensor, ped, rst, mg,my,mr, sg,sy,sr,walk,timer);
    initial begin
        clk=1;
        sensor=0;
        ped=0;
        #4400000 //12 + 2 + 6 + 2 seconds main green light --> side green light
        sensor=1;
        #2200000 //9 + 2 + 6 + 2 seconds only sensor on for main g
        sensor=0;
        #1600000 //wait for side g
        ped=1; 
        #5000000 //12 + 2 + 3 + 6 + 2 seconds walk
        ped=0;
        //12 + 2 + 9 + 2 sensor on for only side g
        #2000000
        sensor=1;
        #2200000
        ped=1;
        #2000000 // 9 + 2 + 3 + 6 + 2 sensor only for main walk is on
        sensor=0;
        ped=0;
        #1000000
        sensor=1;// 9 + 2 + 9 + 2 sensor on for both
        #4400000
        sensor=0;
        ped=1;
        #3400000// 12 + 2 + 3 + 9 + 2 walk on sensor only for side
        sensor=1;
        ped=0;
        #2200000
        ped=1;
        sensor=1;
        #5000000 //9 + 2 + 3 + 9 + 2 sensor for both, walk is on
        //12 + 2 +3 turn reset on while side g is on
        sensor=0;
        ped=1;
        #1200000
        ped=0;
        #2200000
        rst=1;

        #10
        
        
        $stop;
     end
     always
         clk = #1 ~clk;
endmodule
