`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 01:24:03 PM
// Design Name: 
// Module Name: sm
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


module sm(
    input clk, sensor, ped, rst,
    output reg mg,my,mr, sg,sy,sr,walk
    );
    parameter SIZE = 3;
    parameter MG = 3'b000, SG = 3'b001, YLW = 3'b010, PED = 3'b011, EXT = 3'b100, SENS = 3'b101;
    reg [SIZE-1:0] current;
    reg [SIZE-1:0] next;
    reg [3:0] timer; //4 bit max is 12 seconds
    reg swap,main,side;
    initial begin
        timer = 0;
        current = MG;
        next = MG;
        swap = 1;
        main=0;
        side=0;
    end
    
    always @(*) begin
        if(rst)begin
            current = MG;
            next=MG;
            timer = 0;
            swap = 1;
            main=0;
            side=0;
        end
        else
            current = next;
    end
    
    always @(*) begin
        case(current)
            MG : begin
                if(swap)begin
                    swap=0;
                    timer = 0;
                end
                else if(timer >= 6) begin
                    swap =1;
                    side=1;
                    main=0;
                    if(sensor)
                        next=SENS;
                    else
                        next=EXT;
                end
            end
            SG : begin
                if(swap) begin
                    swap=0;
                    timer=0;
                end
                else if(timer >= 3)begin
                    swap=1;
                    main=1;
                    side=0;
                    next=YLW;
                end            
            end
            YLW : begin
                if(swap) begin
                    swap=0;
                    timer=0;
                end
                else if(timer >= 2)begin
                    if(main)
                        next=MG;
                    else if(side)
                        if(ped)
                            next=PED;
                        else
                            next=SG;
                end           
            end
            PED : begin
                if(swap) begin
                    swap=0;
                    timer=0;
                end
                else if(timer >= 3)begin
                    swap =1;
                    next=SG;
                end             
            end
            EXT : begin
               if(swap) begin
                    swap=0;
                    timer=0;
                end
                else if(timer >= 6)begin
                    swap =1;
                    next=YLW;
                end         
            end
            SENS : begin
                if(swap) begin
                    swap=0;
                    timer=0;
                end
                else if(timer >= 3)begin
                    swap =1;
                    next=YLW;
                end
            end
         endcase
    end
    
    always @(*) begin
        case(current)
            MG:begin
                mg = 1;
                my = 0;
                mr = 0;
                sg = 0;
                sy = 0;
                sr = 1;
                walk = 0;
            end
            SG:begin
                mg = 0;
                my = 0;
                mr = 1;
                sg = 1;
                sy = 0;
                sr = 0;
                walk = 0;
            end
            YLW:begin
                if(main)begin
                    mg = 0;
                    my = 0;
                    mr = 0;
                    sg = 0;
                    sy = 1;
                    sr = 0;
                    walk = 0;
                end
                else if(side)begin
                    mg = 0;
                    my = 1;
                    mr = 0;
                    sg = 0;
                    sy = 0;
                    sr = 0;
                    walk = 0;
                end
                
            end
            PED:begin
                mg = 0;
                my = 0;
                mr = 1;
                sg = 0;
                sy = 0;
                sr = 1;
                walk = 1;
            end
            default: begin            
            end
        endcase
    end
    
    
    always @(*) begin
        timer = timer + 1'b1;
    end
endmodule
