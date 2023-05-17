`timescale 1ns / 1ps
module one_clk(
    input master_clk,
    output reg one_clk=0
    );
    reg [31:0] one_dv = 0;
        always @ (posedge master_clk) begin
            if (one_dv == 32'd49_999) begin 
                one_dv <= 0;
                one_clk <= ~one_clk;
            end
            else begin
                one_dv <= one_dv + 1;
            end
        end    
endmodule
