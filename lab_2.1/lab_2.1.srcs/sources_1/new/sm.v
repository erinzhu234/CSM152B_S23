`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 12:32:45 PM
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
    output reg mg,my,mr, sg,sy,sr,walk,
    output reg [3:0]timer
    );
parameter SIZE = 3;
        parameter MG = 3'b000, SG = 3'b001, YLW = 3'b010, PED = 3'b011, EXT = 3'b100, SENS = 3'b101;
        reg [SIZE-1:0] current;
        reg [SIZE-1:0] next;
        reg swap,main,side;
        wire new_clock;
        reg walk_on;
        one_clk one_clk(.master_clk(clk), .one_clk(new_clock));

        initial begin
            timer = 1;
            current = MG;
            next = MG;
            swap = 0;
            main=0;
            side=0;
            walk_on=0;
        end
        
        
        always @(posedge new_clock) begin
            if(rst)begin
                        current = MG;
                        next=MG;
                        timer = 0;
                        swap = 0;
                        main=0;
                        side=0;
                        walk_on=0;
                    end
                    else
                        current = next;
            
            if(ped)
                walk_on=1;
            case(current)
                MG : begin
                    if(swap)begin
                        swap=0;
                        timer = 1;
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
                        timer=1;
                    end
                    else if(timer >= 6)begin
                        swap=1;
                        main=1;
                        side=0;
                        if(sensor)
                            next=SENS;
                        else
                            next=YLW;
                    end            
                end
                YLW : begin
                    if(swap) begin
                        swap=0;
                        timer=1;
                    end
                    else if(timer >= 2)begin
                        swap=1;
                        if(main)
                            next=MG;
                        else if(side)
                            if(walk_on)
                                next=PED;
                            else
                                next=SG;
                    end           
                end
                PED : begin
                    walk_on=0;
                    if(swap) begin
                        swap=0;
                        timer=1;
                    end
                    else if(timer >= 3)begin
                        swap =1;
                        next=SG;
                    end             
                end
                EXT : begin
                   if(swap) begin
                        swap=0;
                        timer=1;
                    end
                    else if(timer >= 6)begin
                        swap =1;
                        next=YLW;
                    end         
                end
                SENS : begin
                    if(swap) begin
                        swap=0;
                        timer=1;
                    end
                    else if(timer >= 3)begin
                        swap =1;
                        next=YLW;
                    end
                end
             endcase
             
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
                                     mr = 1;
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
                                     sr = 1;
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
                         timer = timer + 1'b1;
        end
    endmodule
