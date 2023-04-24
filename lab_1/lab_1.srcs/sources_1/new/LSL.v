`timescale 1ns / 1ps
module LSL(
  input [15:0] A, 
  input [15:0] B,
  output reg [15:0] A_shifted,
  output reg [1:0] overflow);
  integer i;
  integer j;

  always @(A,B)
    begin 
      
  	  A_shifted = A;
      overflow = 1'b0;
  		
      for(j=0; j<B; j=j+1)begin 
        for(i=15; i>=1; i=i-1) 
    	  A_shifted[i] = A_shifted[i-1];
  		 A_shifted[0] = 0;
        
       end
    end
      
endmodule 
