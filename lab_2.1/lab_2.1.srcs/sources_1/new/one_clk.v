`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 12:36:29 PM
// Design Name: 
// Module Name: one_clk
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


module one_clk(
    input master_clk,
    output reg one_clk
    );
    reg [31:0] one_dv = 0;
        always @ (posedge master_clk) begin
            if (one_dv == 32'd49_999_999) begin 
                one_dv <= 0;
                one_clk <= ~one_clk;
            end
            else begin
                one_dv <= one_dv + 1;
            end
        end    
endmodule
